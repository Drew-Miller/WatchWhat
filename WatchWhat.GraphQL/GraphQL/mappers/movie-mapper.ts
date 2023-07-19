import { Movie as MovieDto } from "../../Shared/tmdb/dtos/movie";
import { Movie } from "../models/movie";
import { genreMapper } from "./genre-mapper";

class MovieMapper {
  from(dto: MovieDto): Movie {
    const movie = new Movie();
    
    movie.id = dto.id;
    movie.title = dto.title;
    movie.overview = dto.overview;
    movie.posterPath = dto.poster_path;
    movie.backdropPath = dto.backdrop_path;
    movie.genres = dto.genres.map(genreMapper.map);
    movie.releaseDate = dto.release_date;
    movie.voteAverage = dto.vote_average;

    return movie;
  }
}

const movieMapper = new MovieMapper();

export { movieMapper };