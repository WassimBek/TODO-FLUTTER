const mongoos = require('mongoose')

const tasksSchema = new mongoos.Schema({
    Title : {
        type : String ,
        required : [true , 'this field is required'],
    },
    Description : {
        type : String ,
        required : [true , 'this field is required']
    }
})

const task = mongoos.model('Task' , tasksSchema) 

module.exports = task