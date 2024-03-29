import {
  AugmentedRequest,
  DataSourceConfig,
  RESTDataSource,
} from "@apollo/datasource-rest";
import {
  AllProviders,
  Credits,
  ExternalIds,
  Genre,
  MediaResult,
  MediaType,
  Page,
  Providers,
  Regions,
  Video,
} from "./dtos";
import { Movie, MovieResult, ReleaseDates } from "./dtos/movie";
import { ContentRatings, TV, TVResult, TVSeason } from "./dtos/tv";

export type TmdbAPIOptions = DataSourceConfig & {
  apiVersion: string;
  apiKey: string;
  readAccessToken: string;
  baseURL: string;
  sessionId?: string;
};

export class TmdbAPI extends RESTDataSource {
  private apiVersion: string;
  private apiKey: string;
  private readAccessToken: string;
  private sessionId?: string;

  constructor(options: TmdbAPIOptions) {
    super(options);

    this.baseURL = options.baseURL;
    this.apiVersion = options.apiVersion;
    this.apiKey = encodeURIComponent(options.apiKey);
    this.readAccessToken = options.readAccessToken;
    this.sessionId = options.sessionId;
  }

  // TMDB API

  async search(media: MediaType | "multi", params: {
    language?: string,
    query: string,
    page?: number,
    includeAdult?: boolean,
    region?: string
  }) {
    const getRequest = {
      params: {
        language: params.language,
        query: params.query,
        page: params.page?.toString(),
        include_adult: params.includeAdult?.toString(),
        region: params.region
      }
    };
    const data = await this.get<Page<MediaResult>>(`${this.apiVersion}/search/${media}?api_key=${this.apiKey}`, );
    return data;
  }

  async trending(media: MediaType | "all", time: "day" | "week", page: number = 1) {
    const data = await this.get<Page<MediaResult>>(
      `${this.apiVersion}/trending/${media}/${time}?api_key=${this.apiKey}&page=${page}`
    );
    return data;
  }

  // Customizable
  async discover(
    media: MediaType,
    params?: {
      page?: number;
      genreIds?: number[];
    }
  ) {
    const data = await this.get<Page<MovieResult>>(
      `${this.apiVersion}/discover/${media}`,
      {
        params: {
          with_genres: params?.genreIds.join(","),
          page: params?.page.toString(),
        },
      }
    );
    
    return data;
  }

  async genres(media: MediaType) {
    const data = await this.get<{ genres: Genre[] }>(
      `${this.apiVersion}/genre/${media}/list`
    );
    return data.genres;
  }

  async allProviders(media: MediaType) {
    const data = await this.get<AllProviders>(
      `${this.apiVersion}/watch/providers/${media}?api_key=${this.apiKey}`
    );
    return data;
  }

  async regions() {
    const data = await this.get<{ results: Regions[] }>(
      `${this.apiVersion}/watch/providers/regions?api_key=${this.apiKey}`
    );
    return data.results;
  }

  async externalIds(id: number, media: MediaType) {
    const data = await this.get<ExternalIds>(
      `${this.apiVersion}/${media}/${id}/external_ids?api_key=${this.apiKey}`
    );
    return data;
  }

  // Movies

  async moviesPopular(params?: { page?: number; region?: string }) {
    const data = await this.get<Page<MovieResult>>(
      `${this.apiVersion}/movie/popular?api_key=${this.apiKey}`,
      {
        params: {
          page: params?.page?.toString(),
          region: params?.region,
        },
      }
    );
    return data;
  }

  async movie(id: number) {
    const data = await this.get<Movie>(`${this.apiVersion}/movie/${id}`);
    return data;
  }

  async movieSimilar(id: number) {
    const data = await this.get<Page<MovieResult>>(
      `${this.apiVersion}/movie/${id}/similar`
    );
    return data;
  }

  async movieRecommendations(id: number) {
    const data = await this.get<Page<MovieResult>>(
      `${this.apiVersion}/movie/${id}/recommendations`
    );
    return data;
  }

  async movieVideos(id: number) {
    const data = await this.get<Page<Video>>(
      `${this.apiVersion}/movie/${id}/videos`
    );
    return data;
  }

  async movieCredits(id: number) {
    const data = await this.get<Credits>(
      `${this.apiVersion}/movie/${id}/credits`
    );
    return data;
  }

