
axios.get("http://localhost").then(
    response =>{
        console.log(response.data);
    }
).catch(err =>{
    console.log(err)
})