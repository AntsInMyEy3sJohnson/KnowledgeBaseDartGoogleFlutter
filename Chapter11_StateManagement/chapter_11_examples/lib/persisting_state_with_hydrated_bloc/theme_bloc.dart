import 'package:chapter_11_examples/persisting_state_with_hydrated_bloc/theme_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

// In essence, 'HydratedBloc' is like a regular bloc with two additional
// methods for us to override
class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeData> {
  static final _dark = ThemeData.dark();
  static final _light = ThemeData.light();

  // Make 'light' the default
  // Only set when there is no previous state to be loaded
  ThemeBloc() : super(ThemeData.light());

  @override
  ThemeData fromJson(Map<String, dynamic> json) {
    try {
      if (json['light'] as bool) {
        return ThemeData.light();
      }
      return ThemeData.dark();
    } catch (_) {
      print("Unable to load ThemeData from JSON.");
      return null;
    }
  }

  @override
  Stream<ThemeData> mapEventToState(ThemeEvent event) async* {
    if (event is Darcula) {
      yield _dark;
    }
    if (event is WarriorOfLight) {
      yield _light;
    }
  }

  @override
  Map<String, bool> toJson(ThemeData state) {
    try {
      return {
        'light': state == ThemeData.light()
      };
    } catch (_) {
      // No caching happens when 'null' is returned
      print("Unable to serialize ThemeData state to JSON.");
      return null;
    }
  }
}
