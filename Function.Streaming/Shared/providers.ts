import { ListTableEntitiesOptions, odata, TableClient, TableEntity, TableEntityResult } from "@azure/data-tables";
import { Context } from "@azure/functions";
import { v4 as uuid } from 'uuid';
import { getDbClient } from "./db";
import { Provider } from "./provider";
const { PROVIDERS_PARTITION } = process.env;

class Providers {
  private static shared: Providers;

  static async initialize(context: Context) {
    if (Providers.shared) {
      return Providers.shared;
    }

    const client = await getDbClient()
    const providers = new Providers(context, client);
    return Providers.shared = providers;
  }

  private constructor(
    private context: Context,
    private client: TableClient
  ) {}

  async upsertEntity(provider: Provider) {
    const entity: TableEntity<Provider> = {
      partitionKey: PROVIDERS_PARTITION,
      rowKey: provider.id.toString(),
      ...provider
    };

    this.context.log("Creating entity...");
    const result = await this.client.upsertEntity(entity);
    this.context.log("Created entity.");

    return result;
  }

  async listProviders(): Promise<Provider[]> {
    let providers: Provider[] = [];

    this.context.log("Listing entities...");
    const iterator = this.client.listEntities<Provider>();
    
    this.context.log("Reading entities...");
    for await (const entity of iterator) {
      this.context.log(entity);
      providers.push(entity);
    }

    await Promise.all(providers);
    
    this.context.log("Read entities.");
    return providers;
  }
}

export { Providers };