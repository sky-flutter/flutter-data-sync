import 'package:flutter/material.dart';
import 'package:flutter_app/src/model/users_response.dart';
import 'package:flutter_app/src/theme/color.dart';
import 'package:flutter_app/src/widget/container/item_container.dart';
import 'package:flutter_app/src/widget/imageview/custom_network_image.dart';
import 'package:flutter_app/src/widget/text/text_bold.dart';

class UserItem extends StatefulWidget {
  final UsersResponse usersResponse;

  UserItem(this.usersResponse);

  @override
  _UserItemState createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  @override
  Widget build(BuildContext context) {
    return MyItemContainer(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 24),
      outlineColor: MyColors.color_0A0F3712,
      shadowColor: MyColors.color_F8FAFB,
      padding: const EdgeInsets.all(16),
      children: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: CustomNetworkImage(
              imageUrl: widget.usersResponse.avatar,
              width: 56,
              height: 56,
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: MyText(
                  widget.usersResponse.getFullName(),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: MyColors.color_000000,
                ),
              ),
              MyText(
                widget.usersResponse.email,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: MyColors.color_000000,
              ),
              SizedBox(
                height: 16,
              )
            ],
          ),
        ],
      ),
    );
  }
}
