void main() {
  Set<String> students = {};

  void addStudent(String name) {
    students.add(name);
  }

  void printStudentsRecursive(List<String> list, int index) {
    if (index == list.length) return;
    print(list[index]);
    printStudentsRecursive(list, index + 1);
  }

  void printStudentsLambda() {
    students.forEach((name) => print(name));
  }

  addStudent("Ali");
  addStudent("Sara");
  addStudent("Omar");

  Set<String> newStudents = {"Mona", "Ahmed"};
  students = {...students, ...newStudents};

  print("=== Recursive Print ===");
  printStudentsRecursive(students.toList(), 0);

  print("\n=== Lambda Print ===");
  printStudentsLambda();

  Map<String, Map<String, double>> studentCourses = {};

  void addCourse(String studentName, String courseName, [double grade = 0]) {
    if (!studentCourses.containsKey(studentName)) {
      studentCourses[studentName] = {};
    }
    studentCourses[studentName]![courseName] = grade;
  }

  double averageGrade(String studentName) {
    if (!studentCourses.containsKey(studentName)) return 0;

    var grades = studentCourses[studentName]!.values;

    if (grades.isEmpty) return 0;

    double sum = grades.fold(0, (acc, g) => acc + g);
    return sum / grades.length;
  }

  addCourse("Ali", "Math", 90);
  addCourse("Ali", "CS", 80);
  addCourse("Sara", "Math", 100);
  addCourse("Sara", "Physics", 85);

  print("Ali average: ${averageGrade("Ali")}");
  print("Sara average: ${averageGrade("Sara")}");
}
