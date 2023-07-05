import 'package:flutter/material.dart';
import 'package:hapis/models/db_models/users_model.dart';
import 'package:hapis/reusable_widgets/user_elevated_button.dart';

import 'hapis_elevated_button.dart';

class UserComponent extends StatefulWidget {
  final UsersModel user;
  const UserComponent({
    super.key,
    required this.user,
  });

  @override
  State<UserComponent> createState() => _UserComponentState();
}

class _UserComponentState extends State<UserComponent> {
  @override
  Widget build(BuildContext context) {
    // final buttonContent = '${widget.city}\n${widget.country}';

    return
        //Image.asset(imagePath!);

        UserElevatedButton(
      elevatedButtonContent:
          ' ${widget.user.firstName!} ${widget.user.lastName!}',
    );
  }
}
