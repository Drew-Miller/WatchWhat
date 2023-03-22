import { initializeApp, ServiceAccount } from "firebase-admin";
import { App, cert, deleteApp, getApp } from "firebase-admin/app";
import { getServiceAccount } from "./service-account";

/*
  This could be optimized in the future.
  Each request reads the file from the storage account and downloads it as string.
  Saving and reading from the file in Node.js would be ideal.
 */
export class Firebase {
  private static firebaseApp: App;
  
  static async getFirebaseApp() {
    try {
      // Check if format is correct or should parse to JSON
      const key = await getServiceAccount();
      Firebase.firebaseApp = initializeApp({
        credential: cert(key as ServiceAccount)
      });
    } catch {
      Firebase.firebaseApp = getApp();
    }

    return Firebase.firebaseApp;
  }
  
  static deleteFirebaseApp() {
    deleteApp(Firebase.firebaseApp);
  }
}
