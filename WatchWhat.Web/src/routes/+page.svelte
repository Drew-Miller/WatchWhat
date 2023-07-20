<script lang="ts">
	import WatchableCategory from '$components/watchable/watchable-category.svelte';
	import { apolloClient } from '$graphql';
	import type { Page, Watchable } from '$models';
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

<WatchableCategory title="Trending movies & TV" watchables={$homeQuery.data?.trending.results ?? []} />
<WatchableCategory title="Popular movies" watchables={$homeQuery.data?.popularMovies.results ?? []} />
<WatchableCategory title="Popular TV" watchables={$homeQuery.data?.popularTV.results ?? []} />
