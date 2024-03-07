axios.get("http://localhost/getMovies").then(response => {
    response.data.forEach(movie => {
        console.log(movie);
        let father = document.getElementById("list");
        let div = document.createElement("div");

        div.classList.add(
            "group", 
            "text-white", 
            "transition-all", 
            "ease-in-out", 
            "delay-150",
            "duration-500", 
            "transform",
            "hover:translate-y-1",  
            "hover:scale-150",
            "hover:bg-gray-800",
            "hover:z-10")

        image = new Image;
        image.src = "https://picsum.photos/300/200"; //remember to change with move.poster
        //div.appendChild(image);

        //add 2 <p> for title and for review average and one below for description (follow example)
        
        father.appendChild(div);
    })
}).catch(error => {
    console.log(error);
})

axios.get("http://localhost/getActorsByMovie", {
    params: {
        id: '2'
    }
}).then(response => {
    console.log(response);
}).catch(err => {
    console.log(err);
})




// const options = {
//   method: 'GET',
//   url: 'http://localhost/getActorsByFilm',
//   headers: {
//     cookie: 'PHPSESSID=d26e6ebb79100072a5c9fc8e5794b6ad',
//     'Content-Type': 'application/json',
//     'User-Agent': 'insomnia/8.6.1'
//   },
//   data: {id: '2'}
// };

// axios.request(options).then(function (response) {
//   console.log(response.data);
// }).catch(function (error) {
//   console.error(error);
// });