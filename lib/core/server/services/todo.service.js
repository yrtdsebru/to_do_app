// Bu dosya genellikle 'todo' belgelerini silmek için kullanılan bir controller fonksiyonunu içerir.
const { deleteToDo } = require("../controller/todo.controller");

// Bu dosya genellikle 'todo' belgelerinin yapısını tanımlayan bir Mongoose modelini içerir.
const ToDoModel = require("../models/todo.model");

//Bu sınıf, 'todo' belgeleri ile ilgili işlemleri yönetir.
class ToDoService{
    // Bu metod, verilen 'userId', 'title' ve 'description' değerlerini kullanarak yeni bir 'todo' belgesi oluşturur.
    static async createToDo(userId,title,description){
            const createToDo = new ToDoModel({userId,title,description});
            return await createToDo.save();
    }

    // Bu metod, verilen 'userId' değerine sahip kullanıcının 'todo' listesini alır.
    static async getUserToDoList(userId){
        const todoList = await ToDoModel.find({userId})
        return todoList;
   }

   // Bu metod, verilen 'id' değerine sahip 'todo' belgesini siler.
   static async deleteToDo(id){
        const deleted = await ToDoModel.findByIdAndDelete({_id:id})
        return deleted;
   }
}

// 'ToDoService' sınıfını dışa aktarıyoruz, böylece başka dosyalardan erişilebilir olur.
module.exports = ToDoService;