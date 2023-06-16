import { camelCase } from "lodash";

export function parseBearer(header: string) {
  const token = header.replace("Bearer ", "");
  return token;
}

export function parseSnakeCaseJSON(jsonString: string): any {
  let obj = {};
  JSON.parse(jsonString, (key, value) => {
    const newKey = camelCase(key);

    if (typeof key === 'object') {
      obj[newKey] = parseSnakeCaseJSON(value);
      return;
    }

    obj[newKey] = value;
  });

  return obj;
}

export async function streamToBuffer(readableStream) {
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