import 'package:bonyeza_kazi/common/constants/style.dart';
import 'package:bonyeza_kazi/src/presentation/widgets/service_provider_detail_page_widgets/portfolio_gallery_image_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PortfolioGalleryDetailPage extends StatefulWidget {
  final List<String> imagePaths;
  final int currentIndex;

  PortfolioGalleryDetailPage(
      {Key key, @required this.imagePaths, @required this.currentIndex})
      : super(key: key);

  @override
  _PortfolioGalleryDetailPageState createState() =>
      _PortfolioGalleryDetailPageState();
}

class _PortfolioGalleryDetailPageState
    extends State<PortfolioGalleryDetailPage> {
  int _currentIndex;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kBlueBackgroundColor,
        elevation: 3.h,
        title: Txt('Photo Viewer', style: kAppBarTxtStyle),
        centerTitle: true,
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Stack(
      children: <Widget>[
        _buildPhotoViewGallery(),
        _buildIndicator(),
      ],
    );
  }

  Widget _buildIndicator() {
    return Positioned(
      bottom: 0.0,
      left: 0.0,
      right: 0.0,
      child: _buildImageCarouselSlider(),
    );
  }

  Widget _buildImageCarouselSlider() {
    return CarouselSlider.builder(
      itemCount: widget.imagePaths.length,
      itemBuilder: (BuildContext context, int index) {
        return PortfolioGalleryImageWidget(
          imagePath: widget.imagePaths[index],
          onImageTap: () => _pageController.jumpToPage(index),
        );
      },
      options: CarouselOptions(
          height: 200.h,
          viewportFraction: 0.21,
          enlargeCenterPage: true,
          initialPage: _currentIndex),
    );
  }

  PhotoViewGallery _buildPhotoViewGallery() {
    return PhotoViewGallery.builder(
      itemCount: widget.imagePaths.length,
      builder: (BuildContext context, int index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: NetworkImage(widget.imagePaths[index]),
          minScale: PhotoViewComputedScale.contained * 0.8,
          maxScale: PhotoViewComputedScale.covered * 1.8,
        );
      },
      backgroundDecoration: BoxDecoration(color: Colors.white),
      enableRotation: true,
      scrollPhysics: const BouncingScrollPhysics(),
      pageController: _pageController,
      loadingBuilder: (BuildContext context, ImageChunkEvent event) {
        return Center(child: CircularProgressIndicator());
      },
      onPageChanged: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
