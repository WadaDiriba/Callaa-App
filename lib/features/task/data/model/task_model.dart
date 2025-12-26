
class   TaskModel {


  final String id;
  final String title;
  final double rewardAmount;
  final DateTime taskDate;

  TaskModel({
    required this.id, 
    required this.title, 
    required this.rewardAmount,
     required this.taskDate}
     
     );
factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(

      id: json["id"],
      title:json["title"],
      rewardAmount: json["rewardAmount"],
      taskDate: json["taskDate"],
    
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id":id,
      "title":title,
      "rewardAmount":rewardAmount,
      "taskDate":taskDate,

    };
  }
}

