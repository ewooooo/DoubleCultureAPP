class Museum {
  final String museumName;
  final String quiz1,quiz2,quiz3;

  Museum({this.museumName, this.quiz1,this.quiz2,this.quiz3});

  factory Museum.fromJson(Map<String, dynamic> json) {
    return Museum(
      museumName: json['institution_number'],
      quiz1: json['quiz1'],
      quiz2: json['quiz2'],
      quiz3: json['quiz3'],
    );
  }
  Map<String,dynamic> toJson() =>
      {
        'institution_number' : museumName,
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
  final String quiz_answer;

  UserMuseum({this.stampStatus, this.quiz_answer});

  factory UserMuseum.fromJson(Map<String, dynamic> json) {
    return UserMuseum(
      stampStatus: json['stampStatus'],
      quiz_answer: json['quiz_answer'],
    );
  }
  Map<String,dynamic> toJson() =>
      {
        "stampStatus": stampStatus,
        "quiz_answer": quiz_answer,
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

