import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../theme/app_theme.dart';
import 'sub_view_model.dart';

class SubPage extends HookConsumerWidget {
  const SubPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    final data = ref.watch(subViewModelProvider(id).select((value) => value.data));

    return WillPopScope(
        onWillPop: () {
          // バックキーを押すとここに来る。
          // popしてあげないと、閉じてくれない。
          Navigator.of(context).pop();
          return Future.value(false);
        },
        child: Scaffold(
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                // Status bar color
                statusBarColor: theme.appColors.primary,

                // Status bar brightness (optional)
                statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
                statusBarBrightness: Brightness.light, // For iOS (dark icons)
              ),
              title: const Text("サブページ"),
              centerTitle: true,
            ),
            body: data.when(
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                error: (err, stack) => Center(child: Text('Error: $err')),
                data: (testData) {
                  return (testData == null)
                      ? const Center(child: Text('TestData is Null'))
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(color: theme.appColors.background),
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Center(
                                      child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(testData.name, style: theme.textTheme.s20.bold().sp()))),
                                  const SizedBox(),
                                ],
                              ),
                            ),
                            Divider(
                              color: theme.appColors.border,
                              thickness: 1,
                              height: 0,
                            ),
                            Container(
                              decoration: BoxDecoration(color: theme.appColors.background),
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Center(child: Text(testData.description, style: theme.textTheme.s20.bold().sp())),
                                  const SizedBox(),
                                ],
                              ),
                            ),
                          ],
                        );
                })));
  }
}
