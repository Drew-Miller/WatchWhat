import { MyContext } from './context';

// The GraphQL schema
const resolvers = {
  Query: {
    hello: () => 'world',
    ping: () => 'pong',

    genres: async (_: any, __: any, { dataSources }: MyContext) => {
      return dataSources.movieAPI.getGenres();
    },
    moviesByGenre: async(_: any, req: { genreIds: number[], page: number }, { dataSources }: MyContext) => {
      return dataSources.movieAPI.getMoviesByGenre(req.genreIds, req.page);
    }
  },
  // Mutation: {
  //   addBook: async (_: any, req: AddBook, { dataSources }: MyContext) => {
  //     return dataSources.libraryAPI.addBook(req);
  //   }
  // }
};

export { resolvers };