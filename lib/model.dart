enum TaskCategory { work, meeting, family, me }

class Todo {
  int? id;
  String title;
  String description;
  TaskCategory category;
  DateTime date;
  String startTime;
  String endTime;
 

  Todo({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.date,
    required this.startTime,
    required this.endTime,
    
  });

  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category.index, 
      'date': date.toIso8601String(),
      'starttime': startTime,
      'endtime': endTime,
    };
  }

  
  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      category: TaskCategory.values[map['category']],
      date: DateTime.parse(map['date']),
      startTime: map['starttime'],
      endTime: map['endtime'],
      
    );
  }
}

class User{

  int? id;
  String userName;
  String password;
  
 

  User({
    this.id,
    required this.userName,
    required this.password,
    
    
  });

  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username':userName,
      'password':password
    };
  }

  
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      userName: map['username'],
      password: map['password'],
    );
  }



}
