import 'package:flutter/material.dart';

class Resources {
  String playlist;
  String blog;
  String topic;

  Resources({this.topic, this.blog, this.playlist});

  static List<Resources> getResources() {
    List<Resources> resources = [];
    resources.add(Resources(
        topic: 'STL',
        blog:
            'https://www.geeksforgeeks.org/the-c-standard-template-library-stl/',
        playlist:
            'https://www.youtube.com/watch?v=LyGlTmaWEPs&list=PLk6CEY9XxSIA-xo3HRYC3M0Aitzdut7AA'));
    resources.add(Resources(
        topic: 'Number Theory',
        blog:
            'https://www.geeksforgeeks.org/number-theory-competitive-programming/',
        playlist:
            'https://www.youtube.com/watch?v=eRkqvQtm4DU&list=PL2q4fbVm1Ik4liHX78IRslXzUr8z5QxsG'));

    resources.add(Resources(
        topic: 'Recursion',
        blog: 'https://www.geeksforgeeks.org/recursion/',
        playlist:
            'https://www.youtube.com/watch?v=kHi1DUhp9kM&list=PL_z_8CaSLPWeT1ffjiImo0sYTcnLzo-wY'));

    resources.add(Resources(
        topic: 'Binary Search',
        blog: 'https://www.geeksforgeeks.org/binary-search/',
        playlist:
            'https://www.youtube.com/watch?v=j7NodO9HIbk&list=PL_z_8CaSLPWeYfhtuKHj-9MpYb6XQJ_f2'));

    resources.add(Resources(
        topic: 'BIT Manipulation',
        blog: 'https://www.geeksforgeeks.org/bitwise-algorithms/',
        playlist:
            'https://www.youtube.com/watch?v=efL86JCONH0&list=PL2q4fbVm1Ik7ip1VkWwe5U_CEb93vw6Iu'));

    resources.add(Resources(
        topic: 'Graph',
        blog:
            'https://www.geeksforgeeks.org/graph-data-structure-and-algorithms/',
        playlist:
            'https://www.youtube.com/watch?v=VW85xQ6GJP4&list=PL2q4fbVm1Ik6DCzm9XZJbNwyHtHGclcEh'));

    resources.add(Resources(
        topic: 'Disjoint Set',
        blog: 'https://www.geeksforgeeks.org/disjoint-set-data-structures/',
        playlist:
            'https://www.youtube.com/watch?v=1mhRZPYCkAY&list=PL2q4fbVm1Ik4JdzE2Bv_UUGBz0TXEIrai'));

    resources.add(Resources(
        topic: 'Advanced Graph',
        blog:
            'https://www.geeksforgeeks.org/graph-data-structure-and-algorithms/',
        playlist:
            'https://www.youtube.com/watch?v=QFzvIwi7BV8&list=PL2q4fbVm1Ik64I3VqbVGRfl_OgYzvzt9m'));
    resources.add(Resources(
        topic: 'Dyanmic Programming',
        blog: 'https://www.geeksforgeeks.org/dynamic-programming/',
        playlist:
            'https://www.youtube.com/watch?v=nqowUJzG-iM&list=PL_z_8CaSLPWekqhdCPmFohncHwz8TY2Go'));

    resources.add(Resources(
      topic: 'Segment Trees',
      blog: 'https://cp-algorithms.com/data_structures/segment_tree.html',
      playlist:
          'https://www.youtube.com/watch?v=nWwt7w2s1So&list=PL2q4fbVm1Ik6v2-emg_JGcC9v2v2YTbvq',
    ));
    return resources;
    print(resources);
  }
}
