//veritabanı bağlantı ayarlarını içerir.
const db = require('../config/db');

//User model şemasını içerir.
const UserModel = require("./user.model");

// Mongoose, MongoDB ile etkileşim kurmak için kullanılan bir Node.js kütüphanesidir.
const mongoose = require('mongoose');

// Mongoose'dan 'Schema' nesnesini çıkarıyoruz.
const { Schema } = mongoose;

// Yeni bir Mongoose şeması oluşturuyoruz. Bu şema, 'todo' adında bir koleksiyon için belgelerin yapısını tanımlar.
const toDoSchema = new Schema({
    // Her 'todo' belgesi, bir 'User' belgesine referans veren bir 'userId' alanına sahip olacak.
    userId:{
        type: Schema.Types.ObjectId,  // 'userId' alanının tipi ObjectId olacak.
        ref: UserModel.modelName  // Bu alan, UserModel'in modelName özelliği ile ilişkilendirilecek.
    },
    // Her 'todo' belgesi, bir 'title' alanına sahip olacak.
    title: {
        type: String,  // 'title' alanının tipi String olacak.
        required: true  // Bu alan zorunlu olacak.
    },
    // Her 'todo' belgesi, bir 'description' alanına sahip olacak.
    description: {
        type: String,  // 'description' alanının tipi String olacak.
        required: true  // Bu alan zorunlu olacak.
    },
},{timestamps:true});  // 'timestamps' seçeneği, her belgeye 'createdAt' ve 'updatedAt' alanları ekler.

// 'ToDoModel' adında bir sabit oluşturuyoruz ve bu sabiti 'todo' adında bir Mongoose modeli olarak tanımlıyoruz.
// Bu model, yukarıda tanımladığımız 'toDoSchema' şemasını kullanır.
const ToDoModel = db.model('todo',toDoSchema);

// 'ToDoModel' sabitini dışa aktarıyoruz, böylece başka dosyalardan erişilebilir olur.
module.exports = ToDoModel;
