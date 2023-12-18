// Express ve body-parser modüllerini dahil ediyoruz.
const express = require("express");
const bodyParser = require("body-parser")
const cors = require('cors');

// Kullanıcı ve ToDo rotalarını dahil ediyoruz.
const UserRoute = require("./routers/user.router");
// const ToDoRoute = require('./routes/todo.router');

// Express uygulaması oluşturuyoruz.
const app = express();
const path = require('path');

// CORS isteklerine izin ver, yoksa hata veriyor.
app.use(cors());

// Gelen isteklerin gövdelerini ayrıştırmak için body-parser'ı kullanıyoruz.
app.use(bodyParser.json());
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));


// Kullanıcı ve ToDo rotalarını uygulamamıza ekliyoruz.
app.use("/",UserRoute);
// app.use("/",ToDoRoute);

// Uygulamamızı dışarıya aktarıyoruz.
module.exports = app;