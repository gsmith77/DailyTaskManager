class List {
    constructor(id, title, user_id){
        this.id = id
        this.title = title
        this.user_id = user_id
    }

    newList(list){
        let date = new Date()
        const aTag = document.createElement('button')
        const text = document.createElement('text')
        text.innerHTML = 'Created on: ' + date
        aTag.id = "synchronousList"
        aTag.name = list.id
        aTag.onclick = List.prototype.showList
        aTag.innerHTML = list["title"]
        document.getElementById('current_users_lists').append(text)
        document.getElementById('current_users_lists').append(aTag)
    }


    showList(){        
        let listId = document.getElementById("synchronousList").name
        const x = document.getElementById("synchronousList")
        if (x.style.display === "none") {
            x.style.display = "block";
          } else {
            x.style.display = "none";
        }
        let userId = document.querySelector('hidden_field_tag').id
        fetch(`http://localhost:3000/users/${userId}/lists/${listId}.json`).then(resp => resp.json())
        .then((list) => {
            let aTag = document.createElement('a')
            aTag.href = `http://localhost:3000/users/${userId}/lists/${list[0]['list']['id']}`
            aTag.innerHTML = list[0]['list']['title']
            document.getElementById('current_users_lists').append(aTag)
            const textTag = document.createElement('text')
            list.forEach((task) => {
                textTag.innerHTML += " Task (Content: " + task['content'] + " Status: " + task['status'] + ')'
            });
            document.getElementById('current_users_lists').append(textTag)
        });
    };

    indexOfLists(userId){
        fetch(`http://localhost:3000/users/${userId}/lists.json`).then(resp => resp.json()).then((lists) => {   
        lists.forEach((list) => {
            document.getElementById('organizedLists1').innerHTML = ""

                let li = document.getElementById('organizedLists1').appendChild(document.createElement('li'));
      
                li.innerHTML = list['title']
            })
        })
    };

    indexOfListsWithTasks(userId){
        fetch(`http://localhost:3000/users/${userId}/lists.json`).then(resp => resp.json()).then((lists) => {   
        lists.forEach((list) => {
                document.getElementById('organizedLists2').innerHTML = ""
                let li = document.getElementById('organizedLists2').appendChild(document.createElement('li'));
                li.style = "color: Blue"
                li.innerHTML = list['title'] + "  TASKS: "
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


