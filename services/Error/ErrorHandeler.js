
module.exports.errorHandler = (error) => {
    const errors = {
        Title : '' ,
        Description : ''
      }
      if (error.message.includes('Task validation failed')) {
        Object.values(error.errors).forEach(({properties}) => {
            errors[properties.path] = properties.message
        })
      }
      return errors
}