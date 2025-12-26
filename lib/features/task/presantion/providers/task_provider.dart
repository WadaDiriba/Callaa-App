import 'package:callaa_app/features/task/data/repo/task_repo.dart';
import 'package:callaa_app/features/task/domain/task_entity.dart';
import 'package:flutter/material.dart';
import '../../data/model/task_model.dart';

class TaskProvider  with ChangeNotifier {

final TaskRepo repository;

List<TaskEntity> _tasks = [];

bool _isloading=false;
String? _error;

  TaskProvider(this.repository);

  List<TaskEntity>get tasks=>tasks;
  bool get isloading=>_isloading;
  String? get error=>_error;


   Future<void> getTasks()async{

    _isloading=true;
    _error=null;

    notifyListeners();


    try{
      final List<TaskModel> taskModels=await repository.getTasks();


      _tasks=taskModels

      .map((taskModel)=>TaskEntity(
        
        id: taskModel.id,
         title: taskModel.title,
          rewardAmount:taskModel.rewardAmount,
           taskDate: taskModel.taskDate,
           
           )
           
           ).toList();



    }


    catch(e){


    }

    finally{

      _isloading=false;
      notifyListeners();
    }
   }
}