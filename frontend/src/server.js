// const express = require('express')

// const cors = require('cors')



app.use(cors())


axios.get('http://localhost:3233').then(res => {
    console.log(res)
}).catch(err => {
    console.log(err)
})


