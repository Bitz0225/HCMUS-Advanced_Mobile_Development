import 'package:flutter/material.dart';
import 'package:lettutor/common/values/hex_color.dart';
import 'package:lettutor/gen/assets.gen.dart';

class ScheduleItem extends StatelessWidget {
  const ScheduleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: HexColor.fromHex('#cccccc'),
        ),
      ),
      child: Column(
        children: [
          buildTutorInfo(
            context,
            name: 'Keegan',
            nationality: 'Turkey',
          ),
          const SizedBox(height: 16),
          buildTime(
            startTime: '10:00',
            endTime: '11:00',
            date: 'Sat, 28 Oct 23',
          ),
          const SizedBox(height: 16),
          buildRequestAndReview(),
        ],
      ),
    );
  }

  Widget buildTutorInfo(BuildContext context,
      {String? name, String? nationality, String? avatarUrl}) {
    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundImage: Assets.images.defaultAvatar.image().image,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name ?? '',
              ),
              const SizedBox(height: 4),
              Text(
                nationality ?? '',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTime({String? startTime, String? endTime, String? date}) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lessons time: ${startTime ?? ''} - ${endTime ?? ''}',
          ),
          const SizedBox(height: 4),
          Text(
            'Lessons date: ${date ?? ''}',
          ),
        ],
      ),
    );
  }

  Widget buildRequestAndReview() {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: HexColor.fromHex('#cccccc'),
          ),
        )
      ),
      child: Row(
        children: [
          GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.appBlue100,
                  ),
                ),
                child:  Text(
                  'Request for lesson',
                  style: TextStyle(
                    color: AppColors.appBlue100,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                )
              )),
          const Spacer(),
          GestureDetector(
            onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.red,
                  ),
                ),
                child:  const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                )
              )
          )
        ],
      ),
    );
  }
}
