class List {
    constructor(title, user_id){
        this.title = title
        this.user_id = user_id
    }
    displayFormat() {
        return `${this.title} + ' ' + ${this.created_at}`
    }
}
