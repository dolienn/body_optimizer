import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class Notifications {
  buildNotificationSuccess(controller, context, descp) => ElegantNotification(
        icon: Lottie.asset(
          'assets/animations/confirm.json',
          controller: controller,
          repeat: true,
          width: MediaQuery.of(context).size.width * 0.1,
          height: MediaQuery.of(context).size.width * 0.1,
          onLoaded: (composition) {
            controller
              ..duration = composition.duration
              ..reset()
              ..forward();
          },
        ),
        toastDuration: const Duration(milliseconds: 1500),
        animationDuration: const Duration(milliseconds: 500),
        animation: AnimationType.fromTop,
        notificationPosition: NotificationPosition.topCenter,
        showProgressIndicator: false,
        title: const Text("Success"),
        description: Text(descp),
      ).show(context);

  buildNotificationError(controller, context, descp) => ElegantNotification(
        icon: Lottie.asset(
          'assets/animations/error.json',
          controller: controller,
          repeat: true,
          width: MediaQuery.of(context).size.width * 0.1,
          height: MediaQuery.of(context).size.height * 0.1,
          onLoaded: (composition) {
            controller
              ..duration = composition.duration
              ..reset()
              ..forward();
          },
        ),
        toastDuration: const Duration(milliseconds: 1500),
        animationDuration: const Duration(milliseconds: 500),
        animation: AnimationType.fromTop,
        notificationPosition: NotificationPosition.topCenter,
        showProgressIndicator: false,
        title: const Text("Error"),
        description: Text(descp),
      ).show(context);

  buildNotificationInfo(controller, context, title, descp) =>
      ElegantNotification(
        icon: Lottie.asset(
          'assets/animations/information.json',
          controller: controller,
          repeat: true,
          width: MediaQuery.of(context).size.width * 0.1,
          height: MediaQuery.of(context).size.height * 0.1,
          onLoaded: (composition) {
            controller
              ..duration = composition.duration
              ..reset()
              ..forward();
          },
        ),
        toastDuration: const Duration(milliseconds: 1500),
        animationDuration: const Duration(milliseconds: 500),
        animation: AnimationType.fromTop,
        notificationPosition: NotificationPosition.topCenter,
        showProgressIndicator: false,
        title: Text(title),
        description: Text(descp),
      ).show(context);
}
