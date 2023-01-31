import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'main_view_model.dart';

class MainPage extends HookConsumerWidget {
  MainPage({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    final mainState = ref.watch(mainViewModelProvider);

    FlutterNativeSplash.remove();

    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: theme.appColors.primary,

            // Status bar brightness (optional)
            statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          title: const Text("メインページ"),
          centerTitle: true,
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
              height: 60.h,
              child: Row(children: [
                SizedBox(
                  width: 70.w,
                  child: Text("データ登録", style: theme.textTheme.s12.bold().sp()),
                ),
                Expanded(
                    child: TextField(
                  controller: _nameController,
                  onChanged: (value) => ref.watch(mainViewModelProvider.notifier).setImputName(value),
                )),
                Expanded(
                    child: TextField(
                  controller: _descriptionController,
                  onChanged: (value) => ref.watch(mainViewModelProvider.notifier).setImputDescription(value),
                )),
                SizedBox(
                    width: 60.w,
                    child: ElevatedButton(
                      child: Text("Add", style: theme.textTheme.s12.bold().sp()),
                      onPressed: () {
                        if (_nameController.text.isNotEmpty) {
                          ref.watch(mainViewModelProvider.notifier).save().then((_) => ref.refresh(testDataProvider));
                          _nameController.text = "";
                          _descriptionController.text = "";
                        }
                      },
                    ))
              ])),
          Divider(
            color: theme.appColors.border,
            thickness: 1,
            height: 0,
          ),
          mainState.testList.when(
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
              error: (err, stack) => Center(child: Text('Error: $err')),
              data: (testData) {
                return Expanded(
                    child: ListView.separated(
                  itemBuilder: (_, index) {
                    return ListTile(
                      title: Text(testData[index].name),
                      subtitle: Text(testData[index].lastUpdate.toLocal().toIso8601String()),
                      leading: Text(testData[index].id.toString()),
                      onTap: () => context.pushNamed("sub", params: {'id': testData[index].id.toString()}),
                    );
                  },
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: testData.length,
                ));
              })
        ]));
  }
}
