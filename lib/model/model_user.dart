class Museum {
  final String museumName;
  final String hoToGo;
  final String quiz1;
  final String quiz2;
  final String quiz3;

  Museum({this.museumName, this.hoToGo,this.quiz1,this.quiz2,this.quiz3});

  factory Museum.fromJson(Map<String, dynamic> json) {
    return Museum(
      museumName: json['institution_number'],
      hoToGo: json['howtogo'],
      quiz1: json['quiz1'],
      quiz2: json['quiz2'],
      quiz3: json['quiz3'],
    );
  }
  Map<String,dynamic> toJson() =>
      {
        'institution_number' : museumName,
        'howtogo' : hoToGo,
        'quiz1' : quiz1,
        'quiz2' : quiz2,
        'quiz3' : quiz3,
      };
}

class User{
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final bool status;

  User({this.username, this.email, this.firstName, this.lastName, this.status});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      email: json['email'],
      firstName : json['first_name'],
      lastName: json['last_name'],
      status: json['student_data'],
    );
  }
  Map<String,dynamic> toJson() =>
  {
  "username": username,
  "email": email,
  "first_name": firstName,
  "last_name": lastName,
  "student_data": status,
  };
}

class UserMuseum{
  final bool stampStatus;
  final String quiz1_answer;
  final String quiz2_answer;
  final String quiz3_answer;


  UserMuseum({this.stampStatus, this.quiz1_answer, this.quiz2_answer, this.quiz3_answer});

  factory UserMuseum.fromJson(Map<String, dynamic> json) {
    return UserMuseum(
      stampStatus: json['stampStatus'],
      quiz1_answer: json['quiz1_answer'],
      quiz2_answer : json['quiz2_answer'],
      quiz3_answer: json['quiz3_answer'],
    );
  }
  Map<String,dynamic> toJson() =>
      {
        "stampStatus": stampStatus,
        "quiz1_answer": quiz1_answer,
        "quiz2_answer": quiz2_answer,
        "quiz3_answer": quiz3_answer,
      };
}



class Token{
  final String token;

  Token({this.token});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      token: json['token'],
    );
  }
  Map<String,dynamic> toJson() =>
      {
        "token": token,
      };
}

