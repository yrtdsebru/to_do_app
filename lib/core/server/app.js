// Express ve body-parser modüllerini dahil ediyoruz.
const express = require("express");
const bodyParser = require("body-parser")
const cors = require('cors');

// Kullanıcı ve ToDo rotalarını dahil ediyoruz.
const UserRouter = require("./routers/user.router");
const ToDoRouter = require('./routers/todo.router');

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
app.use("/",UserRouter);
app.use("/",ToDoRouter);

// Uygulamamızı dışarıya aktarıyoruz.
module.exports = app;