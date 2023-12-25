// Bu dosya genellikle 'todo' belgelerini silmek için kullanılan bir controller fonksiyonunu içerir.
const { deleteToDo } = require("../controller/todo.controller");

// Bu dosya genellikle 'todo' belgelerinin yapısını tanımlayan bir Mongoose modelini içerir.
const ToDoModel = require("../models/todo.model");

//Bu sınıf, 'todo' belgeleri ile ilgili işlemleri yönetir.
class ToDoService{
    // Bu metod, verilen 'userId', 'title' ve 'description' değerlerini kullanarak yeni bir 'todo' belgesi oluşturur.
    static async createToDo(userId,title,description){
            const createToDo = new ToDoModel({userId,title,description});   //yeni model olusturuyoruz.
            return await createToDo.save();
    }

    // Bu metod, verilen 'userId' değerine sahip kullanıcının 'todo' listesini alır.
    static async getUserToDoList(userId){
        const todoList = await ToDoModel.find({userId})  //userId'ye göre todo listesini buluyoruz.
        return todoList;
   }

   // Bu metod, verilen 'id' değerine sahip 'todo' belgesini siler.
   static async deleteToDo(id){
        const deleted = await ToDoModel.findByIdAndDelete({_id:id})  //id'ye göre todo belgesini bulup siliyoruz.
        return deleted;
   }

   
   static async searchToDo(title){
     const searchResult = await ToDoModel.find({
         $or: [
             {title: new RegExp(title, 'i')},
             {description: new RegExp(title, 'i')}
         ]
     })  //title'a veya description'a göre todo belgelerini buluyoruz.
     return searchResult;
 }
 
}

// 'ToDoService' sınıfını dışa aktarıyoruz, böylece başka dosyalardan erişilebilir olur.
module.exports = ToDoService;