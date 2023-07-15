import { WatchWhatContext } from '../context';
import { pageMapper } from '../mappers/page-mapper';
import { Watchable } from '../models/watchable';

// The GraphQL schema
const resolvers = {
  Query: {
    ping: () => 'pong',

    trending: async (_: any, req: { page: number }, { tmdbAPI }: WatchWhatContext) => {
      const data = await tmdbAPI.trending("all", "day", req.page);
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
    rating: async (parent: Watchable, __: any, { tmdbAPI }: WatchWhatContext) => {
      switch (parent.mediaType) {
        case "movie":
          const rating = await tmdbAPI.movieRating(parent.id, "US");
          return rating;
        case "tv":
          const contentRating = await tmdbAPI.tvContentRating(parent.id, "US");
          return contentRating.rating;
      }
    },

    imdbId: async (parent: Watchable, __: any, { tmdbAPI }: WatchWhatContext) => {
      const externalIds = await tmdbAPI.externalIds(parent.id, parent.mediaType);
      return externalIds.imdb_id;
    }
  }
};

export { resolvers };
