import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Core/local/cache_Helper.dart';
import 'package:tqniaapp/Core/utils/assets_data.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/components.dart';
import 'package:tqniaapp/Core/utils/styles.dart';
import 'package:tqniaapp/Feature/home/presentation/views/home_view.dart';
import 'package:tqniaapp/Feature/login/presentation/manger/LoginCubit/login_cubit.dart';
import 'package:tqniaapp/Feature/login/presentation/manger/LoginCubit/login_states.dart';
import 'package:tqniaapp/Feature/login/presentation/screens/reset_password.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody(
      {super.key,
      required this.emailController,
      required this.passwordController});
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<LoginCubit, LoginStates>(
      builder: (BuildContext context, state) {
        return Padding(
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
                    "Log in",
                    style: StylesData.font24,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  customTextFormedFiled(
                      controller: emailController,
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
                      hintText: 'Email',
                      type: TextInputType.emailAddress,
                      val: 'enter Your Email'),
                  const SizedBox(
                    height: 16,
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
                              AssetsData.lock,
                            ),
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                    ),
                    controller: passwordController,
                    hintText: 'Password',
                    val: 'enter Your password',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        NavegatorPush(context, const ResetPassword());
                      },
                      child: Text(
                        "Forgot password?",
                        style: StylesData.font12.copyWith(color: kMainColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  defaultButton(
                      fun: () async {
                        if (formKey.currentState!.validate()) {
                          await LoginCubit.get(context).signIn(
                              email: emailController.text,
                              password: passwordController.text);
                        }
                      },
                      textWidget: state is SignInLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Log in",
                              style: StylesData.font14,
                            ),
                      c: kMainColor)
                ],
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {
        if (state is SignInSucc) {
          if (state.model.data?.token != '') {
            TOKEN = state.model.data?.token;
            CacheHelper.saveData(key: 'token', value: state.model.data?.token)
                .then((value) {
              if (TOKEN != null) {
                Nav(context, const HomeView());
              } else {
                Fluttertoast.showToast(
                    msg: state.model.message.toString(),
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    fontSize: 18.0);
              }
            });
          } else {
            print("object");
            Fluttertoast.showToast(
                msg: state.model.message.toString(),
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 18.0);
          }
        } else if (state is SignInFailure) {
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
    );
  }
}
