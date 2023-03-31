import { MyContext } from './context';

// The GraphQL schema
const resolvers = {
  Query: {
    ping: () => 'pong',

    // WatchWhatAPI

    health: async (_: any, __: any, { watchWhatAPI }: MyContext) => {
      return watchWhatAPI.health();
    },

    authenticated: async (_: any, __: any, { watchWhatAPI }: MyContext) => {
      return watchWhatAPI.authenticated();
    },

    // Watchmode API

    webUrl: async (_: any, req: { tmdbId: number, titleType: "movie" | "tv", sourceName: string }, { watchmodeAPI }: MyContext) => {
      return watchmodeAPI.webUrl(req.tmdbId, req.titleType, req.sourceName);
    },

  },
  // Mutation: {
  //   addBook: async (_: any, req: AddBook, { dataSources }: MyContext) => {
  //     return dataSources.libraryAPI.addBook(req);
  //   }
  // }
};

export { resolvers };
