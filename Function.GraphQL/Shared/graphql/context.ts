import { TmdbAPI } from "../tmdb";
import { WatchmodeAPI } from "../watchmode";

type MyContext = {
  // Context typing
  dataSources: {
    tmdbAPI: TmdbAPI,
    watchmodeAPI: WatchmodeAPI
  };
}

export { MyContext };