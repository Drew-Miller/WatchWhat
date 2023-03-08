import { GraphQLError } from "graphql";
import { StatusCodes } from "http-status-codes";

export type Error = {
  message: string,
  code: string
  httpStatus: number
};

export class AppErrors {
  public static MOVIE_URL_FAILED: GraphQLError = new GraphQLError(
    "Movie url is not defined.", {
      extensions: {
        code: "",
        http: {status: StatusCodes.FAILED_DEPENDENCY }
      }
    }
  );

  public static MOVIE_READ_ACCESS_TOKEN_FAILED: GraphQLError = new GraphQLError(
    "READ_ACCESS_TOKEN is not defined.", {
      extensions: {
        code: "",
        http: {status: StatusCodes.FAILED_DEPENDENCY }
      }
    }
  );

  public static MOVIE_API_KEY_FAILED: GraphQLError = new GraphQLError(
    "API_KEY is not defined.", {
      extensions: {
        code: "",
        http: {status: StatusCodes.FAILED_DEPENDENCY }
      }
    }
  );
}