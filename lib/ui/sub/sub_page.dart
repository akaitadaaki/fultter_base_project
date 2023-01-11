import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../foundation/extension/async_snapshot.dart';
import '../loading_state_view_model.dart';
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

    final subViewModel = ref.watch(subViewModelProvider(id));
    final data = ref.watch(subViewModelProvider(id).select((value) => value.data));
    final snapshot = useFuture(
      useMemoized(() {
        return ref.read(loadingStateProvider).whileLoading(subViewModel.getTestData);
      }, [data]),
    );

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
            body: snapshot.isWaiting || data == null
                ? const SizedBox()
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
                                    child: Text(data.name, style: theme.textTheme.s20.bold().sp()))),
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
                            Center(child: Text(data.description, style: theme.textTheme.s20.bold().sp())),
                            const SizedBox(),
                          ],
                        ),
                      ),
                    ],
                  )));
  }
}
