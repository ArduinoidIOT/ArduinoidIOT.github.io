<script setup>
import { ref } from "vue";
import BGeffect from "./components/BGeffect.vue";
import Home from "./components/home/Home.vue";
import MenuButton from "./components/menu/MenuButton.vue";
import Menu from "./components/menu/Menu.vue";
import CustomCursor from "./components/CustomCursor.vue";
import Skills from "./components/skills/Skills.vue";
import gsap from "gsap";
import ScrollTrigger from "gsap/ScrollTrigger";

gsap.registerPlugin(ScrollTrigger);
const menuOpen = ref(false);
</script>

<template>
  <div id="main">
    <MenuButton :open="menuOpen" @click="menuOpen = !menuOpen" />

    <Transition name="menubg">
      <Menu v-if="menuOpen" @closemenu="menuOpen = false" />
    </Transition>
    <Home />
    <Skills />
    <BGeffect />
    <CustomCursor />
  </div>
</template>
<style>

.menubg-enter-from,
.menubg-leave-to {
  transform: translateY(-100%);
}
.menubg-enter-active,
.menubg-leave-active {
  transition: transform 1s cubic-bezier(0.75, 0.1, 0.25, 1);
}
</style>
