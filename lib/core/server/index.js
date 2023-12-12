// app.js dosyasını dahil ediyoruz.
const app = require("./app");
// const UserModel = require('./models/user.model')

// Veritabanı ayarlarını dahil ediyoruz.
const db = require('./config/db')

// Sunucumuzun dinleyeceği portu belirliyoruz.
const port = 3000;

// Ana sayfamızı oluşturuyoruz. route 
//Buradaki degisikliklerin surekli sayfaya yansimasi icin nodemon paketini kullaniyoruz. 
//Normalde nodemon paketi olmadan degisikliklerin sayfaya yansimasi icin sunucuyu kapatip tekrar calistirmamiz gerekir ve node index.js komutu ile calistiririz.
app.get('/',(req,res)=>{
    res.send("Hello World!!")  //package.json dosyasında "dev": "nodemon index" olarak değiştirdikten sonra "npm run dev" komutu ile çalıştırıyoruz.
})

// Sunucumuzu belirlediğimiz portta başlatıyoruz.
app.listen(port,()=>{
    console.log(`Server Listening on Port http://localhost:${port}`);
})
