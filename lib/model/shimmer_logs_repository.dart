import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/interface/database/shimmer_logs_data_store.dart';

class ShimmerLogsRepository {
  final ShimmerLogsDataStoreInterface _dataStore;

  ShimmerLogsRepository(this._dataStore);

  static final instance = ShimmerLogsRepository(ShimmerLogsDataStore());

  ValueListenable listenable() {
    return _dataStore.listenable();
  }

  void createLog(ShimmerLog log) {
    _dataStore.add(log);
  }

  List<ShimmerLog> fetchAll() {
    return _dataStore.fetchAll();
  }

  List<ShimmerLog> fetchAllReversed() {
    return fetchAll().reversed.toList();
  }

  Map<ShimmerCategory, List<ShimmerLog>> fetchAllGroupedByCategory() {
    List<ShimmerLog> logs = fetchAllReversed();
    Map<ShimmerCategory, List<ShimmerLog>> grouped = {};
    ShimmerCategory.values.forEach(
      (category) {
        final values = logs.where((log) => log.category == category).toList();
        if (values.isNotEmpty) {
          grouped[category] = values;
        }
      },
    );
    return grouped;
  }

  // TODO: Only for debug
  void createDebugData(
    DateTime date,
    ShimmerCategory category,
    double star,
    List<Uint8List> images,
  ) {
    final random = Random().nextInt(100);
    final log = ShimmerLog();
    log.date = date;
    log.category = category;
    log.title = '#$random Title';
    log.summary =
        ('木曾路はすべて山の中である。あるところは岨づたいに行く崖の道であり、あるところは数十間の深さに臨む木曾川の岸であり、あるところは山の尾をめぐる谷の入り口である。\n一筋の街道はこの深い森林地帯を貫いてい')
            .substring(0, random);
    log.detail =
        ('吾輩は猫である。\n名前はまだ無い。どこで生れたかとんと見当がつかぬ。\n何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。吾輩はここで始めて人間というものを見た。しかもあとで聞くとそれは書生という人間中で一番獰悪な種族であったそうだ。この書生というのは時々我々を捕えて煮て食うという話である。しかしその当時は何という考もなかったから別段恐しいとも思わなかった。ただ彼の掌に載せられてスーと持ち上げられた時何だかフワフワした感じがあったばかりである。掌の上で少し落ちついて書生の顔を見たのがいわゆる人間というものの見始であろう。この時妙なものだと思った感じが今でも残っている。\n第一毛をもって装飾されべきはずの顔がつるつるしてまるで薬缶だ。その後猫にもだいぶ逢ったがこんな片輪には一度も出会わした事がない。のみならず顔の真中があまりに突起している。そうしてその穴の中から時々ぷうぷう')
            .substring(0, random * 4);
    log.star = star;
    log.tags = [
      '#tag$star',
      '#tag$random',
    ];
    log.images = images;
    log.location = 'Location';
    log.creator = 'Creator';
    log.genre = 'Genre';
    log.theme = 'Theme';
    log.note = '恥の多い生涯を送って来ました。\n自分には、人間の生活というものが、見当つかないのです。自分は東北の田';
    createLog(log);
  }
}
