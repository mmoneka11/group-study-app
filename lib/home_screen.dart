import 'package:flutter/material.dart';
import 'grouplisting.dart';
import 'package:group_study_app/services/auth_service.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const GroupListing(),
        ),
      );
    } else if (index == 3) {
      // profile - show dialog with sign out
      final username = AuthService.instance.getCurrentUsername() ?? 'User';
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Profile'),
          content: Text('Signed in as $username'),
          actions: [
            TextButton(
              onPressed: () {
                AuthService.instance.signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
              child: const Text('Sign out'),
            ),
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
          ],
        ),
      );
    }
  }

  Widget _buildActionButton(String text, IconData icon, Color color, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(width: 8),
            Expanded(
              child: Text(text, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 14)),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGroupCard(String title, String description, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.white.withOpacity(0.3), shape: BoxShape.circle), child: Icon(icon, color: Colors.white)),
          const SizedBox(width: 16),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 4),
            Text(description, style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.8))),
          ])),
          IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final username = AuthService.instance.getCurrentUsername() ?? 'User';
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Home', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24)),
        centerTitle: false,
        actions: [Padding(padding: const EdgeInsets.only(right: 12), child: Center(child: Text('Hi, $username', style: const TextStyle(color: Colors.black))))],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(16)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Welcome to Group Study!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
              const SizedBox(height: 8),
              const Text('Join or create study groups to collaborate with others', style: TextStyle(fontSize: 14, color: Colors.grey)),
              const SizedBox(height: 20),
              Row(children: [
                Expanded(child: _buildActionButton('Create\nGroup', Icons.add_circle_outline, Colors.blue, onTap: () {})),
                const SizedBox(width: 12),
                Expanded(child: _buildActionButton('Join\nGroup', Icons.group_add, Colors.green, onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const GroupListing()));
                })),
              ]),
            ]),
          ),
          const SizedBox(height: 32),
          const Text('Features Groups', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
          const SizedBox(height: 16),
          _buildGroupCard('Physics', '250+ members', Colors.orange[400]!, Icons.science),
          const SizedBox(height: 16),
          _buildGroupCard('IT Group', 'Menu description.', Colors.purple[400]!, Icons.computer),
          const SizedBox(height: 16),
          _buildGroupCard('Code Group', 'Menu description.', Colors.green[400]!, Icons.code),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Groups'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
