class Task{
    constructor(content, status, user_id, list_id){
        this.content = content
        this.status = status
        this.user_id = user_id
        this.list_id = list_id
    }

    addTaskToPage(data){
        let userId = document.querySelectorAll('hidden_field_tag')[1].id
        let listId = data['list']['id']
        let taskId = data['id']
        var li = document.createElement('li')
        let aTag = document.createElement('a')
        aTag.href = `http://localhost:3000/tasks/${taskId}`
        aTag.innerHTML = data["content"]
        li.append(aTag)
        document.querySelector('#newTask').appendChild(li)
        li.innerHTML += " " + "Completed: " + data["status"] 
    };

};


