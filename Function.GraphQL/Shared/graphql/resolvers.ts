import { GroupedMovies } from '../tmdb/dtos';
import { MyContext } from './context';

type Home = {
  results: GroupedMovies[]
}

// The GraphQL schema
const resolvers = {
  Query: {
    hello: () => 'world',
    ping: () => 'pong',


    discover: async(_:any, __: any, { dataSources }: MyContext) => {
      const promises = Promise.all([
        dataSources.tmdbAPI.popularMoviesGrouped(),
        dataSources.tmdbAPI.moviesByGenresGrouped()
      ]);

      const [ popularMovies, genreCategories ] = await promises;
      const results = [popularMovies, ...genreCategories];
      const home: Home = { results };
      return home;
    },


    popularMovies: async(_: any, req: { page: number }, { dataSources }: MyContext) => {
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
    moviesByGenre: async(_: any, req: { genreIds: number[], page: number }, { dataSources }: MyContext) => {
      return dataSources.tmdbAPI.moviesByGenre(req.genreIds, req.page);
    },

    movie: async(_: any, req: { id: number }, { dataSources }: MyContext) => {
      console.log(req.id);
      return dataSources.tmdbAPI.movie(req.id);
    },
    credits: async(_: any, req: { id: number }, { dataSources }: MyContext) => {
      return dataSources.tmdbAPI.credits(req.id);
    },
    videos: async(_: any, req: { id: number }, { dataSources }: MyContext) => {
      return dataSources.tmdbAPI.videos(req.id);
    },
    recommendations: async(_: any, req: { id: number }, { dataSources }: MyContext) => {
      return dataSources.tmdbAPI.recommendations(req.id);
    },

    webUrl: async(_: any, req: { tmdbId: number, titleType: "movie" | "tv", sourceName: string }, { dataSources }: MyContext) => {
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