export type Provider = {
  logo_path: string,
  provider_name: string,
  provider_id: number,
  display_priority: number
};

export type ProviderDisplay = Provider & {
  display_priorities: { [country: string]: number }
};

export type WatchProviders = {
  link: string,
  buy?: Provider[],
  rent?: Provider[],
  flatrate?: Provider[],
};