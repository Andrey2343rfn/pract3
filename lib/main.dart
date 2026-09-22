import 'package:flutter/material.dart';
import 'widgets/contact_card.dart';

void main() {
  runApp(const DeveloperCardApp());
}

class DeveloperCardApp extends StatefulWidget {
  const DeveloperCardApp({super.key});

  @override
  State<DeveloperCardApp> createState() => _DeveloperCardAppState();
}

class _DeveloperCardAppState extends State<DeveloperCardApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Візитівка розробника',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: DeveloperProfileScreen(
        isDarkMode: _isDarkMode,
        onThemeChanged: _toggleTheme,
      ),
    );
  }
}

class DeveloperProfileScreen extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onThemeChanged;

  const DeveloperProfileScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Візитівка розробника'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.wb_sunny : Icons.nightlight_round),
            onPressed: onThemeChanged,
            tooltip: 'Змінити тему',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundColor: theme.colorScheme.primaryContainer,
              child: Icon(
                Icons.person,
                size: 70,
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Андрій Свидан',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Junior Flutter Developer',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Створюю зручні та сучасні мобільні застосунки.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Контакти та звʼязок',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const ContactCard(
              icon: Icons.email,
              title: 'Email',
              value: 'andriy.svidan@example.com',
            ),
            const ContactCard(
              icon: Icons.phone,
              title: 'Телефон',
              value: '+380 (99) 123-45-67',
            ),
            const ContactCard(
              icon: Icons.code,
              title: 'GitHub',
              value: 'github.com/andriysvidan',
            ),
            const ContactCard(
              icon: Icons.location_on,
              title: 'Локація',
              value: 'Київ, Україна',
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: onThemeChanged,
                icon: Icon(isDarkMode ? Icons.wb_sunny : Icons.nightlight_round),
                label: Text(isDarkMode ? 'Увімкнути світлу тему' : 'Увімкнути темну тему'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}