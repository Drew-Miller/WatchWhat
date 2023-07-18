export type Page<T> = {
  page: number;
  totalPages: number;
  totalResults: number;
  results: T[];
}