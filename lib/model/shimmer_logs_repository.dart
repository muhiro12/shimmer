import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:shimmer/interface/database/shimmer_category.dart';
import 'package:shimmer/interface/database/shimmer_log.dart';
import 'package:shimmer/interface/database/shimmer_log_state.dart';
import 'package:shimmer/interface/database/shimmer_logs_data_store.dart';
import 'package:shimmer/model/shimmer_logs.dart';
import 'package:shimmer/model/shimmer_logs_parser.dart';

class ShimmerLogsRepository {
  ShimmerLogsRepository(this._dataStore);

  final ShimmerLogsDataStoreInterface _dataStore;

  static final ShimmerLogsRepository instance =
      ShimmerLogsRepository(ShimmerLogsDataStore.instance);

  ValueListenable listenable() {
    return ShimmerLogsDataStore.instance.listenable();
  }

  ShimmerLogs fetchAll() {
    return ShimmerLogs(
      value: _dataStore.load(),
    );
  }

  ShimmerLogs fetchAllSortedByDate() {
    final all = fetchAll();
    ShimmerLogsParser parser = ShimmerLogsParser(all);
    return parser.sortedByDate();
  }

  ShimmerLogs fetchPublished() {
    final all = fetchAllSortedByDate();
    ShimmerLogsParser parser = ShimmerLogsParser(all);
    return parser.whereOfPublished();
  }

  List<ShimmerLogs> fetchAlbumItems() {
    ShimmerLogs all = fetchAllSortedByDate();
    ShimmerLogsParser parser = ShimmerLogsParser(all);
    List<ShimmerLogs> albumItems = <ShimmerLogs>[
      ShimmerLogs(
        key: 'Draft',
        value: parser.whereOfDraft().value,
      ),
      ShimmerLogs(
        key: 'Archived',
        value: parser.whereOfArchived().value,
      ),
    ];
    parser.logs = parser.whereOfPublished();
    albumItems.insertAll(
      0,
      parser.toCategorizedLogsList(),
    );
    return albumItems.where((albumItem) => albumItem.value.isNotEmpty).toList();
  }

  void saveLog(ShimmerLog log) {
    _dataStore.save(
      log..updatedAt = DateTime.now(),
    );
  }

  void archiveLog(ShimmerLog log) {
    saveLog(
      log..state = ShimmerLogState.archived,
    );
  }

  void deleteLog(ShimmerLog log) {
    _dataStore.delete(log);
  }

  // TODO: Only for debug
  void createDebugData(
    DateTime date,
    ShimmerCategory category,
    double star,
    List<Uint8List> images,
  ) {
    final random = Random().nextInt(100);
    final log = ShimmerLog(
      date: date,
      category: category,
      title: '#$random Title',
      summary:
          ('木曾路はすべて山の中である。あるところは岨づたいに行く崖の道であり、あるところは数十間の深さに臨む木曾川の岸であり、あるところは山の尾をめぐる谷の入り口である。\n一筋の街道はこの深い森林地帯を貫いてい')
              .substring(0, random),
      detail:
          ('吾輩は猫である。\n名前はまだ無い。どこで生れたかとんと見当がつかぬ。\n何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。吾輩はここで始めて人間というものを見た。しかもあとで聞くとそれは書生という人間中で一番獰悪な種族であったそうだ。この書生というのは時々我々を捕えて煮て食うという話である。しかしその当時は何という考もなかったから別段恐しいとも思わなかった。ただ彼の掌に載せられてスーと持ち上げられた時何だかフワフワした感じがあったばかりである。掌の上で少し落ちついて書生の顔を見たのがいわゆる人間というものの見始であろう。この時妙なものだと思った感じが今でも残っている。\n第一毛をもって装飾されべきはずの顔がつるつるしてまるで薬缶だ。その後猫にもだいぶ逢ったがこんな片輪には一度も出会わした事がない。のみならず顔の真中があまりに突起している。そうしてその穴の中から時々ぷうぷう')
              .substring(0, random * 4),
      star: star,
      tags: [
        '#tag$star',
        '#tag$random',
      ],
      images: images,
      location: 'Location',
      creator: 'Creator',
      genre: 'Genre',
      theme: 'Theme',
      note: '恥の多い生涯を送って来ました。\n自分には、人間の生活というものが、見当つかないのです。自分は東北の田',
    );
    saveLog(log);
  }
}