  async movieProviders(id: number, region: string) {
    const data = await this.get<Providers>(
      `${this.apiVersion}/movie/${id}/watch/providers`
    );
    const providers = data.results;
    if (region in providers) {
      return providers[region];
    }
    // throw AppErrors.REGION_NOT_FOUND(region);
  }

  async movieReleaseDate(id: number, region: string) {
    const data = await this.get<ReleaseDates>(
      `${this.apiVersion}/movie/${id}/release_dates`
    );
    const releaseDate = data.results.find(
      (x) => x.iso_3166_1.toLocaleLowerCase() === region.toLocaleLowerCase()
    );
    if (!releaseDate) {
      // throw AppErrors.REGION_NOT_FOUND(region);
    }
    return releaseDate;
  }

  async movieRating(id: number, region: string) {
    const releaseDate = await this.movieReleaseDate(id, region);
    const certification = releaseDate.release_dates.map(x => x.certification).filter(rating => !!rating)[0];
    return certification;
  }

  // TV

  async tvPopular(params?: { page?: number; region?: string, language?: string }) {
    const data = await this.get<Page<TVResult>>(
      `${this.apiVersion}/tv/popular?api_key=${this.apiKey}`,
      {
        params: {
          page: params?.page?.toString(),
          region: params?.region,
          language: params?.language
        },
      }
    );
    return data;
  }

  async tv(id: number) {
    const data = await this.get<TV>(`${this.apiVersion}/tv/${id}`);
    return data;
  }

  async tvSimilar(id: number) {
    const data = await this.get<Page<TVResult>>(
      `${this.apiVersion}/tv/${id}/similar`
    );
    return data;
  }

  async tvRecommendations(id: number) {
    const data = await this.get<Page<TVResult>>(
      `${this.apiVersion}/tv/${id}/recommendations`
    );
    return data;
  }

  async tvVideos(id: number) {
    const data = await this.get<Page<Video>>(
      `${this.apiVersion}/tv/${id}/videos`
    );
    return data;
  }

  async tvCredits(id: number) {
    const data = await this.get<Credits>(`${this.apiVersion}/tv/${id}/credits`);
    return data;
  }

  async tvProviders(id: number, region: string) {
    const data = await this.get<Providers>(
      `${this.apiVersion}/tv/${id}/providers`
    );
    const providers = data.results;
    if (region in providers) {
      return providers[region];
    }
    // throw AppErrors.REGION_NOT_FOUND(region);
  }

  async tvRating(id: number, region: string) {
    const data = await this.get<ContentRatings>(
      `${this.apiVersion}/tv/${id}/content_ratings`
    );
    const contentRating = data.results.find(
      (x) => x.iso_3166_1.toLocaleLowerCase() === region.toLocaleLowerCase()
    );
    if (!contentRating) {
      // throw AppErrors.REGION_NOT_FOUND(region);
    }
    return contentRating?.rating;
  }

  // TV Seasons

  async season(id: number, season: number) {
    const data = await this.get<TVSeason>(
      `${this.apiVersion}/tv/${id}/season/${season}`
    );
    return data;
  }

  async seasonVideos(id: number, season: number) {
    const data = await this.get<Page<Video>>(
      `${this.apiVersion}/tv/${id}/season/${season}/videos`
    );
    return data;
  }

  async seasonCredits(id: number, season: number) {
    const data = await this.get<Credits>(
      `${this.apiVersion}/tv/${id}/season/${season}/credits`
    );
    return data;
  }

  // TV Episodes

  async episode(id: number, season: number, episode: number) {
    const data = await this.get<TVSeason>(
      `${this.apiVersion}/tv/${id}/season/${season}/episode/${episode}`
    );
    return data;
  }

  async episodeVideos(id: number, season: number, episode: number) {
    const data = await this.get<Page<Video>>(
      `${this.apiVersion}/tv/${id}/season/${season}/episode/${episode}/videos`
    );
    return data;
  }

  async episodeCredits(id: number, season: number, episode: number) {
    const data = await this.get<Credits>(
      `${this.apiVersion}/tv/${id}/season/${season}/episode/${episode}/credits`
    );
    return data;
  }

  override willSendRequest(_path: string, request: AugmentedRequest) {
    request.headers["Authorization"] = `Bearer ${this.readAccessToken}`;
  }
}
