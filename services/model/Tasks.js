const mongoos = require('mongoose')

const tasksSchema = new mongoos.Schema({
    Title : {
        type : String ,
        required : [true , 'Title field is required'],
    },
    Description : {
        type : String ,
        required : [true , 'Description field is required']
    }
})

const task = mongoos.model('Task' , tasksSchema) 

module.exports = task