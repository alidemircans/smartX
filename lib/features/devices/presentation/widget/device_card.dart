import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smartx/core/constants/colors_constants%20copy.dart';
import 'package:smartx/core/di/locator.dart';
import 'package:smartx/core/utils/form_elements/text_form_field.dart';
import 'package:smartx/core/utils/text/text_generator_widget.dart';
import 'package:smartx/features/devices/data/model/routines_model.dart';
import 'package:smartx/features/devices/domain/entity/device.dart';
import 'package:smartx/features/devices/domain/entity/routines.dart';
import 'package:smartx/features/devices/presentation/bloc/device_bloc.dart';

class DeviceCard extends StatelessWidget {
  TextEditingController routineNameController = TextEditingController();
  TextEditingController routineDescriptionController = TextEditingController();
  TextEditingController routineController = TextEditingController();

  Device device;
  DeviceCard({required this.device, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDeviceRoutines(context),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(device.image),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(.7), BlendMode.darken),
        )),
        child: Center(
          child: TextStyleGenerator(
            text: device.name,
            color: AppColors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            alignment: TextAlign.center,
          ),
        ),
      ),
    );
  }

  showDeviceRoutines(context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: .4.sh,
            color: AppColors.white,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: SizedBox(
                    width: 1.sw,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextStyleGenerator(
                          text: "${device.name} Routines",
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).pop();
                            addNewRoutine(context, device);
                          },
                          child: const Icon(
                            Icons.add,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: device.routines.length,
                    itemBuilder: (context, index) {
                      final routine = device.routines[index];
                      return GestureDetector(
                        onTap: () async {
                          GoRouter.of(context).pop();
                          runRoutine(context, routine);
                        },
                        child: Card(
                          child: ListTile(
                            title: TextStyleGenerator(
                              text: routine.name,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }

  runRoutine(context, Routine routine) async {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: TextStyleGenerator(
          text: routine.whenRun,
        ),
      ),
    );
  }

  addNewRoutine(context, Device device) async {
    return showDialog(
      context: context,
      builder: (context) {
        return BlocProvider.value(
          value: locator<DeviceBloc>(),
          child: AlertDialog(
            insetPadding: EdgeInsets.zero,
            title:
                TextStyleGenerator(text: "Add New Rouitine to ${device.name}"),
            content: SizedBox(
              width: .8.sw,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormFieldWidget(
                    title: "Routine Name",
                    controller: routineNameController,
                  ),
                  TextFormFieldWidget(
                    title: "Routine Description",
                    controller: routineDescriptionController,
                  ),
                  TextFormFieldWidget(
                    title: "Routine",
                    controller: routineController,
                  ),
                ],
              ),
            ),
            actions: [
              BlocBuilder<DeviceBloc, DeviceState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      context.read<DeviceBloc>().add(
                            DeviceEvent.AddNewRoutine(
                                device.id,
                                RoutineModel(
                                  name: routineNameController.text,
                                  description:
                                      routineDescriptionController.text,
                                  whenRun: routineController.text,
                                )),
                          );
                      GoRouter.of(context).pop();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.smartNowButtonColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                100.sp,
                              ),
                            ),
                          ),
                          padding: EdgeInsets.all(16.sp),
                          child: const TextStyleGenerator(
                            text: "ADD ROUTINE",
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
