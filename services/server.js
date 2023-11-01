const express = require('express')
const cors = require('cors')
const app = express()
const {todoRouter} = require('./Router/todoRouter')
const PORT = process.env.PORT || 8080

app.use(cors())
app.use(express.urlencoded({extended : true}))
app.use(express.json())
app.use('/' , todoRouter)

app.listen(PORT , () => {
    console.log('the server is runing on port '+ PORT) 
})