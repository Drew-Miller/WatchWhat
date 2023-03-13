export type Source = {
  source_id: number,
  name: string,
  type: string,
  region: string,
  ios_url?: string,
  android_url?: string,
  web_url: string,
  format: string,
  price?: number,
  seasons?: number,
  episodes?: number
};