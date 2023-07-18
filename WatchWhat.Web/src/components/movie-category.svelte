<script lang="ts">
	import type { Movie } from '$models';
	import MovieCardView from './movie-card.svelte';

	export let title: string;
	export let movies: Movie[]
</script>

<h2 class="text-2xl font-bold pt-8 pb-6">{title}</h2>

<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 2xl:grid-cols-5 gap-4 overflow overflow-x-auto">
	{#each movies as movie}
		<MovieCardView {movie} />
	{/each}
</div>

<!-- 
<div class="flex items-center space-x-4 overflow-x-auto py-4">
	<div class="flex space-x-4">
		{#each movies as movie}
			<MovieCardView {movie} />
		{/each}
	</div>
</div>
-->
