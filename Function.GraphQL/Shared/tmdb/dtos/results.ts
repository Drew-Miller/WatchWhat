export type Results<T> = {
  id: number,
  results: T[]
};

export type PaginatedResults<T> = {
  page: number,
  results: T[],
  total_pages: number,
  total_results: number,
};