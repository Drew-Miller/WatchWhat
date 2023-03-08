// import type { Credits } from "@/common/credits";
// import type { Genre } from "@/common/genre";
// import type { Movie } from "@/common/movie";
// import type { MovieDetail } from "@/common/movie-detail";
// import type { Recommendation } from "@/common/recommendation";
// import type { PaginatedResults, Results } from "@/common/results";
// import type { Trailer } from "@/common/trailer";
// import axios from "axios";
// import { defineStore } from "pinia";
// import { onMounted, ref } from "vue";

// const apiKey = "d4bbe5d6dc46bbb42aa2bbda9eab1c2b";

// export const useMovieStore = defineStore('movie-store', () => {
//   const genres_list_http    = "https://api.themoviedb.org/3/genre/movie/list?";
//   const movie_genres_http   = "https://api.themoviedb.org/3/discover/movie?";
//   const movie_detail_http   = "https://api.themoviedb.org/3/movie";
//   const img_url             = "https://image.tmdb.org/t/p/w500";
//   const original_img_url    = "https://image.tmdb.org/t/p/original";

//   const genres = ref<Genre[]>([]);

//   function getMovie(id: number): Promise<MovieDetail> {
//     return axios.get<MovieDetail>(movie_detail_http + "/" + id, {
//       params: { api_key: apiKey }
//     }).then(res => res.data);
//   }

//   function getCredits(id: number): Promise<Credits> {
//     return axios.get<Credits>(movie_detail_http + "/" + id + "/credits?", {
//       params: { api_key: apiKey }
//     }).then(res => res.data);
//   }

//   function getVideos(id: number): Promise<Results<Trailer>> {
//     return axios.get<Results<Trailer>>(movie_detail_http + "/" + id + "/videos?", {
//       params: { api_key: apiKey }
//     }).then(res => res.data);
//   }

//   function getRecommendations(id: number): Promise<PaginatedResults<Recommendation>> {
//     return axios.get<PaginatedResults<Recommendation>>(movie_detail_http + "/" + id + "/recommendations?", {
//       params: { api_key: apiKey }
//     }).then(res => res.data);
//   }

//   function getGenres(): Promise<Genre[]> {
//     return axios.get<{ genres: Genre[]}>(genres_list_http, {
//       params: { api_key: apiKey }
//     }).then(res => res.data.genres);
//   }

//   function getMoviesByGenre(genreId: number, page: number = 1): Promise<PaginatedResults<Movie>> {
//     return axios.get<PaginatedResults<Movie>>(movie_genres_http, {
//       params: { api_key: apiKey, with_genres: genreId, page }
//     }).then(res => res.data);
//   }

//   onMounted(async () => {
//     genres.value = await getGenres();
//   });

//   return {
//     genres,

//     img_url,
//     original_img_url,

//     getMoviesByGenre,
//     getMovie,
//     getCredits,
//     getVideos,
//     getRecommendations
//   };
// });