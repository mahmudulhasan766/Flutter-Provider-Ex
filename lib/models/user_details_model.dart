//
// class UserDetailsByModelList {
//   final List<UserDetailsByModel> scheduleList;
//   UserDetailsByModelList({this.scheduleList});
//
//   factory UserDetailsByModelList.fromJson(List<dynamic> persedJson){
//     List<UserDetailsByModel> userDetailsList = <UserDetailsByModel>[];
//     userDetailsList = persedJson.map((i)=>UserDetailsByModel.fromJson(i)).toList();
//
//     return new UserDetailsByModelList(
//         scheduleList: userDetailsList
//     );
//
//   }
// }


class UserDetailsByModel {
  UserDetailsByModel({
    this.status,
    this.userId,
    this.name,
    this.email,
    this.imageUrl,
    this.meetingCode,
    this.gender,
    this.role,
    this.joinDate,
    this.lastLogin,
    this.activePurchasesEvents,
  });

  String status;
  String userId;
  String name;
  String email;
  String imageUrl;
  String meetingCode;
  String gender;
  String role;
  DateTime joinDate;
  DateTime lastLogin;
  List<String> activePurchasesEvents;

  factory UserDetailsByModel.fromJson(Map<String, dynamic> json) => UserDetailsByModel(
    status: json["status"],
    userId: json["user_id"],
    name: json["name"],
    email: json["email"],
    imageUrl: json["image_url"],
    meetingCode: json["meeting_code"],
    gender: json["gender"],
    role: json["role"],
    joinDate: DateTime.parse(json["join_date"]),
    lastLogin: DateTime.parse(json["last_login"]),
    activePurchasesEvents: List<String>.from(json["active_purchases_events"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "user_id": userId,
    "name": name,
    "email": email,
    "image_url": imageUrl,
    "meeting_code": meetingCode,
    "gender": gender,
    "role": role,
    "join_date": joinDate.toIso8601String(),
    "last_login": lastLogin.toIso8601String(),
    "active_purchases_events": List<dynamic>.from(activePurchasesEvents.map((x) => x)),
  };
}