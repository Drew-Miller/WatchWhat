import { Crew } from "./crew"
import { GuestStar } from "./guest-star"

export type TVEpisode = {
  air_date: string
  crew: Crew[]
  episode_number: number
  guest_stars: GuestStar[]
  name: string
  overview: string
  id: number
  production_code: string
  runtime: number
  season_number: number
  still_path: string
  vote_average: number
  vote_count: number
}
