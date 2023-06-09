export type Videos = {
  id: number,
  results: Video[]
};

export type Video = {
  id: string,
  iso_639_1: string,
  iso_3166_1: string,
  key: string,
  name: string,
  official: boolean,
  published_at: Date,
  site: string,
  size: number,
  type: string
};