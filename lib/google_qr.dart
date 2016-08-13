// Copyright (c) 2016, Adao Jr. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

const int maxChartSize = 300000;

class GoogleQr {
  final String data;
  final bool useHttps;
  final int width;
  final int height;

  GoogleQr(this.data,
      {this.height: 100, this.width: 100, this.useHttps: true}) {
    if (height * width > maxChartSize)
      throw new Exception(
          'The parameters height and width specifies a chart with ${height * width} pixels, which exceeds the maximum size of $maxChartSize pixels.');
  }

  Map<String, String> get _queryParameters =>
      {'cht': 'qr', 'chl': data, 'chs': "${width}x$height"};

  Uri get url {
    String base = "chart.googleapis.com";
    String path = "chart";
    return useHttps
        ? new Uri.https(base, path, _queryParameters)
        : new Uri.http(base, path, _queryParameters);
  }

  String toImageTag() => "<img src='$url' height='$height' width='$width' />";

  ImageElement toImageElement() =>
      new ImageElement(src: url.toString(), width: width, height: height);
}
