import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:smartx/core/constants/assets_constants.dart';
import 'package:smartx/core/constants/colors_constants%20copy.dart';
import 'package:smartx/core/constants/string_constants.dart';
import 'package:smartx/core/utils/text/text_generator_widget.dart';
import 'package:smartx/features/devices/presentation/bloc/device_bloc.dart';
import 'package:smartx/features/devices/presentation/widget/widgets.dart';

class DevicesView extends StatelessWidget {
  const DevicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: Image.asset(
          AssetsPath.appLogo,
          height: 32.h,
        ),
      ),
      body: BlocBuilder<DeviceBloc, DeviceState>(
        builder: (context, state) {
          return state.when(
            initial: () {
              context.read<DeviceBloc>().add(const DeviceEvent.GetAllDevices());
              return const CircularProgressIndicator.adaptive();
            },
            loading: () {
              return const CircularProgressIndicator.adaptive();
            },
            empty: () {
              return const TextStyleGenerator(
                text: "There is no data",
                color: Colors.blue,
              );
            },
            error: () {
              return const TextStyleGenerator(
                text: AppStrings.ups,
                color: Colors.blue,
              );
            },
            loaded: (devices) {
              return Container(
                margin: EdgeInsets.all(8.sp),
                child: GridView.custom(
                  gridDelegate: SliverQuiltedGridDelegate(
                    crossAxisCount: 4,
                    mainAxisSpacing: 8.sp,
                    crossAxisSpacing: 8.sp,
                    repeatPattern: QuiltedGridRepeatPattern.inverted,
                    pattern: [
                      const QuiltedGridTile(2, 2),
                      const QuiltedGridTile(2, 1),
                      const QuiltedGridTile(2, 1),
                      const QuiltedGridTile(2, 1),
                      const QuiltedGridTile(2, 1),
                      const QuiltedGridTile(2, 2),
                    ],
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    childCount: devices.length,
                    (context, index) => DeviceCard(
                      device: devices[index],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
