import { AzureFunction, Context, HttpRequest } from "@azure/functions";
import { Providers } from "../Shared/providers";

const httpTrigger: AzureFunction = async function (
  context: Context,
  req: HttpRequest
): Promise<void> {
  try {
    const providers = await Providers.initialize(context);

    const results = await providers.listProviders();

    context.res = {
      // status: 200, /* Defaults to 200 */
      body: results,
    };
  } catch (error) {
    context.log("Uh oh!");
    context.log(JSON.stringify(error));

    context.res = {
      status: 400,
      body: JSON.stringify(error),
    };
  }
};

export default httpTrigger;
