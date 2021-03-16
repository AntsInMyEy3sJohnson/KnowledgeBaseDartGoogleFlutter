import 'package:chapter_11_examples/persisting_state_with_hydrated_bloc/theme_bloc.dart';
import 'package:chapter_11_examples/persisting_state_with_hydrated_bloc/theme_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeChooser extends StatelessWidget {
  const ThemeChooser();

  @override
  Widget build(BuildContext context) {
    final themeBloc = context.watch<ThemeBloc>();

    return Scaffold(
      backgroundColor: themeBloc.state.backgroundColor,
      appBar: AppBar(
        title: Text("Storing state with HydratedBloc"),
      ),
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Currently chosen theme: ${themeBloc.state}"),
              RaisedButton(
                child: const Text("Change theme"),
                onPressed: () {
                  final response = showDialog<String>(
                      context: context,
                      builder: (BuildContext buildContext) {
                        return SimpleDialog(
                          title: const Text("Please choose your theme."),
                          children: [
                            SimpleDialogOption(
                              onPressed: () => Navigator.pop(context, "light"),
                              child: const Text("Warrior of Light"),
                            ),
                            SimpleDialogOption(
                              onPressed: () => Navigator.pop(context, "dark"),
                              child: const Text("Darcula"),
                            ),
                          ],
                        );
                      });
                  response.then((value) => _updateThemeState(themeBloc, value));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateThemeState(ThemeBloc themeBloc, String userDialogResponse) {
    if(userDialogResponse == 'light') {
      themeBloc.add(new WarriorOfLight());
    }
    if(userDialogResponse == 'dark') {
      themeBloc.add(new Darcula());
    }
  }
}
