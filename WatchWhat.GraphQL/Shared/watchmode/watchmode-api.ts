import { KeyValueCache } from "@apollo/utils.keyvaluecache";
import { AugmentedRequest, DataSourceConfig, RESTDataSource } from '@apollo/datasource-rest';
import { AppErrors } from "../errors";
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

    if (!options.baseURL) {
      throw AppErrors.BASE_URL_FAILED("WatchmodeAPI");
    }

    if (!options.apiKey) {
      throw AppErrors.API_KEY_FAILED("WatchmodeAPI");
    }

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