import { DataSourceConfig, RESTDataSource } from '@apollo/datasource-rest';
import { AppErrors } from "../errors";

export type WatchWhatAPIOptions = DataSourceConfig & {
  baseURL: string
};

export class WatchWhatAPI extends RESTDataSource {
  constructor(options: WatchWhatAPIOptions) {
    super(options);

    if (!options.baseURL) {
      throw AppErrors.BASE_URL_FAILED;
    }

    this.baseURL = options.baseURL;
  }

  async health(): Promise<string> {
    const data = await this.get<string>(`/api/health`);
    const results = data;
    return results;
  }
}