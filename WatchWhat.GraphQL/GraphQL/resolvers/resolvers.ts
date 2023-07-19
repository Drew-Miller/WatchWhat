import { WatchWhatContext } from '../context';
import { movieMapper } from '../mappers/movie-mapper';
import { watchablePageMapper } from '../mappers/watchable-page-mapper';
import { Movie } from '../models/movie';
import { Watchable } from '../models/watchable';

// The GraphQL schema
const resolvers = {
  Query: {
    ping: () => 'pong',

    trending: async (_: any, req: { page: number }, { tmdbAPI }: WatchWhatContext) => {
      const data = await tmdbAPI.trending("all", "day", req.page);
      const page = watchablePageMapper.fromMediaResult(data);
      return page;
    },

    popularMovies: async (_: any, req: { page: number }, { tmdbAPI }: WatchWhatContext) => {
      const data = await tmdbAPI.moviesPopular({ page: req.page, region: "US" });
      const page = watchablePageMapper.fromMovieResult(data);
      return page;
    },

    popularTV: async (_: any, req: { page: number }, { tmdbAPI }: WatchWhatContext) => {
      const data = await tmdbAPI.tvPopular({ page: req.page, region: "US", language: "en" });
      const page = watchablePageMapper.fromTVResult(data);
      return page;
    },

    movie: async (_: any, req: { id: number }, { tmdbAPI }: WatchWhatContext) => {
      const data = await tmdbAPI.movie(req.id);
      const movie = movieMapper.from(data);
      return movie;
    },

    // tv: async (_: any, req: { id: number }, { tmdbAPI }: WatchWhatContext) => {
    //   const data = await tmdbAPI.tv(req.id);
    //   return data;
    // }

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
        case "movie": {
          const rating = await tmdbAPI.movieRating(parent.id, "US");
          return rating;
        } case "tv": {
          const rating = await tmdbAPI.tvRating(parent.id, "US");
          return rating;
        }
      }
    },

    imdbId: async (parent: Watchable, __: any, { tmdbAPI }: WatchWhatContext) => {
      const externalIds = await tmdbAPI.externalIds(parent.id, parent.mediaType);
      return externalIds.imdb_id;
    }
  },

  Movie: {
    rating: async (parent: Movie, __: any, { tmdbAPI }: WatchWhatContext) => {
      const rating = await tmdbAPI.movieRating(parent.id, "US");
      return rating;
    },

    imdbId: async (parent: Movie, __: any, { tmdbAPI }: WatchWhatContext) => {
      const externalIds = await tmdbAPI.externalIds(parent.id, "movie");
      return externalIds.imdb_id;
    }
  }
};

export { resolvers };
