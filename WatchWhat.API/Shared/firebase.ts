import { Context } from "@azure/functions";
import { initializeApp, App, cert, deleteApp, getApp, ServiceAccount } from "firebase-admin/app";
import { BlobServiceClient } from "@azure/storage-blob";
import { parseSnakeCaseJSON, streamToBuffer } from "./util";

const { BLOB_CONNECTION, CONTAINER_NAME, FIREBASE_KEY } = process.env;

export class Firebase {
  private firebaseApp: App;
  private context: Context;

  constructor(context: Context) {
    this.context = context;
    if (!BLOB_CONNECTION) {
      throw this.context.res.status(500).send("Blob Connection not found.");
    }
    if (!CONTAINER_NAME) {
      throw this.context.res.status(500).send("Container Name not found.");
    }
    if (!FIREBASE_KEY) {
      throw this.context.res.status(500).send("Firebase Key not found.");
    }
  }
  
  async getApp() {    
    const serviceAccount = await this.getServiceAccount();
    try {
      return this.firebaseApp = initializeApp({
        credential: cert(serviceAccount)
      });
    } catch {
      try {
        return this.firebaseApp = getApp();
      } catch(error) {
        throw this.context.res.status(500).send(error)
      }
    }
  }
  
  deleteApp() {
    try {
      deleteApp(this.firebaseApp);
    } catch(error) {
      throw this.context.res.status(500).send(error)
    }
  }

  private async getServiceAccount(): Promise<ServiceAccount> {
    try {
      const blobServiceClient = BlobServiceClient.fromConnectionString(BLOB_CONNECTION);
      const containerClient = blobServiceClient.getContainerClient(CONTAINER_NAME);
      const blobClient = containerClient.getBlobClient(FIREBASE_KEY);
      const downloadResponse = await blobClient.download();
  
      const downloaded = await streamToBuffer(downloadResponse.readableStreamBody);
  
      const firebaseKey = downloaded.toString();
      const json = parseSnakeCaseJSON(firebaseKey);
      const serviceAccount: ServiceAccount = json as ServiceAccount;
      return serviceAccount;
    } catch(error) {
      throw this.context.res.status(500).send(error);
    }
  }
}
