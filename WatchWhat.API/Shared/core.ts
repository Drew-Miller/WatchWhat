import { HttpRequest } from "@azure/functions";

export function getToken(req: HttpRequest) {
  let header = req.headers["authorization"]
  if (header) {
    return header.replace('Bearer ', '');
  }
}