import { initializeApp, App, cert, deleteApp, getApp, ServiceAccount } from "firebase-admin/app";
import { Logs } from "./logger";
import { createServiceAccount, getServiceAccount } from "./service-account";

/*
  This could be optimized in the future.
  Each request reads the file from the storage account and downloads it as string.
  Saving and reading from the file in Node.js would be ideal.
 */
export class Firebase {
  private static firebaseApp: App;
  
  static async getFirebaseApp() {
    if (Firebase.firebaseApp) {
      return Firebase.firebaseApp;
    }
    
    let serviceAccount: ServiceAccount;
    try {
      const key = await getServiceAccount();
      serviceAccount = createServiceAccount(key);
    } catch (error) {
      Logs.shared.error(error);
      throw error;
    }
    
    try {
      return Firebase.firebaseApp = initializeApp({
        credential: cert(serviceAccount)
      });
    } catch(error) {
      Logs.shared.error(error);
    }

    try {
      return Firebase.firebaseApp = getApp();
    } catch(error) {
      Logs.shared.error(error);
      throw error;
    }
  }
  
  static deleteFirebaseApp() {
    deleteApp(Firebase.firebaseApp);
  }
}
