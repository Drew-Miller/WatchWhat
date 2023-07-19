<script lang="ts">
	import MovieCategoryView from '$components/movie-category.svelte';
	import { apolloClient } from '$graphql';
	import type { Watchable, Page } from '$models';
	import { gql } from '@apollo/client/core';
	import { query, setClient } from 'svelte-apollo';

	setClient(apolloClient);

	const HOME_QUERY = gql`
		query Home {
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
			},
			popularMovies {
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
			},
			popularTV {
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

	const homeQuery = query<{
		trending: Page<Watchable>,
		popularMovies: Page<Watchable>,
		popularTV: Page<Watchable>,
	}>(HOME_QUERY);
</script>

<MovieCategoryView title="Trending movies & TV" movies={$homeQuery.data?.trending.results ?? []} />
<MovieCategoryView title="Popular movies" movies={$homeQuery.data?.popularMovies.results ?? []} />
<MovieCategoryView title="Popular TV" movies={$homeQuery.data?.popularTV.results ?? []} />
