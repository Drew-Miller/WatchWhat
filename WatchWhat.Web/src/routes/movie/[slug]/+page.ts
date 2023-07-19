import type { PageLoad } from "./$types";

export const load: PageLoad = ({ params }) => {
  const movieId = Number(params.slug);
  return { movieId };
}