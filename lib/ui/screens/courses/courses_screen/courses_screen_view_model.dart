import 'package:edtech/base_model.dart';
import 'package:edtech/core/models/course.dart';

class CoursesViewModel extends BaseModel {
  var coursesList = <Course>[];

  bool isLoading = false;
  String? errorMessage;

  setIsLoading(val) {
    isLoading = val;
    notifyListeners();
  }

  setErrorMessage(val) {
    errorMessage = val;
    notifyListeners();
  }

  getCourses(result) {
    if (result.loading) {
      // setIsLoading(true);
    } else {
      var data = result.data['get_all_courses']['edges'];
      // setIsLoading(false);
      List<Course> courses =
          List.from(data.map((item) => Course.fromJson(item)));
      coursesList = courses;
      print(coursesList);
      // notifyListeners();
    }
  }
}
