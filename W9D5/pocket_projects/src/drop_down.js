
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};


function dogLinkCreator() {
  const dogLinks = []
  for(const[key, val] of Object.entries(dogs)) {
    const aTag = document.createElement('a');
    aTag.innerHTML = key;
    aTag.href = val;
    const liTag = document.createElement("li");
    liTag.className = 'dog-link';
    liTag.appendChild(aTag);
    dogLinks.push(liTag);
  }
  return dogLinks
}

function attachDogLinks() {
  const dropList = document.getElementsByClassName('drop-down-dog-list')[0]
  const dogLinks = dogLinkCreator();
  dogLinks.forEach((dogLink) => {
    dropList.appendChild(dogLink)
  })
}

function handleEnter() {
  const dropList = document.getElementsByClassName('drop-down-dog-list')[0]
  const lists = Array.from(dropList.children);
  lists.forEach((list) => {
    list.className = 'dog-link-visible'
  })
}

function handleLeave() {
  const dropList = document.getElementsByClassName("drop-down-dog-list")[0];
  const lists = Array.from(dropList.children);
  lists.forEach((list) => {
    list.className = "dog-link";
  });
}


attachDogLinks();

const showDogTarget = document.getElementsByClassName('drop-down-dog-nav')[0]

showDogTarget.addEventListener('mouseenter', handleEnter)
showDogTarget.addEventListener('mouseleave', handleLeave)