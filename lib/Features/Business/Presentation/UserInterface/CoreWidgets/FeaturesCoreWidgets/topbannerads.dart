import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/BlocStates/blocstates.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ConstStrings/ApisStrings/apiurls.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/StateMangement/Blocs/slider_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class BannerAdsWidget extends StatefulWidget {
  final double height;
  const BannerAdsWidget({super.key, required this.height});

  @override
  // ignore: library_private_types_in_public_api
  _BannerAdsWidgetState createState() => _BannerAdsWidgetState();
}

class _BannerAdsWidgetState extends State<BannerAdsWidget> {
  List<String> images = [];

  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<GetSliderBloc, BlocStates>(
      builder: (ctx, state) {
        var list = BlocProvider.of<GetSliderBloc>(context).getSliderLocal();

        if (state is Loading) {
          return _buildShimmerLoading(size);
        }

        if (state is Sucessfull) {
          images = list.map((e) => '${ApiUrls.baseUrl}/${e.image}').toList();

          return _buildImageSlider(size);
        }

        return Container(); // Placeholder for failure state
      },
    );
  }

  Widget _buildShimmerLoading(Size size) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: size.height * .01,
        vertical: size.height * .009,
      ),
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: Colors.grey.withOpacity(.2),
          width: 1.0,
        ),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          color: Colors.white,
          height: widget.height,
          width: double.infinity,
        ),
      ),
    );
  }

 Widget _buildImageSlider(Size size) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.0),
      border: Border.all(
        color: Colors.grey.withOpacity(.2),
        width: 1.0,
      ),
    ),
    margin: EdgeInsets.symmetric(
      horizontal: size.height * .01,
      vertical: size.height * .009,
    ),
    height: widget.height,
    child: CarouselSlider.builder(
      itemCount: images.length,
      itemBuilder: (context, index, realIndex) {
        return AspectRatio(
          aspectRatio: 16 / 9,  // Ensures consistent aspect ratio
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: CachedNetworkImage(
              imageUrl: images[index],
              fit: BoxFit.cover, // Ensures images fill the container
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  color: Colors.white,
                  height: widget.height,
                  width: double.infinity,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: widget.height,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
        enlargeCenterPage: true,
        viewportFraction: 1,  // Adjust this for better image consistency
      ),
    ),
  );
}
}
