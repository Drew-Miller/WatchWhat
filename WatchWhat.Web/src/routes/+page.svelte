<script lang="ts">
	import MovieCategoryView from '@components/movie-category.svelte';
	import type { MovieCategory } from '@models';
	import { movieStore } from '@stores';
	import { onDestroy } from 'svelte';

	let movieCategories: MovieCategory[] = [];

	const unsubscribe = movieStore.movieCategories.subscribe((data) => {
		movieCategories = data;
	});

	onDestroy(unsubscribe);
</script>

<!-- Main content (Rows of movie cards) -->
{#each movieCategories as movieCategory}
	<MovieCategoryView {movieCategory} />
{/each}
