<template>
  <div class="scrollicon-container">
    <div class="iconoutline">
      <div class="scrollwheel"></div>
    </div>
    Scroll for more
  </div>
</template>

<style scoped>
.scrollicon-container {
  position: absolute;
  left: 50%;
  transform: translateX(-50%);
  bottom: 2rem;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 1rem;
  color: #ffffffaf;
  font-size: 0.8rem;
}
.iconoutline {
  height: 2rem;
  width: 1.2rem;
  border-radius: 0.75rem;
  border: 0.15rem solid #ffffffaf;
  box-sizing: border-box;
  position: relative;
}
.scrollwheel {
  top: 0.22rem;
  left: 0.35rem;
  position: absolute;
  width: 0.3rem;
  height: 0.3rem;
  border-radius: 50%;
  background: #ffffffaf;
  animation: scrollwheel 1.2s linear infinite forwards;
}

@keyframes scrollwheel {
  0% {
    transform: translateY(0);
  }
  75% {
    transform: translateY(0.4rem);
  }
  100% {
    transform: translateY(0);
  }
}
</style>