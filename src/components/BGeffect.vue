<template>
  <div class="dotbg"></div>
  <div class="blur"></div>
</template>

<style>
.dotbg {
  position: absolute;
  z-index: -1;
  top: 0;
  left: 0;
  width: 100%;
  min-height: 100%;
  height: 100%;
  background-image: radial-gradient(white 1px, transparent 0);
  background-size: 40px 40px;
  mix-blend-mode: overlay;
}
.blur {
  z-index: -999;
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: transparent;
  backdrop-filter: blur(10rem);
  box-shadow: 0 0 12.5rem #121518 inset
}

@media only screen and (pointer: coarse) {
  .blur {
    display: none;
  }
}
</style>