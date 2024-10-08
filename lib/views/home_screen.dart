import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widgets/popular_course_card.dart';
import '../widgets/topper_card.dart';
import '../widgets/toggle_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: const SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(Icons.account_circle,
                          size: 40, color: Colors.black),
                      title: Text(
                        'Hi, Krishna',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Better yourself each day everyday',
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                      ),
                    ),
                  ),
                  Icon(Icons.notifications, color: Colors.black),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: homeController.items,
        onTap: null,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ToggleButton(),
            const SizedBox(height: 20),
            _buildFeatureList(context),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildExtras(context, 'assets/freecource.png'),
                  const SizedBox(height: 10),
                  _buildExtras(context, 'assets/attendance.png'),
                  const SizedBox(height: 10),
                  _buildExtras(context, 'assets/store.png'),
                  const SizedBox(height: 10),
                  _buildExtras(context, 'assets/assessment.png'),
                ],
              ),
            ),
            const Text('Toppers of ABC',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TopperCard(
                    url: 'assets/nikhil.png', name: 'Nikhil', score: '94%'),
                TopperCard(
                    url: 'assets/shariq.png', name: 'Shariq', score: '92%'),
                TopperCard(url: 'assets/yash.png', name: 'Yash', score: '89%'),
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Popular Courses',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('View All',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            Obx(() {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: homeController.courses.map((course) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: PopularCourseCard(
                        courseName: course['name'] as String,
                        teacherName: course['teacher'] as String,
                        isLive: course['isLive'] as bool,
                        imageUrl: 'assets/imageone.png',
                      ),
                    );
                  }).toList(),
                ),
              );
            }),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('All Courses',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('View All',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            Obx(() {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: homeController.courses.map((course) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: PopularCourseCard(
                        courseName: course['name'] as String,
                        teacherName: course['teacher'] as String,
                        isLive: course['isLive'] as bool,
                        imageUrl: 'assets/imageone.png',
                      ),
                    );
                  }).toList(),
                ),
              );
            }),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              decoration: BoxDecoration(color: Colors.pink.shade50),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      const ListTile(
                        title: Text('Refer & Earn'),
                        subtitle: Text(
                          'Cashback & Rewards',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      const ListTile(
                        title: Text('Invite Your Friends & Get Up to'),
                        subtitle: Text('₹500 After Registration'),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black87,
                            ),
                            child: const Text(
                              'Invite',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/rewards.png',
                          scale: 1,
                          height: 250,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExtras(BuildContext context, String? img) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      width: 100,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.asset(img ?? ''),
    );
  }

  Widget _buildFeatureList(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildFeatureCard(
              'Free Courses',
              'Start learning today - It\'s completely FREE!',
              'Start',
              Colors.orange.shade400,
              context),
          const SizedBox(width: 16),
          _buildFeatureCard(
              'Live Sections on Exams',
              'Live Section on JEE Exams',
              'Join',
              Colors.green.shade400,
              context),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(String title, String subtitle, String buttonText,
      Color color, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      width: 230,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subtitle,
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
