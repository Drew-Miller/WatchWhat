<script lang="ts">
	import MovieCategoryView from '$components/movie-category.svelte';
	import { apolloClient } from '$graphql';
	import type { Movie, Page } from '$models';
	import { movieStore } from '$stores';
	import { gql } from '@apollo/client/core';
	import { onDestroy, onMount } from 'svelte';
	import { query, setClient } from 'svelte-apollo';

	setClient(apolloClient);

	const TRENDING_QUERY = gql`
		query Trending {
			trending {
				page,
				totalPages,
				totalResults,
				results {
					... on Watchable {
						id,
						title,
						mediaType,
						backdropPath,
						posterPath,
						voteAverage,
						releaseDate,
					}
				}
			}
		}
	`;

	const homeQuery = query<{ trending: Page<Movie> }>(TRENDING_QUERY);
</script>

<MovieCategoryView title="Trending" movies={$homeQuery.data?.trending.results ?? []} />
