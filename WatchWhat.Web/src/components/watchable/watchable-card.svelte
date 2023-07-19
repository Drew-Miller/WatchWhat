<script lang="ts">
	import type { Watchable } from "$models";
	import { getImagePath } from "$util";

  export let watchable: Watchable
</script>

<a href="/{watchable.mediaType}/{watchable.id}" class="w-60 bg-layer-2 rounded-md shadow-md hover:bg-zinc-800 hover:cursor-pointer">
  {#if watchable.posterPath}
    <img
      class="w-full h-88 object-cover rounded-t-md"
      src="{getImagePath(watchable.posterPath)}"
      alt={watchable.title}
    />
  {:else}
    <img
      class="w-full h-88 object-cover rounded-t-md"
      
      alt="Placeholder"
    />
  {/if}
  <div class="space-y-4 p-4">
    <h3 class="font-bold">{watchable.title}</h3>
    <div class="flex justify-between text-subtitle text-xs">
      <p>{watchable.voteAverage} ⭐</p>
      <p>{new Date(watchable.releaseDate).getFullYear()}</p>
    </div>
  </div>
</a>