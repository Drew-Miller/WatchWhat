import { MovieAPI } from "../movie-api/movie-api";

type MyContext = {
  // Context typing
  dataSources: {
    movieAPI: MovieAPI
  };
}

export { MyContext };