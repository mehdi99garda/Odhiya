import 'package:flutter/material.dart';

class CheckOutCheckPoints extends StatelessWidget {
  final int checkedTill;
  final List<String> checkpoints;
  final Color checkPointFilledColor;
  final String orderStatus;

  CheckOutCheckPoints(
      {this.checkedTill,
      this.checkpoints,
      this.checkPointFilledColor,
      this.orderStatus});

  final double circleDiameter = 32;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, string) {
      // /one extra for left and right padding to the checkpoint row
      final double cWidth =
          ((string.maxWidth - (32 * (checkpoints.length + 1))) /
              (checkpoints.length - 1));
      //this checkpoint.length -1 is coz we have checkpoint.length -1, middle sticks
      return Container(
        height: 56,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: checkpoints.map(
                  (element) {
                    int index = checkpoints.indexOf(element);
                    int customIndex = checkpoints.length - 1;

                    return Row(
                      children: [
                        Container(
                          width: circleDiameter,
                          padding: const EdgeInsets.all(4),
                          child: Icon(
                            orderStatus == "cancelled" ||
                                    orderStatus == "refunded"
                                ? Icons.cancel
                                : Icons.done,
                            size: 18,
                            color: orderStatus == "cancelled" ||
                                    orderStatus == "refunded"
                                ? Colors.red
                                : Colors.white,
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index <= checkedTill
                                  ? checkPointFilledColor
                                  : checkPointFilledColor.withOpacity(0.2)),
                        ),
                        // index != (checkpoints!.length - 1)
                        index != customIndex
                            ? Container(
                                color: index < checkedTill
                                    ? checkPointFilledColor
                                    : checkPointFilledColor.withOpacity(0.2),
                                height: 4,
                                width: cWidth,
                              )
                            : Container(),
                      ],
                    );
                  },
                ).toList(),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: checkpoints.map((e) {
                  return Text(
                    e,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      );
    });
  }
}
