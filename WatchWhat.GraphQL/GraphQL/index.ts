import { ApolloServer } from "@apollo/server";
import { startServerAndCreateHandler } from "@as-integrations/azure-functions";
import { Context } from "@azure/functions";
import { loadFiles } from "graphql-import-files";

import { WatchWhatContext } from "./context";
import { resolvers } from "./resolvers/resolvers";

import { TmdbAPI, TmdbAPIOptions } from "../Shared/tmdb";
import { WatchmodeAPI, WatchmodeAPIOptions } from "../Shared/watchmode";
import { WatchWhatAPI, WatchWhatAPIOptions } from "../Shared/watchwhat";

// TMDB Variables
const { TMDB_BASE_URL, TMDB_API_VERSION, TMDB_API_KEY, TMDB_READ_ACCESS_TOKEN } = process.env;

// Watchmode Variables
const { WATCHMODE_BASE_URL, WATCHMODE_API_VERSION, WATCHMODE_API_KEY } = process.env;

// WatchWhat Variables
const { WATCHWHAT_BASE_URL, WATCHWHAT_FUNCTION_KEY } = process.env;

const typeDefs = loadFiles("**/schemas/**/*.{graphql,gql}");

// Apollo Server setup
const server = new ApolloServer<WatchWhatContext>({
  typeDefs: [typeDefs],
  resolvers: [resolvers],
  csrfPrevention: true,
  cache: "bounded"
});

export default startServerAndCreateHandler(server, {
  context: async (args: { context: Context }) => {
    const { cache } = server;
    const { req, res } = args.context;

    const token = req.headers.authorization;
    const sessionId = req.headers.sessionId;

    const tmdbOptions: TmdbAPIOptions = {
      baseURL: TMDB_BASE_URL,
      apiVersion: TMDB_API_VERSION,
      apiKey: TMDB_API_KEY,
      readAccessToken: TMDB_READ_ACCESS_TOKEN,
      cache
    };

    const watchmodeOptions: WatchmodeAPIOptions = {
      baseURL: WATCHMODE_BASE_URL,
      apiVersion: WATCHMODE_API_VERSION,
      apiKey: WATCHMODE_API_KEY,
      cache
    };

    const watchWhatOptions: WatchWhatAPIOptions = {
      baseURL: WATCHWHAT_BASE_URL,
      functionKey: WATCHWHAT_FUNCTION_KEY,
      token
    };

    return {
      tmdbAPI: new TmdbAPI(tmdbOptions),
      watchmodeAPI: new WatchmodeAPI(watchmodeOptions),
      watchWhatAPI: new WatchWhatAPI(watchWhatOptions)
    };
  }
});
