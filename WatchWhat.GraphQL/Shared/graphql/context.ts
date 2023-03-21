import { TmdbAPI } from "../tmdb";
import { WatchmodeAPI } from "../watchmode";
import { WatchWhatAPI } from "../watchwhat";

type MyContext = {
  idToken?: string,
  dataSources: {
    tmdbAPI: TmdbAPI,
    watchmodeAPI: WatchmodeAPI,
    watchWhatAPI: WatchWhatAPI
  };
}

export { MyContext };