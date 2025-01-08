import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:myproject/core/constans/app_colors.dart';
import 'package:myproject/core/constans/app_distances.dart';
import 'package:shimmer/shimmer.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDistances.borderRadius)),
      child: MaterialButton(
        onPressed: () {},
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDistances.borderRadius)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                _buildProductImage(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [],
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppDistances.smallPadding,
                    vertical: AppDistances.smallPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "IPhone 16 Pro Max ",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Row(
                      children: [
                        Text(
                          "3.5",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const Icon(
                          Icons.star,
                          size: 15,
                        ),
                        const SizedBox(
                          width: AppDistances.smallPadding,
                        ),
                        Text(
                          "12",
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const Text(
                          "128",
                        ),
                        const SizedBox(
                          width: AppDistances.smallPadding,
                        ),
                        Container(
                          height: 15,
                          width: 15,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            border: Border.all(
                              width: 1,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Expanded(child: Text("5000\$")),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage() => CachedNetworkImage(
        placeholder: (context, url) => Center(
          child: Shimmer.fromColors(
            baseColor: AppColors.greyColor.withOpacity(0.5),
            highlightColor: AppColors.greyLightColor,
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.20,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ),
        imageBuilder: (context, imageProvider) => Container(
          height: MediaQuery.sizeOf(context).height * 0.20,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Image(
            image: imageProvider,
            fit: BoxFit.contain,
          ),
        ),
        fadeInDuration: const Duration(milliseconds: 4),
        fadeOutDuration: const Duration(milliseconds: 4),
        imageUrl: '',
        errorWidget: (context, url, error) => Container(
          height: MediaQuery.sizeOf(context).height * 0.20,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: const Icon(
            Icons.abc,
          ),
        ),
        fit: BoxFit.cover,
      );
}
