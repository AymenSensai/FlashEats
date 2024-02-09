import 'package:flash_eats/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flash_eats/core/helpers/app_regex.dart';
import 'package:flash_eats/features/sign_up/logic/sign_up_cubit.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            prefixIcon: InkWell(
                child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset("assets/svgs/user_icon.svg",
                        colorFilter: const ColorFilter.mode(
                            ColorsManager.steelGray, BlendMode.srcIn)))),
            hintText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
            controller: context.read<SignupCubit>().nameController,
          ),
          verticalSpace(18),
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
            controller: context.read<SignupCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<SignupCubit>().passwordController,
            hintText: 'Password',
            isObscureText: isPasswordObscureText,
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
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: 'Phone number',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              }
            },
            controller: context.read<SignupCubit>().phoneController,
          ),
        ],
      ),
    );
  }
}
