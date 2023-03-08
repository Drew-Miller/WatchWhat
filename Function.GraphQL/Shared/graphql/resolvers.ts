import { MyContext } from './context';

// The GraphQL schema
const resolvers = {
  Query: {
    hello: () => 'world',
    ping: () => 'pong',

    popularMovies: async(_: any, req: { page: number }, { dataSources }: MyContext) => {
      return dataSources.movieAPI.popularMovies(req.page);
    },

    searchMovies: async (_: any, req: { query: string, page: number }, { dataSources }: MyContext) => {
      return dataSources.movieAPI.searchMovies(req.query, req.page);
    },

    genres: async (_: any, __: any, { dataSources }: MyContext) => {
      return dataSources.movieAPI.genres();
    },
    moviesByGenre: async(_: any, req: { genreIds: number[], page: number }, { dataSources }: MyContext) => {
      return dataSources.movieAPI.moviesByGenre(req.genreIds, req.page);
    },

    movie: async(_: any, req: { id: number }, { dataSources }: MyContext) => {
      console.log(req.id);
      return dataSources.movieAPI.movie(req.id);
    },
    credits: async(_: any, req: { id: number }, { dataSources }: MyContext) => {
      return dataSources.movieAPI.credits(req.id);
    },
    videos: async(_: any, req: { id: number }, { dataSources }: MyContext) => {
      return dataSources.movieAPI.videos(req.id);
    },
    recommendations: async(_: any, req: { id: number }, { dataSources }: MyContext) => {
      return dataSources.movieAPI.recommendations(req.id);
    },
  },
  // Mutation: {
  //   addBook: async (_: any, req: AddBook, { dataSources }: MyContext) => {
  //     return dataSources.libraryAPI.addBook(req);
  //   }
  // }
};

export { resolvers };