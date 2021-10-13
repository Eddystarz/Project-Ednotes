
class Course {
  String? sId;
  String? name;
  String? description;
  School? school;
  School? faculty;
  School? dept;
  School? level;
  List<CourseTopics>? courseTopics;

  Course(
      {this.sId,
        this.name,
        this.description,
        this.school,
        this.faculty,
        this.dept,
        this.level,
        this.courseTopics});

  Course.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    school =
    json['school'] != null ? new School.fromJson(json['school']) : null;
    faculty =
    json['faculty'] != null ? new School.fromJson(json['faculty']) : null;
    dept = json['dept'] != null ? new School.fromJson(json['dept']) : null;
    level = json['level'] != null ? new School.fromJson(json['level']) : null;
    if (json['courseTopics'] != null) {
      courseTopics = [];
      json['courseTopics'].forEach((v) {
        courseTopics!.add(new CourseTopics.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.school != null) {
      data['school'] = this.school!.toJson();
    }
    if (this.faculty != null) {
      data['faculty'] = this.faculty!.toJson();
    }
    if (this.dept != null) {
      data['dept'] = this.dept!.toJson();
    }
    if (this.level != null) {
      data['level'] = this.level!.toJson();
    }
    if (this.courseTopics != null) {
      data['courseTopics'] = this.courseTopics!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class School {
  String? sId;
  String? name;

  School({this.sId, this.name});

  School.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}

class CourseTopics {
  String? sId;
  String? name;
  List<LectureNotes>? lectureNotes;

  CourseTopics({this.sId, this.name, this.lectureNotes});

  CourseTopics.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    if (json['lectureNotes'] != null) {
      lectureNotes = [];
      json['lectureNotes'].forEach((v) {
        lectureNotes!.add(new LectureNotes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    if (this.lectureNotes != null) {
      data['lectureNotes'] = this.lectureNotes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LectureNotes {
  String? sId;
  String? name;
  String? text;
  List<NoteAttachments>? noteAttachments;

  LectureNotes({this.sId, this.name, this.text, this.noteAttachments});

  LectureNotes.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    text = json['text'];
    if (json['noteAttachments'] != null) {
      noteAttachments = [];
      json['noteAttachments'].forEach((v) {
        noteAttachments!.add(new NoteAttachments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['text'] = this.text;
    if (this.noteAttachments != null) {
      data['noteAttachments'] =
          this.noteAttachments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NoteAttachments {
  String? sId;
  String? url;
  String? fileName;
  String? mimeType;
  String? dateUploaded;

  NoteAttachments(
      {this.sId, this.url, this.fileName, this.mimeType, this.dateUploaded});

  NoteAttachments.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    url = json['url'];
    fileName = json['file_name'];
    mimeType = json['mime_type'];
    dateUploaded = json['date_uploaded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['url'] = this.url;
    data['file_name'] = this.fileName;
    data['mime_type'] = this.mimeType;
    data['date_uploaded'] = this.dateUploaded;
    return data;
  }
}
