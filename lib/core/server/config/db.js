const mongoose = require('mongoose');

// const connection = mongoose.createConnection(`mongodb://127.0.0.1:27017`).on('open',()=>{
//     console.log("MongoDB Connected");}).on('error',()=>{
//     console.log("MongoDB Connection error");
// });

const connection = mongoose.createConnection(`mongodb://127.0.0.1:27017/ToDoAppDB`).on('open',()=>{  //sen sadece path'e yolu veriyorsun o database'i oluşturuyor
    console.log("MongoDB Connected");}).on('error',()=>{
    console.log("MongoDB Connection error");
});

module.exports = connection;