class Task {
  Task({required this.title});

  String title;
  bool isDone = false;

  void toggleDone() {
    isDone = !isDone;
  }
}
