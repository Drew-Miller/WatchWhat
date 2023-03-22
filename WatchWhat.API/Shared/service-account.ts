import { BlobServiceClient } from "@azure/storage-blob";

const { BLOB_CONNECTION, CONTAINER_NAME, FIREBASE_KEY } = process.env;

async function getServiceAccount() {
  if (!BLOB_CONNECTION) {
    throw "Blob Connection not found.";
  }
  
  if (!CONTAINER_NAME) {
    throw "Container Name not found.";
  }
  
  if (!FIREBASE_KEY) {
    throw "Firebase Key not found.";
  }

  const blobServiceClient = BlobServiceClient.fromConnectionString(BLOB_CONNECTION);
  const containerClient = blobServiceClient.getContainerClient(CONTAINER_NAME);
  const blobClient = containerClient.getBlobClient(FIREBASE_KEY);
  const downloadResponse = await blobClient.download();

  const downloaded = await streamToBuffer(downloadResponse.readableStreamBody);
  console.log('Downloaded blob content:', downloaded.toString());

  return downloaded.toString();
}

export { getServiceAccount };

async function streamToBuffer(readableStream) {
  return new Promise((resolve, reject) => {
      const chunks = [];
      readableStream.on('data', (data) => {
          chunks.push(data instanceof Buffer ? data : Buffer.from(data));
      });
      readableStream.on('end', () => {
          resolve(Buffer.concat(chunks));
      });
      readableStream.on('error', reject);
  });
}
