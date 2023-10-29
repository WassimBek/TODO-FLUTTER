const {Router} = require('express')
const router = Router()
const todoControllers = require('../controller/todoController')

router.get('/task' , todoControllers.get_all)
router.get('/task/:id' , todoControllers.get_single)
router.post('/add/task', todoControllers.add_task)
router.put('/update/task/:id',todoControllers.update_task)
router.delete('/delete/all',todoControllers.delete_all)
router.delete('/delete/task/:id',todoControllers.delete_single)

module.exports = {todoRouter : router}