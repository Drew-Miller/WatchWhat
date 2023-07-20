<script lang="ts">
	import type { Watchable } from '$models';
	import WatchableCard from './watchable-card.svelte';

	export let title: string;
	export let watchables: Watchable[];
</script>

<h2 class="text-2xl font-bold m-4">{title}</h2>

<div class="flex items-center overflow-x-auto p-4">
	<div class="flex space-x-8">
		{#if !watchables.length}
			{#each Array.from({ length: 20 }) as _, index}
				<WatchableCard watchable={undefined} />
			{/each}
		{:else}
			{#each watchables as watchable}
				<WatchableCard {watchable} />
			{/each}
		{/if}
	</div>
</div>
