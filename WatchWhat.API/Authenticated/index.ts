import { AzureFunction, Context, HttpRequest } from "@azure/functions"
import { getAuth } from "firebase-admin/auth";
import { getToken } from "../Shared/core";
import { Firebase } from "../Shared/firebase";

const httpTrigger: AzureFunction = async function (context: Context, req: HttpRequest): Promise<void> {
    context.log('HTTP trigger function processed a request.');
    const token = getToken(req);

    const firebaseApp = await Firebase.getFirebaseApp();

    try {
        // Check if IdToken is in correct format
        const decodedToken = await getAuth(firebaseApp).verifyIdToken(token);
        const uid = decodedToken.uid;
    } catch {

    }

    Firebase.deleteFirebaseApp();

    context.res = {
        status: 200, /* Defaults to 200 */
        body: token ? `Hello, world! Token is ${token}` : 'Not Authenticated'
    };

};

export default httpTrigger;