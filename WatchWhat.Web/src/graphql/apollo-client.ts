import { createHttpLink, ApolloClient, InMemoryCache } from "@apollo/client/core";

const link = createHttpLink({
  // You should use an absolute URL here
  //uri: import.meta.env.VITE_GRAPHQL_URL,
  uri: 'http://localhost:7071'
});

const apolloClient = new ApolloClient({
  link,
  cache: new InMemoryCache()
});

export { apolloClient };