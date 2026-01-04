import 'package:web_app/core/const/app_export.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final DashboardController controller = Get.put(DashboardController());

  final List<Widget> pages = const [
    Center(child: Text("Dashboard Page")),
    Center(child: Text("Users Page")),
    Center(child: Text("Settings Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          /// 🔹 SIDE NAVBAR
          Container(
            width: 240,
            color: Colors.black87,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Admin Panel",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                _navItem(Icons.dashboard, "Dashboard", 0),
                _navItem(Icons.people, "Users", 1),
                _navItem(Icons.settings, "Settings", 2),
              ],
            ),
          ),

          /// 🔹 MAIN CONTENT
          Expanded(
            child: Obx(
              () => Container(
                color: Colors.grey.shade100,
                child: pages[controller.selectedIndex.value],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String title, int index) {
    return Obx(() {
      final bool isSelected = controller.selectedIndex.value == index;

      return InkWell(
        onTap: () => controller.changePage(index),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white24 : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      );
    });
  }
}
