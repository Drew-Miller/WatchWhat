import { KeyValueCache } from "@apollo/utils.keyvaluecache";
import { AugmentedRequest, DataSourceConfig, RESTDataSource } from '@apollo/datasource-rest';
import { AppErrors } from "../errors";
import { Genre, Movie, PaginatedResults } from "./dtos";

export type MovieAPIOptions = DataSourceConfig & {
  apiVersion: string,
  apiKey: string,
  readAccessToken: string,
  baseURL: string,
  sessionId?: string
};

export class MovieAPI extends RESTDataSource {
  private apiVesion: string;
  private apiKey: string;
  private readAccessToken: string;
  private sessionId?: string;

  constructor(options: MovieAPIOptions) {
    super(options);

    if (!options.baseURL) {
      throw AppErrors.MOVIE_URL_FAILED;
    }

    if (!options.apiKey) {
      throw AppErrors.MOVIE_API_KEY_FAILED;
    }

    if (!options.readAccessToken) {
      throw AppErrors.MOVIE_READ_ACCESS_TOKEN_FAILED;
    }

    this.baseURL = options.baseURL;
    this.apiVesion = options.apiVersion;
    this.apiKey = encodeURIComponent(options.apiKey);
    this.readAccessToken = options.readAccessToken;
    this.sessionId = options.sessionId;
  }

  async getGenres(): Promise<Genre[]> {
    const data = await this.get<{ genres: Genre[] }>(`/${this.apiVesion}/genre/movie/list`);
    return data.genres;
  }

  async getMoviesByGenre(genreIds: number[], page: number = 1): Promise<PaginatedResults<Movie>> {
    const data = await this.get<PaginatedResults<Movie>>(`/${this.apiVesion}/discover/movie?`, {
      params: {
        with_genres: encodeURIComponent(genreIds.join(',')),
        page: encodeURIComponent(page)
      }
    });
    console.log(data);
    return data;
  }

  override willSendRequest(_path: string, request: AugmentedRequest) {
    request.headers['Authorization'] = `Bearer ${this.readAccessToken}`
  }
}