const vw = Math.max(document.documentElement.clientWidth || 0, window.innerWidth || 0)
const vh = Math.max(document.documentElement.clientHeight || 0, window.innerHeight || 0)

const minimap = document.querySelector("#minimap")
const minimap_width = minimap.offsetWidth

const content_width = document.querySelector("#content").offsetWidth
const content_height = document.querySelector("#content").offsetHeight

const fraction = minimap_width / content_width
let scrollbox_height = Math.round(fraction * (vh - 40))

const scrollbox = document.createElement("div")
scrollbox.id = "scrollbox";
scrollbox.style.height = scrollbox_height + "px"
scrollbox.style.width = minimap_width + "px"

minimap.appendChild(scrollbox)

minimap.style.height = Math.round(fraction * content_height) + 50 + "px"
minimap.style["border-radius"] = "5px"

onscroll = () => {
    scrollbox.style.top = Math.round(40 + fraction * document.scrollingElement.scrollTop) + "px"
};
