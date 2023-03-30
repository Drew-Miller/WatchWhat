export type ContentRating = {
  id: number,
  results: [
		{
			descriptors: string[],
			iso_3166_1: string,
			rating: string
		}
  ]
};