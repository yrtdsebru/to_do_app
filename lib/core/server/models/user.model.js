// Veritabanı ayarlarını ve gerekli modülleri dahil ediyoruz.
const db = require('../config/db');
const bcrypt = require("bcrypt");
const mongoose = require('mongoose');
const { Schema } = mongoose;

// Kullanıcı şemasını oluşturuyoruz.
const userSchema = new Schema({
    email: {
        type: String, // Veri tipi String.
        lowercase: true, // Tüm e-postalar küçük harfle saklanır.
        required: [true, "userName can't be empty"], // E-posta alanı zorunludur.
        // @ts-ignore
        match: [
            /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/, // E-posta formatını kontrol eder.
            "userName format is not correct",
        ],
        unique: true, // E-posta adresi benzersiz olmalıdır.
    },
    password: {
        type: String, // Veri tipi String.
        required: [true, "password is required"], // Parola alanı zorunludur.
    },
},{timestamps:true}); // Oluşturulma ve güncelleme zaman damgalarını saklar.

// Kullanıcının parolasını kaydetmeden önce şifreliyoruz.
userSchema.pre("save",async function(){
    var user = this;
    if(!user.isModified("password")){
        return
    }
    try{
        const salt = await bcrypt.genSalt(10); // Tuz oluşturuyoruz.
        const hash = await bcrypt.hash(user.password,salt); // Parolayı tuz ile şifreliyoruz.

        user.password = hash; // Kullanıcının parolasını şifrelenmiş parola ile değiştiriyoruz.
    }catch(err){
        throw err;
    }
});

// Kullanıcının parolasını doğrularken şifresini çözüyoruz.
userSchema.methods.comparePassword = async function (candidatePassword) {
    try {
        console.log('----------------no password',this.password);
        // @ts-ignore
        const isMatch = await bcrypt.compare(candidatePassword, this.password); // Girilen parola ile kayıtlı parolanın eşleşip eşleşmediğini kontrol ediyoruz.
        return isMatch; // Eşleşme durumunu döndürüyoruz.
    } catch (error) {
        throw error;
    }
};

// Kullanıcı modelini oluşturuyoruz ve dışarıya aktarıyoruz.
const UserModel = db.model('user',userSchema);
module.exports = UserModel;