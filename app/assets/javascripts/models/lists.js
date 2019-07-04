class List {
    constructor(id, title, user_id){
        this.id = id
        this.title = title
        this.user_id = user_id
    }
    redirectToShowPage(userId, listId){
        fetch(`http://localhost:3000/users/${userId}/lists/${listId}.json`)
        .then(function (){
            window.location = `http://localhost:3000/users/${userId}/lists/${listId}.json`
        })
    }

    indexOfLists(userId){
        fetch(`http://localhost:3000/users/${userId}/lists.json`).then(function() {
            window.location = `http://localhost:3000/users/${userId}/lists.json`
        })
    }

    totalListCount(listId) {
        return `${listId}` 
    }


}
