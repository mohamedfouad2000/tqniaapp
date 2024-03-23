import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/home/data/repo/homerepo/home_repos_imp.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/user%20data/user_data_cubit.dart';
import 'package:tqniaapp/Feature/home/presentation/manager/user%20data/user_data_state.dart';
import 'package:tqniaapp/Feature/home/presentation/views/home_view.dart';

class EditProfileScreenBody extends StatefulWidget {
  const EditProfileScreenBody(
      {super.key,
      required this.name,
      required this.email,
      required this.phone,
      required this.image});
  final String name;
  final String email;
  final String phone;
  final String image;

  @override
  State<EditProfileScreenBody> createState() => _EditProfileScreenBodyState();
}

class _EditProfileScreenBodyState extends State<EditProfileScreenBody> {
  TextEditingController nameCont = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  TextEditingController phoneCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  TextEditingController conpasswordCon = TextEditingController();
  bool passObs = true;
  bool conpassObs = true;
  var formkey = GlobalKey<FormState>();
  bool isEmpty = false;
  File? file;
  ImagePicker picker = ImagePicker();

  Future<void> getuserprofile({required ImageSource i}) async {
    // emit(getuserprofileLoading());
    var pickedfile = await picker.pickImage(source: i);
    if (pickedfile != null) {
      setState(() {
        file = File(pickedfile.path);
      });
      print(pickedfile.path);
    } else {
      print("No Image");
    }
  }

  Future upload() async {
    if (file == null) return;
    // String base64=base64Encode(file!.readAsBytesSync());
  }

