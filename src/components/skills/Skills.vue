<script setup>
import gsap from "gsap";
import { ref, onMounted } from "vue";

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
};

onMounted(() => {
  setGSAP();
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
    <div class="skillsdesc">
      <p>
        I develop robust, scalable backend applications, which are efficient and
        performant.
      </p>
      <p>
        I'm well versed in reverse engineering, helping with optimization and
        finding security issues in applications.
      </p>
    </div>
    <div class="proglangs">
      <h1>Technologies i use</h1>
      <div class="flex">
        
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
  width: 40rem;
  backdrop-filter: blur(0.25rem);
  border-radius: 1rem;
  position: relative;
  background: radial-gradient(
      circle at 50% 250%,
      rgba(var(--accent-main), 0.3),
      rgba(var(--primary-bg-rgb), 0.2) 75%
    ),
    radial-gradient(
      circle at 150% -150%,
      rgba(var(--accent3-main), 0.2),
      rgba(var(--primary-bg-rgb), 0.2) 75%
    ),
    radial-gradient(
      circle at -50% -120%,
      rgba(var(--accent3-main), 0.2),
      rgba(var(--primary-bg-rgb), 0.2) 75%
    );
  background-repeat: no-repeat;
  background-clip: border-box;
  border: 0.1rem solid rgba(var(--accent-light), 0.2);
  box-shadow: 0 0 10rem rgba(var(--accent-main), 0.2);
  display: flex;
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
.skillsdesc {
  max-width: 40rem;
  font-size: 1.2rem;
  letter-spacing: 0.025rem;
  text-align: center;
}
.proglangs h1 {
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
}
</style>
