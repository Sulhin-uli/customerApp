import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerSilder extends StatelessWidget {
  const BannerSilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.bottomCenter,
      children: [BannerSection(), const CashInfo()],
    );
  }
}

class BannerSection extends StatefulWidget {
  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  final List<String> _imgList = [
    // "assets/images/banner_1.jpg",
    "assets/images/banner_2.jpg",
    // "assets/images/banner_3.jpg",
    "assets/images/banner_4.jpg",
    // "assets/images/banner_5.jpg",
    // "assets/images/banner_6.jpg",
    // "assets/images/banner_7.jpg",
  ];

  int? _current;

  @override
  void initState() {
    _current = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [_buildBanner(), _builIndicator()],
    );
  }

  Container _buildBanner() {
    return Container(
      padding: EdgeInsets.only(bottom: 55),
      width: double.infinity,
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 1.873,
          viewportFraction: 1.0,
          autoPlay: true,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          },
        ),
        items: _imgList
            .map((item) => Image.asset(
                  item,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ))
            .toList(),
      ),
    );
  }

  _builIndicator() => Positioned(
        bottom: 0,
        top: 90,
        left: 8,
        child: Row(
          children: _imgList.map(
            (url) {
              int index = _imgList.indexOf(url);
              return Container(
                  width: 8,
                  height: _current == index ? 8 : 1,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    shape: _current == index
                        ? BoxShape.circle
                        : BoxShape.rectangle,
                    color: Colors.transparent,
                  ));
            },
          ).toList(),
        ),
      );
}

class CashInfo extends StatelessWidget {
  const CashInfo();

  @override
  Widget build(BuildContext context) {
    final verticalDivider = VerticalDivider(
      indent: 5,
      endIndent: 5,
      thickness: 1.5,
      width: 24,
      color: Colors.grey[300],
    );
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.2,
                blurRadius: 7,
                offset: Offset(0, 1))
          ]),
      child: IntrinsicHeight(
        child: Row(
          children: [
            SizedBox(
              width: 4,
            ),
            Image.network(
              "https://www.nicepng.com/png/detail/23-231666_scan-qr-code-comments-scan-qr-code-icon.png",
              height: 45,
              color: Colors.white,
              // color: Colors.black54,
            ),
            // verticalDivider,
            // _buildInfo(
            //     image: "https://image.pngaaa.com/195/1257195-small.png",
            //     title: "5000.0",
            //     subTitle: " "),
            // verticalDivider,
            // _buildInfo(
            //     image: "https://image.pngaaa.com/195/1257195-small.png",
            //     title: "1000.0",
            //     subTitle: " ",
            //     isCoin: false),
          ],
        ),
      ),
    );
  }
}

_buildInfo({String? image, String? title, String? subTitle, isCoin = false}) {
  final height = 22.0;
  return Expanded(
    flex: 3,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: height,
          child: Row(
            children: [
              Image.network(
                image!,
                height: isCoin ? height - 7.0 : null,
                color: isCoin ? Colors.amber : null,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                title!,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
        ),
        Text(
          subTitle!,
          style: TextStyle(fontSize: 11, color: Colors.grey[700]),
          maxLines: 2,
        )
      ],
    ),
  );
}
