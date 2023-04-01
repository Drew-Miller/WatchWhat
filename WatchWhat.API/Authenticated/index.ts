import { AzureFunction, Context, HttpRequest } from "@azure/functions";
import { parseBearer } from "../Shared/util";
import { Firebase } from "../Shared/firebase";
import { FirebaseAuth } from "../Shared/firebase-auth";
import { DecodedIdToken } from "firebase-admin/auth";

const httpTrigger: AzureFunction = async function (
  context: Context,
  req: HttpRequest
): Promise<void> {
  const token = parseBearer(req.headers["authorization"]);
  if (token) {
    const firebase = new Firebase(context);
    const auth = new FirebaseAuth(firebase, context);
    const idToken: DecodedIdToken = await auth.getUid(token);
    const idToken2: DecodedIdToken = await auth.getUid(token);
    firebase.deleteApp();
    context.res.status(200).json(idToken.uid);
  } else {
    context.res.status(401).send("No auth token was provided.");
  }
};

export default httpTrigger;
