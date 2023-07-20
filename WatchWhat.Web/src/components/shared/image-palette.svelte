<!-- ImagePalette.svelte -->
<script lang="ts">
  import { onMount } from 'svelte';
  import { extractColors, toStyleString, type RGB } from '$util';

  export let imageUrl: string;

  const canvasId = crypto.randomUUID();
  let palette: RGB[] = [];

  onMount(async () => {
    try {
      const canvas: HTMLCanvasElement = document.getElementById(canvasId) as HTMLCanvasElement;
      palette = await extractColors(imageUrl, canvas);
      console.log(palette);
    } catch (error) {
      console.error('Error extracting image palette:', error);
    }
  });
</script>

<canvas class="hidden" id="{canvasId}"></canvas>

<div>
  {#each palette as color}
    <div style="background-color: {toStyleString(color)}" class="palette-color"></div>
  {/each}
</div>

<style>
  .palette-color {
    width: 50px;
    height: 50px;
    margin: 5px;
    display: inline-block;
  }
</style>
