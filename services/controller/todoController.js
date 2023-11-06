const Task = require('../model/Tasks');
const errorsHandling = require('../Error/ErrorHandeler')

module.exports.get_all = async(req, res) => {
    try {
        const allTasks = await Task.find()
        return res.status(200).json({data : allTasks});
    } catch (error) {
        return res.status(500).json({message : error.message})
    }
}

module.exports.get_single = async (req, res) => {
  try {
    const { id } = req.params;
    const findTask = await Task.findById(id);
    return res.status(200).json({ data: findTask});
  } catch (error) {
    return res.status(404).json({ message : 'Task not exist'  });
  }
}

module.exports.add_task = async (req, res) => {
  try {
    const { title, description } = req.body;
    const newTask = await Task.create({ Title: title, Description: description });
    return res.status(200).json({data : 'Create task done!'});
  } catch (error) {
    const errors = errorsHandling.errorHandler(error)
    if (errors.Title != '' && errors.Description != '') 
      return res.status(404).json({ message : 'all field required' });
    else if (errors.Title != '') {
      return res.status(404).json({message : errors.Title})
    }else 
      return res.status(404).json({message : errors.Description})
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
            return res.status(200).json({data : "update done !"})
    } catch (error) {
      return res.status(404).json({message : 'task no exist'})
    }
}


module.exports.delete_all = async(req , res) => {
    try {
        const result =await Task.deleteMany({})
        if (result.deletedCount > 0)
            return res.status(200).json({data : 'delete all task done!'})
        else 
            return res.status(404).json({message : 'Empty'})
    } catch (error) {
        return res.status(500).json({message : error.message})
    }
}


module.exports.delete_single = async(req , res) => {
    try {
        const {id} = req.params
        const findTask = await Task.findByIdAndDelete(id)
        return res.status(200).json({data : 'delete single successfully'})
    } catch (error) {
       return res.status(404).json({message : 'Task not foud'})
    }
}