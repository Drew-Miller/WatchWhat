import { TableClient, TableServiceClient } from "@azure/data-tables";
const { AZURE_TABLES_ENDPOINT, WATCHWHAT_TABLE } = process.env;

async function getDbClient() {
  if (!AZURE_TABLES_ENDPOINT || !WATCHWHAT_TABLE) {
    throw "Environment variables are undefined";
  }
  
  const tableService = TableServiceClient.fromConnectionString(AZURE_TABLES_ENDPOINT);
  await tableService.createTable(WATCHWHAT_TABLE);
  const tableClient = TableClient.fromConnectionString(AZURE_TABLES_ENDPOINT, WATCHWHAT_TABLE);
  return tableClient;
}

export { getDbClient };
