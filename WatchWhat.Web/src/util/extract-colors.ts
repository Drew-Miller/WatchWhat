type RGB = {
  r: number;
  b: number;
  g: number;
}

type PixelColor = "r" | "g" | "b";

function toStyleString(rgb: RGB) {
  return `rgb(${rgb.r},${rgb.b},${rgb.g})`;
}

async function extractColors(imageUrl: string, canvas: HTMLCanvasElement): Promise<RGB[]> {
  const imageData: ImageData = await getImageData(imageUrl, canvas);  
  if (!imageData) {
    return [];
  }

  const rgb = buildRgbValues(imageData);
  if (!rgb) {
    return [];
  }

  const palette = quantization(rgb, 0);
  
  return palette;
}

// Reads image from url into ImageData containing colors.
function getImageData(imageUrl: string, canvas: HTMLCanvasElement): Promise<ImageData> {
  const img = new Image();
  img.crossOrigin = "Anonymous";
  img.src = imageUrl + "?not-from-cache-please";

  return new Promise((resolve, reject) => {
    img.onload = () => {
      canvas.width = img.width;
      canvas.height = img.height;
  
      const ctx = canvas.getContext("2d");
      if (!ctx) {
        return reject();
      }

      ctx.drawImage(img, 0, 0);
  
      const imageData = ctx.getImageData(0, 0, canvas.width, canvas.height);
      resolve(imageData);
    };
  });
}

// Creates RBB array containing all pixels from the ImageData
function buildRgbValues(imageData: ImageData): RGB[] {
  const rgb: RGB[] = [];

  const colorData = imageData.data;

  for (let i = 0; i < colorData.length; i += 4) {
    const val = {
      r: colorData[i],
      g: colorData[i + 1],
      b: colorData[i + 2],
    };
    rgb.push(val);
  }

  return rgb;
}

// For a set of pixels, finds the PixelColor that has the largest range between the min and max.
function findBiggestColorRange(rgb: RGB[]): PixelColor {
  let rMin = Number.MAX_VALUE;
  let gMin = Number.MAX_VALUE;
  let bMin = Number.MAX_VALUE;

  let rMax = Number.MIN_VALUE;
  let gMax = Number.MIN_VALUE;
  let bMax = Number.MIN_VALUE;

  rgb.forEach((pixel) => {
    rMin = Math.min(rMin, pixel.r);
    gMin = Math.min(gMin, pixel.g);
    bMin = Math.min(bMin, pixel.b);

    rMax = Math.max(rMax, pixel.r);
    gMax = Math.max(gMax, pixel.g);
    bMax = Math.max(bMax, pixel.b);
  });

  const rRange = rMax - rMin;
  const gRange = gMax - gMin;
  const bRange = bMax - bMin;

  const biggestRange = Math.max(rRange, gRange, bRange);
  if (biggestRange === rRange) {
    return "r";
  } else if (biggestRange === gRange) {
    return "g";
  } else {
    return "b";
  }
}

// Stops recursion after set amount of calls.
const QUANTIZE_MAX_DEPTH = 4;

function quantization(rgb: RGB[], depth: number): RGB[] {
  // base code goes here
  if (depth === QUANTIZE_MAX_DEPTH || rgb.length === 0) {
    const color: RGB = rgb.reduce(
      (prev, curr) => {
        prev.r += curr.r;
        prev.g += curr.g;
        prev.b += curr.b;

        return prev;
      },
      {
        r: 0,
        g: 0,
        b: 0,
      }
    );

    color.r = Math.round(color.r / rgb.length);
    color.g = Math.round(color.g / rgb.length);
    color.b = Math.round(color.b / rgb.length);
    return [color];
  }

  // recursive code
  const componentToSortBy: PixelColor = findBiggestColorRange(rgb);
  rgb.sort((p1, p2) => {
    return p1[componentToSortBy] - p2[componentToSortBy];
  });

  const mid = rgb.length / 2;
  return [
    ...quantization(rgb.slice(0, mid), depth + 1),
    ...quantization(rgb.slice(mid + 1), depth + 1),
  ];
}

export { extractColors, type RGB, toStyleString };