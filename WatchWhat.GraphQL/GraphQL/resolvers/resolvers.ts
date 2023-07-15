import { WatchWhatContext } from '../context';
import { pageMapper } from '../mappers/page-mapper';
import { Watchable } from '../models/watchable';

// The GraphQL schema
const resolvers = {
  Query: {
    ping: () => 'pong',

    trending: async (_: any, req: { page: number }, { tmdbAPI }: WatchWhatContext) => {
      const data = await tmdbAPI.trending("all", "day");
      const page = pageMapper.fromMediaResult(data);
      return page;
    }

    // WatchWhatAPI

    // health: async (_: any, __: any, { watchWhatAPI }: WatchWhatContext) => {
    //   return watchWhatAPI.health();
    // },

    // authenticated: async (_: any, __: any, { watchWhatAPI }: WatchWhatContext) => {
    //   return watchWhatAPI.authenticated();
    // },

    // // Watchmode API

    // webUrl: async (_: any, req: { tmdbId: number, titleType: "movie" | "tv", sourceName: string }, { watchmodeAPI }: WatchWhatContext) => {
    //   return watchmodeAPI.webUrl(req.tmdbId, req.titleType, req.sourceName);
    // },
  },
  
  Watchable: {
    rating: (parent: Watchable) => {
      switch (parent.mediaType) {
        case "movie":
          return "MOVIE RATING";
        case "tv":
          return "TV RATING";
      }
    },

    tmdbId: (parent: Watchable) => {
      return 1;
    }
  }
};

export { resolvers };
