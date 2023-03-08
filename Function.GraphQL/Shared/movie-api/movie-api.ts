import { KeyValueCache } from "@apollo/utils.keyvaluecache";
import { AugmentedRequest, DataSourceConfig, RESTDataSource } from '@apollo/datasource-rest';
import { AppErrors } from "../errors";
import { Credits, Genre, Movie, MovieDetails, PaginatedResults, Recommendation, Results, Trailer } from "./dtos";

export type MovieAPIOptions = DataSourceConfig & {
  apiVersion: string,
  apiKey: string,
  readAccessToken: string,
  baseURL: string,
  sessionId?: string
};

export class MovieAPI extends RESTDataSource {
  private apiVersion: string;
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
    this.apiVersion = options.apiVersion;
    this.apiKey = encodeURIComponent(options.apiKey);
    this.readAccessToken = options.readAccessToken;
    this.sessionId = options.sessionId;
  }

  async popularMovies(page: number = 1) {
    const data = await this.get(`/${this.apiVersion}/movie/popular`, {
      params: {
        page: page.toString()
      }
    });
    return data;
  }

  async searchMovies(query: string, page: number = 1) {
    console.log(encodeURIComponent("The Dark Knight"));
    const data = await this.get(`/${this.apiVersion}/search/movie`, {
      params: {
        api_key: this.apiKey,
        query,
        page: page.toString()
      }
    });
    return data;
  }

  async genres(): Promise<Genre[]> {
    const data = await this.get<{ genres: Genre[] }>(`/${this.apiVersion}/genre/movie/list`);
    return data.genres;
  }

  async moviesByGenre(genreIds: number[], page: number = 1): Promise<PaginatedResults<Movie>> {
    const data = await this.get<PaginatedResults<Movie>>(`/${this.apiVersion}/discover/movie?`, {
      params: {
        with_genres: genreIds.join(','),
        page: page.toString()
      }
    });
    return data;
  }

  async movie(id: number): Promise<MovieDetails> {
    const data = await this.get<MovieDetails>(`/${this.apiVersion}/movie/${encodeURIComponent(id)}`);
    return data;
  }

  async credits(id: number): Promise<Credits> {
    const data = await this.get<Credits>(`/${this.apiVersion}/movie/${encodeURIComponent(id)}/credits`);
    return data;
  }

  async videos(id: number): Promise<Results<Trailer>> {
    const data = await this.get<Results<Trailer>>(`/${this.apiVersion}/movie/${encodeURIComponent(id)}/videos`);
    return data;
  }

  async recommendations(id: number): Promise<PaginatedResults<Recommendation>> {
    const data = await this.get<PaginatedResults<Recommendation>>(`/${this.apiVersion}/movie/${encodeURIComponent(id)}/recommendations`);
    return data;
  }

  override willSendRequest(_path: string, request: AugmentedRequest) {
    request.headers['Authorization'] = `Bearer ${this.readAccessToken}`
  }
}