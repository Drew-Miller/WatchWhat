import { MediaType } from "./media-type";
import { MovieResult } from "./movie";
import { TVResult } from "./tv";

export type MediaResult = (MovieResult | TVResult) & {
  media_type: MediaType
};