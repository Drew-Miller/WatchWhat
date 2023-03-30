export type TVSeason = {
  air_date: string
  crew: Crew[]
  episode_number: number
  guest_stars: GuestStar[]
  name: string
  overview: string
  id: number
  production_code: string
  season_number: number
  still_path: string
  vote_average: number
  vote_count: number
}

type Crew = {
  id: number
  credit_id: string
  name: string
  department: string
  job: string
  profile_path?: string
};

type GuestStar = {
  id: number
  name: string
  credit_id: string
  character: string
  order: number
  profile_path?: string
};
