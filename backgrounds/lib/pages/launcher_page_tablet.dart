import 'package:backgrounds/models/layout_model.dart';
import 'package:backgrounds/routes/routes.dart';
import 'package:backgrounds/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherPageTablet extends StatelessWidget {
  static const String routeName = 'LauncherPage';

  const LauncherPageTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final layoutModel = Provider.of<LayoutModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diseños en Flutter - Tablet'),
      ),
      drawer: const _MenuPrincipal(),
      body: Row(
        children: [
          const SizedBox(width: 300, height: double.infinity, child: _ListaOpciones()),
          Container(
            width: 1,
            height: double.infinity,
            color: Provider.of<ThemeChanger>(context).currentTheme.colorScheme.secondary,
          ),
          Expanded(child: layoutModel.currentPage),
        ],
      ),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  const _ListaOpciones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context).currentTheme;
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => Divider(color: theme.colorScheme.secondary),
      itemCount: pageRoutes.length,
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(pageRoutes[index].icon, color: theme.colorScheme.secondary),
        title: Text(pageRoutes[index].title),
        trailing: Icon(Icons.chevron_right, color: theme.primaryColorLight),
        onTap: () => Provider.of<LayoutModel>(context, listen: false).currentPage = pageRoutes[index].page,
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    final theme = themeChanger.currentTheme;
    return Drawer(
      child: Column(
        children: [
          SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: 200,
              child: CircleAvatar(
                backgroundColor: theme.primaryColorLight,
                child: const Text('SL', style: TextStyle(fontSize: 50)),
              ),
            ),
          ),
          const Expanded(child: _ListaOpciones()),
          ListTile(
            leading: Icon(Icons.lightbulb_outline, color: theme.colorScheme.secondary),
            title: const Text('Dark Mode'),
            trailing: Switch.adaptive(
              value: themeChanger.dartTheme,
              activeColor: theme.colorScheme.secondary,
              onChanged: (value) => themeChanger.dartTheme = value,
            ),
          ),
          SafeArea(
            top: false,
            left: false,
            right: false,
            bottom: true,
            child: ListTile(
              leading: Icon(Icons.add_to_home_screen, color: theme.colorScheme.secondary),
              title: const Text('Custom Theme'),
              trailing: Switch.adaptive(
                value: themeChanger.customTheme,
                activeColor: theme.colorScheme.secondary,
                onChanged: (value) => themeChanger.customTheme = value,
              ),
            ),
          )
        ],
      ),
    );
  }
}
