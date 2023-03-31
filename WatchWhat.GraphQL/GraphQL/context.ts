import { TmdbAPI } from "../Shared/tmdb";
import { TmdbContext } from "../Shared/tmdb/graphql/context";
import { WatchmodeAPI } from "../Shared/watchmode";
import { WatchWhatAPI } from "../Shared/watchwhat";

type Context = TmdbContext & {
  tmdbAPI: TmdbAPI,
  watchmodeAPI: WatchmodeAPI,
  watchWhatAPI: WatchWhatAPI
}

export { Context };