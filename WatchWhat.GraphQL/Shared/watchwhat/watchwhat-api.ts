import { AugmentedRequest, DataSourceConfig, RESTDataSource } from '@apollo/datasource-rest';
import { AppErrors } from "../errors";

export type WatchWhatAPIOptions = DataSourceConfig & {
  baseURL: string,
  functionKey: string,
  idToken?: string
};

export class WatchWhatAPI extends RESTDataSource {
  functionKey: string;
  idToken?: string;

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
    this.idToken = options.idToken;
  }

  async health(): Promise<string> {
    const data = await this.get<string>(`/api/health`);
    return data;
  }

  async authenticated(): Promise<string> {
    const data = await this.post<string>(`/api/authenticated`);
    return data;
  }

  override willSendRequest(_path: string, request: AugmentedRequest) {
    request.headers['x-functions-key'] = this.functionKey;
    request.headers['id-token'] = this.idToken;
  }
}