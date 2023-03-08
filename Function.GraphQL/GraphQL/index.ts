import { Context } from "@azure/functions";
import { ApolloServer } from "@apollo/server";
import { startServerAndCreateHandler } from "@as-integrations/azure-functions";
import { MyContext, resolvers, typeDefs } from "../Shared/graphql";
import { MovieAPI, MovieAPIOptions } from "../Shared/movie-api";

const { MOVIE_BASE_URL, MOVIE_API_VERSION, MOVIE_API_KEY, MOVIE_READ_ACCESS_TOKEN } = process.env;

// Apollo Server setup
const server = new ApolloServer<MyContext>({
  typeDefs,
  resolvers,
  csrfPrevention: true,
  cache: "bounded"
});

export default startServerAndCreateHandler(server, {
  context: async (args: { context: Context }) => {
    const { cache } = server;
    const { req, res } = args.context;

    const sessionId = req.headers.sessionId;

    const options: MovieAPIOptions = {
      baseURL: MOVIE_BASE_URL,
      apiVersion: MOVIE_API_VERSION,
      apiKey: MOVIE_API_KEY,
      readAccessToken: MOVIE_READ_ACCESS_TOKEN,
      cache
    };

    const dataSources = {
      movieAPI: new MovieAPI(options)
    };

    return { dataSources };
  }
});
