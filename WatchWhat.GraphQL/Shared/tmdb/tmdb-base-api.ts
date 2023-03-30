import { KeyValueCache } from "@apollo/utils.keyvaluecache";
import { AugmentedRequest, DataSourceConfig, RESTDataSource } from '@apollo/datasource-rest';
import { AppErrors } from "../errors";
import { Credits, Genre, GroupedMovies, Movie, MovieDetails, PaginatedResults, Provider, ProviderDisplay, WatchProviders, Region, Results, Trailer, ReleaseDate, MovieRelated, Recommendation } from "./dtos";

export interface ITmdbAPI {
  apiName: string
  apiVersion: string;
  apiKey: string;
  readAccessToken: string;
  sessionId?: string;
}

export interface ITmdbMediaAPI extends ITmdbAPI {
  media: MediaType
}

export type TmdbAPIOptions = DataSourceConfig & ITmdbAPI & {
  baseURL: string
};

export type TmdbMediaAPIOptions = TmdbAPIOptions & ITmdbMediaAPI;

export abstract class TmdbAPIBase extends RESTDataSource implements ITmdbAPI {
  apiName: string
  apiVersion: string;
  apiKey: string;
  readAccessToken: string;
  sessionId?: string;

  constructor(options: TmdbAPIOptions) {
    super(options);

    this.apiName = options.apiName ?? "TmdbAPI";

    if (!options.baseURL) {
      throw AppErrors.BASE_URL_FAILED(this.apiName);
    }

    if (!options.apiKey) {
      throw AppErrors.API_KEY_FAILED(this.apiName);
    }

    if (!options.readAccessToken) {
      throw AppErrors.READ_ACCESS_TOKEN_FAILED(this.apiName);
    }

    this.baseURL = options.baseURL;
    this.apiVersion = options.apiVersion;
    this.apiKey = encodeURIComponent(options.apiKey);
    this.readAccessToken = options.readAccessToken;
    this.sessionId = options.sessionId;
  }
}

export abstract class TmdbMediaAPIBase extends TmdbAPIBase implements ITmdbMediaAPI {
  apiName: string
  apiVersion: string;
  apiKey: string;
  readAccessToken: string;
  media: MediaType;
  sessionId?: string;

  constructor(options: TmdbMediaAPIOptions) {
    super(options);

    if (!options.media) {
      throw AppErrors.CONFIG_FAILED(`${this.apiName} -> Media`);
    }

    this.media = options.media;
  }


  // The Movie DB API

  async popular(page: number = 1) {
    const data = await this.get(`/${this.apiVersion}/${this.media}/popular`, {
      params: {
        page: page.toString()
      }
    });
    return data;
  }

  async search(query: string, page: number = 1) {
    const data = await this.get(`/${this.apiVersion}/search/${this.media}`, {
      params: {
        api_key: this.apiKey,
        query,
        page: page.toString()
      }
    });
    return data;
  }

  async regions(): Promise<Region[]> {
    const data = await this.get<{ results: Region[] }>(`/${this.apiVersion}/watch/providers/regions?api_key=${this.apiKey}`);
    return data.results;
  }

  async movieProviders(region: string = ""): Promise<Provider[]> {
    const data = await this.get<{ results: ProviderDisplay[] }>(`/${this.apiVersion}/watch/providers/movie?api_key=${this.apiKey}`);
    const results: Provider[] = data.results.map(result => {
      if (!!region && region in result.display_priorities) {
        result.display_priority = result.display_priorities[region];
      }
      return result as Provider;
    })
    return results;
  }

  async watchMovie(movieId: number, region: string): Promise<WatchProviders | null> {
    const data = await this.get<{ results: { [country: string]: WatchProviders } }>(`/${this.apiVersion}/movie/${movieId}/watch/providers?api_key=${this.apiKey}`);
    const results = data.results;
    if (region in results) {
      return results[region];
    }
    return null;
  }

  async genres(): Promise<Genre[]> {
    const data = await this.get<{ genres: Genre[] }>(`/${this.apiVersion}/genre/movie/list`);
    return data.genres;
  }

  async moviesByGenre(genreIds: number[], page: number = 1): Promise<PaginatedResults<Movie>> {
    const data = await this.get<PaginatedResults<Movie>>(`/${this.apiVersion}/discover/movie`, {
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

  async releaseDates(id: number): Promise<ReleaseDate[]> {
    const data = await this.get<{ results: ReleaseDate[] }>(`/${this.apiVersion}/movie/${encodeURIComponent(id)}/release_dates?api_key=${this.apiKey}`);
    const results = data.results;
    return results;
  }

  async credits(id: number): Promise<Credits> {
    const data = await this.get<Credits>(`/${this.apiVersion}/movie/${encodeURIComponent(id)}/credits`);
    return data;
  }

  async videos(id: number): Promise<Results<Trailer>> {
    const data = await this.get<Results<Trailer>>(`/${this.apiVersion}/movie/${encodeURIComponent(id)}/videos`);
    return data;
  }

  async similar(id: number): Promise<PaginatedResults<MovieRelated>> {
    const data = await this.get<PaginatedResults<MovieRelated>>(`/${this.apiVersion}/movie/${encodeURIComponent(id)}/similar`);
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