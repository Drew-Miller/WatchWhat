import { TmdbAPI } from "../tmdb";
import { WatchmodeAPI } from "../watchmode";
import { WatchWhatAPI } from "../watchwhat";

type MyContext = {
  // Context typing
  dataSources: {
    tmdbAPI: TmdbAPI,
    watchmodeAPI: WatchmodeAPI,
    watchWhatAPI: WatchWhatAPI
  };
}

export { MyContext };