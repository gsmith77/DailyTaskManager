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
            textTag.innerHTML += " Task (Content: " + task['content'] + " Status: " + task['status'] + ')'
        });
        document.getElementById('showList').append(textTag)
        ;
    };

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
        fetch(`http://localhost:3000/users/${userId}/lists.json`).then(resp => resp.json()).then((lists) => {   
        lists.forEach((list) => {
                let aTag = document.createElement('a')
                aTag.href = `http://localhost:3000/users/${userId}/lists/${list.id}`
                aTag.innerHTML = " " + list['title']
                let li = document.getElementById('showList').appendChild(document.createElement('li'));
                li.append(aTag)
                li.style = "color: Blue"
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

window.addEventListener("load", List.prototype.indexOfLists)
