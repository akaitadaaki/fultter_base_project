import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

import '../../data/model/test_data.dart';
import '../../foundation/extension/async_snapshot.dart';
import '../theme/app_theme.dart';
import 'main_view_model.dart';

class MainPage extends HookConsumerWidget {
  MainPage({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    final mainViewModel = ref.watch(mainViewModelProvider);

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    onChanged: (value) {
                      mainViewModel.inputName = value;
                    },
                  )),
                  Expanded(
                      child: TextField(
                    controller: _descriptionController,
                    onChanged: (value) {
                      mainViewModel.inputDescription = value;
                    },
                  )),
                  SizedBox(
                      width: 60.w,
                      child: ElevatedButton(
                        child: Text("Add", style: theme.textTheme.s12.bold().sp()),
                        onPressed: () {
                          if (_nameController.text.isNotEmpty) {
                            mainViewModel.save();
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
            FutureBuilder(
              future: mainViewModel.getDataList(),
              initialData: const <TestData>[],
              builder: (BuildContext context, AsyncSnapshot<List<TestData>> snapshot) {
                if (snapshot.isWaiting) {
                  // 非同期処理未完了 = 通信中
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.error != null) {
                  // エラー
                  return const Center(child: Text('エラーがおきました'));
                }

                if (snapshot.hasData) {
                  var testData = snapshot.data!;
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
                }
                return const SizedBox();
              },
            ),
          ],
        ));
  }
}
