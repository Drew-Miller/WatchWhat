import { AppErrors } from "../errors"
import { MovieResult, TVResult } from "./dtos"

export type MediaType =
  | "tv"
  | "movie";

export type MixedMedia = MovieResult | TVResult;

export class MediaResult {
  adult: boolean
  backdrop_path?: string
  genre_ids: number[]
  id: number
  name: string
  overview: string
  poster_path?: string
  release_date?: Date
  media_type: MediaType

  constructor(media: TVResult | MovieResult) {
    if ("name" in  media) {
      let tv: TVResult = media;
      this.adult = tv.adult;
      this.backdrop_path = tv.backdrop_path;
      this.genre_ids = tv.genre_ids;
      this.id = tv.id;
      this.name = tv.name;
      this.overview = tv.overview;
      this.poster_path = tv.poster_path;
      this.release_date = tv.first_air_date;
      this.media_type = "tv";
      return
    } else if ("title" in media) {
      let movie: MovieResult = media;
      this.adult = movie.adult;
      this.backdrop_path = movie.backdrop_path;
      this.genre_ids = movie.genre_ids;
      this.id = movie.id;
      this.name = movie.title;
      this.overview = movie.overview;
      this.poster_path = movie.poster_path;
      this.release_date = movie.release_date;
      this.media_type = "movie";
      return
    }

    throw AppErrors.IS_NOT_MEDIA;
  }
}
