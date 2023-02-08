import 'package:faramove_assesment/constants/pallets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../shared/text_view.dart';

const double kAppBarHeight = 75;

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool hasBack;
  final String title;
  final bool hasTrailing;
  final Widget? trailing;
  final Widget? leading;
  final VoidCallback onMenuTap;

  const HomeAppBar({
    Key? key,
    this.hasBack = true,
    this.title = '',
    this.hasTrailing = false,
    this.trailing,
    this.leading,
    required this.onMenuTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: 32,
                width: 32,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: SvgPicture.asset(
                  'assets/svgs/account.svg',
                )),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: TextView(
                text: 'Hi, Sarah',
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            IconContainer(
              icon: SvgPicture.asset('assets/svgs/chat.svg'),
            ),
            SizedBox(
              width: 16,
            ),
            IconContainer(
              icon: SvgPicture.asset('assets/svgs/notification.svg'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kAppBarHeight);
}

class IconContainer extends StatelessWidget {
  const IconContainer({
    Key? key,
    this.onTap,
    this.size,
    required this.icon,
    this.color,
  }) : super(key: key);

  final Color? color;
  final double? size;
  final VoidCallback? onTap;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size ?? 32,
        height: size ?? 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color ?? Pallets.blueGrey,
        ),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
