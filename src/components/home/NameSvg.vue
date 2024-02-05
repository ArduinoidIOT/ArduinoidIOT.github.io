<script setup>
const props = defineProps(["text", "fontsize"])
</script>

<template>
  <svg class="name" :style="`--fontsize: ${props.fontsize}`">
    <linearGradient id="lgrad1" x1="-50%" y1="20%" x2="150%" y2="80%">
      <stop offset="0%" style="stop-color: #d63230" stop-opacity="1" />
      <stop offset="50%" style="stop-color: #742424" stop-opacity="1" />
      <stop offset="100%" style="stop-color: #d63230" stop-opacity="1" />
    </linearGradient>
    <mask id="outlinemask">
      <rect id="bg" x="0" y="0" width="100%" height="100%" fill="white" />
      <text class="masktext" fill="black" x="50%" y="50%">{{props.text}}</text>
    </mask>
    <text class="outline" x="50%" y="50%">{{props.text}}</text>
    <text class="gradient" x="50%" y="50%">{{props.text}}</text>
    <text class="overlay" x="50%" y="50%">{{props.text}}</text>
  </svg>
</template>

<style>
svg.name {
  font-weight: 700;
  font-family: Manrope;
  font-size: var(--fontsize);
  height: calc(1.5 * var(--fontsize));
  width: 100%;
}
svg.name text {
  text-anchor: middle;
  dominant-baseline: central;
  cursor: default;
}
text.outline {
  z-index: -3;
  stroke: url(#lgrad1);
  mask: url(#outlinemask);
  stroke-width: 0.15rem;
  opacity: 0.75;
  filter: drop-shadow(0 0 2rem #7424248f);
  transition: stroke-width 200ms ease-in-out;
}
text.gradient {
  fill: url(#lgrad1);
  opacity: 0.25;
  pointer-events: none;
}
text.overlay {
  fill: #f3c2c1;
  stroke: #f3c2c1;
  paint-order: stroke;
  stroke-width: 0.15rem;
  mix-blend-mode: overlay;
  pointer-events: none;
  transition: stroke-width 200ms ease-in-out;
}
text.outline:hover,
text.outline:hover ~ text.overlay {
  stroke-width: 0.25rem;
}
</style>
