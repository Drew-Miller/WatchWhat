import { KeyValueCache } from "@apollo/utils.keyvaluecache";
import { AugmentedRequest, DataSourceConfig, RESTDataSource } from '@apollo/datasource-rest';
import { AppErrors } from "../errors";
import { ContentRatings, TV, TVResult } from "./dtos/tv";
import { Movie, MovieResult, ReleaseDates } from "./dtos/movie";
import { AllProviders, Credits, Genre, Page, Providers, Regions } from "./dtos";

export type TmdbAPIOptions = DataSourceConfig & {
  apiVersion: string,
  apiKey: string,
  readAccessToken: string,
  baseURL: string,
  sessionId?: string
};

type MediaType =
  | "tv"
  | "movie";

type MixedMedia = MovieResult | TVResult;

export class TmdbAPI extends RESTDataSource {
  private apiVersion: string;
  private apiKey: string;
  private readAccessToken: string;
  private sessionId?: string;

  constructor(options: TmdbAPIOptions) {
    super(options);

    if (!options.baseURL) {
      throw AppErrors.BASE_URL_FAILED("TmdbAPI");
    }

    if (!options.apiKey) {
      throw AppErrors.API_KEY_FAILED("TmdbAPI");
    }

    if (!options.readAccessToken) {
      throw AppErrors.READ_ACCESS_TOKEN_FAILED("TmdbAPI");
    }

    this.baseURL = options.baseURL;
    this.apiVersion = options.apiVersion;
    this.apiKey = encodeURIComponent(options.apiKey);
    this.readAccessToken = options.readAccessToken;
    this.sessionId = options.sessionId;
  }

  // TMDB API

  async trending(media: MediaType | "all", time: "day" | "week") {
    const data = await this.get<MixedMedia[]>(`{this.apiVersion}/trending/${media}/${time}?api_key=${encodeURIComponent(this.apiKey)}`);
    return data;
  }

  // Customizable
  async discover(media: MediaType, params?: {
    page?: number,
    genreIds?: number[]
  }) {
    const data = await this.get<MixedMedia[]>(`{this.apiVersion}/discover/${media}`, {
      params: {
        with_genres: params?.genreIds.join(','),
        page: params?.page.toString()
      }
    });
    return data;
  }

  // Customizable
  async search(media: MediaType | "multi", params: {
    language?: string,
    query: string,
    page?: number,
    includeAdult?: boolean,
    region?: string
  }) {
    const data = await this.get<MixedMedia[]>(`{this.apiVersion}/search/${media}?api_key=${encodeURIComponent(this.apiKey)}`, {
      params: {
        language: params.language,
        query: params.query,
        page: params.page.toString(),
        include_adult: params.includeAdult?.toString(),
        region: params.region
      }
    });
    return data;
  }

  async genres(media: MediaType) {
    const data = await this.get<Genre[]>(`{this.apiVersion}/genre/${media}`);
    return data;
  }

  async providers(media: MediaType) {
    const data = await this.get<AllProviders>(`{this.apiVersion}/watch/providers/${media}?api_key=${encodeURIComponent(this.apiKey)}`);
    return data;
  }

  async regions() {
    const data = await this.get<Regions[]>(`{this.apiVersion}/watch/providers/regions?api_key=${encodeURIComponent(this.apiKey)}`);
    return data;
  }


  // Movies

  async moviesPopular(params?: {
    page?: number,
    region?: string
  }) {
    const data = await this.get<Page<MovieResult>>(`{this.apiVersion}/movie/popular?api_key=${encodeURIComponent(this.apiKey)}`, {
      params: {
        page: params?.page?.toString(),
        region: params?.region
      }
    });
    return data;
  }

  async movie(id: number) {
    const data = await this.get<Movie>(`{this.apiVersion}/movie/${id}`);
    return data;
  }

  async moviesSimilar(id: number) {
    const data = await this.get<Page<MovieResult>>(`{this.apiVersion}/movie/${id}/similar`);
    return data;
  }

  async movieRecommendations(id: number) {
    const data = await this.get<Page<MovieResult>>(`{this.apiVersion}/movie/${id}/recommendations`);
    return data;
  }

  async movieVideos(id: number) {
    const data = await this.get<Page<MovieResult>>(`{this.apiVersion}/movie/${id}/videos`);
    return data;
  }

  async movieCredits(id: number) {
    const data = await this.get<Credits>(`{this.apiVersion}/movie/${id}/credits`);
    return data;
  }

  async movieProviders(id: number, region: string) {
    const data = await this.get<Providers>(`{this.apiVersion}/movie/${id}/providers`);
    const providers = data.results;
    if (region in providers) {
      return providers[region];
    }
    throw AppErrors.REGION_NOT_FOUND(region);
  }

  async movieReleaseDates(id: number, region: string) {
    const data = await this.get<ReleaseDates>(`{this.apiVersion}/movie/${id}/release_dates`);
    const releaseDate = data.results.find(x => x.iso_3166_1.toLocaleLowerCase() === region.toLocaleLowerCase());
    if (!releaseDate) {
      throw AppErrors.REGION_NOT_FOUND(region);
    }
    return releaseDate;
  }


  // TV

  async tvPopular(params?: {
    page?: number,
    region?: string
  }) {
    const data = await this.get<Page<TVResult>>(`{this.apiVersion}/tv/popular?api_key=${encodeURIComponent(this.apiKey)}`, {
      params: {
        page: params?.page?.toString(),
        region: params?.region
      }
    });
    return data;
  }

  async tv(id: number) {
    const data = await this.get<TV>(`{this.apiVersion}/tv/${id}`);
    return data;
  }

  async tvSimilar(id: number) {
    const data = await this.get<Page<TVResult>>(`{this.apiVersion}/tv/${id}/similar`);
    return data;
  }

  async tvRecommendations(id: number) {
    const data = await this.get<Page<TVResult>>(`{this.apiVersion}/tv/${id}/recommendations`);
    return data;
  }

  async tvVideos(id: number) {
    const data = await this.get<Page<TVResult>>(`{this.apiVersion}/tv/${id}/videos`);
    return data;
  }

  async tvCredits(id: number) {
    const data = await this.get<Credits>(`{this.apiVersion}/tv/${id}/credits`);
    return data;
  }

  async tvProviders(id: number, region: string) {
    const data = await this.get<Providers>(`{this.apiVersion}/tv/${id}/providers`);
    const providers = data.results;
    if (region in providers) {
      return providers[region];
    }
    throw AppErrors.REGION_NOT_FOUND(region);
  }

  async tvContentRatings(id: number, region: string) {
    const data = await this.get<ContentRatings>(`{this.apiVersion}/tv/${id}/content_ratings`);
    const contentRating = data.results.find(x => x.iso_3166_1.toLocaleLowerCase() === region.toLocaleLowerCase());
    if (!contentRating) {
      throw AppErrors.REGION_NOT_FOUND(region);
    }
    return contentRating;
  }

  

  override willSendRequest(_path: string, request: AugmentedRequest) {
    request.headers['Authorization'] = `Bearer ${this.readAccessToken}`
  }
}