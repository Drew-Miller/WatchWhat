<script lang="ts">
	import type { MovieCategory } from '@models';
	import MovieCardView from './movie-card.svelte';

	export let movieCategory: MovieCategory;
</script>

<h2 class="text-2xl font-bold">{movieCategory.title}</h2>
<div class="flex items-center space-x-4 overflow-x-auto py-4">
	<div class="flex space-x-4">
		{#each movieCategory.movies as movie}
			<MovieCardView {movie} />
		{/each}
	</div>
</div>
