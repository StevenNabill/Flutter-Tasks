import 'dart:io';

void main() {
  List<String> studentNames = [];
  List<List<double>> studentGrades = [];

  int numStudents;

  while (true) {
    stdout.write("Enter number of students: ");
    String? input = stdin.readLineSync();

    numStudents = int.tryParse(input ?? "") ?? -1;

    if (numStudents > 0) {
      break;
    } else {
      print("Invalid number. Please enter a positive integer.");
    }
  }

  for (int i = 0; i < numStudents; i++) {
    stdout.write("\nEnter student name: ");
    String name = stdin.readLineSync() ?? "Unknown";

    int numSubjects;

    while (true) {
      stdout.write("Enter number of subjects for $name: ");
      String? input = stdin.readLineSync();

      numSubjects = int.tryParse(input ?? "") ?? -1;

      if (numSubjects > 0) {
        break;
      } else {
        print("Invalid number of subjects.");
      }
    }

    List<double> grades = [];

    for (int j = 0; j < numSubjects; j++) {
      while (true) {
        stdout.write("Enter grade for subject ${j + 1}: ");
        String? gradeInput = stdin.readLineSync();

        double? grade = double.tryParse(gradeInput ?? "");

        if (grade != null && grade >= 0 && grade <= 100) {
          grades.add(grade);
          break;
        } else {
          print("Invalid grade. Enter value between 0 and 100.");
        }
      }
    }

    studentNames.add(name);
    studentGrades.add(grades);
  }

  while (true) {
    print("\n===== MENU =====");
    print("1. Show All Results");
    print("2. Search Student");
    print("3. Exit");

    stdout.write("Choose an option: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print("\n===== STUDENT RESULTS =====");

        for (int i = 0; i < studentNames.length; i++) {
          double sum = 0;

          for (double grade in studentGrades[i]) {
            sum += grade;
          }

          double average = sum / studentGrades[i].length;

          String letterGrade;

          if (average >= 90) {
            letterGrade = 'A';
          } else if (average >= 80) {
            letterGrade = 'B';
          } else if (average >= 70) {
            letterGrade = 'C';
          } else {
            letterGrade = 'F';
          }

          print(
            "${studentNames[i].toUpperCase()} | Average: ${average.toStringAsFixed(2)} | Grade: $letterGrade",
          );
        }
        break;

      case '2':
        stdout.write("Enter student name to search: ");
        String searchName = stdin.readLineSync() ?? "";

        bool found = false;

        for (int i = 0; i < studentNames.length; i++) {
          if (studentNames[i].toLowerCase() == searchName.toLowerCase()) {
            double sum = 0;

            for (double grade in studentGrades[i]) {
              sum += grade;
            }

            double average = sum / studentGrades[i].length;

            print("${studentNames[i]} average grade: ${average.round()}");

            found = true;
            break;
          }
        }

        if (!found) {
          print("Student not found.");
        }

        break;

      case '3':
        print("Program terminated.");
        return;

      default:
        print("Invalid choice. Please try again.");
    }
  }
}
