import 'package:flutter/material.dart';
import 'package:lettutor/common/ui/base_appbar/base_appbar.dart';
import 'package:lettutor/common/ui/base_drawer/base_drawer.dart';
import 'package:lettutor/gen/assets.gen.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      drawer: BaseDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
              children: [
                Row(
                  children: [
                    Container(
                        child: Assets.svg.history.svg(
                            width: MediaQuery.sizeOf(context).width * 0.25)),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Text('Schedule',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 36,
                              fontWeight: FontWeight.w900)),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                    'You can review the details of the lessons you have attended',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
                const SizedBox(height: 16),
              ]
          ),
        ),
      ),
    );
  }
}
