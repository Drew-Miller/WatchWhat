import { initializeApp, App, cert, deleteApp, getApp } from "firebase-admin/app";
import { createServiceAccount, getServiceAccount } from "./service-account";

/*
  This could be optimized in the future.
  Each request reads the file from the storage account and downloads it as string.
  Saving and reading from the file in Node.js would be ideal.
 */
export class Firebase {
  private static firebaseApp: App;
  
  static async getFirebaseApp() {
    const key = await getServiceAccount();
    const serviceAccount = createServiceAccount(key);

    try {
      Firebase.firebaseApp = initializeApp({
        credential: cert(serviceAccount)
      });
    } catch(error) {
      console.log(error);
      Firebase.firebaseApp = getApp();
    }

    return Firebase.firebaseApp;
  }
  
  static deleteFirebaseApp() {
    deleteApp(Firebase.firebaseApp);
  }
}
