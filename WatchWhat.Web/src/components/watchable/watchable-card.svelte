<script lang="ts">
	import type { Watchable } from "$models";
	import { getImagePath } from "$util";

  export let watchable: Watchable | undefined;
</script>

{#if !watchable}
<!-- Skeleton Loading View -->
<div class="w-60 bg-layer-2 rounded-md shadow-md animate-pulse">
  <div class="w-full h-[22.5rem] bg-layer-3 rounded-t-md"></div>
  <div class="space-y-4 p-4">
    <div class="h-4 bg-layer-3 rounded"></div>
    <div class="h-4 bg-layer-3 rounded"></div>
    <div class="h-4 bg-layer-3 rounded w-1/2"></div>
  </div>
</div>

{:else}

<a href="/{watchable.mediaType}/{watchable.id}" class="w-60 bg-layer-2 rounded-md shadow-md hover:bg-zinc-800 hover:cursor-pointer">
  {#if watchable.posterPath}
    <img
      class="w-full object-cover rounded-t-md"
      src="{getImagePath(watchable.posterPath)}"
      alt={watchable.title}
    />
  {:else}
    <img
      class="w-full object-cover rounded-t-md"
      
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
{/if}