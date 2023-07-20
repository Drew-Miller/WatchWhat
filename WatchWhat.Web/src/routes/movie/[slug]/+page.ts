import { error } from "@sveltejs/kit";
import type { PageLoad } from "./$types";

export const load: PageLoad = ({ params }) => {
  const movieId = parseInt(params.slug);

  if (isNaN(movieId)) {
    throw error(404, 'Not found');
  }

  return { movieId };
}