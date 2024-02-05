<script setup>
import { onMounted, ref } from "vue";
import GradientBgText from "./GradientBgText.vue";
import ScrollIcon from "./ScrollIcon.vue";
import gsap from "gsap";

const scrollicon = ref(null);
const home = ref(null);

const setGSAP = () => {
  gsap.to(scrollicon.value, {
    scrollTrigger: {
      trigger: home.value,
      scrub: 0.25,
      start: "20% top",
      end: "bottom 50%",
    },
    opacity: "0",
  });
};

onMounted(() => {
  setGSAP();
});
</script>

<template>
  <div id="home" ref="home">
    <GradientBgText class="titleContainer">
      <h1 class="normalTitle overlayEffect big" text="invokedynamic">
        invokedynamic
      </h1>
      <div class="mobileTitle">
        <h1 class="overlayEffect big" text="invoke">invoke</h1>
        <h1 class="overlayEffect big" text="dynamic">dynamic</h1>
      </div>
    </GradientBgText>
    <div class="desc">
      <div
        class="overlayEffect"
        text="Backend developer, reverse engineer, 3d artist."
      >
        Backend developer, reverse engineer, 3d artist.
      </div>
    </div>
    <div class="scrollicon" ref="scrollicon"><ScrollIcon /></div>
  </div>
</template>

<style>
#home {
  width: 100%;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  overflow: hidden;
  position: relative;
}
.overlayEffect::after {
  content: attr(text);
  color: #ffffff;
  mix-blend-mode: overlay;
  position: absolute;
  top: 0;
  left: 0;
}
.overlayEffect {
  color: #ffffff3f;
  mix-blend-mode: normal;
  position: relative;
}
.mobileTitle {
  display: none;
  flex-direction: column;
  padding-inline: 3rem;
}
.mobileTitle .big:first-child {
  text-align: left;
}
.mobileTitle .big:last-child {
  text-align: right;
}
.mobileTitle .big:last-child::after {
  right: 0;
}
.big {
  font-size: 5rem;
  margin: 0;
}
.desc {
  position: relative;
  font-size: 1.2rem;
  text-align: center;
}
@media only screen and (min-width: 1200px) {
  .big {
    font-size: 6.5rem;
  }
  .desc {
    font-size: 1.5rem;
  }
}
@media only screen and (max-width: 650px) {
  .titleContainer {
    width: 100%;
  }
  .big {
    font-size: 4.5rem;
    line-height: 4rem;
  }
  .normalTitle {
    display: none;
  }
  .mobileTitle {
    display: flex;
  }
  .desc {
    margin-top: 1rem;
    padding-inline: 3rem;
  }
}
@media only screen and (max-width: 400px) {
  .big {
    font-size: 3.5rem;
    line-height: 3rem;
  }
}
</style>
