const express = require('express')
const cors = require('cors')
const mongoose = require('mongoose')
require('dotenv').config()
const app = express()
const {todoRouter} = require('./Router/todoRouter')
const PORT = process.env.PORT || 3000

    mongoose.connect(process.env.MY_DB)
    .then( _ => app.listen(PORT , _ => console.log('the server is runing on port '+ PORT) ))
    .catch(err => console.log(err))

app.use(cors())
app.use(express.urlencoded({extended : false}))
app.use(express.json())
app.use('/' , todoRouter)