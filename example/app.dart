// Copyright (c) 2016, Adao Jr. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

import 'package:google_qr/google_qr.dart';

void main() {
  InputElement width = querySelector('#width');
  InputElement height = querySelector('#height');
  TextAreaElement text = querySelector('#text');
  ButtonElement submit = querySelector('#submit');
  DivElement form = querySelector('#form-container');
  ImageElement image = querySelector('#image');

  submit.onClick.listen((_) {
    try {
      GoogleQr qr = new GoogleQr(text.value,
          height: int.parse(height.value), width: int.parse(width.value));
      form.hidden = true;
      image.src = qr.url.toString();
    }
    on Exception catch(e){
      window.alert(e.toString());
    }
  });
}
