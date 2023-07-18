<script lang="ts">
	import MovieCategoryView from '$components/movie-category.svelte';
	import type { Movie, Page } from '$models';
	import { movieStore } from '$stores';
	import { ApolloClient, createHttpLink, gql, InMemoryCache } from '@apollo/client/core';
	import { onDestroy, onMount } from 'svelte';
	import { query, setClient } from 'svelte-apollo';

	const link = createHttpLink({
		// You should use an absolute URL here
		//uri: import.meta.env.VITE_GRAPHQL_URL,
		uri: 'http://localhost:7071'
	});

	const apolloClient = new ApolloClient({
		link,
		cache: new InMemoryCache()
	});

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
						voteAverage,
						releaseDate,
					}
				}
			}
		}
	`;

	let trendingMovies: Movie[] = [];
	const trending = query<Page<Movie>>(TRENDING_QUERY);

	$: trending;
	onMount(() => {
		console.log('On Mount');
		trending.subscribe((payload) => {
			if (!payload.loading) {
				trendingMovies = payload.data?.results ?? [];
			}			
		});
	});

	let movieCategories: { title: string; movies: Movie[] }[] = [];

	const unsubscribe = movieStore.movieCategories.subscribe((data) => {
		movieCategories = data;
	});

	onDestroy(() => {
		unsubscribe();
	});
</script>

{#if $trending.loading}
  <p>Loading...</p>
{:else if $trending.error}
  <p>Error: {$trending.error.message}</p>
{:else}
<MovieCategoryView title="Trending" movies={trendingMovies} />
{/if}

<!-- Main content (Rows of movie cards) -->
{#each movieCategories as movieCategory}
	<MovieCategoryView title={movieCategory.title} movies={movieCategory.movies} />
{/each}
