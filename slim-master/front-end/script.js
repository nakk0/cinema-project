//remember to create vendor:
//docker-compose exec webserver-dev composer update

const instance = axios.create({
    baseURL: 'http://localhost',
    timeout: 1000,
  });

window.addEventListener("load", () => {
    console.log("w")
    displayMovies()
});

window.addEventListener("resize", () => {
    //when the number of columns changes (colNum()), run displayMovies()
    //implement the different animations based on position and col number in movies array.
})

function displayMovies(){
    instance.get("/getMovies").then(response => {
        let father = document.getElementById("list");
        father.innerHTML = '';
        movies = response.data;
        console.log(movies);
        movies.forEach((movie, i) => {
            
            let div1 = document.createElement("div");

            div1.classList.add(
                "group", 
                "text-white", 
                "sm:transition-all", 
                "sm:ease-in-out", 
                "sm:hover:delay-200",
                "sm:duration-200", 
                "sm:transform",
                "sm:hover:scale-150",
                "sm:hover:bg-gray-800",
                "sm:hover:z-10")
    
            image = new Image;
            image.src = "https://picsum.photos/300/200"; //remember to change with move.poster
            image.classList.add("w-full", "h-auto");
            div1.appendChild(image);
    
            div2 = document.createElement("div");
            div2.classList.add(
                "bg-gray-800", 
                "sm:opacity-0", 
                "sm:group-hover:opacity-100", 
                "sm:transition-all", 
                "sm:ease-in-out", 
                "sm:delay-200", 
                "min-w-min", 
                "p-3"
            )
    ;
            div3 = document.createElement("div");
            div3.classList.add("flex", "justify-end");
    
            title = document.createElement("p");
            title.classList.add("text-xl", "font-bold", "truncate", "max-w-56");
            title.innerText = movie.title;
    
            avg = document.createElement("p");
            avg.classList.add("ml-auto");
            //api is still not complete
            avg.innerText = /*getReviewAvg(movie.id) +*/ "*/5";
    
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
}
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

function colNum(){
    
    width = document.documentElement.clientWidth;
    if(width >= 1536){
        return 5;
    }else if(width >= 1280){
        return 4;
    }else if(width >= 1024){
        return 3
    }else if(width >= 640){
        return 2;
    }else {
        return 1;
    };
}