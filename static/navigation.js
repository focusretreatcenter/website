/* global document */
const nav = document.querySelector("nav.full");
// const navButton = document.querySelector("button.open-nav");
// const content = document.querySelector(".content");

function toggleNav() {
  nav.classList.toggle("open");
  // if (nav.classList.contains("open")) {
  //   navButton.innerText = "×";
  // } else {
  //   navButton.innertText = "≡";
  // }
  // content.classList.toggle("navOpen");
}

function closeNav() {
  nav.classList.remove("open");
  // content.classList.remove("navOpen");
}

nav.addEventListener("click", toggleNav);
document.querySelector("button.open-nav").addEventListener("click", toggleNav);
document.querySelector("button.close-nav").addEventListener("click", toggleNav);
