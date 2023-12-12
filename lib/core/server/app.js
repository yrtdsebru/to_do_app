// Express ve body-parser modüllerini dahil ediyoruz.
const express = require("express");
// const bodyParser = require("body-parser")

// // Kullanıcı ve ToDo rotalarını dahil ediyoruz.
// const UserRoute = require("./routes/user.routes");
// const ToDoRoute = require('./routes/todo.router');

// Express uygulaması oluşturuyoruz.
const app = express();

// Gelen isteklerin gövdelerini ayrıştırmak için body-parser'ı kullanıyoruz.
// app.use(bodyParser.json())

// // Kullanıcı ve ToDo rotalarını uygulamamıza ekliyoruz.
// app.use("/",UserRoute);
// app.use("/",ToDoRoute);

// Uygulamamızı dışarıya aktarıyoruz.
module.exports = app;