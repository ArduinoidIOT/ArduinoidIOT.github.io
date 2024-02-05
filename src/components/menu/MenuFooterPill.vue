<script setup>
import { computed } from "vue";

const props = defineProps(["text", "w", "buttonType", "link"]);
const hoverWidthCss = computed(() => `--hover-width: ${props.w}`);

const buttonClick = (ev) => {
  if (props.buttonType == "link") {
    window.open(props.link, "_blank").focus();
  } else if (props.buttonType == "copy") {
    navigator.clipboard.writeText(props.text);
    ev.target.classList.add("copied");
    setTimeout(() => ev.target.classList.remove("copied"), 2500);
  }
};
</script>

<template>
  <div class="pillbutton" @click="buttonClick" :style="hoverWidthCss" pointer>
    <div class="button-icon">
      <slot></slot>
    </div>
    {{ props.text }}
  </div>
</template>

<style>
.button-icon {
  display: flex;
  align-items: center;
  pointer-events: none;
}
.button-icon svg {
  width: 1.5rem;
  height: auto;
  fill: white;
}
.pillbutton {
  display: flex;
  border: 1px solid #ffffff5f;
  align-items: center;
  gap: 0.75rem;
  padding: 0.5rem 0.75rem;
  height: 3rem;
  width: 3rem;
  border-radius: 2rem;
  box-sizing: border-box;
  overflow: hidden;
  transition: width 200ms ease, border 200ms ease, box-shadow 200ms ease;
}
.pillbutton:hover {
  border: 1px solid var(--accent-main-hex);
  box-shadow: 0 0 1rem rgba(var(--accent-main), 0.25);
  width: var(--hover-width);
}

.pillbutton::after {
  content: "Copied to clipboard";
  font-size: 1rem;
  font-weight: 400;
  width: var(--hover-width);
  box-sizing: border-box;
  position: absolute;
  text-align: center;
  background-color: #3cb46e;
  padding: 0.5rem 0.75rem;
  border-radius: 1.5rem;
  pointer-events: none;
  transform: translate(-0.75rem, -1.5rem);
  opacity: 0;
  transition: transform 300ms ease, opacity 300ms ease;
}
.pillbutton.copied::after {
  transform: translate(-0.75rem, -3rem);
  opacity: 1;
}

@media only screen and (max-width: 650px) {
  .pillbutton {
    width: var(--hover-width);
  }
}
@media only screen and (max-width: 500px) {
  .pillbutton {
    font-size: 1rem;
    height: 2.5rem;
    width: calc(var(--hover-width) - 1.75rem);
  }
  .pillbutton:hover {
    width: calc(var(--hover-width) - 1.75rem);
  }
  .pillbutton::after {
    width: calc(var(--hover-width) - 1.75rem);
  }
  .pillbutton .button-icon svg {
    width: 1.25rem;
  }
}
</style>
