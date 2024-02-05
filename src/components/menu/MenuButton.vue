<script setup>
const props = defineProps(["open"]);
</script>

<template>
  <div id="menubutton" pointer :open="props.open">
    <div class="line line1"></div>
    <div class="line line2"></div>
    <div class="line line3"></div>
  </div>
</template>

<style scoped>
#menubutton {
  position: fixed;
  top: 2rem;
  right: 2rem;
  height: 2.5rem;
  width: 2.8rem;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: end;
  transition: transform 200ms cubic-bezier(.3,.1,.7,1.5), right 750ms ease;
  z-index: 9000;
}
.line {
  width: 100%;
  background: #ffffffaf;
  height: 3px;
  border-radius: 1.5px;
  pointer-events: none;
  transform-origin: calc(100% - 1.5px);
  transition: width 250ms cubic-bezier(.3,.1,.7,1.5), background 200ms, box-shadow 200ms, transform 200ms;
}
.line2 {
  transition-delay: 50ms;
  width: 85%;
}
.line3 {
  transition-delay: 100ms;
  width: 70%;
}
#menubutton:hover .line2, #menubutton:hover .line3 {
  width: 100%;
}
#menubutton:active {
  transform: scale(90%);
}
#menubutton[open="true"] {
  right: 3rem;
}
#menubutton:active .line {
  background-color: white;
  box-shadow: 0 0 1rem #ffffff3f;
}
#menubutton[open="true"]:active .line {
  box-shadow: 0 0 1rem rgba(var(--accent-main), 0.5);
}
#menubutton[open="true"]:active .line2 {
  box-shadow: none;
}
#menubutton[open="true"] .line {
  background-color: rgba(var(--accent-main), 0.85);
}
#menubutton[open="true"] .line1 {
  transform: rotate(-45deg) scaleX(125%);
}
#menubutton[open="true"] .line2 {
  background-color: transparent;
}
#menubutton[open="true"] .line3 {
  width: 100%;
  transform: rotate(45deg) scaleX(125%);
}

@media only screen and (min-width: 1200px) {
  #menubutton[open="true"] {
    right: 5rem;
  }
}

@media only screen and (max-width: 500px) {
  #menubutton[open="true"] {
    right: 2rem;
  }
}
</style>
