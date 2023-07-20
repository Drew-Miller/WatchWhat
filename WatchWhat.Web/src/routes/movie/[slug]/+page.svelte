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
				id,
				imdbId,
				title,
				overview,
				backdropPath,
				posterPath,
				genres {
					id,
					name
				},
				releaseDate,
				voteAverage,
				rating, 
			}
		}
	`;

	const movieQuery = query<{
		movie: Movie;
	}>(HOME_QUERY, {
		variables: { id: data.movieId }
	});

	let movie: Movie;

	movieQuery.subscribe(payload => {
		if (payload.data) {
			movie = payload.data.movie;
		}
	})

	// extractColors(getImagePath(watchable.posterPath))
	// .then(console.log)
	// .catch(console.error)
</script>

<ul>

{data}
{#if $movieQuery.loading}
	<li>Loading...</li>
{:else if $movieQuery.error}
	<li>ERROR: {$movieQuery.error.message}</li>
{:else if $movieQuery.data?.movie}
	<li>{movie.title}</li>
{/if}
</ul>