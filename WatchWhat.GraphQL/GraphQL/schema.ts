export const typeDefs = `#graphql

type Query {
  ping: String!

  health: String!

  authenticated: String!

  webUrl(tmdbId: Int!, titleType: String!, sourceName: String!): String!
}

`;