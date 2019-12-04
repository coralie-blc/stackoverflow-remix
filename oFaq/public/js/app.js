function onClickBtnLike(event) {
    event.preventDefault();

    // valeur de this, element html qui déclenche l'evt, donc 'a'
    const url = this.href; 
    console.log(url);
    const spanCount = this.querySelector('span.js-likes');
    const icone = this.querySelector('i');

    // Si ça se passe bien = then
    axios.get(url).then(function (response) {    // une fois que tu as la réponse, tu me la renvoies.
        spanCount.textContent = response.data.likes;        // visible dans le network
    
        if(icone.classList.contains('fa-thumbs-down')) {
            icone.classList.replace('fa-thumbs-down', 'fa-thumbs-up');
        } else { 
            icone.classList.replace('fa-thumbs-up', 'fa-thumbs-down');
        }
    // Si erreur
    }).catch(function(error){
        if(error.response.status === 403){
            window.alert("Pour liker, merci de vous connecter.")
        } else {
            window.alert("Une erreur s'est produite.")
        }
    });
}

document.querySelectorAll('a.js-like').forEach(function(link){
    link.addEventListener('click', onClickBtnLike);
})
