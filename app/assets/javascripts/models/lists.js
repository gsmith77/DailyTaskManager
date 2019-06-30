class List {
    constructor(id, title, user_id){
        this.id = id
        this.title = title
        this.user_id = user_id
    }
    totalListCount(listId) {
        return `${listId}` 
    }
}
