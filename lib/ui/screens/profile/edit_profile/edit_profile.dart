
import 'package:edtech/core/graphql.dart';
// import 'package:edtech/core/services/user_service.dart';
import 'package:edtech/core/validators/index.dart';
// import 'package:edtech/locator.dart';
import 'package:edtech/ui/screens/profile/edit_profile/edit_profile_view_model.dart';
//import 'package:edtech/ui/widgets/auth_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:stacked/stacked.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String? selectedSchool;
  String? selectedLevel;
  String? selectedFaculty;
  String? selectedDepartment;
  TextEditingController stateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ViewModelBuilder<EditProfileViewModel>.reactive(
        onModelReady: (h) async {
          await h.fetchSchools();
          // await h.fetchFaculty()
          // await h.fetchLevel();
        },
        viewModelBuilder: () => EditProfileViewModel(),
        builder: (context, model, child) => Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Get.back(),//ex.ExtendedNavigator.of(context).pop(),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.edit_outlined,
                        color: Colors.white38,
                      ),
                    ),
                  ]),
            ),
            body: SingleChildScrollView(
                child: Column(children: [
                  Material(
                    // shape: ,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    child: Container(
                      transform: Matrix4.translationValues(0, -50, 0),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/profile.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(3)),
                      height: size.height * 0.3,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.only(right: 20, top: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Text(
                            "${model.currentUser.firstName}  ${model.currentUser.lastName}",
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        SizedBox(height: size.height * 0.02),
                        Text(
                          'Email',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Text("${model.currentUser.email}",
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        SizedBox(height: size.height * 0.02),
                        Text(
                          'Username',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Text("${model.currentUser.username}",
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        SizedBox(
                          height: 19,
                        ),

                        SizedBox(height: size.height * 0.01),
                        /* AuthTextField(
                          labelColor: Colors.black,
                          textColor: Colors.black,
                          fillColor: Colors.grey,
                          controller: stateController,
                          label: 'State',
                          validator: Validators().isEmpty,
                          onChanged: (val) {},
                          hintText: 'Enter state'), */

                        SizedBox(
                          height: 19,
                        ),

                        SizedBox(height: size.height * 0.02),
                        // Query(
                        //     options:
                        //         QueryOptions(documentNode: gql(fetchSchools)),
                        //     builder: (QueryResult result,
                        //         {VoidCallback refetch, FetchMore fetchMore}) {
                        //       if (result.hasException) {
                        //         return Text(result.exception.toString());
                        //       }
                        //       if (result.loading) {
                        //         return CircularProgressIndicator();
                        //       }
                        //       model.getSchools(result);
                        //       print(result);
                        //       return Column(
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: [
                        //             Text(
                        //               'School',
                        //               style: TextStyle(
                        //                   color: Colors.black,
                        //                   fontSize: 17,
                        //                   fontWeight: FontWeight.bold),
                        //             ),
                        //             SizedBox(height: size.height * 0.02),
                        //             ClipRRect(
                        //               borderRadius: BorderRadius.circular(10),
                        //               child: Container(
                        //                   padding: EdgeInsets.only(
                        //                       top: 15,
                        //                       bottom: 10,
                        //                       right: 20,
                        //                       left: 12),
                        //                   width:
                        //                       MediaQuery.of(context).size.width,
                        //                   height: 60,
                        //                   decoration:
                        //                       BoxDecoration(color: Colors.grey),
                        //                   child: DropdownButtonHideUnderline(
                        //                     child: new DropdownButton<String>(
                        //                       isExpanded: true,
                        //                       value: model.selectedSchool,
                        //                       iconSize: 15,
                        //                       icon: Icon(Icons
                        //                           .keyboard_arrow_down_sharp),
                        //                       // itemHeight: 300,
                        //                       elevation: 0,
                        //                       style:
                        //                           TextStyle(color: Colors.black),
                        //                       dropdownColor: Colors.white,
                        //                       items: model.schoolList
                        //                           .map((item) => item.name)
                        //                           .map((String value) {
                        //                         return new DropdownMenuItem<
                        //                             String>(
                        //                           value: value,
                        //                           child: new Text(
                        //                             value,
                        //                             style: TextStyle(
                        //                                 color: Colors.black),
                        //                           ),
                        //                         );
                        //                       }).toList(),
                        //                       onChanged: (newValue) {
                        //                         setState(() {
                        //                           model.selectedSchool = newValue;
                        //                           selectedSchool = model
                        //                               .fetchSchoolAssociatedWithName(
                        //                                   model.selectedSchool,
                        //                                   model.schoolList);
                        //                         });
                        //                       },
                        //                     ),
                        //                   )),
                        //             ),
                        //           ]);
                        //     }),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'School',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: size.height * 0.02),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                    padding: EdgeInsets.only(
                                        top: 15, bottom: 10, right: 20, left: 12),
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    decoration: BoxDecoration(color: Colors.grey),
                                    child: DropdownButtonHideUnderline(
                                      child: new DropdownButton<String>(
                                        isExpanded: true,
                                        value: model.selectedSchool,
                                        iconSize: 15,
                                        icon:
                                        Icon(Icons.keyboard_arrow_down_sharp),
                                        // itemHeight: 300,
                                        elevation: 0,
                                        style: TextStyle(color: Colors.black),
                                        dropdownColor: Colors.white,
                                        items: model.schoolList
                                            .map((item) => item.name)
                                            .map((value) {
                                          return new DropdownMenuItem<String>(
                                            value: value,
                                            child: new Text(
                                              value!,
                                              style:
                                              TextStyle(color: Colors.black),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          // setState(() {
                                          //   model.selectedSchool = newValue;
                                          //   selectedSchool = model
                                          //       .fetchSchoolAssociatedWithName(
                                          //           model.selectedSchool,
                                          //           model.schoolList);
                                          // });
                                          model.selectSchool(newValue);
                                        },
                                      ),
                                    )),
                              ),
                            ]),

                        SizedBox(
                          height: 19,
                        ),
                        SizedBox(height: size.height * 0.02),

                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Faculty',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: size.height * 0.02),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                    padding: EdgeInsets.only(
                                        top: 15, bottom: 10, right: 20, left: 12),
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    decoration: BoxDecoration(color: Colors.grey),
                                    child: DropdownButtonHideUnderline(
                                      child: new DropdownButton<String>(
                                        isExpanded: true,
                                        value: model.selectedFaculty,
                                        iconSize: 15,
                                        icon:
                                        Icon(Icons.keyboard_arrow_down_sharp),
                                        // itemHeight: 300,
                                        elevation: 0,
                                        style: TextStyle(color: Colors.black),
                                        dropdownColor: Colors.white,
                                        items: model.facultyList
                                            .map((item) => item.name)
                                            .map((value) {
                                          return new DropdownMenuItem<String>(
                                            value: value,
                                            child: new Text(
                                              value!,
                                              style:
                                              TextStyle(color: Colors.black),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          // setState(() {
                                          //   model.selectedFaculty = newValue;
                                          //   selectedFaculty = model
                                          //       .fetchSchoolAssociatedWithName(
                                          //           model.selectedFaculty,
                                          //           model.facultyList);
                                          // });
                                          model.selectFaculty(newValue);
                                        },
                                      ),
                                    )),
                              ),
                            ]),

                        SizedBox(
                          height: 19,
                        ),
                        SizedBox(height: size.height * 0.02),

                        //  !!!!!!!!!!!!!!!
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Department',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: size.height * 0.02),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                    padding: EdgeInsets.only(
                                        top: 15, bottom: 10, right: 20, left: 12),
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    decoration: BoxDecoration(color: Colors.grey),
                                    child: DropdownButtonHideUnderline(
                                      child: new DropdownButton<String>(
                                        isExpanded: true,
                                        value: model.selectDept,
                                        iconSize: 15,
                                        icon:
                                        Icon(Icons.keyboard_arrow_down_sharp),
                                        // itemHeight: 300,
                                        elevation: 0,
                                        style: TextStyle(color: Colors.black),
                                        dropdownColor: Colors.white,
                                        items: model.departmentList
                                            .map((item) => item.name)
                                            .map((value) {
                                          return new DropdownMenuItem<String>(
                                            value: value,
                                            child: new Text(
                                              value!,
                                              style:
                                              TextStyle(color: Colors.black),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          // setState(() {
                                          //   model.selectDept = newValue;
                                          //   selectedDepartment = model
                                          //       .fetchSchoolAssociatedWithName(
                                          //           model.selectDept,
                                          //           model.departmentList);
                                          // });
                                          model.selectDepartment(newValue);
                                        },
                                      ),
                                    )),
                              ),
                            ]),

                        SizedBox(
                          height: 19,
                        ),
                        SizedBox(height: size.height * 0.02),

                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Level',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: size.height * 0.02),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                    padding: EdgeInsets.only(
                                        top: 15, bottom: 10, right: 20, left: 12),
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    decoration: BoxDecoration(color: Colors.grey),
                                    child: DropdownButtonHideUnderline(
                                      child: new DropdownButton<String>(
                                        isExpanded: true,
                                        value: model.selectedLevel,
                                        iconSize: 15,
                                        icon:
                                        Icon(Icons.keyboard_arrow_down_sharp),
                                        // itemHeight: 300,
                                        elevation: 0,
                                        style: TextStyle(color: Colors.black),
                                        dropdownColor: Colors.white,
                                        items: model.levelList
                                            .map((item) => item.name)
                                            .map((value) {
                                          return new DropdownMenuItem<String>(
                                            value: value,
                                            child: new Text(
                                              value!,
                                              style:
                                              TextStyle(color: Colors.black),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            model.selectedLevel = newValue!;
                                          });
                                        },
                                      ),
                                    )),
                              ),
                            ]),

                        SizedBox(
                          height: 19,
                        ),
                        SizedBox(height: size.height * 0.02),
                        // Mutation(
                        //     options: MutationOptions(
                        //         onCompleted: (result) {
                        //           print(result);
                        //           model.setLoading(false);
                        //           model.showEditProfileResponse(
                        //               result, context, stateController.text);
                        //         },
                        //         documentNode: gql(editStudentProfile)),
                        //     builder: (RunMutation insert, QueryResult result) {
                        //       return SizedBox(
                        //         height: size.height * 0.08,
                        //         width: size.width,
                        //         child: MaterialButton(
                        //           shape: RoundedRectangleBorder(
                        //             borderRadius:
                        //                 BorderRadius.all(Radius.circular(10)),
                        //           ),
                        //           onPressed: () {
                        //             model.setLoading(true);
                        //             insert(<String, dynamic>{
                        //               'state': stateController.text,
                        //               'school': selectedSchool,
                        //               'faculty': selectedFaculty,
                        //               'dept': selectedDepartment,
                        //               'level': selectedLevel
                        //             });
                        //             if (result.hasException) {
                        //               print(result.exception);
                        //             }
                        //           },
                        //           color: Theme.of(context).accentColor,
                        //           child: model.isLoading
                        //               ? CircularProgressIndicator()
                        //               : Text(
                        //                   'Edit Profile',
                        //                   style: GoogleFonts.poppins(
                        //                       fontSize: 16,
                        //                       color: Colors.white,
                        //                       fontWeight: FontWeight.normal),
                        //                 ),
                        //         ),
                        //       );
                        //     }),

                        SizedBox(
                          height: size.height * 0.08,
                          width: size.width,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            onPressed: () {
                              model.editprofile(stateController.text, context);
                            },
                            color: Theme.of(context).accentColor,
                            child: model.isLoading
                                ? CircularProgressIndicator()
                                : Text(
                              'Edit Profile',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 19,
                        ),
                        SizedBox(height: size.height * 0.02),
                      ],
                    ),
                  )
                ])),
        ),
    );
  }
}
