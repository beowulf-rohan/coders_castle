// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorChange extends ChangeNotifier {
  bool codechef = false, codeforces = false;
  bool leetcode = false, atcoder = false;

  // bool getState(String platform) {
  //   if(platform == 'leetcode') {
  //     return leetcode;
  //   }
  //   else if(platform == 'codechef') {
  //     return codechef;
  //   }
  //   else if(platform == 'codeforces') {
  //     return codeforces;
  //   }
  //   else if(platform == 'atcoder') {
  //     return atcoder;
  //   }
  // }

  void changeSpinnerState(String platform) {
    if(platform == 'leetcode') {
      leetcode = !leetcode;
      notifyListeners();
    }
    else if(platform == 'codechef') {
      codechef = !codechef;
      notifyListeners();
    }
    else if(platform == 'codeforces') {
      codeforces = !codeforces;
      notifyListeners();
    }
    else if(platform == 'atcoder') {
      atcoder = !atcoder;
      notifyListeners();
    }
  }
}