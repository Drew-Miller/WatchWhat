import { AugmentedRequest, DataSourceConfig, RESTDataSource } from '@apollo/datasource-rest';

export type WatchWhatAPIOptions = DataSourceConfig & {
  baseURL: string,
  functionKey: string,
  token?: string
};

export class WatchWhatAPI extends RESTDataSource {
  functionKey: string;
  token?: string;

  constructor(options: WatchWhatAPIOptions) {
    super(options);

    this.baseURL = options.baseURL;
    this.functionKey = options.functionKey;
    this.token = options.token;
  }

  async health(): Promise<string> {
    const data = await this.get<string>(`/api/health`);
    return data;
  }

  async authenticated(): Promise<string> {
    const data = await this.get<string>(`/api/authenticated`);
    return data;
  }

  override willSendRequest(_path: string, request: AugmentedRequest) {
    request.headers['x-functions-key'] = this.functionKey;
    request.headers['authorization'] = this.token;
  }
}