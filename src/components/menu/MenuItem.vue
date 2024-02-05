<script setup>
import { onMounted, ref } from "vue";
const props = defineProps(["text", "link"]);
const emit = defineEmits(["click"]);

const menuitem = ref(null);
onMounted(() => {
  menuitem.value.onmousemove = (ev) => {
    const decimal = ev.clientX / menuitem.value.offsetWidth;
    const basepercent = 70,
      percentRange = 30,
      adjustablePercent = percentRange * decimal;
    const color2percent = basepercent + adjustablePercent;
    menuitem.value.style.setProperty("--color2percent", `${color2percent}%`);
  };
});

const clickLink = () => {
  window.location.href = props.link;
  emit("click");
};
</script>

<template>
  <div class="menuitem" ref="menuitem" @click="clickLink">
    <div class="overflowbox">
      <div>{{ props.text }}</div>
    </div>
    <span class="material-symbols-outlined"> arrow_outward </span>
  </div>
</template>

<style>
.menuitem {
  border-bottom: var(--menuitem-border);
  position: relative;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1.5rem 2.5rem 1.5rem 3rem;
}
.menuitem .material-symbols-outlined {
  font-variation-settings: "FILL" 0, "wght" 500, "GRAD" 0, "opsz" 48;
  z-index: 2;
  font-size: 4rem;
  mix-blend-mode: overlay;
}
.menuitem:before {
  content: "";
  background: linear-gradient(
    to right,
    transparent,
    var(--accent3-main-hex) var(--color2percent),
    var(--accent2-main-hex)
  );
  position: absolute;
  top: 0;
  left: 0;
  width: 0%;
  height: 100%;
  transition: width 750ms ease;
  opacity: 0.75;
}
.menuitem:hover:before {
  width: var(--menuitem-hover-width);
}
.menuitem:hover .overflowbox {
  letter-spacing: 0.15rem;
}
.overflowbox {
  font-size: 4.5rem;
  font-weight: 300;
  box-sizing: border-box;
  position: relative;
  height: 4.5rem;
  overflow: hidden;
  display: flex;
  pointer-events: none;
  transition: text-shadow 0.5s ease, letter-spacing 0.5s ease;
}
.overflowbox div {
  all: unset;
  line-height: 100%;
  transform: translateY(5rem);
  transition: transform 0.5s ease;
}
.menuitem:nth-child(1) .overflowbox div {
  transition-delay: 0ms;
}
.menuitem:nth-child(2) .overflowbox div {
  transition-delay: 100ms;
}
.menuitem:nth-child(3) .overflowbox div {
  transition-delay: 200ms;
}
.menuitem:nth-child(4) .overflowbox div {
  transition-delay: 300ms;
}
</style>
