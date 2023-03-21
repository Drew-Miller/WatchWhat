import { AugmentedRequest, DataSourceConfig, RESTDataSource } from '@apollo/datasource-rest';
import { AppErrors } from "../errors";

export type WatchWhatAPIOptions = DataSourceConfig & {
  baseURL: string,
  functionKey: string
};

export class WatchWhatAPI extends RESTDataSource {
  functionKey: string;

  constructor(options: WatchWhatAPIOptions) {
    super(options);

    if (!options.baseURL) {
      throw AppErrors.BASE_URL_FAILED("WatchWhatAPI");
    }

    if (!options.functionKey) {
      throw AppErrors.API_KEY_FAILED("WatchWhatAPI");
    }

    this.baseURL = options.baseURL;
    this.functionKey = options.functionKey;
  }

  async health(): Promise<string> {
    const data = await this.get(`/api/health`);
    const results = data;
    return results;
  }

  override willSendRequest(_path: string, request: AugmentedRequest) {
    request.headers['x-functions-key'] = this.functionKey;
  }
}