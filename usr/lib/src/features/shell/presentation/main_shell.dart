import 'package:flutter/material.dart';
import '../../dashboard/presentation/dashboard_screen.dart';
import '../../employee/presentation/employee_list_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _selectedIndex = 0;
  bool _isExtended = true;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const EmployeeListScreen(), // Core HR
    const Center(child: Text('Recruitment Module (Coming Soon)')),
    const Center(child: Text('Time & Attendance (Coming Soon)')),
    const Center(child: Text('Leave Management (Coming Soon)')),
    const Center(child: Text('Performance (Coming Soon)')),
    const Center(child: Text('Payroll & Benefits (Coming Soon)')),
  ];

  final List<NavigationRailDestination> _destinations = [
    const NavigationRailDestination(
      icon: Icon(Icons.dashboard_outlined),
      selectedIcon: Icon(Icons.dashboard),
      label: Text('Dashboard'),
    ),
    const NavigationRailDestination(
      icon: Icon(Icons.people_outline),
      selectedIcon: Icon(Icons.people),
      label: Text('Core HR'),
    ),
    const NavigationRailDestination(
      icon: Icon(Icons.person_search_outlined),
      selectedIcon: Icon(Icons.person_search),
      label: Text('Recruitment'),
    ),
    const NavigationRailDestination(
      icon: Icon(Icons.access_time),
      selectedIcon: Icon(Icons.access_time_filled),
      label: Text('Attendance'),
    ),
    const NavigationRailDestination(
      icon: Icon(Icons.calendar_today_outlined),
      selectedIcon: Icon(Icons.calendar_today),
      label: Text('Leave'),
    ),
    const NavigationRailDestination(
      icon: Icon(Icons.trending_up),
      selectedIcon: Icon(Icons.trending_up),
      label: Text('Performance'),
    ),
    const NavigationRailDestination(
      icon: Icon(Icons.payments_outlined),
      selectedIcon: Icon(Icons.payments),
      label: Text('Payroll'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;
    
    return Scaffold(
      body: Row(
        children: [
          if (isDesktop)
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              extended: _isExtended,
              destinations: _destinations,
              leading: Column(
                children: [
                  const SizedBox(height: 16),
                  IconButton(
                    icon: Icon(_isExtended ? Icons.menu_open : Icons.menu),
                    onPressed: () {
                      setState(() {
                        _isExtended = !_isExtended;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  if (_isExtended)
                    const Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        'COULD.AI HRMS',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                ],
              ),
            ),
          Expanded(
            child: Column(
              children: [
                // Top Bar
                Container(
                  height: 64,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(bottom: BorderSide(color: Color(0xFFE2E8F0))),
                  ),
                  child: Row(
                    children: [
                      if (!isDesktop)
                        IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: () {
                            // TODO: Implement drawer for mobile
                          },
                        ),
                      Text(
                        _destinations[_selectedIndex].label.toString().replaceAll('Text("', '').replaceAll('")', ''),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.notifications_outlined),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 8),
                      const CircleAvatar(
                        backgroundColor: Color(0xFF0F172A),
                        child: Text('AD', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
                // Main Content
                Expanded(
                  child: _screens[_selectedIndex],
                ),
              ],
            ),
          ),
        ],
      ),
      // Add Drawer for mobile later
    );
  }
}
