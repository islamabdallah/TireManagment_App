import 'package:flutter/material.dart';

showMessageDialog({
  required BuildContext context,
  required String message,
  required bool isSucceeded,
  VoidCallback?  onPressedOk,
  VoidCallback?  onPressedRetry,
}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
          onWillPop: () async => false,
        child: Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                SizedBox(
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 60, 10, 10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            isSucceeded ? 'Succeeded' : 'Failed',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: isSucceeded ? Colors.lightGreen : Colors.red,
                            ),
                          ),
                          Text(
                            message,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 16),
                            maxLines: 3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (!isSucceeded) ...[
                                RaisedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    onPressedRetry?.call();
                                  },
                                  color: Colors.red,
                                  child: const Text(
                                    'Retry',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                              ],
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  onPressedOk?.call();
                                },
                                color:
                                isSucceeded ? Colors.lightGreen : Colors.red,
                                child: const Text(
                                  'Ok',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          )
                        ]),
                  ),
                ),
                Positioned(
                    top: -50,
                    child: isSucceeded
                        ? const CircleAvatar(
                            backgroundColor: Colors.lightGreen,
                            radius: 50,
                            child: Icon(
                              Icons.verified_user,
                              color: Colors.white,
                              size: 50,
                            ),
                          )
                        : const CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 50,
                            child: Icon(
                              Icons.privacy_tip,
                              color: Colors.white,
                              size: 50,
                            ),
                          )),
              ],
            )),
      );
    },
  );
}
