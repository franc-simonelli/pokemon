import 'dart:async';

import 'package:flutter/material.dart';

VoidCallback debounce(
  VoidCallback callback,
  int wait, {
  bool leading = false,
  bool trailing = true,
}) {
  Timer? debounceTimer;

  return () {
    if (debounceTimer?.isActive ?? false) {
      if (trailing) {
        debounceTimer?.cancel();
        debounceTimer = Timer(Duration(milliseconds: wait), callback);
      }
    } else {
      if (leading) {
        callback();
      }
      debounceTimer = Timer(Duration(milliseconds: wait), () {
        if (trailing) {
          callback();
        }
      });
    }
  };
}
