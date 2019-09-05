class List {
    
    constructor(id, title, user_id){
        this.id = id
        this.title = title
        this.user_id = user_id
    }

    addListToUserShowPage(list){
        let userId = document.querySelector('hidden_field_tag').id
        fetch(`http://localhost:3000/users/${userId}/lists/${list.id}.json`).then(resp => resp.json())
        .then(list => {
            const buttonTag = document.createElement('button')
            const li = document.createElement('li')
            li.style = {'list-style': 'none'}
            li.innerHTML = 'Created on: ' + list.time
            buttonTag.id = "synchronousList"
            buttonTag.name = list.id
            buttonTag.onclick = (event => List.prototype.showList(list))
            buttonTag.innerHTML = " " + list["title"]
            document.getElementById('indexOfLists').append(li)
            li.append(buttonTag)
        })
    }
    
    showList(list){      
        List.prototype.displayButtons
        document.getElementById('showList').innerHTML = ""
        let userId = document.querySelector('hidden_field_tag').id
        let aTag = document.createElement('a')
        aTag.href = `http://localhost:3000/users/${userId}/lists/${list.id}`
        aTag.innerHTML = " " + list['title']
        document.getElementById('showList').append(aTag)
        const textTag = document.createElement('text')
        list.tasks.forEach((task) => {
            // debugger
            textTag.innerHTML += "<p> Task (Content: " + task['content'] + " Status: " + task['status'] + ')</p>' 
        });
        document.getElementById('showList').append(textTag)
        ;
    };

    displayButtons = () => {
        const buttons = document.querySelectorAll('button') 
        buttons.forEach(button => {
            button.onclick = (function(){
                if (button.style.display === "none") {
                    button.style.display = "block";
                  } else {
                    button.style.display = "none";
                }
            }) 
        })
    }

    indexOfLists(userId){
        if(document.getElementById('indexOfLists').innerHTML === ""){
            let userId = document.querySelector('hidden_field_tag').id
            fetch(`http://localhost:3000/users/${userId}/lists.json`).then(resp => resp.json()).then((lists) => {
                lists.forEach((list) => {
                let li = document.getElementById('indexOfLists').appendChild(document.createElement('li'));
                li.innerHTML = 'Created on: ' + list.time + " "
                let buttonTag = document.createElement('button')
                li.append(buttonTag)
                buttonTag.id = list.id
                buttonTag.onclick = (event => List.prototype.showList(list))
                buttonTag.innerHTML = list['title'] 
                })
            })
        }
    };

    indexOfListsWithTasks(userId){
        document.getElementById('showList').innerHTML = ""
        fetch(`http://localhost:3000/users/${userId}/lists.json`).then(resp => resp.json()).then((lists) => {   
        lists.forEach((list) => {
                let aTag = document.createElement('a')
                aTag.href = `http://localhost:3000/users/${userId}/lists/${list.id}`
                aTag.innerHTML = " " + list['title']
                let li = document.getElementById('showList').appendChild(document.createElement('li'));
                li.append(aTag)
                li.innerHTML += "  TASKS: "
                list.tasks.forEach((task) => {
                    li.innerHTML += " " + task['content'] + " " + "Completed: " + task['status']
               });
            })
        })
    };

    totalListCount(listId) {
        return `${listId}` 
    };
    
};

//RAILS will set the DISBALED attribute of the form button to TRUE
//you can target this button with javascript and turn the attribute
//back to FALSE to allow multiple uses of the asynchronous LIST creator

//getting index of list with tasks to look as the same of the list show page when clicked
//have tasks on seperate lines 

window.addEventListener("load", List.prototype.indexOfLists)
