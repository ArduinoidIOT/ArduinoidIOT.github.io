<script setup>
import { onBeforeUnmount, onMounted, ref } from "vue";
import MenuItem from "./MenuItem.vue";
import MenuFooterPill from "./MenuFooterPill.vue";
const props = defineProps(["open"]);
const menuitembox = ref(null);
onMounted(() => {
  setTimeout(() => {
    for (const menuitem of menuitembox.value.children) {
      var linkelement = menuitem.children[0].children[0];
      linkelement.style.transform = "none";
    }
    setTimeout(() => {
      menuitembox.value.style.setProperty("--menuitem-hover-width", "100%");
    }, 250);
  }, 750);
});
onBeforeUnmount(() => {
  menuitembox.value.style.setProperty("--menuitem-hover-width", "0%");
});
</script>

<template>
  <div id="menu">
    <div class="header">Menu</div>
    <div class="main" ref="menuitembox">
      <MenuItem pointer text="Home" link="#home" @click="$emit('closemenu')" />
      <MenuItem
        pointer
        text="Skills"
        link="#skills"
        @click="$emit('closemenu')"
      />
      <MenuItem pointer text="Work" link="#work" @click="$emit('closemenu')" />
      <MenuItem
        pointer
        text="Contact"
        link="#contact"
        @click="$emit('closemenu')"
      />
    </div>
    <div class="footer">
      <div class="buttons">
        <MenuFooterPill
          text="ArduinoidIOT"
          w="11rem"
          buttonType="link"
          link="https://github.com/ArduinoidIOT"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            height="16"
            width="15.5"
            viewBox="0 0 496 512"
          >
            <path
              d="M165.9 397.4c0 2-2.3 3.6-5.2 3.6-3.3 .3-5.6-1.3-5.6-3.6 0-2 2.3-3.6 5.2-3.6 3-.3 5.6 1.3 5.6 3.6zm-31.1-4.5c-.7 2 1.3 4.3 4.3 4.9 2.6 1 5.6 0 6.2-2s-1.3-4.3-4.3-5.2c-2.6-.7-5.5 .3-6.2 2.3zm44.2-1.7c-2.9 .7-4.9 2.6-4.6 4.9 .3 2 2.9 3.3 5.9 2.6 2.9-.7 4.9-2.6 4.6-4.6-.3-1.9-3-3.2-5.9-2.9zM244.8 8C106.1 8 0 113.3 0 252c0 110.9 69.8 205.8 169.5 239.2 12.8 2.3 17.3-5.6 17.3-12.1 0-6.2-.3-40.4-.3-61.4 0 0-70 15-84.7-29.8 0 0-11.4-29.1-27.8-36.6 0 0-22.9-15.7 1.6-15.4 0 0 24.9 2 38.6 25.8 21.9 38.6 58.6 27.5 72.9 20.9 2.3-16 8.8-27.1 16-33.7-55.9-6.2-112.3-14.3-112.3-110.5 0-27.5 7.6-41.3 23.6-58.9-2.6-6.5-11.1-33.3 2.6-67.9 20.9-6.5 69 27 69 27 20-5.6 41.5-8.5 62.8-8.5s42.8 2.9 62.8 8.5c0 0 48.1-33.6 69-27 13.7 34.7 5.2 61.4 2.6 67.9 16 17.7 25.8 31.5 25.8 58.9 0 96.5-58.9 104.2-114.8 110.5 9.2 7.9 17 22.9 17 46.4 0 33.7-.3 75.4-.3 83.6 0 6.5 4.6 14.4 17.3 12.1C428.2 457.8 496 362.9 496 252 496 113.3 383.5 8 244.8 8zM97.2 352.9c-1.3 1-1 3.3 .7 5.2 1.6 1.6 3.9 2.3 5.2 1 1.3-1 1-3.3-.7-5.2-1.6-1.6-3.9-2.3-5.2-1zm-10.8-8.1c-.7 1.3 .3 2.9 2.3 3.9 1.6 1 3.6 .7 4.3-.7 .7-1.3-.3-2.9-2.3-3.9-2-.6-3.6-.3-4.3 .7zm32.4 35.6c-1.6 1.3-1 4.3 1.3 6.2 2.3 2.3 5.2 2.6 6.5 1 1.3-1.3 .7-4.3-1.3-6.2-2.2-2.3-5.2-2.6-6.5-1zm-11.4-14.7c-1.6 1-1.6 3.6 0 5.9 1.6 2.3 4.3 3.3 5.6 2.3 1.6-1.3 1.6-3.9 0-6.2-1.4-2.3-4-3.3-5.6-2z"
            />
          </svg>
        </MenuFooterPill>
        <MenuFooterPill text="invokedynamic" w="12.25rem" buttonType="copy">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            height="16"
            width="20"
            viewBox="0 0 640 512"
          >
            <path
              d="M524.5 69.8a1.5 1.5 0 0 0 -.8-.7A485.1 485.1 0 0 0 404.1 32a1.8 1.8 0 0 0 -1.9 .9 337.5 337.5 0 0 0 -14.9 30.6 447.8 447.8 0 0 0 -134.4 0 309.5 309.5 0 0 0 -15.1-30.6 1.9 1.9 0 0 0 -1.9-.9A483.7 483.7 0 0 0 116.1 69.1a1.7 1.7 0 0 0 -.8 .7C39.1 183.7 18.2 294.7 28.4 404.4a2 2 0 0 0 .8 1.4A487.7 487.7 0 0 0 176 479.9a1.9 1.9 0 0 0 2.1-.7A348.2 348.2 0 0 0 208.1 430.4a1.9 1.9 0 0 0 -1-2.6 321.2 321.2 0 0 1 -45.9-21.9 1.9 1.9 0 0 1 -.2-3.1c3.1-2.3 6.2-4.7 9.1-7.1a1.8 1.8 0 0 1 1.9-.3c96.2 43.9 200.4 43.9 295.5 0a1.8 1.8 0 0 1 1.9 .2c2.9 2.4 6 4.9 9.1 7.2a1.9 1.9 0 0 1 -.2 3.1 301.4 301.4 0 0 1 -45.9 21.8 1.9 1.9 0 0 0 -1 2.6 391.1 391.1 0 0 0 30 48.8 1.9 1.9 0 0 0 2.1 .7A486 486 0 0 0 610.7 405.7a1.9 1.9 0 0 0 .8-1.4C623.7 277.6 590.9 167.5 524.5 69.8zM222.5 337.6c-29 0-52.8-26.6-52.8-59.2S193.1 219.1 222.5 219.1c29.7 0 53.3 26.8 52.8 59.2C275.3 311 251.9 337.6 222.5 337.6zm195.4 0c-29 0-52.8-26.6-52.8-59.2S388.4 219.1 417.9 219.1c29.7 0 53.3 26.8 52.8 59.2C470.7 311 447.5 337.6 417.9 337.6z"
            />
          </svg>
        </MenuFooterPill>
      </div>
      <div class="copyright">
        ©️ invokedynamic 2024
        <a pointer href="https://brin.is-a.dev/" target="_blank"
          >created by trinethr</a
        >
      </div>
    </div>
  </div>
