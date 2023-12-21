// app.js dosyasını dahil ediyoruz.
const app = require("./app");
const UserModel = require('./models/user.model')
const ToDoModel = require('./models/todo.model')

// Veritabanı ayarlarını dahil ediyoruz.
const db = require('./config/db')

// Sunucumuzun dinleyeceği portu belirliyoruz.
const port = 3000;

// Ana sayfamızı oluşturuyoruz. route 
//Buradaki degisikliklerin surekli sayfaya yansimasi icin nodemon paketini kullaniyoruz. 
//Normalde nodemon paketi olmadan degisikliklerin sayfaya yansimasi icin sunucuyu kapatip tekrar calistirmamiz gerekir ve node index.js komutu ile calistiririz.
app.get('/', async (req, res) => {
    try {
        const users = await UserModel.find();
        res.render('index', { message: "Hello World!!", users: users });
    } catch (error) {
        console.log(error); // Hata mesajını konsola yazdırır.
        res.status(500).send({ error: 'An error occurred while getting users' });
    }
});

// Sunucumuzu belirlediğimiz portta başlatıyoruz.
app.listen(port,()=>{
    console.log(`Server Listening on Port http://localhost:${port}`);
})
