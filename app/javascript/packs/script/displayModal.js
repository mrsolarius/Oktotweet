// add event listener to toggle modal on each element that have modal-open class
const openModal = document.querySelectorAll('.modal-open');
for (let i = 0; i < openModal.length; i++) {
    openModal[i].addEventListener('click', function(event){
        event.preventDefault()
        toggleModal()
    })
}

// add event listener to toggle modal on each element that have modal-overlay class
const overlay = document.querySelector('.modal-overlay')
if (overlay) overlay.addEventListener('click', toggleModal)

// add event listener to toggle modal on each element that have modal-close class
const closeModal = document.querySelectorAll('.modal-close');
for (let i = 0; i < closeModal.length; i++) {
    closeModal[i].addEventListener('click', toggleModal)
}
/**
 * Close modal if hit escape
 * @param evt
 */
document.onkeydown = function(evt) {
    //If event is null get event from windows
    evt = evt || window.event
    let isEscape = false;
    if ("key" in evt) {
        isEscape = (evt.key === "Escape" || evt.key === "Esc")
    } else {
        isEscape = (evt.keyCode === 27)
    }
    if (isEscape && document.body.classList.contains('modal-active')) {
        toggleModal()
    }
};

/**
 * Function that open or close modal base on current modal class
 */
function toggleModal () {
    const body = document.querySelector('body')
    const modal = document.querySelector('.modal')
    modal.classList.toggle('opacity-0')
    modal.classList.toggle('pointer-events-none')
    body.classList.toggle('modal-active')
}

window.onload = function (){
    if (document.getElementById('asError')!=null){
        toggleModal()
    }
}