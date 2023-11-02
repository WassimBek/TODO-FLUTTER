const fs = require('fs')
const path = require('path')

const data = JSON.parse(fs.readFileSync(path.resolve(__dirname , '../model/db.json')))

module.exports.get_all = (req , res) => {
    return res.status(200).json(data)
}

module.exports.get_single = (req , res) => {
    try {
        const {id} = req.params
        const findTask = data.data.find( task => task.id == id)
        if (findTask != undefined) {
            return res.status(200).json({data : findTask})
        } else 
            return res.status(404).json({failedGetSingle : 'task no exist'})
    } catch (error) {
        return res.status(404).json({failedGetSingle : error})
    }
}

module.exports.add_task = (req , res) => {
    try {
        const {title , description} = req.body
        const id = Math.floor(Math.random() * 10000)
        if (title != ''&& description !='') {
            data.data.push({title , description , id})
            fs.writeFileSync(path.resolve(__dirname , '../model/db.json') , JSON.stringify(data))
            return res.status(200).json({data : 'create done !'})
        }else {
            return res.status(404).json({message : 'all field are required'})
        }
    } catch (error) {
        return res.status(404).json({failedCreate : error})
    }
}



module.exports.update_task = (req  , res) => {
    try {
        const {title , description} = req.body
        const {id} = req.params
        const findTask = data.data.findIndex(task => task.id == id)
        if (findTask != -1) {
            data.data[findTask].title = title || data.data[findTask].title
            data.data[findTask].description = description || data.data[findTask].description
            fs.writeFileSync(path.resolve(__dirname , '../model/db.json') , JSON.stringify(data))
            return res.status(200).json({message : 'update successfully'})
        }else {
            return res.status(404).json({failedUpdate : 'task no exist'})
        }
    } catch (error) {
        return res.status(404).json({failedUpdateTask : error})
    }
}


module.exports.delete_all = (req , res) => {
    data.data = []
    fs.writeFileSync(path.resolve(__dirname , '../model/db.json') , JSON.stringify(data))
    return res.status(200).json({message : 'delete all task done!'})
}


module.exports.delete_single = (req , res) => {
    try {
        const {id} = req.params
        const findIndex = data.data.findIndex(task => task.id == id)
        if (findIndex != -1) {
            data.data.splice(findIndex , 1)
            fs.writeFileSync(path.resolve(__dirname , '../model/db.json') , JSON.stringify(data))
            return res.status(200).json({message : 'delete single successfully'})
        } else {
            return res.status(404).json({failedDelete : 'task no exist'})
        }
    } catch (error) {
        return res.status(404).json({failedDeleteTask : error})
    }
}