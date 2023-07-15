import { DataSourceConfig, RESTDataSource } from '@apollo/datasource-rest';
import { Source } from "./dtos";

export type WatchmodeAPIOptions = DataSourceConfig & {
  apiVersion: string,
  apiKey: string,
  baseURL: string,
  sessionId?: string
};

export class WatchmodeAPI extends RESTDataSource {
  private apiVersion: string;
  private apiKey: string;

  constructor(options: WatchmodeAPIOptions) {
    super(options);

    this.baseURL = options.baseURL;
    this.apiVersion = options.apiVersion;
    this.apiKey = encodeURIComponent(options.apiKey);
  }

  async webUrl(titleId: number, titleType: "movie" | "tv", sourceName: string): Promise<String | null> {
    const combinedId = titleType + "-" + titleId;

    const data = await this.get<Source[]>(`/${this.apiVersion}/title/${combinedId}/sources/?apiKey=${this.apiKey}`);
    const results = data;

    const matches = results.filter(source => {
      return source.name.toLocaleLowerCase() === sourceName.toLocaleLowerCase();
    });

    return matches.length > 0 ? matches[0].web_url : "";
  }
}