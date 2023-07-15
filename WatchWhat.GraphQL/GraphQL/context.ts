import { TmdbAPI } from "../Shared/tmdb";
import { WatchmodeAPI } from "../Shared/watchmode";
import { WatchWhatAPI } from "../Shared/watchwhat";

export type WatchWhatContext = {
  tmdbAPI: TmdbAPI,
  watchmodeAPI: WatchmodeAPI,
  watchWhatAPI: WatchWhatAPI
};
