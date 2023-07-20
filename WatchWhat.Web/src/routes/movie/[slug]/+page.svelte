<script lang="ts">
	import { apolloClient } from '$graphql';
	import { gql } from '@apollo/client/core';
	import { query, setClient } from 'svelte-apollo';
	import { getImagePath } from '$util';
	import type { Movie } from '$models/movie';
	import { onDestroy } from 'svelte';
	import ImagePaletteView from '$components/shared/image-palette.svelte';

	export let data: { movieId: number };

	setClient(apolloClient);

	const HOME_QUERY = gql`
		query Movie($id: Int!) {
			movie(id: $id) {
				id
				imdbId
				title
				overview
				backdropPath
				posterPath
				genres {
					id
					name
				}
				releaseDate
				voteAverage
				rating
			}
		}
	`;

	const movieQuery = query<{
		movie: Movie;
	}>(HOME_QUERY, {
		variables: { id: data.movieId }
	});

	let movie: Movie;

	const unsubscribe = movieQuery.subscribe((payload) => {
		if (payload.data) {
			movie = payload.data.movie;
		}
	});

	onDestroy(unsubscribe);
</script>

{#if $movieQuery.loading}
	<p>Loading...</p>
{:else if $movieQuery.error}
	<p>ERROR: {$movieQuery.error.message}</p>
{:else if $movieQuery.data?.movie}
	<ImagePaletteView imageUrl="{getImagePath(movie.posterPath)}" />
	
	{#if movie.posterPath}
		<img
			class="w-48 h-48 object-cover rounded-t-md"
			src={getImagePath(movie.posterPath)}
			alt={movie.title}
		/>
	{/if}
	<div class="space-y-4 p-4">
		<h3 class="font-bold">{movie.title}</h3>
		<div class="flex justify-between text-subtitle text-xs">
			<p>{movie.voteAverage} ⭐</p>
			<p>{new Date(movie.releaseDate).getFullYear()}</p>
		</div>
	</div>
{/if}