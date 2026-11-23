import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kelime_yapbozu/oyun_kelime_yapbozu.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kelimeYapbozuConfig.title.length, 33);
    expect(kelimeYapbozuConfig.tagline.length, 33);
    for (final s in kelimeYapbozuConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(kelimeYapbozuConfig.gameId, kelimeYapbozuId);
    expect(kelimeYapbozuRules.gameId, kelimeYapbozuId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(kelimeYapbozuRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: kelimeYapbozuId, optionalMechanics: kelimeYapbozuRules.optionalMechanics);
    for (final l in ['tr', 'en']) {
      kelimeYapbozuRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(kelimeYapbozuRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}
