<script setup>
const props = defineProps(["wipopen"]);
</script>

<template>
  <Transition>
    <div v-if="props.wipopen" id="wipwarning">
      <div class="content">
        <div class="head">Work In Progress</div>
        <p>This website is heavily a work in progress.</p>
        <p>
          You may come across incomplete features or issues while browsing the
          website. They will be resolved upon the final release of the website.
        </p>
      </div>
      <div class="closebtn" pointer @click="() => $emit('close')">Continue</div>
    </div>
  </Transition>
</template>

<style scoped>
#wipwarning {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: var(--primary-bg);
  z-index: 9998;
  padding: 4rem;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  transition: opacity 500ms;
}
.content {
  max-width: 50rem;
}
.head {
  font-size: 2rem;
}
.closebtn {
  font-size: 1.1rem;
  color: rgb(var(--accent-light));
  transition: color 100ms, text-decoration 100ms;
}
.closebtn:hover {
  color: rgb(var(--accent2-main));
  text-decoration: underline;
}

.v-enter-active,
.v-leave-active {
  opacity: 1;
  transition: opacity 500ms;
}
.v-enter-from,
.v-leave-to {
  opacity: 0;
}
</style>
