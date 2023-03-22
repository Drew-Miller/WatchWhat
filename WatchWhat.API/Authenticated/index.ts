import { AzureFunction, Context, HttpRequest } from "@azure/functions"
import { getAuth } from "firebase-admin/auth";
import { Firebase } from "../Shared/firebase";

const httpTrigger: AzureFunction = async function (context: Context, req: HttpRequest): Promise<void> {
    context.log('HTTP trigger function processed a request.');
    const idToken = req.headers['id-token'];

    const firebaseApp = await Firebase.getFirebaseApp();

    try {
        // Check if IdToken is in correct format
        const decodedToken = await getAuth(firebaseApp).verifyIdToken(idToken);
        const uid = decodedToken.uid;
    } catch {

    }

    Firebase.deleteFirebaseApp();

    context.res = {
        // status: 200, /* Defaults to 200 */
        body: idToken ? `Hello, world! Token is ${idToken}` : "Not Authenticated"
    };

};

export default httpTrigger;