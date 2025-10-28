import 'package:flutter/material.dart';
import 'grouplisting.dart';

class GroupDetails extends StatefulWidget {
  final Group group;
  const GroupDetails({super.key, required this.group});

  @override
  State<GroupDetails> createState() => _GroupDetailsState();
}

class _GroupDetailsState extends State<GroupDetails> {
  String selectedTab = 'Members';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: [
        Container(padding: const EdgeInsets.all(16), child: const Text('Group Details', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 2), borderRadius: BorderRadius.circular(8)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), border: Border.all(color: Colors.grey, width: 1)),
              child: Row(children: [Text(widget.group.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))]),
            ),
            const SizedBox(height: 16),
            Row(children: [_buildTab('Members'), const SizedBox(width: 20), _buildTab('Stats')]),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), border: Border.all(color: Colors.grey, width: 1)),
              child: Row(children: [
                CircleAvatar(backgroundColor: widget.group.avatarColor, radius: 16, child: Text(widget.group.admin.isNotEmpty ? widget.group.admin[0].toUpperCase() : '?', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14))),
                const SizedBox(width: 12),
                Text(widget.group.admin, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
              ]),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), border: Border.all(color: Colors.grey, width: 1)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('About this group', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                const SizedBox(height: 8),
                Text(widget.group.description, style: const TextStyle(fontSize: 14, color: Colors.black87)),
              ]),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), border: Border.all(color: Colors.grey, width: 1)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Discussion', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                const SizedBox(height: 8),
                ...widget.group.discussionTopics.map((topic) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(children: [const Text('• ', style: TextStyle(fontSize: 16)), Text(topic, style: const TextStyle(fontSize: 14))]),
                    )),
              ]),
            ),
          ]),
        ),
        const Spacer(),
        Container(
          height: 60,
          decoration: BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: Colors.grey[300]!))),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [Icon(Icons.home, color: Colors.grey), Icon(Icons.settings, color: Colors.grey), Icon(Icons.list, color: Colors.grey), Icon(Icons.person, color: Colors.grey)]),
        ),
      ]),
    );
  }

  Widget _buildTab(String label) {
    final isSelected = selectedTab == label;
    return GestureDetector(
      onTap: () => setState(() => selectedTab = label),
      child: Container(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), decoration: BoxDecoration(color: isSelected ? Colors.blue : Colors.grey[200], borderRadius: BorderRadius.circular(20)), child: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.grey[700], fontWeight: FontWeight.w500))),
    );
  }
}
