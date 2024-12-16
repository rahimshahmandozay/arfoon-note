import 'package:arfoon_note/model/example_model.dart';

final List<ExampleModel> exampleData = [
  ExampleModel(
      id: 1,
      title: "HomeExample",
      description:
          "Push to HomeExample and Example returns HomeView with calls of getNote(file), getLabels, addNote, onSettingTap, onProfileTap."),
  ExampleModel(
      id: 2,
      title: "ProfileView",
      description:
          "This is a dialog and show as ProfileView().show(context) and has parameters of: title, submitText, onSubmit(s)"),
  ExampleModel(
      id: 3,
      title: "SettingsView",
      description:
          "This is a dialog and show as SettingsView().show(context) and has parameters of currentLanguage, onLanguageChanged(llang), currentTheme, onThemeChanged(t)"),
  ExampleModel(
      id: 4,
      title: "AddEditLabelView",
      description:
          "This is a dialog and show as AddEditLabelView().show(context) and has parameters of: title, onSubmit(s), onDelete"),
  ExampleModel(
      id: 5,
      title: "SureView",
      description:
          "This is a dialog and show as SureView(title: , subtitle: , sureText: , onSure: async (){}).show(context)")
];
