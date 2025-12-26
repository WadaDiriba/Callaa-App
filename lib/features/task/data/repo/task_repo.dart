import 'package:callaa_app/core/networks/api_client.dart';
import 'package:callaa_app/core/networks/api_exceptions.dart';
import 'package:callaa_app/core/networks/token_manager.dart';
import 'package:callaa_app/features/task/data/model/task_model.dart';


class TaskRepo {

  final ApiClient _apiClient;

  TaskRepo(this._apiClient,
  );

   Future <List<TaskModel>> getTasks() async{
    try{
      TokenManager tokenHolder=TokenManager();
      String? token =await tokenHolder.getToken();
      final response =await _apiClient.get("task/get-today-tasks",headers:{
        
        "Authorization":"Bearer $token",
     
      });
    
      final tasksData= response['data'] as List<dynamic>;

      final List<TaskModel> tasks=tasksData

        .map((task)=>TaskModel
        
        .fromJson(task as Map<String,dynamic>)).toList();

        return tasks;  
      
   }

   catch(e){
throw ApiExceptions(e.toString());
   }
}

}

      

      



    