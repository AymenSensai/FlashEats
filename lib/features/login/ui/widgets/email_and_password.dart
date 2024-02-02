import 'package:flash_eats/core/helpers/app_regex.dart';
import 'package:flash_eats/core/theming/colors.dart';
import 'package:flash_eats/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            prefixIcon: InkWell(
                child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset("assets/svgs/email_icon.svg",
                        colorFilter: const ColorFilter.mode(
                            ColorsManager.steelGray, BlendMode.srcIn)))),
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: 'Password',
            isObscureText: isObscureText,
            prefixIcon: InkWell(
                child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset("assets/svgs/password_icon.svg",
                  colorFilter: const ColorFilter.mode(
                      ColorsManager.steelGray, BlendMode.srcIn)),
            )),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
                color: ColorsManager.steelGray,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
            controller: context.read<LoginCubit>().passwordController,
          ),
        ],
      ),
    );
  }
}
