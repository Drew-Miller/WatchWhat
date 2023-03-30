import { KeyValueCache } from "@apollo/utils.keyvaluecache";
import { AugmentedRequest, DataSourceConfig, RESTDataSource } from '@apollo/datasource-rest';
import { AppErrors } from "../errors";
import { Credits, Genre, GroupedMovies, Movie, MovieDetails, PaginatedResults, Provider, ProviderDisplay, WatchProviders, Region, Results, Trailer, ReleaseDate, MovieRelated, Recommendation } from "./movies/dtos";

export type TmdbAPIOptions = DataSourceConfig & {
  apiVersion: string,
  apiKey: string,
  readAccessToken: string,
  baseURL: string,
  sessionId?: string
};

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


  // Custom methods

  async popularMoviesGrouped(): Promise<GroupedMovies> {
    const data = await this.popularMovies().then(popularMovies => {
      const group: GroupedMovies = {
        id: 0,
        title: "Popular",
        movies: popularMovies.results
      }

      return group
    });

    return data;
  }

  async moviesByGenresGrouped(): Promise<GroupedMovies[]> {
    const genres = await this.genres();

    const promises = genres.map(genre => this.moviesByGenre([genre.id])
      .then(pagedMovies => {
        const group: GroupedMovies = {
          id: genre.id,
          title: genre.name,
          movies: pagedMovies.results
        }

        return group;
      })
    );

    const data: GroupedMovies[] = await Promise.all(promises);
    return data;
  }


  // The Movie DB API

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