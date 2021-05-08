//

import 'package:flutter/material.dart';

class NetworkAssetIconViewer extends StatelessWidget {
  final String _url;

  const NetworkAssetIconViewer(this._url);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(
          _url,
          // Caution: Image widget rebuilt very often when using 'loadingBuilder()',
          // which is fine when displaying a progress indicator, but if a static
          // widget is used instead (i. e., one whose contents do not depend
          // on the progress), then 'frameBuilder()' should be used instead.
          // Note that 'loadingBuilder()' and 'frameBuilder()' can also be
          // chained.
          loadingBuilder: (context, child, progress) {
            if (progress == null) {
              return child;
            }
            return _determineProgressWidgetToUse(progress);
          },
        ),
      ),
    );
  }

  Widget _determineProgressWidgetToUse(ImageChunkEvent progress) {
    final int total = progress.expectedTotalBytes;

    // For a classic linear progress bar, use 'LinearProgressIndicator'

    if (total != null) {
      return _CircularProgressIndicatorWithProgress(
          total, progress.cumulativeBytesLoaded);
    }

    return _CircularProgressIndicatorWoProgress();
  }
}

class _CircularProgressIndicatorWithProgress extends StatelessWidget {
  final int _total;
  final int _loaded;

  const _CircularProgressIndicatorWithProgress(this._total, this._loaded);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        value: _loaded / _total,
      ),
    );
  }
}

class _CircularProgressIndicatorWoProgress extends StatelessWidget {
  const _CircularProgressIndicatorWoProgress();

  @override
  Widget build(BuildContext context) =>
      Center(child: CircularProgressIndicator());
}
