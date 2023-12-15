// Kullanıcı hizmetlerini dahil ediyoruz.
const UserServices = require('../services/user.service');

// Kullanıcı kayıt işlemi için bir controller oluşturuyoruz.
exports.register = async (req, res, next) => {
    try {
        console.log("---req body---", req.body);
        const { email, password } = req.body; // Kullanıcının e-posta ve parolasını alıyoruz.

        // Kullanıcının zaten kayıtlı olup olmadığını kontrol ediyoruz.
        const duplicate = await UserServices.getUserByEmail(email);
        if (duplicate) {
            throw new Error(`UserName ${email}, Already Registered`)
        }

        // Kullanıcıyı kaydediyoruz.
        const response = await UserServices.registerUser(email, password);

        // Başarılı bir şekilde kaydedildiğine dair bir yanıt gönderiyoruz.
        res.json({ status: true, success: 'User registered successfully' });

    } catch (err) {
        console.log("---> err -->", err);
        next(err);
    }
}

// Kullanıcı giriş işlemi için bir controller oluşturuyoruz.
exports.login = async (req, res, next) => {
    try {

        const { email, password } = req.body; // Kullanıcının e-posta ve parolasını alıyoruz.

        // E-posta ve parolanın doğru girilip girilmediğini kontrol ediyoruz.
        if (!email || !password) {
            throw new Error('Parameter are not correct');
        }

        // Kullanıcının var olup olmadığını kontrol ediyoruz.
        let user = await UserServices.checkUser(email);
        if (!user) {
            throw new Error('User does not exist');
        }

        // Kullanıcının parolasını kontrol ediyoruz.
        const isPasswordCorrect = await user.comparePassword(password);

        // Parolanın doğru olup olmadığını kontrol ediyoruz.
        if (isPasswordCorrect === false) {
            throw new Error(`Username or Password does not match`);
        }

        // Erişim belirteci oluşturuyoruz.
        let tokenData;
        tokenData = { _id: user._id, email: user.email };
        const token = await UserServices.generateAccessToken(tokenData,"secret","1h")

        // Erişim belirtecini yanıt olarak gönderiyoruz.
        res.status(200).json({ status: true, success: "sendData", token: token });
    } catch (error) {
        console.log(error, 'err---->');
        next(error);
    }
}
