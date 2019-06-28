class List {
    constructor(title, user_id){
        this.title = title
        this.user_id = user_id
    }
}

const getLists = (user_id) => {
    fetch(`https://localhost:3000/${user_id}/lists.json`)
}

List.prototype.display_format = () => {
    return `${this.title} + ' ' + ${this.created_at}`
}