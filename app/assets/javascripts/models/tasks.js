class Task{
    constructor(content, status, user_id, list_id){
        this.content = content
        this.status = status
        this.user_id = user_id
        this.list_id = list_id
    }

    addTaskToPage(data){
        let userId = document.querySelectorAll('hidden_field_tag')[1].id
        let taskId = data['id']
        var li = document.createElement('li')
        let aTag = document.createElement('a')
        aTag.href = `http://localhost:3000/tasks/${taskId}`
        aTag.innerHTML = data["content"]
        li.append(aTag)
        document.querySelector('#asyncIndexOfTasks').appendChild(li)
        li.innerHTML += " " + "Completed: " + data["status"] 
    };

    indexOfTasks(){
        if(document.getElementById('asyncIndexOfTasks').innerHTML !== ""){
            document.getElementById('asyncIndexOfTasks').innerHTML = ""
        }
        fetch(`http://localhost:3000/lists/${document.querySelector('hidden_field_tag').id}/tasks.json`)
        .then(resp => resp.json())
        .then(tasks => {
            tasks.forEach((task) => {
                let li = document.createElement('li')
                let aTag = document.createElement('a')
                aTag.href = `http://localhost:3000/tasks/${task.id}`
                aTag.innerHTML = task['content']
                li.append(aTag)
                document.getElementById('asyncIndexOfTasks').appendChild(li)
                li.innerHTML += " Completed: " + task['status'] 
            });
        });
    }
};

window.addEventListener("load", Task.prototype.indexOfTasks)