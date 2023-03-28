import { Context, HttpRequest } from "@azure/functions";
import { App } from "firebase-admin/app";
import { DecodedIdToken, getAuth } from "firebase-admin/auth";
import { Firebase } from "./firebase";
import { Logs } from "./logger";

function getToken(req: HttpRequest) {
  let header = req.headers["authorization"];
  if (header) {
    const token = header.replace("Bearer ", "");
    return token;
  }

  throw "Token not found.";
}

export async function authReq(context: Context, req: HttpRequest): Promise<DecodedIdToken> {
  let firebaseApp: App;
  try {
    firebaseApp = await Firebase.getFirebaseApp();
  } catch(error) {
    context.res = {
      status: 500,
      body: {
        reason: 'Firebase not initialized.',
        error
      }
    };
    throw error;
  }

  let token: string;
  try {
    token = getToken(req);
  } catch(error) {
    Logs.shared.error(error);
    context.res = {
      status: 500,
      body: {
        reason: 'User token missing.',
        error
      }
    };
    throw error;
  }

  try {
    // Check if IdToken is in correct format
    const decodedToken = await getAuth(firebaseApp).verifyIdToken(token);
    return decodedToken;
  } catch (error) {
    Logs.shared.error(error);
    context.res = {
      status: 500,
      body: {
        reason: 'Could not verify token.',
        error
      }
    };
    throw error;
  }
}

export async function authRes() {
  Firebase.deleteFirebaseApp();
}