  @override
  Widget build(BuildContext context) {
    nameCont.text = widget.name;
    emailCon.text = widget.email;
    phoneCon.text = widget.phone;

    return BlocProvider(
      create: (context) => UserDataCubit(HomeRepoImp()),
      child: BlocConsumer<UserDataCubit, UserDataState>(
        listener: (context, state) {
          if (state is UpdateUserDataSucc) {
            Fluttertoast.showToast(
                msg: state.txt.toString(),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 18.0);

            Nav(context, const HomeView());
          } else if (state is UpdateUserDataFailure) {
            Fluttertoast.showToast(
                msg: state.ErrorMsq.toString(),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 18.0);
          } else if (state is UpdateUserImageSucc) {
            Fluttertoast.showToast(
                msg: state.txt.toString(),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 18.0);
            Nav(context, const HomeView());
          } else if (state is UpdateUserImageFailure) {
            Fluttertoast.showToast(
                msg: state.ErrorMsq.toString(),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 18.0);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: InkWell(
                        onTap: () {
                          var x = AlertDialog(
                            surfaceTintColor: Colors.white,
                            title: const Text(
                              "Choose Your Photo",
                            ),
                            content: SizedBox(
                              height: 140,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      height: 50,
                                      width: double.infinity,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      child: TextButton.icon(
                                          label: const Text(
                                            "Gallary",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          onPressed: () async {
                                            getuserprofile(
                                                i: ImageSource.gallery);
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(
                                            Icons.storage_outlined,
                                            color: Colors.black,
                                          ))),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                      height: 50,
                                      width: double.infinity,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      child: TextButton.icon(
                                          label: const Text(
                                            "camera",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          onPressed: () {
                                            getuserprofile(
                                                i: ImageSource.camera);
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(
                                            Icons.camera_alt_outlined,
                                            color: Colors.black,
                                          ))),
                                ],
                              ),
                            ),
                          );
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return x;
                              });
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            file == null
                                ? Container(
                                    width: 127,
                                    height: 127,
                                    decoration: ShapeDecoration(
                                      image: DecorationImage(
                                        colorFilter: ColorFilter.mode(
                                            const Color.fromARGB(255, 0, 0, 0)
                                                .withOpacity(
                                                    0.20000000298023224),
                                            BlendMode.darken),
                                        image: NetworkImage(widget.image),
                                      ),
                                      shape: const OvalBorder(),
                                    ),
                                  )
                                : Container(
                                    width: 127,
                                    height: 127,
                                    decoration: BoxDecoration(
                                        // shape: BoxShape.circle,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Image.file(file!),
                                  ),
                            const Image(
                              image: AssetImage(AssetsData.showshow),
                              width: 32,
                              height: 32,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    if (file != null)
                      defaultButton(
                          height: 50,
                          fun: () {
                            UserDataCubit.get(context)
                                .UpdateImage(image: file!)
                                .then((value) {});
                          },
                          textWidget: state is UpdateUserImageLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  'Upload Image',
                                  style: StylesData.font14
                                      .copyWith(color: Colors.white),
                                ),
                          c: kMainColor),
                    Text(
                      "Name",
                      style: StylesData.font16.copyWith(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    customTextFormedFiled(
                      controller: nameCont,
                      preicon: Padding(
                        padding: const EdgeInsets.only(
                            top: 6.0, bottom: 6.0, left: 6.0, right: 16),
                        child: Container(
                          width: 48,
                          height: 45,
                          decoration: ShapeDecoration(
                            color: const Color(0x19F67952),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Center(
                            child: Image(
                              image: AssetImage(AssetsData.profile2),
                              height: 24,
                              width: 24,
                            ),
                          ),
                        ),
                      ),
                      hintText: 'name',
                      type: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Email",
                      style: StylesData.font16.copyWith(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    customTextFormedFiled(
                      controller: emailCon,
                      preicon: Padding(
                        padding: const EdgeInsets.only(
                            top: 6.0, bottom: 6.0, left: 6.0, right: 16),
                        child: Container(
                          width: 48,
                          height: 45,
                          decoration: ShapeDecoration(
                            color: const Color(0x19F67952),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Center(
                            child: Image(
                              image: AssetImage(AssetsData.message),
                              height: 24,
                              width: 24,
                            ),
                          ),
                        ),
                      ),
                      hintText: 'Email',
                      type: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Phone number",
                      style: StylesData.font16.copyWith(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    customTextFormedFiled(
                      controller: phoneCon,
                      preicon: Padding(
                        padding: const EdgeInsets.only(
                            top: 6.0, bottom: 6.0, left: 6.0, right: 16),
                        child: Container(
                          width: 48,
                          height: 45,
                          decoration: ShapeDecoration(
                            color: const Color(0x19F67952),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Center(
                            child: Image(
                              image: AssetImage(AssetsData.call2),
                              height: 24,
                              width: 24,
                            ),
                          ),
                        ),
                      ),
                      hintText: '+12344578',
                      type: TextInputType.phone,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Password",
                      style: StylesData.font16.copyWith(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    customTextFormedFiled(
                      sufficon: InkWell(
                        onTap: () {
                          setState(() {
                            passObs = !passObs;
                          });
                        },
                        child: passObs
                            ? const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Image(
                                  image: AssetImage(
                                    AssetsData.eye2,
                                  ),
                                  height: 24,
                                  width: 24,
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: ImageIcon(
                                  const AssetImage(
                                    AssetsData.eye,
                                  ),
                                  size: 24,
                                  color: kMainColor,
                                ),
                              ),
                      ),
                      preicon: Padding(
                        padding: const EdgeInsets.only(
                            top: 6.0, bottom: 6.0, left: 6.0, right: 16),
                        child: Container(
                          width: 48,
                          height: 45,
                          decoration: ShapeDecoration(
                            color: const Color(0x19F67952),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Center(
                            child: Image(
                              image: AssetImage(
                                AssetsData.lock2,
                              ),
                              height: 24,
                              width: 24,
                            ),
                          ),
                        ),
                      ),
                      controller: passwordCon,
                      hintText: 'Password',
                      obscureText: passObs,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Confirm Password",
                      style: StylesData.font16.copyWith(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    customTextFormedFiled(
                        preicon: Padding(
                          padding: const EdgeInsets.only(
                              top: 6.0, bottom: 6.0, left: 6.0, right: 16),
                          child: Container(
                            width: 48,
                            height: 45,
                            decoration: ShapeDecoration(
                              color: const Color(0x19F67952),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Center(
                              child: Image(
                                image: AssetImage(
                                  AssetsData.lock2,
                                ),
                                height: 24,
                                width: 24,
                              ),
                            ),
                          ),
                        ),
                        controller: conpasswordCon,
                        hintText: 'confirm Password',
                        obscureText: conpassObs,
                        sufficon: InkWell(
                          onTap: () {
                            setState(() {
                              conpassObs = !conpassObs;
                            });
                          },
                          child: conpassObs
                              ? const Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Image(
                                    image: AssetImage(
                                      AssetsData.eye2,
                                    ),
                                    height: 24,
                                    width: 24,
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: ImageIcon(
                                    const AssetImage(
                                      AssetsData.eye,
                                    ),
                                    size: 24,
                                    color: kMainColor,
                                  ),
                                ),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    if (isEmpty)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(078),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.info,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                'password does not match',
                                style: StylesData.font14
                                    .copyWith(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    if (isEmpty)
                      const SizedBox(
                        height: 24,
                      ),
                    defaultButton(
                        fun: () {
                          if (formkey.currentState!.validate()) {
                            if (conpasswordCon.text == passwordCon.text) {
                              const end = ' ';
                              final startIndex = nameCont.text.indexOf(end);
                              String fname =
                                  nameCont.text.substring(0, startIndex);
                              String lname = nameCont.text.substring(
                                  startIndex + 1, nameCont.text.length);
                              UserDataCubit.get(context).updateUserData(
                                  fname: fname,
                                  lname: lname,
                                  mobile: phoneCon.text,
                                  password: passwordCon.text);
                            } else {
                              setState(() {
                                isEmpty = true;
                              });
                            }
                          }
                          // NavegatorPush(context, const TicketInfoScreen());
                        },
                        textWidget: state is UpdateUserDataLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                'Save',
                                style: StylesData.font14
                                    .copyWith(color: Colors.white),
                              ),
                        c: kMainColor)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
