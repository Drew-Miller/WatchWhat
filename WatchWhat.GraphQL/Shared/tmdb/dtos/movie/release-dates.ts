export type ReleaseDates = {
  id: number
  results: ReleaseDate[]
}

export type ReleaseDate = {
  iso_3166_1: string
  release_dates: Release[]
}

type Release = {
  certification: string
  descriptors: any[]
  iso_639_1: string
  note: string
  release_date: string
  type: number
}