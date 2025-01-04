import '../../../utility/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          DrawerListTile(
            title: "Painel",
            svgSrc: "assets/icons/menu_dashboard.svg",
            press: () {
              context.mainScreenProvider.navigateToScreen('Dashboard');
            },
          ),
          DrawerListTile(
            title: "Cateoria",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              context.mainScreenProvider.navigateToScreen('Category');
            },
          ),
          DrawerListTile(
            title: "Sub Categoria",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {
              context.mainScreenProvider.navigateToScreen('SubCategory');
            },
          ),
          DrawerListTile(
            title: "Marcas",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              context.mainScreenProvider.navigateToScreen('Brands');
            },
          ),
          DrawerListTile(
            title: "Tipo de variante",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {
              context.mainScreenProvider.navigateToScreen('VariantType');
            },
          ),
          DrawerListTile(
            title: "variante",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {
              context.mainScreenProvider.navigateToScreen('Variants');
            },
          ),
          DrawerListTile(
            title: "Pedidos",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {
              context.mainScreenProvider.navigateToScreen('Order');
            },
          ),
          DrawerListTile(
            title: "Cupons",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {
              context.mainScreenProvider.navigateToScreen('Coupon');
            },
          ),
          DrawerListTile(
            title: "Cartazes",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              context.mainScreenProvider.navigateToScreen('Poster');
            },
          ),
          DrawerListTile(
            title: "Notificações",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {
              context.mainScreenProvider.navigateToScreen('Notifications');
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(Colors.white54, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
