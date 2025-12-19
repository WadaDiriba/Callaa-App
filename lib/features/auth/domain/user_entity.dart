class UserEntity {


  final String username;
  final String fullName;
  final String? referralCode;
  final double? amount;
 

  final int totalReffered;
  final double? totalEarned;
  final String id;

  UserEntity( {

     required this.id,
    required this.username,
    required this.fullName,
    required this.referralCode,
    required this.amount,
  
    required this.totalReffered,
    required this.totalEarned
  });
  // ignore: non_constant_identifier_names
  String getWellcomemesssage(){

    return'welcome$username';
          
  }

  //min  and max tranferr ammount
}