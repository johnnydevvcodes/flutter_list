import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_list/app/user_details/screens/user_detail_screen.dart';
import 'package:flutter_list/core/user_entity.dart';
import 'package:gap/gap.dart';

class UserItemWidget extends StatefulWidget {
  const UserItemWidget(this.user, {super.key});
  final UserEntity user;

  @override
  State<UserItemWidget> createState() => _UserItemWidgetState();
}

class _UserItemWidgetState extends State<UserItemWidget> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return CupertinoButton(
      padding: EdgeInsets.zero,
      minSize: 0,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserDetailScreen(widget.user),
          ),
        );
      },
      child: SizedBox(
        height: 90,
        child: Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Gap(8),
              Text(widget.user.id),
              const Gap(8),
              SizedBox(
                width: 68,
                child: Image.network(widget.user.imageUrl),
              ),
              const Gap(8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.user.name, style: textTheme.bodyLarge),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
