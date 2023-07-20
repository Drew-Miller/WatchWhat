<script lang="ts">
	import type { Watchable } from '$models';
	import WatchableCard from './watchable-card.svelte';

	export let watchables: Watchable[]
</script>

<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 2xl:grid-cols-5 gap-4 overflow overflow-x-auto">
	{#each watchables as watchable}
		<WatchableCard {watchable} />
	{/each}
</div>