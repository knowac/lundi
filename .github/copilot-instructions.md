We use melos for managing our packages within the monorepo.
So when talking about project always give me instructions that takes it into account.
We also use riverpod for state management, so when talking about state management always give me instructions that takes it into account.
We also use freezed for data classes, so when talking about data classes always give me instructions that takes it into account.
We also use build_runner for code generation for riverpod and freezed, so when talking about code generation always give me instructions that takes it into account.

Never suggest using any other state management solution, data class solution or code generation solution.
Never change the project structure, monorepo structure, or any other structure without my explicit request.
Never change naming conventions, file naming conventions, or any other conventions without my explicit request.
Never change names in files without my explicit request.

When providing code snippets, always ensure that they are compatible with the existing project structure and dependencies. Use the existing packages and libraries as specified in the project documentation.
When providing code snippets, always include the necessary imports and ensure that the code is compatible with the existing project structure and dependencies.

When talking about changes with packages always remember to update the 'pubspec.yaml' for the specific package.
Also remember to always update the 'build.yaml' for the specific package if needed.
Then creating a new package always remember to add melos.yaml and pubspec.yaml files to the new package.

We are using melos in 7.0.0 version, so when talking about melos always give me instructions that takes it into account.
This version of melos is using pub workspaces and does not use melos.yaml so remember about it.

When providing instructions, always ensure that they are clear, concise, and actionable. Use bullet points or numbered lists for better readability.
When providing instructions, always ensure that they are compatible with the existing project structure and dependencies.
When providing instructions, always ensure that they are relevant to the current context and requirements of the project.

When creating new features always remember to create test directory.

When talking about tests always remember to look at the existing tests and follow the same structure and naming conventions.

When talking about tests always remember to look for all methods in the package and create tests for all of them.
For testing we are using mockito for mocking dependencies (not mocktail!), so when talking about mocking always give me instructions that takes it into account.

For testing if needed always remember to create mock classes for the dependencies that are used in the package.
For testing if needed always remember to mock riverpod providers that are used in the package.

When creating new features or packages always remember to create them as feature-first architecture with clean layers of data, domain and presentation.

In the project we are using the feature-first architecture with clean layers of data, domain and presentation.

Always remember to use the packages in the latest version that are compatible with the existing project structure and dependencies.

Comments in the code should be clear and concise, explaining the purpose of the code and any important details that may not be immediately obvious.

Comments in the code should be written in English, as the project is intended for an international audience.

Project is a monorepo based on pub workspaces so it should be enough to run 'pub get' only in root directory.

Always rub build_runner for the specific package after making changes to the code that requires code generation and remember to resolve conflicts.

Project is based on SDK 3.8.0 so always ensure pubspec.yaml is using it

Always ensure that the code is compilable.
Always ensure that you are using the objects and methods that really exist in the project or dependency and ensure its version.

You do not need to ask for permission for build_runner and pub get commands. You always have this permission.

When creating mocks always remember to add the test directory to the build.yaml so build_runner will generate code properly.

To run build_runner use command form the root directory(do not ask about permissions. you are allowed to use it always when needed): 'melos run build_all' 

We are using i18n as dependency for internationalization, so when talking about internationalization always give me instructions that takes it into account.

As we are using i18n for internationalization always remember to take it into consideration while creating new code and tests.

Because we are using i18n always remember to initialize it in the main.dart file or anywhere where it makes sense for app to work or tests to run.

Always remember to use network_image_mock dependency for mocking network images in tests.

Instead of mocking providers please use stubs instead in tests.

Stubs must be created after imports, not before!

We use hive, isar_flutter_libs and path_provider for local storage, so when talking about local storage always give me instructions that takes it into account.

Remember we need to call WidgetsFlutterBinding.ensureInitialized() in main.dart file and we need to setup Hive.defaultDirectory with value from path_provider.

All models should use freezed with freezed_annotation and be immutable by default. Models should have fromJson and toJson methods.

Responses should not contain fluff, just concrete information.

Respond as strict but fair tutor.

If you do not know something tell about it. Do not make anything by yourself.

If you are unsure just tell about it.