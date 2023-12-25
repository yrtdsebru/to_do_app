// Bu dosya genellikle 'todo' belgeleri ile ilgili işlemleri yöneten bir servis sınıfını içerir.
const ToDoService = require('../services/todo.service');

// 'createToDo' adında bir asenkron fonksiyon oluşturuyoruz ve bu fonksiyonu dışa aktarıyoruz.
// Bu fonksiyon, gelen istekten 'userId', 'title' ve 'desc' değerlerini alır ve bu değerleri kullanarak yeni bir 'todo' belgesi oluşturur.
exports.createToDo =  async (req,res,next)=>{
    try {
        const { userId,title, desc } = req.body;
        let todoData = await ToDoService.createToDo(userId,title, desc);
        res.json({status: true,success:todoData});
    } catch (error) {
        console.log(error, 'err---->');
        next(error);
    }
}

// 'getToDoList' adında bir asenkron fonksiyon oluşturuyoruz ve bu fonksiyonu dışa aktarıyoruz.
// Bu fonksiyon, gelen istekten 'userId' değerini alır ve bu değeri kullanarak kullanıcının 'todo' listesini alır.
exports.getToDoList =  async (req,res,next)=>{
    try {
        const { userId } = req.body;
        let todoData = await ToDoService.getUserToDoList(userId);
        res.json({status: true,success:todoData});
    } catch (error) {
        console.log(error, 'err---->');
        next(error);
    }
}

// 'deleteToDo' adında bir asenkron fonksiyon oluşturuyoruz ve bu fonksiyonu dışa aktarıyoruz.
// Bu fonksiyon, gelen istekten 'id' değerini alır ve bu değeri kullanarak belirli bir 'todo' belgesini siler.
exports.deleteToDo =  async (req,res,next)=>{
    try {
        const { id } = req.body;
        let deletedData = await ToDoService.deleteToDo(id);
        res.json({status: true,success:deletedData});
    } catch (error) {
        console.log(error, 'err---->');
        next(error);
    }
}

// 'searchToDo' adında bir asenkron fonksiyon oluşturuyoruz ve bu fonksiyonu dışa aktarıyoruz.
// Bu fonksiyon, gelen istekten 'title' değerini alır ve bu değeri kullanarak 'todo' belgelerini arar.
exports.searchToDo =  async (req,res,next)=>{
    try {
        const { title } = req.body;
        let searchResult = await ToDoService.searchToDo(title);
        res.json({status: true,success:searchResult});
    } catch (error) {
        console.log(error, 'err---->');
        next(error);
    }
}
