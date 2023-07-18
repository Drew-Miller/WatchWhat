<script lang="ts">
	import type { Movie } from '$models';
	import MovieCardView from './movie-card.svelte';

	export let title: string;
	export let movies: Movie[]
</script>

<h2 class="text-2xl font-bold">{title}</h2>
<div class="flex items-center space-x-4 overflow-x-auto py-4">
	<div class="flex space-x-4">
		{#each movies as movie}
			<MovieCardView {movie} />
		{/each}
	</div>
</div>
