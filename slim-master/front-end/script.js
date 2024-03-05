axios.get("http://localhost/getMovies").then(response =>{
    response.data.forEach(a =>{
        console.log(a);
        let div = document.createElement("div");
        let classes = ["bg-red-300", "max-h-96", "min-h-96", "max-w-72", "min-w-72", "p-4"]
        classes.forEach(c =>{
            div.classList.add(c);
        })
        //finish building the div
        document.getElementById("list").appendChild(div);
    })
}).catch(error =>{
    console.log(error);
})

axios.get("http://localhost/getActorsByMovie", {
    params:{
        id: '2'
    }
}).then(response =>{
    console.log(response);
}).catch(err =>{
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