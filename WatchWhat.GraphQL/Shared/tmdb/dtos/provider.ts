// All Global Providers
export type AllProviders = {
  id: number,
  results: Result[]
};

type Result = Provider & {
  display_priorities: {
    [country: string]: number
  }
};

// A Movie/TV Show providers in each country
export type Providers = {
  id: number,
  results: {
    [country: string]: ProviderTypes
  }
}

export type ProviderTypes = {
  link: string,
  buy?: Provider[],
  rent?: Provider[],
  flatrate?: Provider[]
}

export type Provider = {
  display_priority: number
  logo_path?: string,
  provider_name: string,
  provider_id: number,
};