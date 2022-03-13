import 'package:flutter/material.dart';

showMessageDialog({
  required BuildContext context,
  required String title,
  required String message,
  required bool type,
}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: type ? Colors.lightGreen : Colors.red,
                          ),
                        ),
                        Text(
                          message,
                          style: const TextStyle(fontSize: 18),
                          maxLines: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RaisedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                              color: type ? Colors.lightGreen : Colors.red,
                              child: const Text(
                                'Ok',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            if (!type) ...[
                              const SizedBox(
                                width: 25,
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                color: type ? Colors.lightGreen : Colors.red,
                                child: const Text(
                                  'Ok',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ]
                          ],
                        )
                      ]),
                ),
              ),
              Positioned(
                  top: -50,
                  child: type
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
          ));
    },
  );
}
