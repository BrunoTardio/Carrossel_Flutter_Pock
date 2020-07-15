import 'package:flutter/material.dart';

class SlideTile extends StatelessWidget {
  final String imagem;
  final bool activePage;

  const SlideTile({Key key, this.imagem, this.activePage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double top = this.activePage ? 50 : 150;
    final double blur = this.activePage ? 30 : 0;
    final double offset = this.activePage ? 20 : 0;

    return AnimatedContainer(
      curve: Curves.easeOutQuint,
      duration: Duration(microseconds: 500),
      margin: EdgeInsets.only(top: top, bottom: 100, right: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(this.imagem),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black45,
                blurRadius: blur,
                offset: Offset(offset, offset)),
          ]),
    );
  }
}
