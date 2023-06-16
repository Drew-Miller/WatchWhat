import { AzureFunction, Context, HttpRequest } from "@azure/functions";
import { parseBearer } from "../../shared/util";
import { Firebase } from "../../shared/firebase";
import { FirebaseAuth } from "../../shared/firebase-auth";
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
    firebase.deleteApp();
    context.res.body(idToken.uid);
  } else {
    context.res.status(401).send("No auth token was provided.");
  }
};

export default httpTrigger;
