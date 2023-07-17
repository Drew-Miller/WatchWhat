import type { MovieCategory } from "@models";
import { movieCategories } from "./data";
import { writable } from "svelte/store";

class MovieStore {
  movieCategories = writable<MovieCategory[]>(movieCategories);
}

export const movieStore = new MovieStore();