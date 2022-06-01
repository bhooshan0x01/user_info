//Total 5 APIs to get data from the internet
class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
      );
  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
      };
}

class User {
  final int id;
  final String name;
  final String email;
  final Map<String, dynamic> address;
  final String website;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.website,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        address: json['address'],
        website: json['website'],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "address": address,
        "website": website,
      };
}

class ToDos {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const ToDos({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory ToDos.fromJson(Map<String, dynamic> json) {
    return ToDos(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}

class Posts {
  final int userId;
  final int id;
  final String title;
  final String body;

  const Posts({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class Comment {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  const Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      postId: json['postId'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }
}
