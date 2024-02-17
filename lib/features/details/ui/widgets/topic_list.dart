import 'package:flash_eats/core/helpers/spacing.dart';
import 'package:flash_eats/core/theming/colors.dart';
import 'package:flash_eats/core/theming/styles.dart';
import 'package:flash_eats/features/home/data/models/food_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopicList extends StatefulWidget {
  final List<Topic> topics;
  const TopicList({super.key, required this.topics});

  @override
  State<TopicList> createState() => _TopicListState();
}

class _TopicListState extends State<TopicList> {
  int? groupValue;
  @override
  Widget build(BuildContext context) {
    final topics = widget.topics;

    return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: topics.length,
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 4.h),
        itemBuilder: (context, index) {
          final topic = topics[index];
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5.h),
            child: Row(
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Radio<int>(
                      activeColor: ColorsManager.mainOrange,
                      value: index,
                      groupValue: groupValue,
                      toggleable: true,
                      onChanged: (int? value) {
                        setState(() {
                          groupValue = value;
                        });
                      }),
                ),
                horizontalSpace(8),
                Text(
                  topic.name,
                  style: TextStyles.font14BlackRegular,
                )
              ],
            ),
          );
        });
  }
}
