import { TmdbAPI } from "../Shared/tmdb";
import { TmdbContext } from "../Shared/tmdb/graphql/context";
import { WatchmodeAPI } from "../Shared/watchmode";
import { WatchWhatAPI } from "../Shared/watchwhat";

export type MyContext = TmdbContext & {
  watchmodeAPI: WatchmodeAPI,
  watchWhatAPI: WatchWhatAPI
};
