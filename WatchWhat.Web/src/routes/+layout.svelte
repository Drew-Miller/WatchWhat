<script>
	import '../app.scss';
</script>

<div class="flex h-screen">
	<nav class="w-[16rem] m-4 space-y-4 flex flex-col">
		<div class="bg-layer-1 p-4 rounded-md text-subtitle">
			<!-- Sidebar content -->
			<ul class="space-y-2">
				<li>
					<a href="/" class="nav-link selected">
						<span class="material-symbols-outlined text-3xl">home</span>
						Home
					</a>
				</li>
				<li>
					<a href="/popular" class="nav-link">
						<span class="material-symbols-outlined text-3xl">star</span>
						Popular
					</a>
				</li>
				<li>
					<a href="/trending" class="nav-link">
						<span class="material-symbols-outlined text-3xl">trending_up</span>
						Trending
					</a>
				</li>
				<li>
					<a href="/discover" class="nav-link">
						<span class="material-symbols-outlined text-3xl">news</span>
						Discover
					</a>
				</li>
			</ul>
		</div>

		<div class="bg-layer-1 p-4 rounded-md flex-1">
			<h2 class="text-lg font-bold mt-8 mb-4">Playlists</h2>
			<ul class="space-y-2">
				<li>
					<a href="/list/favorites" class="block text-blue-400 hover:text-blue-500">Favorites</a>
				</li>
				<li>
					<a href="/list/watch-later" class="block text-blue-400 hover:text-blue-500">Watch Later</a
					>
				</li>
				<li>
					<a href="/list/suggested-by-friends" class="block text-blue-400 hover:text-blue-500"
						>Suggested By Friends</a
					>
				</li>
				<!-- Add more playlists here... -->
			</ul>
		</div>
	</nav>

	<main class="flex-grow overflow-x-auto rounded-md bg-layer-1 my-4 w-full">
		<header class="sticky top-0 bg-layer-1 p-4 shadow-md z-10 transition-opacity opacity-100">
			<div class="flex items-center justify-end space-x-8">
				<span class="material-symbols-outlined text-3xl">search</span>
				<span class="material-symbols-outlined text-3xl">account_circle</span>
			</div>
		</header>

		<slot />

		<footer class="py-4 text-center">
			<!-- Footer content (Website name, date, etc.) -->
			<p class="text-sm">&#xa9; 2023 Your Movie Streaming Website. All rights reserved.</p>
		</footer>
	</main>
</div>

<style>
	.nav-link {
		@apply flex items-center;
	}

	.nav-link span {
		@apply pr-4;
	}

	.nav-link.selected {
		@apply opacity-100 font-extrabold;
	}

	.nav-link.selected span {
		@apply opacity-100 font-extrabold;
	}
</style>
