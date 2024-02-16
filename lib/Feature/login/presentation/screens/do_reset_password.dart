import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/login/presentation/manger/LoginCubit/login_cubit.dart';
import 'package:tqniaapp/Feature/login/presentation/manger/LoginCubit/login_states.dart';
import 'package:tqniaapp/Feature/login/presentation/views/login_view.dart';

class DoResetPassword extends StatelessWidget {
  const DoResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController passController = TextEditingController();
    TextEditingController codeCont = TextEditingController();

    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is sendCodeSucc) {
            Fluttertoast.showToast(
                msg: state.Message.toString(),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 18.0);

            Nav(context, const LoginView());
          } else if (state is sendCodeFailure) {
            Fluttertoast.showToast(
                msg: state.errorMessage.toString(),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 18.0);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const Image(
                        image: AssetImage(AssetsData.tqniaLogo),
                        height: 43,
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      Text(
                        "Reset Password",
                        style: StylesData.font24,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      customTextFormedFiled(
                          controller: codeCont,
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
                                    AssetsData.message,
                                  ),
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                            ),
                          ),
                          hintText: 'code',
                          type: TextInputType.text,
                          val: 'enter Your code'),
                      const SizedBox(
                        height: 32,
                      ),
                      customTextFormedFiled(
                          controller: passController,
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
                                    AssetsData.message,
                                  ),
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                            ),
                          ),
                          hintText: 'Password',
                          type: TextInputType.emailAddress,
                          obscureText: true,
                          val: 'enter Your Password'),
                      const SizedBox(
                        height: 16,
                      ),
                      defaultButton(
                          fun: () async {
                            if (formKey.currentState!.validate()) {
                              await LoginCubit.get(context).doResetPassword(
                                  password: passController.text,
                                  key: codeCont.text);
                            }
                          },
                          textWidget: state is sendCodeLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  "Send Code",
                                  style: StylesData.font14,
                                ),
                          c: kMainColor)
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
