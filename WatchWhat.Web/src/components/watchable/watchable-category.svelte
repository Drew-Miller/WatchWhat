<script lang="ts">
	import type { Watchable } from '$models';
	import WatchableCardView from './watchable-card.svelte';

	export let title: string;
	export let watchables: Watchable[]
</script>

<h2 class="text-2xl font-bold m-4">{title}</h2>

<div class="flex items-center overflow-x-auto p-4">
	<div class="flex space-x-8">
		{#each watchables as watchable}
			<WatchableCardView {watchable} />
		{/each}
	</div>
</div>