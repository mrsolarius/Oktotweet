//Set event listener on notification
const closeNotification = document.querySelector('.notify-close');
closeNotification.addEventListener('click', removeNotification)

/**
 * Function to close notification
 * @param event
 */
function removeNotification(){
    let element = closeNotification;
    while(element.nodeName !== "BUTTON"){
        element = element.parentNode;
    }
    element.parentNode.parentNode.removeChild(element.parentNode);
}