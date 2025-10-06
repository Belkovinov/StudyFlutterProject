import 'package:flutter/material.dart';
import 'pages/homepage.dart';
import 'pages/services.dart';
import 'pages/profile.dart';

void main() {  runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: const MainScreen(),
  ),
);
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Переменная для хранения индекса выбранной страницы
  int _selectedIndex = 0;

  // Список виджетов (страниц), которые мы будем отображать
  static const List<Widget> _pages = <Widget>[
    HomePage(),
    ServicesPage(),
    ProfilePage(),
  ];

  // Список заголовков для AppBar
  static const List<String> _pageTitles = <String>[
    'Главная',
    'Услуги',
    'Профиль',
  ];

  // Метод для обновления индекса при нажатии на элемент BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Заголовок меняется в зависимости от выбранной страницы
        title: Text(_pageTitles[_selectedIndex]),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        // Добавляем кнопки для переключения в AppBar
        actions: <Widget>[
          // Кнопка "Главная"
          IconButton(
            icon: Icon(
              Icons.home,
              // Подсвечиваем иконку, если страница активна
              color: _selectedIndex == 0 ? Colors.white : Colors.white70,
            ),
            onPressed: () => _onItemTapped(0),
            tooltip: 'Главная',
          ),
          // Кнопка "Услуги"
          IconButton(
            icon: Icon(
              Icons.medical_services,
              color: _selectedIndex == 1 ? Colors.white : Colors.white70,
            ),
            onPressed: () => _onItemTapped(1),
            tooltip: 'Услуги',
          ),
          // Кнопка "Профиль"
          IconButton(
            icon: Icon(
              Icons.person,
              color: _selectedIndex == 2 ? Colors.white : Colors.white70,
            ),
            onPressed: () => _onItemTapped(2),
            tooltip: 'Профиль',
          ),
        ],
      ),
      // Тело Scaffold'а показывает ту страницу, которая выбрана в данный момент
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      // Нижнее навигационное меню
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Услуги',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
        currentIndex: _selectedIndex, // Текущий активный элемент
        selectedItemColor: Colors.blue, // Цвет выбранного элемента
        onTap: _onItemTapped, // Метод, который вызывается при нажатии
      ),
    );
  }
}
