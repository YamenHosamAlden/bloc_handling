class DatabaseSchema {
  static const List<String> schema = [
    "CREATE TABLE $post(id INTEGER PRIMARY KEY AUTOINCREMENT,userId INTEGER,title TEXT,body TEXT)",
  ];
  static const String post = "Post";
}
