import { describe, expect, test, beforeEach } from "@jest/globals";
import { Context, HttpRequest } from "@azure/functions";
import httpTrigger from "../../src/functions/health/index";

describe("Hello World", () => {
  let context: Context;
  let request: HttpRequest;

  beforeEach(() => {
    // Really crude and unsafe implementations that will be replaced soon
    context = { log: () => {} } as unknown as Context;
    request = { query: {} } as unknown as HttpRequest;
  });

  test("Responds 'Hello, world!'", async () => {
    await httpTrigger(context, request);
    expect(context.res.body).toMatch("Hello, world!");
  });
});