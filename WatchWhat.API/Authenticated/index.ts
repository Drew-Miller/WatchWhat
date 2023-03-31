import { AzureFunction, Context, HttpRequest } from "@azure/functions";
import { getAuth } from "firebase-admin/auth";
import { parseBearer } from "../Shared/util";
import { Firebase } from "../Shared/firebase";

const httpTrigger: AzureFunction = async function (
  context: Context,
  req: HttpRequest
): Promise<void> {
  const token = parseBearer(req.headers["authorization"]);
  if (token) {
    const firebase = new Firebase(context);
    const app = await firebase.getApp();

    let uid: string;
    try {
      const decodedToken = await getAuth(app).verifyIdToken(token); 
      uid = decodedToken.uid; 
    } catch (error) {
      firebase.deleteApp();
      context.res.status(401).send(error);
    }

    firebase.deleteApp();
    context.res.status(200).json(uid);
  } else {
    context.res.status(401).send("No auth token was provided.");
  }
};

export default httpTrigger;
