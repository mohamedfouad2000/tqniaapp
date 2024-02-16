import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Feature/login/presentation/manger/LoginCubit/login_cubit.dart';
import 'package:tqniaapp/Feature/login/presentation/manger/LoginCubit/login_states.dart';
import 'package:tqniaapp/Feature/login/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kbackColor,
              foregroundColor: kbackColor,
              surfaceTintColor: kbackColor,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_outlined,
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ),
            body: LoginViewBody(
                emailController: emailController,
                passwordController: passwordController),
          );
        },
        listener: (BuildContext context, Object? state) {},
      ),
    );
  }
}
