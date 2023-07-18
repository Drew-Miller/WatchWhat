<script lang="ts">
	import type { Movie } from "$models";

  export let movie: Movie
</script>

<div class="w-64 p-4 bg-layer-2 rounded-md shadow-md">
  {#if movie.posterPath}
    <img
      class="w-full h-48 object-cover rounded-md"
      
      alt={movie.title}
    />
  {:else}
    <img
      class="w-full h-48 object-cover rounded-md"
      
      alt="Placeholder"
    />
  {/if}
  <div class="mt-2 space-y-4">
    <h3 class="text-lg font-bold">{movie.title}</h3>
    <div class="flex justify-between text-subtitle text-xs">
      <p>{movie.voteAverage} ⭐</p>
      <p>{movie.releaseDate.getFullYear()}</p>
    </div>
  </div>
</div>