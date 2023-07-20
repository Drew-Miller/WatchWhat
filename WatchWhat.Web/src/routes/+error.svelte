<script lang="ts">
	import { page } from '$app/stores';
</script>

<div
	class="w-full overflow-y-auto p-8 flex flex-col items-center justify-center min-h-screen bg-layer-1"
>
	<img
		src="404.webp"
		alt="Cute Cartoon GIF"
		class="w-48 h-48 object-cover rounded-full mx-auto mb-6"
	/>

	<h1 class="text-5xl font-bold mb-4">Page Not Available</h1>
	<p class="mb-8 text-subtitle">Something went wrong, please try again later.</p>

	<a href="/">
		<button
			class="bg-white hover:bg-blue-600 text-black font-bold py-4 px-12 rounded-full focus:outline-none focus:shadow-outline"
		>
			Home
		</button>
	</a>
</div>
