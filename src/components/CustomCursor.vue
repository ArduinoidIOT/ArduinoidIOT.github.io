<script setup>
import { ref, onMounted } from "vue";

const cursor = ref(null);
const outline = ref(null);
const blob = ref(null);

onMounted(() => {
  if (window.matchMedia("(pointer: fine)").matches) {
    document.onmousemove = (ev) => {
      const { x, y } = ev;
      blob.value.animate(
        {
          left: `${x}px`,
          top: `${y}px`,
        },
        { duration: 2000, fill: "forwards", easing: "ease-out"  }
      );
      cursor.value.style.left = `${x}px`;
      cursor.value.style.top = `${y}px`;
      outline.value.animate(
        {
          left: `${x}px`,
          top: `${y}px`,
        },
        { duration: 500, fill: "forwards", easing: "ease-out" }
      );
      if (ev.target.hasAttributes()) {
        if (ev.target.attributes.getNamedItem("pointer"))
          outline.value.classList.add("hover");
        else outline.value.classList.remove("hover");
      }
    };
    document.onmousedown = () => {
      cursor.value.classList.add("click");
      outline.value.classList.add("click");
    };
    document.onmouseup = () => {
      cursor.value.classList.remove("click");
      outline.value.classList.remove("click");
    };
  }
});
</script>

<template>
  <div class="cursorblob" ref="blob"></div>
  <div class="cursoroutline" ref="outline"></div>
  <div class="cursor" ref="cursor"></div>
</template>

<style>
.cursor,
.cursoroutline,
.cursorblob {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  border-radius: 50%;
}
.cursorblob {
  z-index: -1000;
  background: rgb(var(--accent-main));
  width: 17rem;
  height: 17rem;
}
.cursor,
.cursoroutline {
  pointer-events: none;
  transition: background-color 150ms, border 150ms, transform 200ms,
    box-shadow 150ms;
}
.cursor {
  width: 0.8rem;
  height: 0.8rem;
  z-index: 10000;
  background: rgba(var(--accent-light), 0.5);
  backdrop-filter: blur(5rem);
}
.cursoroutline {
  width: 1rem;
  height: 1rem;
  z-index: 9999;
  border: rgba(var(--accent-light), 0.5) 0.15rem solid;
}
.cursoroutline.hover {
  border: rgba(var(--accent-light), 1) 0.15rem solid;
  transform: translate(-50%, -50%) scale(110%) rotate(45deg);
  border-radius: 0.1rem;
}
.cursoroutline.click {
  border: rgba(var(--accent-main), 0.75) 0.15rem solid;
  transform: translate(-50%, -50%) scale(110%) rotate(45deg);
}
.cursor.click {
  background: rgba(var(--accent-main), 0.8);
  box-shadow: 0 0 1.5rem 0.5rem rgba(var(--accent-main), 0.25);
}
@media only screen and (pointer: coarse) {
  .cursor {
    display: none;
  }
  .cursoroutline {
    display: none;
  }
  .cursorblob {
    display: none;
  }
}
</style>
