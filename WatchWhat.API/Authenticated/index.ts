import { AzureFunction, Context, HttpRequest } from "@azure/functions"

const httpTrigger: AzureFunction = async function (context: Context, req: HttpRequest): Promise<void> {
    context.log('HTTP trigger function processed a request.');
    const idToken = req.headers.idToken ?? "";

    context.res = {
        // status: 200, /* Defaults to 200 */
        body: idToken ? `Hello, world! IdToken is ${idToken}` : "Not Authenticated"
    };

};

export default httpTrigger;