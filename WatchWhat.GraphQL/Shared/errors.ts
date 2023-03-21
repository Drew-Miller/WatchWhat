import { GraphQLError } from "graphql";
import { StatusCodes } from "http-status-codes";

export type Error = {
  message: string,
  code: string
  httpStatus: number
};

export class AppErrors {
  public static BASE_URL_FAILED: GraphQLError = new GraphQLError(
    "Movie url is not defined.", {
      extensions: {
        code: "",
        http: {status: StatusCodes.FAILED_DEPENDENCY }
      }
    }
  );

  public static READ_ACCESS_TOKEN_FAILED: GraphQLError = new GraphQLError(
    "READ_ACCESS_TOKEN is not defined.", {
      extensions: {
        code: "",
        http: {status: StatusCodes.FAILED_DEPENDENCY }
      }
    }
  );

  public static API_KEY_FAILED: GraphQLError = new GraphQLError(
    "API_KEY is not defined.", {
      extensions: {
        code: "",
        http: {status: StatusCodes.FAILED_DEPENDENCY }
      }
    }
  );
}