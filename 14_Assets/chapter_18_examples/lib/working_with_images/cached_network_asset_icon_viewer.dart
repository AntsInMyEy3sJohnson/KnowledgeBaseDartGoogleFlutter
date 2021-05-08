import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkAssetIconViewer extends StatelessWidget {
  final String _url;

  const CachedNetworkAssetIconViewer(this._url);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        // 'CachedNetworkImage' will download the given image and store it in the
        // device's temporary directory such that follow-up invocations to download
        // the image will result in the image being fetched from local storage rather
        // than being downloaded again.

        // Additional stuff to be configured on the 'CachedNetworkImage' object:
        // * The animation's type and duration
        // * HTTP headers
        // * Image size and box fit

        // In most situations, the use of 'CachedNetworkImage' is preferable to
        // 'Image.network()' because it handles many things that would have to
        // be implemented when using the latter, such as animations, caching, and
        // error handling.
        child: CachedNetworkImage(
          imageUrl: _url,
          // placeholder: (context, url) => const CircularProgressIndicator(),
          progressIndicatorBuilder: (context, url, status) {
            return CircularProgressIndicator(
              value: status.progress,
            );
          },
          errorWidget: (context, url, error) => const Icon(Icons.error_outline),
        ),
      ),
    );
  }
}
