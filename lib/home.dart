import 'package:carrosselproject/slide_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  int _currentPage = 0;

  var _listSlide = [
    {'id': 0, 'image': 'imagens/lobos.jpg'},
    {'id': 1, 'image': 'imagens/aranha.jpg'},
    {'id': 2, 'image': 'imagens/praia.jpg'}
  ];

  @override
  void initState() {
    _pageController.addListener(() {
      int next = _pageController.page.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: <Widget>[
          Expanded(
            child: Container(
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: _listSlide.length,
                  itemBuilder: (_, currentIndex) {
                    bool activePage = currentIndex == _currentPage;
                    return SlideTile(
                      activePage: activePage,
                      imagem: _listSlide[currentIndex]['image'],
                    );
                  }),
            ),
          ),
          _buildBullets(),
        ]),
      ),
    );
  }

  Widget _buildBullets() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _listSlide.map((i) {
          return InkWell(
            onTap: (){
              setState(() {
                _pageController.jumpToPage(i['id']);
                _currentPage = i ['id'];
              });
            },
            child: Container(
                margin: EdgeInsets.all(10),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: _currentPage == i['id'] ? Colors.red : Colors.grey)),
          );
        }).toList(),
      ),
    );
  }
}
