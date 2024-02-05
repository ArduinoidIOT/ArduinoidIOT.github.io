<template>
  <div class="container">
    <div class="blobflex">
      <div class="blob blob1"></div>
      <div class="blob blob2"></div>
      <div class="blob blob3"></div>
    </div>
    <slot></slot>
  </div>
</template>

<style scoped>
.container {
  position: relative;
}
.blobflex {
  position: absolute;
  top: -25%;
  left: 0%;
  height: 150%;
  width: 100%;
}
.blobflex {
  display: flex;
  z-index: -2;
  justify-content: center;
  align-items: center;
}
.blob {
  height: 175%;
  width: 50%;
  background-color: rgb(var(--accent-main));
  transform: rotate(50deg);
  border-radius: 50%;
  filter: blur(5rem);
  opacity: 0.65;
}
.blob1 {
  transform: rotate(50deg) translateY(10%);
  background-color: rgb(var(--accent2-main));
}
.blob2 {
  background-color: rgb(var(--accent-main));
}
.blob3 {
  transform:rotate(50deg) translateY(-10%);
  background-color: rgb(var(--accent3-main));
}

@media only screen and (min-width: 1200px) {
  .blob {
    filter: blur(7rem);
  }
}
</style>
