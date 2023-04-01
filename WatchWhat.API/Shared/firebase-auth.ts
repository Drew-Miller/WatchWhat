import { Context } from "@azure/functions";
import { getAuth } from "firebase-admin/auth";
import { Firebase } from "./firebase";

export class FirebaseAuth {
  constructor(private firebase: Firebase, private context: Context) { }
  
  async getUid(token: string) {
    const app = await this.firebase.getApp();
    try {
      return await getAuth(app).verifyIdToken(token); 
    } catch (error) {
      this.firebase.deleteApp();
      throw this.context.res.status(401).send(error);
    }
  }
}
