import { AppErrors } from '../../errors';
import { Credits, Movie, Page, Provider, ProviderTypes, TV, Video } from '../dtos';
import { MediaResult, MediaType, MixedMedia } from '../media';
import { TmdbContext } from './context';

type MovieRated = Movie & {
  mpaa_rating: string
};

type TVRated = TV & {
  content_rating: string
};

// The GraphQL schema
export const tmdbResolvers = {
  Query: {

    // Media Results

    trending: async (_: any, req: { media: MediaType | "all", time: "day" | "week"}, { tmdbAPI }: TmdbContext) => {
      const data = await tmdbAPI.trending(req.media, req.time);
      return mediaPage(data);
    },
    discover: async (_: any, req: { media: MediaType, params }, { tmdbAPI }: TmdbContext) => {
      const data = await tmdbAPI.discover(req.media, req.params);
      return mediaPage(data);
    },
    search: async (_: any, req: { media: MediaType | "multi", params }, { tmdbAPI }: TmdbContext) => {
      const data = await tmdbAPI.search(req.media, req.params);
      return mediaPage(data);
    },
    popular: async (_: any, req: { media: MediaType, params }, { tmdbAPI }: TmdbContext) => {
      let data: Page<MixedMedia>;
      switch (req.media) {
        case "movie": {
          data = await tmdbAPI.moviesPopular(req.params);
          break;
        } case "tv": {
          data = await tmdbAPI.tvPopular(req.params);
          break;
        } default: {
          throw AppErrors.IS_NOT_MEDIA;
        }
      }
      
      return mediaPage(data);
    },
    similar: async (_: any, req: { media: MediaType, id: number }, { tmdbAPI }: TmdbContext) => {
      let data: Page<MixedMedia>;
      switch (req.media) {
        case "movie": {
          data = await tmdbAPI.movieSimilar(req.id);
          break;
        } case "tv": {
          data = await tmdbAPI.tvSimilar(req.id);
          break;
        } default: {
          throw AppErrors.IS_NOT_MEDIA;
        }
      }
      
      return mediaPage(data);
    },
    recommendations: async (_: any, req: { media: MediaType, id: number }, { tmdbAPI }: TmdbContext) => {
      let data: Page<MixedMedia>;
      switch (req.media) {
        case "movie": {
          data = await tmdbAPI.movieRecommendations(req.id);
          break;
        } case "tv": {
          data = await tmdbAPI.tvRecommendations(req.id);
          break;
        } default: {
          throw AppErrors.IS_NOT_MEDIA;
        }
      }
      
      return mediaPage(data);
    },

    // Extras

    videos: async (_: any, req: { media: MediaType, id: number }, { tmdbAPI }: TmdbContext) => {
      let data: Page<Video>;
      switch (req.media) {
        case "movie": {
          data = await tmdbAPI.movieVideos(req.id);
          break;
        } case "tv": {
          data = await tmdbAPI.tvVideos(req.id);
          break;
        } default: {
          throw AppErrors.IS_NOT_MEDIA;
        }
      }
      
      return data;
    },
    credits: async (_: any, req: { media: MediaType, id: number }, { tmdbAPI }: TmdbContext) => {
      let data: Credits;
      switch (req.media) {
        case "movie": {
          data = await tmdbAPI.movieCredits(req.id);
          break;
        } case "tv": {
          data = await tmdbAPI.tvCredits(req.id);
          break;
        } default: {
          throw AppErrors.IS_NOT_MEDIA;
        }
      }
      
      return data;
    },
    providers: async (_: any, req: { media: MediaType, id: number, region: string }, { tmdbAPI }: TmdbContext) => {
      let data: ProviderTypes;
      switch (req.media) {
        case "movie": {
          data = await tmdbAPI.movieProviders(req.id, req.region);
          break;
        } case "tv": {
          data = await tmdbAPI.tvProviders(req.id, req.region);
          break;
        } default: {
          throw AppErrors.IS_NOT_MEDIA;
        }
      }
      
      return data;
    },

    genres: async (_: any, req: { media: MediaType }, { tmdbAPI }: TmdbContext) => {
      return tmdbAPI.genres(req.media);
    },
    allProviders: async (_: any, req: { media: MediaType, region: string }, { tmdbAPI }: TmdbContext) => {
      const data = await tmdbAPI.allProviders(req.media);
      return {
        id: data.id,
        results: data.results.map(result => {
          const display_priority = result.display_priorities[req.region];
          const ret: Provider & { display_priority: number } = {
            ...result,
            display_priority
          };
          return ret;
        })
      }
    },
    regions: async (_: any, __: any, { tmdbAPI }: TmdbContext) => {
      return tmdbAPI.regions();
    },

    // Movies
    movie: async (_: any, req: { id: number, region?: string }, { tmdbAPI }: TmdbContext) => {
      let region = req.region ?? "US";
      const [ movie, releaseDate ] = await Promise.all([
        tmdbAPI.movie(req.id),
        tmdbAPI.movieReleaseDates(req.id, region)
      ]);

      const mpaaRating = releaseDate?.release_dates[0]?.certification ?? "Unrated";
      const result: MovieRated = {
        ...movie,
        mpaa_rating: mpaaRating
      };

      return result;
    },

    // TV
    tv: async (_: any, req: { id: number, region?: string }, { tmdbAPI }: TmdbContext) => {
      let region = req.region ?? "US";
      const [ movie, contentRating ] = await Promise.all([
        tmdbAPI.tv(req.id),
        tmdbAPI.tvContentRatings(req.id, region)
      ]);

      const result: TVRated = {
        ...movie,
        content_rating: contentRating.rating
      };

      return result;
    },
  },
};

function mediaPage(page: Page<MixedMedia>) {
  const result: Page<MediaResult> = {
    ...page,
    results: page.results.map(x => new MediaResult(x))
  }
  return result;
}
