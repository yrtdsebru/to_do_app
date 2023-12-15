// Kullanıcı modelini ve jsonwebtoken modülünü dahil ediyoruz.
const UserModel = require("../models/user.model");
const jwt = require("jsonwebtoken");

// Kullanıcı hizmetleri sınıfını oluşturuyoruz.
class UserServices{
 
    // Yeni bir kullanıcı kaydetme metodu
    static async registerUser(email,password){
        try{
                console.log("-----Email --- Password-----",email,password);
                
                // Yeni bir kullanıcı oluşturuyoruz.
                const createUser = new UserModel({email,password});
                // Kullanıcıyı veritabanına kaydediyoruz.
                return await createUser.save();
        }catch(err){
            throw err;
        }
    }

    // E-posta adresine göre kullanıcıyı getirme metodu
    static async getUserByEmail(email){
        try{
            // E-posta adresine göre kullanıcıyı veritabanından getiriyoruz.
            return await UserModel.findOne({email});
        }catch(err){
            console.log(err);
        }
    }

    // Kullanıcının var olup olmadığını kontrol etme metodu
    static async checkUser(email){
        try {
            // E-posta adresine göre kullanıcıyı veritabanından getiriyoruz.
            return await UserModel.findOne({email});
        } catch (error) {
            throw error;
        }
    }

    // Erişim belirteci oluşturma metodu
    static async generateAccessToken(tokenData,JWTSecret_Key,JWT_EXPIRE){
        // Erişim belirtecini oluşturuyoruz ve döndürüyoruz.
        return jwt.sign(tokenData, JWTSecret_Key, { expiresIn: JWT_EXPIRE });
    }
}

// Kullanıcı hizmetleri sınıfını dışarıya aktarıyoruz.
module.exports = UserServices;
