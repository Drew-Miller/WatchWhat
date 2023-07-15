import { Page as PageDto } from "../../Shared/tmdb/dtos";

export class Page<T> {
  __typename = "Page";
  page: number;
  totalPages: number;
  totalResults: number;
  results: T[];

  constructor(data: PageDto<any>) {
    this.page = data.page;
    this.totalPages = data.total_pages;
    this.totalResults = data.total_results;
  }
}