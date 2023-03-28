import { AzureFunction, Context, HttpRequest } from "@azure/functions";
import { DecodedIdToken } from "firebase-admin/auth";
import { authReq, authRes } from "../Shared/auth";
import { Logs } from "../Shared/logger";

const httpTrigger: AzureFunction = async function (
  context: Context,
  req: HttpRequest
): Promise<void> {
  Logs.init(context);

  try {
    let token: DecodedIdToken = await authReq(context, req);
    authRes();

    context.res = {
      status: 200 /* Defaults to 200 */,
      body: token,
    };
  } catch (error) {
    authRes();
  }
};

export default httpTrigger;
