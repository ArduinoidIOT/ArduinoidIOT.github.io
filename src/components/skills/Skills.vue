<script setup>
import gsap from "gsap";
import ScrollTrigger from "gsap/ScrollTrigger";
import { ref, onMounted, onBeforeUnmount } from "vue";

const skills = ref(null);
const termcontent = ref(null);
const setGSAP = () => {
  let mm = gsap.matchMedia();
  mm.add("(max-width: 750px)", () => {
    gsap.to(termcontent.value, {
      scrollTrigger: {
        trigger: skills.value,
        scrub: 0.25,
        start: "top 50%",
        end: "bottom bottom",
      },
      height: "12rem",
      ease: "steps(7)",
    });
  });
  mm.add("(min-width: 751px)", () => {
    gsap.to(termcontent.value, {
      scrollTrigger: {
        trigger: skills.value,
        scrub: 0.25,
        start: "top 70%",
        end: "90% bottom",
      },
      height: "7.5rem",
      ease: "steps(4)",
    });
  });
  ScrollTrigger.batch(".grid-item", {
    onEnter: (batch) =>
      gsap.to(batch, {
        scale: 1,
        opacity: 1,
        stagger: 0.1,
      }),
    onLeave: (batch) =>
      gsap.to(batch, {
        scale: 0.25,
        opacity: 0,
        stagger: 0.1,
      }),
    onEnterBack: (batch) =>
      gsap.to(batch, {
        scale: 1,
        opacity: 1,
        stagger: 0.1,
      }),
    onLeaveBack: (batch) =>
      gsap.to(batch, {
        scale: 0.25,
        opacity: 0,
        stagger: 0.1,
      }),
    start: 'bottom 95%',
    end: 'top 5%',
  })
};

onMounted(() => {
  setGSAP();
});

onBeforeUnmount(() => {
  ScrollTrigger.getAll().forEach(t => t.kill());
});

</script>
<template>
  <div id="skills" ref="skills">
    <div class="heading">
      <div>Skills</div>
    </div>
    <div class="terminalwindow" ref="skills">
      <div class="titlebar">
        <div class="windowcontrols">
          <div class="circle"></div>
          <div class="circle"></div>
          <div class="circle"></div>
        </div>
      </div>
      <div class="content" ref="termcontent">
        <div class="termgreen">invokedynamic@pc</div>
        $
        <div class="termblue">python ./skills.py</div>
        <br />
        Loading skills...<br />
        GET /portfolio/skills<br />
        Loaded!<br />
        <div class="termgrey">Program exited with status code 0</div>
        <br />
      </div>
    </div>
    <div class="skills-grid">
      <div class="grid-item icon" style="grid-area: icon1;"> <i class="devicon-python-plain"></i></div>
      <div class="grid-item icon" style="grid-area: icon2;"> <i class="devicon-javascript-plain"></i></div>
      <div class="grid-item icon" style="grid-area: icon3;"> <img class="asm-icon" src="/src/assets/asm.svg" alt=""></div>
      <div class="grid-item icon" style="grid-area: icon4;"> <i class="devicon-blender-original"></i></div>
      <div class="grid-item icon" style="grid-area: icon5;"> <i class="devicon-cplusplus-plain"></i></div>
      <div class="grid-item icon" style="grid-area: icon6;"> <i class="devicon-bash-plain"></i></div>
      <div class="grid-item text" style="grid-area: text1;">
        <p>Building <b>Powerful</b>, <b>Scalable</b> backend applications for Desktop and the Web.</p>
      </div>
    </div>
  </div>
</template>

<style>
#skills {
  padding: 3rem;
  display: flex;
  flex-direction: column;
  gap: 3rem;
  align-items: center;
  margin-bottom: 200vh;
  height: 100vh;
}

.heading {
  display: flex;
  font-size: 5rem;
  justify-content: center;
}

.terminalwindow {
  font-family: "IBM Plex Mono";
  height: 14rem;
  width: 38rem;
  backdrop-filter: blur(0.25rem);
  border-radius: 1rem;
  background: radial-gradient(circle at 50% 250%,
      rgba(var(--accent-main), 0.3),
      rgba(var(--primary-bg-rgb), 0.2) 75%),
    radial-gradient(circle at 150% -150%,
      rgba(var(--accent3-main), 0.2),
      rgba(var(--primary-bg-rgb), 0.2) 75%),
    radial-gradient(circle at -50% -120%,
      rgba(var(--accent3-main), 0.2),
      rgba(var(--primary-bg-rgb), 0.2) 75%);
  background-repeat: no-repeat;
  background-clip: border-box;
  border: 0.1rem solid rgba(var(--accent-light), 0.2);
  box-shadow: 0 0 10rem rgba(var(--accent-main), 0.2);
  display: flex;
  position: relative;
}

.terminalwindow .titlebar {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 2.5rem;
  border-bottom: 0.1rem solid rgba(var(--accent-light), 0.2);
  display: flex;
  align-items: center;
  padding-inline: 1rem;
  box-sizing: border-box;
}

.terminalwindow .windowcontrols {
  display: flex;
  gap: 0.5rem;
}

.terminalwindow .circle {
  width: 1rem;
  height: 1rem;
  border: 0.1rem solid rgba(var(--accent-light), 0.2);
  border-radius: 50%;
}

.terminalwindow .content {
  margin: 4.5rem 2rem 2rem 2rem;
  box-sizing: border-box;
  opacity: 90%;
  overflow: hidden;
  height: 1.5rem;
  transition: height 100ms linear;
}

.termblue {
  display: inline;
  color: #5d8dd0;
}

.termgreen {
  display: inline;
  color: #7bdaaf;
}

.termgrey {
  display: inline;
  color: #a6aab6;
}

.asm-icon {
  margin: 0;
  width: 3rem;
  height: 3rem;
}

.skills-grid {
  display: grid;
  gap: 0.5rem;
  grid-template-areas:
    "icon1 icon2 icon3 text1 text1"
    "icon4 icon5 icon6 text1 text1"
}

.skills-grid .grid-item {
  transform: scale(0.5);
  background: rgba(var(--primary-bg-rgb), 0.2);
  border: 0.1rem solid rgba(var(--accent-light), 0.2);
  backdrop-filter: blur(0.25rem);
  border-radius: 1rem;
}

.skills-grid .icon {
  min-width: 5rem;
  min-height: 5rem;
  text-align: center;
  font-size: 3rem;
  display: flex;
  align-items: center;
  justify-content: center;
}

.skills-grid .text {
  width: 21.5rem;
  display: flex;
  align-items: center;
  text-align: center;
  font-size: 1.35rem;
  padding: 1.25rem;
  box-sizing: border-box;
  line-height: 120%;
}

.skills-grid p {
  margin: 0;
}

/* Responsiveness */
@media only screen and (max-width: 750px) {
  #skills {
    gap: 3rem;
  }

  .terminalwindow {
    width: 16rem;
    height: 16rem;
  }

  .terminalwindow .content {
    margin: 4rem 1.5rem 1.5rem 1.5rem;
  }

  

  .skills-grid .text {
    width: 16rem;
    font-size: 1rem;
  }

  .skills-grid {
    grid-template-areas:
      "icon1 icon2 icon3"
      "icon4 icon5 icon6"
      "text1 text1 text1"
  }
}
</style>
