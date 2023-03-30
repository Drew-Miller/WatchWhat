export type ContentRatings = {
  id: number,
  results: ContentRating[]
};

type ContentRating = {
	descriptors: string[],
	iso_3166_1: string,
	rating: string
};