const Task = require('../model/Tasks');

module.exports.get_all = async(req, res) => {
    try {
        const allTasks = await Task.find()
        return res.status(200).json({data : allTasks});
    } catch (error) {
        return res.status(500).json({error : error.message})
    }
}

module.exports.get_single = async (req, res) => {
  try {
    const { id } = req.params;
    const findTask = await Task.findById(id);
    if (findTask !== null) {
      return res.status(200).json({ data: findTask});
    } else {
      return res.status(404).json({ failedGetSingle: 'Task does not exist' });
    }
  } catch (error) {
    return res.status(500).json({ failedGetSingle: error.message });
  }
}

module.exports.add_task = async (req, res) => {
  try {
    const { title, description } = req.body;
    const newTask = await Task.create({ Title: title, Description: description });
    return res.status(201).json({ data: newTask._id });
  } catch (error) {
    return res.status(500).json({ failedCreate: error.message });
  }
}




module.exports.update_task = async(req  , res) => {
    try {
        const {title , description} = req.body
        const {id} = req.params
        const findAndUpdate = await Task.findByIdAndUpdate(
            {_id : id} ,
            {$set : {Title : title , Description : description}} ,
            {new : true}
        )
        if (findAndUpdate) {
            return res.status(200).json({task : findAndUpdate})
        }else {
            return res.status(404).json({failedUpdate : 'task no exist'})
        }
    } catch (error) {
        return res.status(500).json({failedUpdateTask : error.message})
    }
}


module.exports.delete_all = async(req , res) => {
    try {
        const result =await Task.deleteMany({})
        if (result.deletedCount > 0)
            return res.status(200).json({message : 'delete all task done!'})
        else 
            return res.status(404).json({message : 'No data found'})
    } catch (error) {
        return res.status(500).json({message : error.message})
    }
}


module.exports.delete_single = async(req , res) => {
    try {
        const {id} = req.params
        await Task.findByIdAndDelete(id)
        return res.status(200).json({message : 'delete single successfully'})
    } catch (error) {
        return res.status(404).json({failedDeleteTask : error.message})
    }
}