<script lang="ts">
	import { apolloClient } from '$graphql';
	import { gql } from '@apollo/client/core';
	import { query, setClient } from 'svelte-apollo';
	// import { extractColors } from 'extract-colors'
	import { getImagePath } from '$util';
	import type { Movie } from '$models/movie';

	export let data: { movieId: number };

	console.log(data);

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

	movieQuery.subscribe((payload) => {
		if (payload.data) {
			movie = payload.data.movie;
		}
	});

	// extractColors(getImagePath(movie.posterPath))
	// .then(console.log)
	// .catch(console.error)
</script>

{#if $movieQuery.loading}
	<p>Loading...</p>
{:else if $movieQuery.error}
	<p>ERROR: {$movieQuery.error.message}</p>
{:else if $movieQuery.data?.movie}
	{#if movie.posterPath}
		<img
			class="w-48 h-48 object-cover rounded-t-md"
			src={getImagePath(movie.posterPath)}
			alt={movie.title}
		/>
	{:else}
		<img class="w-full h-88 object-cover rounded-t-md" alt="Placeholder" />
	{/if}
	<div class="space-y-4 p-4">
		<h3 class="font-bold">{movie.title}</h3>
		<div class="flex justify-between text-subtitle text-xs">
			<p>{movie.voteAverage} ⭐</p>
			<p>{new Date(movie.releaseDate).getFullYear()}</p>
		</div>
	</div>
{/if}
