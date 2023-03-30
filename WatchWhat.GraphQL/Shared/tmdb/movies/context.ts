import { TmdbAPI } from "/";

type MyContext = {
  dataSources: {
    tmdbAPI: TmdbAPI
  };
}

export { MyContext };