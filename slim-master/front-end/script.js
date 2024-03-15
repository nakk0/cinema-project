//remember to create vendor:
//docker-compose exec webserver-dev composer update


const instance = axios.create({
    baseURL: 'http://localhost',
    timeout: 1000,
  });

instance.get("/getMovies").then(response => {
    response.data.forEach(movie => {
        console.log(movie);
        let father = document.getElementById("list");
        let div1 = document.createElement("div");

        div1.classList.add(
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
        image.classList.add("w-full", "h-auto");
        div1.appendChild(image);

        div2 = document.createElement("div");
        div2.classList.add("bg-gray-800", "opacity-0", "group-hover:opacity-100", "transition-all", "ease-in-out", "delay-150", "duration-500", "min-w-min", "p-3")
;
        div3 = document.createElement("div");
        div3.classList.add("flex", "justify-end");

        title = document.createElement("p");
        title.classList.add("text-xl", "font-bold", "truncate");
        title.innerText = movie.title;

        avg = document.createElement("p");
        avg.classList.add("ml-auto");
        //api is still not complete
        avg.innerText = /*getReviewAvg(movie.id) +*/ "Avg/5";

        desc = document.createElement("p");
        desc.classList.add("text-white");
        //to implement when api is done
        desc.innerText = "no description"

        div3.appendChild(title);
        div3.appendChild(avg)
        div2.appendChild(div3);
        div2.appendChild(desc)
        div1.appendChild(div2);
        father.appendChild(div1);
    })
}).catch(error => {
    console.log(error);
})

function getReviewAvg(movieId){
    instance.get("/getReviewAverageByMovie", {
        params:{
            id: movieId
        }
    }).then(response => {
        console.log(response)
        return response;
    })
}

function getDesc(movieId){
    //gotta wait for the api :)
    //instance.get("")
}


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