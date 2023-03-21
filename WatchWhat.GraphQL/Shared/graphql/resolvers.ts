import { GroupedMovies, MovieDetails } from '../tmdb/dtos';
import { MyContext } from './context';

type DiscoverView = {
  results: GroupedMovies[]
};

type MovieDetailsView = MovieDetails & {
  mpaa_rating: string
};

// The GraphQL schema
const resolvers = {
  Query: {
    ping: () => 'pong',

    health: async (_: any, __: any, { dataSources }: MyContext) => {
      return dataSources.watchWhatAPI.health();
    },

    // TmdbAPI

    discover: async (_:any, __: any, { dataSources }: MyContext) => {
      const promises = Promise.all([
        dataSources.tmdbAPI.popularMoviesGrouped(),
        dataSources.tmdbAPI.moviesByGenresGrouped()
      ]);

      const [ popularMovies, genreCategories ] = await promises;
      const results = [popularMovies, ...genreCategories];
      const home: DiscoverView = { results };
      return home;
    },

    popularMovies: async (_: any, req: { page: number }, { dataSources }: MyContext) => {
      return dataSources.tmdbAPI.popularMovies(req.page);
    },

    searchMovies: async (_: any, req: { query: string, page: number }, { dataSources }: MyContext) => {
      return dataSources.tmdbAPI.searchMovies(req.query, req.page);
    },

    regions: async (_: any, __: any, { dataSources }: MyContext) => {
      return dataSources.tmdbAPI.regions();
    },
    movieProviders: async (_: any, req: { region?: string }, { dataSources }: MyContext) => {
      return dataSources.tmdbAPI.movieProviders(req.region);
    },
    watchMovie: async (_: any, req: { movieId: number, region: string }, { dataSources }: MyContext) => {
      return dataSources.tmdbAPI.watchMovie(req.movieId, req.region);
    },

    genres: async (_: any, __: any, { dataSources }: MyContext) => {
      return dataSources.tmdbAPI.genres();
    },
    moviesByGenre: async (_: any, req: { genreIds: number[], page: number }, { dataSources }: MyContext) => {
      return dataSources.tmdbAPI.moviesByGenre(req.genreIds, req.page);
    },

    movie: async (_: any, req: { id: number }, { dataSources }: MyContext) => {
      const [ movie, releaseDates ] = await Promise.all([
        dataSources.tmdbAPI.movie(req.id),
        dataSources.tmdbAPI.releaseDates(req.id).then(releaseDates => {
          return releaseDates.filter(x => x.iso_3166_1.toLocaleLowerCase() == "US".toLocaleLowerCase());
        }),
      ]);

      const mpaaRating = !!releaseDates.length && !!releaseDates[0].release_dates.length ? releaseDates[0].release_dates[0].certification : "";
      const result: MovieDetailsView = {
        ...movie,
        mpaa_rating: mpaaRating
      };

      return result;
    },
    credits: async (_: any, req: { id: number }, { dataSources }: MyContext) => {
      return dataSources.tmdbAPI.credits(req.id);
    },
    videos: async (_: any, req: { id: number }, { dataSources }: MyContext) => {
      return dataSources.tmdbAPI.videos(req.id);
    },
    similar: async (_: any, req: { id: number }, { dataSources }: MyContext) => {
      return dataSources.tmdbAPI.similar(req.id);
    },
    recommendations: async (_: any, req: { id: number }, { dataSources }: MyContext) => {
      return dataSources.tmdbAPI.recommendations(req.id);
    },


    // Watchmode API

    webUrl: async (_: any, req: { tmdbId: number, titleType: "movie" | "tv", sourceName: string }, { dataSources }: MyContext) => {
      return dataSources.watchmodeAPI.webUrl(req.tmdbId, req.titleType, req.sourceName);
    },

  },
  // Mutation: {
  //   addBook: async (_: any, req: AddBook, { dataSources }: MyContext) => {
  //     return dataSources.libraryAPI.addBook(req);
  //   }
  // }
};

export { resolvers };