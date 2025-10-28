import 'package:flutter/material.dart';
import 'package:group_study_app/home_screen.dart';
import 'groupdetails.dart';
import 'package:group_study_app/services/group_service.dart';

class GroupListing extends StatefulWidget {
  const GroupListing({super.key});

  @override
  State<GroupListing> createState() => _GroupListingState();
}

class _GroupListingState extends State<GroupListing> {
  String selectedFilter = 'All';
  final TextEditingController searchController = TextEditingController();
  Group? selectedGroup;

  List<Group> groups = [];

  @override
  void initState() {
    super.initState();
    fetchGroupsFromAssets().then((loaded) {
      setState(() {
        groups = loaded;
      });
    }).catchError((err) {
      debugPrint('Failed to load groups: $err');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left side - Group Listing
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[100],
              child: Column(
                children: [
                  Container(padding: const EdgeInsets.all(16), child: const Text('Group Listing', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Search Groups',
                        prefixIcon: const Icon(Icons.menu),
                        suffixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        _buildFilterTab('All'),
                        _buildFilterTab('Ongoing'),
                        _buildFilterTab('Upcoming'),
                        _buildFilterTab('Others'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: groups.length,
                      itemBuilder: (context, index) {
                        final group = groups[index];
                        return _buildGroupCard(group);
                      },
                    ),
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: Colors.grey[300]!))),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                      IconButton(icon: const Icon(Icons.home, color: Colors.grey), onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                      }),
                      IconButton(icon: const Icon(Icons.settings, color: Colors.grey), onPressed: () {}),
                      IconButton(icon: const Icon(Icons.list, color: Colors.blue), onPressed: () {}),
                      IconButton(icon: const Icon(Icons.person, color: Colors.grey), onPressed: () {}),
                    ]),
                  ),
                ],
              ),
            ),
          ),

          // Right side - Details
          Expanded(
            flex: 1,
            child: selectedGroup != null
                ? GroupDetails(group: selectedGroup!)
                : const Center(child: Text('Select a group to view details', style: TextStyle(fontSize: 18, color: Colors.grey))),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTab(String label) {
    final isSelected = selectedFilter == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = label;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(color: isSelected ? Colors.blue[100] : Colors.transparent, borderRadius: BorderRadius.circular(20)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          if (isSelected) ...[Icon(Icons.check, size: 16, color: Colors.blue[700]), const SizedBox(width: 4)],
          Text(label, style: TextStyle(color: isSelected ? Colors.blue[700] : Colors.grey[600], fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal)),
        ]),
      ),
    );
  }

  Widget _buildGroupCard(Group group) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGroup = group;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: selectedGroup == group ? Border.all(color: Colors.blue, width: 2) : null),
        child: Row(children: [
          CircleAvatar(
            backgroundColor: group.avatarColor,
            radius: 20,
            child: group.avatarImage != null
                ? ClipOval(child: Image.asset(group.avatarImage!, width: 40, height: 40, fit: BoxFit.cover, errorBuilder: (c, e, s) => Text(group.name[0].toUpperCase(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))))
                : Text(group.name[0].toUpperCase(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(group.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)), Text('${group.memberCount}+ members', style: TextStyle(color: Colors.grey[600], fontSize: 12))])),
          Row(children: [Icon(Icons.keyboard_arrow_up, color: Colors.grey[400]), Text('A', style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w500))]),
        ]),
      ),
    );
  }
}

class Group {
  final String name;
  final int memberCount;
  final Color avatarColor;
  final String? avatarImage;
  final String description;
  final String admin;
  final List<String> discussionTopics;

  Group({required this.name, required this.memberCount, required this.avatarColor, this.avatarImage, required this.description, required this.admin, required this.discussionTopics});

  factory Group.fromJson(Map<String, dynamic> json) {
    final colorStr = (json['avatarColor'] as String?) ?? '#FF2196F3';
    int value;
    if (colorStr.startsWith('#')) {
      final hex = colorStr.length == 7 ? 'ff${colorStr.substring(1)}' : colorStr.substring(1);
      value = int.parse(hex, radix: 16);
    } else {
      value = int.parse(colorStr, radix: 16);
    }
    return Group(
      name: json['name'] as String? ?? 'Unknown',
      memberCount: (json['memberCount'] as num?)?.toInt() ?? 0,
      avatarColor: Color(value),
      avatarImage: json['avatarImage'] as String?,
      description: json['description'] as String? ?? '',
      admin: json['admin'] as String? ?? '',
      discussionTopics: (json['discussionTopics'] as List<dynamic>?)?.map((e) => e as String).toList() ?? <String>[],
    );
  }
}
        