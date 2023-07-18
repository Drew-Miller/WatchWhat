import { writable } from "svelte/store";
import { movieCategories } from "./data";

class MovieStore {
  movieCategories = writable(movieCategories);
}

export const movieStore = new MovieStore();