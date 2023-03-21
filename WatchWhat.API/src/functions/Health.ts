import { app, HttpRequest, HttpResponseInit, InvocationContext } from "@azure/functions";

export async function Health(request: HttpRequest, context: InvocationContext): Promise<HttpResponseInit> {
    return { body: `Hello, world!` };
};

app.http('Health', {
    methods: ['GET', 'POST'],
    authLevel: 'anonymous',
    handler: Health
});