</template>

<style>
#menu {
  position: fixed;
  width: 100%;
  height: 100%;
  z-index: 8999;
  top: 0;
  left: 0;
  background: rgba(var(--primary-bg-rgb), 0.5);
  backdrop-filter: blur(2rem);
  display: flex;
  flex-direction: column;
  --menuitem-border: 1px solid #ffffff0a;
}
.header,
.footer {
  padding-inline: 3rem;
  display: flex;
  height: 6.5rem;
  align-items: center;
}
#menu .header {
  font-size: 2rem;
  font-weight: 100;
  border-bottom: var(--menuitem-border);
}
#menu .main {
  display: flex;
  flex-direction: column;
  flex-grow: 1;
  --menuitem-hover-width: 0%;
}
#menu .footer {
  font-size: 1.25rem;
  font-weight: 100;
  border-top: var(--menuitem-border);
  justify-content: space-between;
}
#menu .copyright {
  display: flex;
  align-items: center;
  gap: 1rem;
}
#menu .copyright a {
  all: unset;
  color: rgb(var(--accent3-main));
  text-decoration: underline 1px;
  font-weight: 400;
}
#menu .footer .buttons {
  display: flex;
  align-items: center;
  gap: 1rem;
}
@media only screen and (min-width: 1200px) {
  .header,
  .footer {
    padding-inline: 5rem;
  }
  .menuitem {
    padding: 1.5rem 4.5rem 1.5rem 5rem;
  }
}
@media only screen and (max-width: 650px) {
  #menu .footer {
    flex-direction: column;
    padding-block: 1rem;
  }
}
@media only screen and (max-width: 500px) {
  .header,
  .footer {
    padding-inline: 2rem;
  }
  .header {
    font-size: 1.75rem;
  }
  .footer .buttons,
  .footer .copyright {
    flex-direction: column;
  }
  .footer {
    height: 10rem;
  }
  #menu .footer .buttons {
    gap: 0.5rem;
  }
  #menu .footer .copyright {
    gap: 0.25rem;
  }
  .overflowbox {
    font-size: 2.5rem;
    height: 2.5rem;
  }
  .menuitem {
    padding: 1.5rem 1.5rem 1.5rem 2rem;
  }
  .menuitem .material-symbols-outlined {
    font-variation-settings: "FILL" 0, "wght" 300, "GRAD" 0, "opsz" 48;
    font-size: 3rem;
  }
}
</style>
