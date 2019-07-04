class List {
    instances = []
    constructor(id, title, user_id){
        this.id = id
        this.title = title
        this.user_id = user_id
        instances.push(this)
    }
    indexOfLists(){
        return console.log(this.instances)
    }
    
    totalListCount(listId) {
        return `${listId}` 
    }


}
