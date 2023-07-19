import { Genre } from "../models/genre";
import { Genre as GenreDto } from "../../Shared/tmdb/dtos";

class GenreMapper {
  map(dto: GenreDto): Genre {
    const genre = new Genre();

    genre.id = dto.id;
    genre.name = dto.name;
    
    return genre;
  }
}

const genreMapper = new GenreMapper();

export { genreMapper };