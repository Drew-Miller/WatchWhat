import { GraphQLError } from "graphql";
import { StatusCodes } from "http-status-codes";

export type Error = {
  message: string,
  code: string
  httpStatus: number
};

type CreateGraphQLError = (source: string) => GraphQLError;

export class AppErrors {


  // Initialization Errors

  public static BASE_URL_FAILED: CreateGraphQLError = (source: string) => new GraphQLError(
    `${source} Base url is not defined.`, {
      extensions: {
        code: "",
        http: {status: StatusCodes.FAILED_DEPENDENCY }
      }
    }
  );

  public static API_VERSION_FAILED: CreateGraphQLError = (source: string) => new GraphQLError(
    `${source} API Version is not defined.`, {
      extensions: {
        code: "",
        http: {status: StatusCodes.FAILED_DEPENDENCY }
      }
    }
  );

  public static READ_ACCESS_TOKEN_FAILED: CreateGraphQLError = (source: string) => new GraphQLError(
    `${source} READ_ACCESS_TOKEN is not defined.`, {
      extensions: {
        code: "",
        http: {status: StatusCodes.FAILED_DEPENDENCY }
      }
    }
  );

  public static API_KEY_FAILED: CreateGraphQLError = (source: string) => new GraphQLError(
    `${source} API_KEY is not defined.`, {
      extensions: {
        code: "",
        http: {status: StatusCodes.FAILED_DEPENDENCY }
      }
    }
  );

  public static CONFIG_FAILED: CreateGraphQLError = (source: string) => new GraphQLError(
    `${source} CONFIG is not defined.`, {
      extensions: {
        code: "",
        http: {status: StatusCodes.FAILED_DEPENDENCY }
      }
    }
  );
}