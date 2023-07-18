<script lang="ts">
	import type { Movie } from "$models";

  export let movie: Movie
</script>

<a href="/movie/{movie.id}" class="w-60 bg-layer-2 rounded-md shadow-md hover:bg-zinc-800 hover:cursor-pointer">
  {#if movie.posterPath}
    <img
      class="w-full h-88 object-cover rounded-t-md"
      src="https://image.tmdb.org/t/p/w500/{movie.posterPath}"
      alt={movie.title}
    />
  {:else}
    <img
      class="w-full h-88 object-cover rounded-t-md"
      
      alt="Placeholder"
    />
  {/if}
  <div class="space-y-4 p-4">
    <h3 class="font-bold">{movie.title}</h3>
    <div class="flex justify-between text-subtitle text-xs">
      <p>{movie.voteAverage} ⭐</p>
      <p>{new Date(movie.releaseDate).getFullYear()}</p>
    </div>
  </div>
</a>