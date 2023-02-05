import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smartx/core/constants/assets_constants.dart';
import 'package:smartx/core/constants/colors_constants%20copy.dart';
import 'package:smartx/core/constants/string_constants.dart';
import 'package:smartx/core/router/routes.dart';
import 'package:smartx/core/utils/form_elements/text_form_field.dart';
import 'package:smartx/core/utils/text/text_generator_widget.dart';
import 'package:smartx/features/splash/data/model/user_model.dart';
import 'package:smartx/features/splash/presentation/bloc/user_bloc.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            width: 1.sw,
            height: .7.sh,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    120.h.verticalSpace,
                    Image.asset(
                      AssetsPath.appLogo,
                      height: 80.h,
                    ),
                    18.h.verticalSpace,
                    SizedBox(
                      width: .6.sw,
                      child: TextStyleGenerator(
                        text: AppStrings.splashSubTitle,
                        color: AppColors.white,
                        fontSize: 14.sp,
                        alignment: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        return state.when(
                          initial: () {
                            emitGetUser();
                            return const CircularProgressIndicator.adaptive();
                          },
                          loading: () {
                            return const CircularProgressIndicator.adaptive();
                          },
                          empty: () {
                            return Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16.sp),
                                  child: TextFormFieldWidget(
                                    controller: controller,
                                    title: "Your Name",
                                  ),
                                ),
                                16.h.verticalSpace,
                                GestureDetector(
                                  onTap: () {
                                    final user =
                                        UserModel(id: 8, name: controller.text);
                                    emitAddUser(user);
                                    emitGetUser();
                                  },
                                  child: Container(
                                    width: .6.sw,
                                    height: 48.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.smartNowButtonColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(48.h),
                                      ),
                                    ),
                                    child: const Center(
                                      child: TextStyleGenerator(
                                        text: AppStrings.smartNow,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                          loaded: (user) {
                            return Column(
                              children: [
                                TextStyleGenerator(
                                  text: "${AppStrings.welcome} ${user.name}",
                                  color: AppColors.white,
                                  fontSize: 21.sp,
                                ),
                                16.h.verticalSpace,
                                GestureDetector(
                                  onTap: () {
                                    GoRouter.of(context).pushReplacement(
                                        AppRoutersConstants.devicesPage);
                                  },
                                  child: Container(
                                    width: .6.sw,
                                    height: 48.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.smartNowButtonColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(48.h),
                                      ),
                                    ),
                                    child: const Center(
                                      child: TextStyleGenerator(
                                        text: AppStrings.smartNow,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  emitGetUser() => context.read<UserBloc>().add(const UserEvent.GetUser());
  emitAddUser(UserModel user) =>
      context.read<UserBloc>().add(UserEvent.AddUser(user));
}
