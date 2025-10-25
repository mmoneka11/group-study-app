import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:group_study_app/grouplisting.dart';

Future<List<Group>> fetchGroupsFromAssets() async {
  final jsonStr = await rootBundle.loadString('assets/groups.json');
  final List<dynamic> data = json.decode(jsonStr) as List<dynamic>;
  return data.map((e) => Group.fromJson(e as Map<String, dynamic>)).toList();
}