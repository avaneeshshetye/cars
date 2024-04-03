import 'package:flutter/material.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({Key? key}) : super(key: key);

  @override
  State<DisplayScreen> createState() {
    return _DisplayScreen();
  }
}

class _DisplayScreen extends State<DisplayScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startSlideshow();
  }

  void _startSlideshow() {
    Future.delayed(const Duration(seconds: 3), () {
      _pageController.nextPage(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
      _startSlideshow();
    });
  }

  void _navigationBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: const TextStyle(fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none),
                    ),
                    filled: true,
                    fillColor: Colors.grey[50],
                    contentPadding: const EdgeInsets.only(
                      left: 30,
                    ),
                    suffixIcon: const Padding(
                      padding: EdgeInsets.only(right: 24, left: 16),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100, // Adjust the height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: carOptions.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OptionItem(
                      title: carOptions[index]['title'],
                      image: carOptions[index]['image'],
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                '2024 Newly launched',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            // Slideshow
            Container(
              height: 300,
              width: 400, // Set the height as needed
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  _buildSlideshowImage('assets/images/slideshow.jpg'),
                  _buildSlideshowImage('assets/images/slideshow_1.jpg'),
                  _buildSlideshowImage('assets/images/slideshow_2.jpg'),
                  // Add more images as needed
                ],
              ),
            ),
            BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: _navigationBottomBar,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.message), label: 'Message'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: 'Account'),
                ])
          ],
        ),
      ),
    );
  }

  Widget _buildSlideshowImage(String imagePath) {
    return Image.asset(
      imagePath,
      height: 300,
      width: double.infinity,
      fit: BoxFit.fitHeight,
    );
  }
}

class OptionItem extends StatefulWidget {
  final String title;
  final String image; // Provide the path to the image

  const OptionItem({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  _OptionItemState createState() => _OptionItemState();
}

class _OptionItemState extends State<OptionItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: InkWell(
        onTap: () {
          // Add your onTap logic here
          print("${widget.title} clicked!");
        },
        focusColor: Colors.transparent, // Set focusColor to transparent
        child: Container(
          height: 80, // Adjust the height as needed
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: widget.title == 'Browse All'
                ? isHovered
                    ? Colors.orange[700] // Dark orange when hovered
                    : Colors.orange[
                        600] // Regular orange// Set orange color for "Browse All"
                : isHovered
                    ? Colors.purple[300]
                    : Colors.purple[200],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                widget.image,
                height: 50, // Set the height
                width: 50, // Set the width
              ),
              const SizedBox(height: 8),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> carOptions = [
  {'title': 'Browse All', 'image': 'assets/icons/list.png'},
  {'title': 'Classic', 'image': 'assets/icons/classic-car.png'},
  {'title': 'Sedan', 'image': 'assets/icons/Sedan.png'},
  {'title': 'Hatchback', 'image': 'assets/icons/hatchback.png'},
  {'title': 'Hybrid', 'image': 'assets/icons/hybrid-car.png'},
  {'title': 'Convertible', 'image': 'assets/icons/convertible-car.png'},
  {'title': 'SUV', 'image': 'assets/icons/SUV.png'},
  {'title': 'Electric Vehicle', 'image': 'assets/icons/electric-car.png'},
  {'title': 'Truck', 'image': 'assets/icons/pickup-truck.png'},
];
