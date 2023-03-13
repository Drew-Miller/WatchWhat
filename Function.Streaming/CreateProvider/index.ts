import { AzureFunction, Context, HttpRequest } from "@azure/functions"
import { Provider } from "../Shared/provider";
import { Providers } from "../Shared/providers";

const httpTrigger: AzureFunction = async function (context: Context, req: HttpRequest): Promise<void> {
    context.log(`Request Method: ${req.method}`);
    context.log(`Request Body: ${JSON.stringify(req.body)}`);

    const dto = req.body as Provider;

    try {
        const providers = await Providers.initialize(context);

        const result = await providers.upsertEntity(dto);

        context.res = {
            // status: 200, /* Defaults to 200 */
            body: result
        };
    } catch(error) {
        context.log("Uh oh!");
        context.log(JSON.stringify(error));
    
        context.res = {
          status: 400,
          body: JSON.stringify(error)
        }
    }
};

export default httpTrigger;