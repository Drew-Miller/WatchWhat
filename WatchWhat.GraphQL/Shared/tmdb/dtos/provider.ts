// All Global Providers
export type Providers = {
  id: number,
  results: {
    // Display priorities in each country for the provider
    display_priorities: {
      [country: string]: number
    }
  } & Provider []
};

// A Movie/TV Show providers in each country
export type WatchProviders = {
  id: number,
  results: {
    [country: string]: {
      link: string,
      buy?: Provider[],
      rent?: Provider[],
      flatrate?: Provider[]
    }
  }
}

export type Provider = {
  logo_path: string,
  provider_name: string,
  provider_id: number,
  display_priority: number
};