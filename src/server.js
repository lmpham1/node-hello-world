const express = require('express')
const app = express()
const port = 8080

app.get('/', (req, res) => {
    res.status(200).json({ 'status': 200, 'message': 'Hello World!' })
    console.log({ 'status': 'Success', 'method': 'GET' })
})

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})