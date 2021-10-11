import 'package:edtech/core/models/course.dart';
import 'package:edtech/ui/widgets/toastshow.dart';
import 'package:flutter/cupertino.dart';

class CourseProvider with ChangeNotifier{
  List<Course> _coursesList = [];
  List<Course> get coursesList => _coursesList;

  Course? _selectedCourse;
  Course? get selectedCourse => _selectedCourse;

  String getUserCourses = """
      query{
  get_user_courses{
    edges{
      _id,
      name,
      description,
      school{
        _id,
        name
      },
      faculty{
      	_id,
      	name
    	},
    	dept{
        _id,
        name
      },
      level{
        _id,
        name
      }, 
      courseTopics{
        _id,
        name,
        lectureNotes{
          _id,
          name,
          text,
          noteAttachments{
            _id,
            url,
            file_name,
            mime_type,
            date_uploaded
          }
        }
      }
    }
  }
}
    """;

  setSelectedCourse(Course cours){
    _selectedCourse = cours;
  }

  getCourses(result) {
    print(111);
    print(result['edges'][0]['_id']);
    print(222);

    if (result == null) {
      showErrorToast("request failed. check your internet and try again");
      return;
    }
    var respData = result['edges'];

    print(respData.length);

    if(result['edges'] == null){
      showErrorToast("request failed. try again");
      return;
    }

    List<Course> courList = [];
    for(var i = 0; i < result['edges'].length; i++){
      print("use index: ${i}");
      try{
        Course cou = Course.fromJson(result['edges'][i]);
        courList.add(cou);
      }catch(e){
        print(e);
      }

    }

    _coursesList = courList;
    //notifyListeners();


  }
}