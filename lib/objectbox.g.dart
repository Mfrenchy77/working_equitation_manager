// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'Database/Models/cow_trial.dart';
import 'Database/Models/dressage_trial.dart';
import 'Database/Models/ease_of_handling_trial.dart';
import 'Database/Models/horse.dart';
import 'Database/Models/movement.dart';
import 'Database/Models/rider.dart';
import 'Database/Models/show.dart';
import 'Database/Models/speed_trial.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 63250940508551214),
      name: 'CowTrial',
      lastPropertyId: const obx_int.IdUid(4, 8592155193016830314),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 8979404150974326776),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 4267876305057843098),
            name: 'penalties',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 3106565612549053962),
            name: 'finalSpeed',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 8592155193016830314),
            name: 'initialSpeed',
            type: 6,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(2, 2703117802835632783),
      name: 'DressageTrial',
      lastPropertyId: const obx_int.IdUid(6, 3790004214224889617),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 784299847791076873),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 5665698535716992632),
            name: 'level',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 4336611006830846796),
            name: 'finalScore',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 6093126611907525339),
            name: 'deductions',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 8554875908340660420),
            name: 'numberOfMovements',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 3790004214224889617),
            name: 'totalPossiblePoints',
            type: 6,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[
        obx_int.ModelRelation(
            id: const obx_int.IdUid(1, 5022004700891805289),
            name: 'movements',
            targetId: const obx_int.IdUid(5, 2675766736071501523)),
        obx_int.ModelRelation(
            id: const obx_int.IdUid(2, 6500097012327221885),
            name: 'collectives',
            targetId: const obx_int.IdUid(5, 2675766736071501523))
      ],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(3, 7578264731106799850),
      name: 'EaseOfHandlingTrial',
      lastPropertyId: const obx_int.IdUid(4, 667930973857147443),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 2643718246965358947),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 3740177021117019789),
            name: 'level',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 1707713340493578248),
            name: 'finalScore',
            type: 8,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 667930973857147443),
            name: 'numberOfObstacles',
            type: 6,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[
        obx_int.ModelRelation(
            id: const obx_int.IdUid(3, 3787620749565465966),
            name: 'obstacles',
            targetId: const obx_int.IdUid(5, 2675766736071501523)),
        obx_int.ModelRelation(
            id: const obx_int.IdUid(4, 8601128172282941843),
            name: 'collectives',
            targetId: const obx_int.IdUid(5, 2675766736071501523))
      ],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(4, 3850228166504749069),
      name: 'Horse',
      lastPropertyId: const obx_int.IdUid(3, 5199553903871087052),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 7427565582528182156),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 3296866496827052613),
            name: 'usaweId',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 5199553903871087052),
            name: 'name',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(5, 2675766736071501523),
      name: 'Movement',
      lastPropertyId: const obx_int.IdUid(5, 3661289767123217734),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 6361744352729221838),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 4425802224324552267),
            name: 'score',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 8815371143098432932),
            name: 'name',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 3116176411750949501),
            name: 'comment',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 3661289767123217734),
            name: 'coefficient',
            type: 6,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(6, 4883577621006176284),
      name: 'Rider',
      lastPropertyId: const obx_int.IdUid(11, 2706689388499001140),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 7276628588297421678),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 5969945047832807455),
            name: 'level',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 98659955271180779),
            name: 'name',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 8557452512096679501),
            name: 'usaweId',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 7742956392015050079),
            name: 'division',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 9059132646827851726),
            name: 'horseId',
            type: 11,
            flags: 520,
            indexId: const obx_int.IdUid(1, 3997345600747617928),
            relationTarget: 'Horse'),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(8, 613611606511666812),
            name: 'speedTrialId',
            type: 11,
            flags: 520,
            indexId: const obx_int.IdUid(2, 3363223653990071986),
            relationTarget: 'SpeedTrial'),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(9, 83562232001080600),
            name: 'cowTrialId',
            type: 11,
            flags: 520,
            indexId: const obx_int.IdUid(3, 953812502317162990),
            relationTarget: 'CowTrial'),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(10, 7523432754969229718),
            name: 'dressageTrialId',
            type: 11,
            flags: 520,
            indexId: const obx_int.IdUid(4, 8511625803678800472),
            relationTarget: 'DressageTrial'),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(11, 2706689388499001140),
            name: 'easeOfHandlingTrialId',
            type: 11,
            flags: 520,
            indexId: const obx_int.IdUid(5, 154860879866054309),
            relationTarget: 'EaseOfHandlingTrial')
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(7, 5717436637775268798),
      name: 'Show',
      lastPropertyId: const obx_int.IdUid(11, 3386301996721487134),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 6443553067535165832),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 1349571348782008618),
            name: 'regionNumber',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 5937993669393497191),
            name: 'showLicenseNumber',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 6154353341279453764),
            name: 'competitionName',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 9006543490485820043),
            name: 'facuilityNameandAddress',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 5342386886133429611),
            name: 'showDateAndStartTime',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 4085013099005688624),
            name: 'showOrganizers',
            type: 30,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(8, 6028468566126476842),
            name: 'isDraft',
            type: 1,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(11, 3386301996721487134),
            name: 'showTypeString',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[
        obx_int.ModelRelation(
            id: const obx_int.IdUid(5, 6368276511851888509),
            name: 'riders',
            targetId: const obx_int.IdUid(6, 4883577621006176284))
      ],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(8, 4065534881636303013),
      name: 'SpeedTrial',
      lastPropertyId: const obx_int.IdUid(5, 2442408713560850730),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 8819470891384763999),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 8631061760606706837),
            name: 'bonus',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 5755240725817916353),
            name: 'finalSpeed',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 7586374786020243661),
            name: 'penalties',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 2442408713560850730),
            name: 'initialSpeed',
            type: 6,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(8, 4065534881636303013),
      lastIndexId: const obx_int.IdUid(5, 154860879866054309),
      lastRelationId: const obx_int.IdUid(5, 6368276511851888509),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        4514435501998974196,
        5250495783960195806,
        6238531958365320550
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    CowTrial: obx_int.EntityDefinition<CowTrial>(
        model: _entities[0],
        toOneRelations: (CowTrial object) => [],
        toManyRelations: (CowTrial object) => {},
        getId: (CowTrial object) => object.id,
        setId: (CowTrial object, int id) {
          object.id = id;
        },
        objectToFB: (CowTrial object, fb.Builder fbb) {
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.penalties);
          fbb.addInt64(2, object.finalSpeed);
          fbb.addInt64(3, object.initialSpeed);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final penaltiesParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0);
          final finalSpeedParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          final initialSpeedParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0);
          final object = CowTrial(
              penalties: penaltiesParam,
              finalSpeed: finalSpeedParam,
              initialSpeed: initialSpeedParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        }),
    DressageTrial: obx_int.EntityDefinition<DressageTrial>(
        model: _entities[1],
        toOneRelations: (DressageTrial object) => [],
        toManyRelations: (DressageTrial object) => {
              obx_int.RelInfo<DressageTrial>.toMany(1, object.id):
                  object.movements,
              obx_int.RelInfo<DressageTrial>.toMany(2, object.id):
                  object.collectives
            },
        getId: (DressageTrial object) => object.id,
        setId: (DressageTrial object, int id) {
          object.id = id;
        },
        objectToFB: (DressageTrial object, fb.Builder fbb) {
          fbb.startTable(7);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.level);
          fbb.addInt64(2, object.finalScore);
          fbb.addInt64(3, object.deductions);
          fbb.addInt64(4, object.numberOfMovements);
          fbb.addInt64(5, object.totalPossiblePoints);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final finalScoreParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 8);
          final levelParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 6);
          final deductionsParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0);
          final numberOfMovementsParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0);
          final totalPossiblePointsParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0);
          final object = DressageTrial(
              id: idParam,
              finalScore: finalScoreParam,
              level: levelParam,
              deductions: deductionsParam,
              numberOfMovements: numberOfMovementsParam,
              totalPossiblePoints: totalPossiblePointsParam);
          obx_int.InternalToManyAccess.setRelInfo<DressageTrial>(
              object.movements,
              store,
              obx_int.RelInfo<DressageTrial>.toMany(1, object.id));
          obx_int.InternalToManyAccess.setRelInfo<DressageTrial>(
              object.collectives,
              store,
              obx_int.RelInfo<DressageTrial>.toMany(2, object.id));
          return object;
        }),
    EaseOfHandlingTrial: obx_int.EntityDefinition<EaseOfHandlingTrial>(
        model: _entities[2],
        toOneRelations: (EaseOfHandlingTrial object) => [],
        toManyRelations: (EaseOfHandlingTrial object) => {
              obx_int.RelInfo<EaseOfHandlingTrial>.toMany(3, object.id):
                  object.obstacles,
              obx_int.RelInfo<EaseOfHandlingTrial>.toMany(4, object.id):
                  object.collectives
            },
        getId: (EaseOfHandlingTrial object) => object.id,
        setId: (EaseOfHandlingTrial object, int id) {
          object.id = id;
        },
        objectToFB: (EaseOfHandlingTrial object, fb.Builder fbb) {
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.level);
          fbb.addFloat64(2, object.finalScore);
          fbb.addInt64(3, object.numberOfObstacles);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = EaseOfHandlingTrial()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..level = const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0)
            ..finalScore = const fb.Float64Reader()
                .vTableGetNullable(buffer, rootOffset, 8)
            ..numberOfObstacles =
                const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0);
          obx_int.InternalToManyAccess.setRelInfo<EaseOfHandlingTrial>(
              object.obstacles,
              store,
              obx_int.RelInfo<EaseOfHandlingTrial>.toMany(3, object.id));
          obx_int.InternalToManyAccess.setRelInfo<EaseOfHandlingTrial>(
              object.collectives,
              store,
              obx_int.RelInfo<EaseOfHandlingTrial>.toMany(4, object.id));
          return object;
        }),
    Horse: obx_int.EntityDefinition<Horse>(
        model: _entities[3],
        toOneRelations: (Horse object) => [],
        toManyRelations: (Horse object) => {},
        getId: (Horse object) => object.id,
        setId: (Horse object, int id) {
          object.id = id;
        },
        objectToFB: (Horse object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.usaweId);
          fbb.addOffset(2, nameOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final usaweIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0);
          final object = Horse(name: nameParam, usaweId: usaweIdParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        }),
    Movement: obx_int.EntityDefinition<Movement>(
        model: _entities[4],
        toOneRelations: (Movement object) => [],
        toManyRelations: (Movement object) => {},
        getId: (Movement object) => object.id,
        setId: (Movement object, int id) {
          object.id = id;
        },
        objectToFB: (Movement object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final commentOffset =
              object.comment == null ? null : fbb.writeString(object.comment!);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.score);
          fbb.addOffset(2, nameOffset);
          fbb.addOffset(3, commentOffset);
          fbb.addInt64(4, object.coefficient);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final scoreParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 6);
          final commentParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 10);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final coefficientParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0);
          final object = Movement(
              score: scoreParam,
              comment: commentParam,
              name: nameParam,
              coefficient: coefficientParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        }),
    Rider: obx_int.EntityDefinition<Rider>(
        model: _entities[5],
        toOneRelations: (Rider object) => [
              object.horse,
              object.speedTrial,
              object.cowTrial,
              object.dressageTrial,
              object.easeOfHandlingTrial
            ],
        toManyRelations: (Rider object) => {},
        getId: (Rider object) => object.id,
        setId: (Rider object, int id) {
          object.id = id;
        },
        objectToFB: (Rider object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final usaweIdOffset = fbb.writeString(object.usaweId);
          final divisionOffset = fbb.writeString(object.division);
          fbb.startTable(12);
          fbb.addInt64(0, object.id);
          fbb.addInt64(2, object.level);
          fbb.addOffset(3, nameOffset);
          fbb.addOffset(4, usaweIdOffset);
          fbb.addOffset(5, divisionOffset);
          fbb.addInt64(6, object.horse.targetId);
          fbb.addInt64(7, object.speedTrial.targetId);
          fbb.addInt64(8, object.cowTrial.targetId);
          fbb.addInt64(9, object.dressageTrial.targetId);
          fbb.addInt64(10, object.easeOfHandlingTrial.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final levelParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final usaweIdParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 12, '');
          final divisionParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 14, '');
          final object = Rider(
              level: levelParam,
              name: nameParam,
              usaweId: usaweIdParam,
              division: divisionParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          object.horse.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 16, 0);
          object.horse.attach(store);
          object.speedTrial.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 18, 0);
          object.speedTrial.attach(store);
          object.cowTrial.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 20, 0);
          object.cowTrial.attach(store);
          object.dressageTrial.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 22, 0);
          object.dressageTrial.attach(store);
          object.easeOfHandlingTrial.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 24, 0);
          object.easeOfHandlingTrial.attach(store);
          return object;
        }),
    Show: obx_int.EntityDefinition<Show>(
        model: _entities[6],
        toOneRelations: (Show object) => [],
        toManyRelations: (Show object) =>
            {obx_int.RelInfo<Show>.toMany(5, object.id!): object.riders},
        getId: (Show object) => object.id,
        setId: (Show object, int id) {
          object.id = id;
        },
        objectToFB: (Show object, fb.Builder fbb) {
          final competitionNameOffset = object.competitionName == null
              ? null
              : fbb.writeString(object.competitionName!);
          final facuilityNameandAddressOffset =
              object.facuilityNameandAddress == null
                  ? null
                  : fbb.writeString(object.facuilityNameandAddress!);
          final showDateAndStartTimeOffset = object.showDateAndStartTime == null
              ? null
              : fbb.writeString(object.showDateAndStartTime!);
          final showOrganizersOffset = object.showOrganizers == null
              ? null
              : fbb.writeList(object.showOrganizers!
                  .map(fbb.writeString)
                  .toList(growable: false));
          final showTypeStringOffset = object.showTypeString == null
              ? null
              : fbb.writeString(object.showTypeString!);
          fbb.startTable(12);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addInt64(1, object.regionNumber);
          fbb.addInt64(2, object.showLicenseNumber);
          fbb.addOffset(3, competitionNameOffset);
          fbb.addOffset(4, facuilityNameandAddressOffset);
          fbb.addOffset(5, showDateAndStartTimeOffset);
          fbb.addOffset(6, showOrganizersOffset);
          fbb.addBool(7, object.isDraft);
          fbb.addOffset(10, showTypeStringOffset);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);
          final regionNumberParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 6);
          final isDraftParam =
              const fb.BoolReader().vTableGet(buffer, rootOffset, 18, false);
          final showOrganizersParam = const fb.ListReader<String>(
                  fb.StringReader(asciiOptimization: true),
                  lazy: false)
              .vTableGetNullable(buffer, rootOffset, 16);
          final competitionNameParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 10);
          final showLicenseNumberParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 8);
          final showDateAndStartTimeParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 14);
          final facuilityNameandAddressParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 12);
          final object = Show(
              id: idParam,
              regionNumber: regionNumberParam,
              isDraft: isDraftParam,
              showOrganizers: showOrganizersParam,
              competitionName: competitionNameParam,
              showLicenseNumber: showLicenseNumberParam,
              showDateAndStartTime: showDateAndStartTimeParam,
              facuilityNameandAddress: facuilityNameandAddressParam)
            ..showTypeString = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 24);
          obx_int.InternalToManyAccess.setRelInfo<Show>(object.riders, store,
              obx_int.RelInfo<Show>.toMany(5, object.id!));
          return object;
        }),
    SpeedTrial: obx_int.EntityDefinition<SpeedTrial>(
        model: _entities[7],
        toOneRelations: (SpeedTrial object) => [],
        toManyRelations: (SpeedTrial object) => {},
        getId: (SpeedTrial object) => object.id,
        setId: (SpeedTrial object, int id) {
          object.id = id;
        },
        objectToFB: (SpeedTrial object, fb.Builder fbb) {
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.bonus);
          fbb.addInt64(2, object.finalSpeed);
          fbb.addInt64(3, object.penalties);
          fbb.addInt64(4, object.initialSpeed);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final bonusParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0);
          final penaltiesParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0);
          final finalSpeedParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          final initialSpeedParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0);
          final object = SpeedTrial(
              id: idParam,
              bonus: bonusParam,
              penalties: penaltiesParam,
              finalSpeed: finalSpeedParam,
              initialSpeed: initialSpeedParam);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [CowTrial] entity fields to define ObjectBox queries.
class CowTrial_ {
  /// See [CowTrial.id].
  static final id =
      obx.QueryIntegerProperty<CowTrial>(_entities[0].properties[0]);

  /// See [CowTrial.penalties].
  static final penalties =
      obx.QueryIntegerProperty<CowTrial>(_entities[0].properties[1]);

  /// See [CowTrial.finalSpeed].
  static final finalSpeed =
      obx.QueryIntegerProperty<CowTrial>(_entities[0].properties[2]);

  /// See [CowTrial.initialSpeed].
  static final initialSpeed =
      obx.QueryIntegerProperty<CowTrial>(_entities[0].properties[3]);
}

/// [DressageTrial] entity fields to define ObjectBox queries.
class DressageTrial_ {
  /// See [DressageTrial.id].
  static final id =
      obx.QueryIntegerProperty<DressageTrial>(_entities[1].properties[0]);

  /// See [DressageTrial.level].
  static final level =
      obx.QueryIntegerProperty<DressageTrial>(_entities[1].properties[1]);

  /// See [DressageTrial.finalScore].
  static final finalScore =
      obx.QueryIntegerProperty<DressageTrial>(_entities[1].properties[2]);

  /// See [DressageTrial.deductions].
  static final deductions =
      obx.QueryIntegerProperty<DressageTrial>(_entities[1].properties[3]);

  /// See [DressageTrial.numberOfMovements].
  static final numberOfMovements =
      obx.QueryIntegerProperty<DressageTrial>(_entities[1].properties[4]);

  /// See [DressageTrial.totalPossiblePoints].
  static final totalPossiblePoints =
      obx.QueryIntegerProperty<DressageTrial>(_entities[1].properties[5]);

  /// see [DressageTrial.movements]
  static final movements = obx.QueryRelationToMany<DressageTrial, Movement>(
      _entities[1].relations[0]);

  /// see [DressageTrial.collectives]
  static final collectives = obx.QueryRelationToMany<DressageTrial, Movement>(
      _entities[1].relations[1]);
}

/// [EaseOfHandlingTrial] entity fields to define ObjectBox queries.
class EaseOfHandlingTrial_ {
  /// See [EaseOfHandlingTrial.id].
  static final id =
      obx.QueryIntegerProperty<EaseOfHandlingTrial>(_entities[2].properties[0]);

  /// See [EaseOfHandlingTrial.level].
  static final level =
      obx.QueryIntegerProperty<EaseOfHandlingTrial>(_entities[2].properties[1]);

  /// See [EaseOfHandlingTrial.finalScore].
  static final finalScore =
      obx.QueryDoubleProperty<EaseOfHandlingTrial>(_entities[2].properties[2]);

  /// See [EaseOfHandlingTrial.numberOfObstacles].
  static final numberOfObstacles =
      obx.QueryIntegerProperty<EaseOfHandlingTrial>(_entities[2].properties[3]);

  /// see [EaseOfHandlingTrial.obstacles]
  static final obstacles =
      obx.QueryRelationToMany<EaseOfHandlingTrial, Movement>(
          _entities[2].relations[0]);

  /// see [EaseOfHandlingTrial.collectives]
  static final collectives =
      obx.QueryRelationToMany<EaseOfHandlingTrial, Movement>(
          _entities[2].relations[1]);
}

/// [Horse] entity fields to define ObjectBox queries.
class Horse_ {
  /// See [Horse.id].
  static final id = obx.QueryIntegerProperty<Horse>(_entities[3].properties[0]);

  /// See [Horse.usaweId].
  static final usaweId =
      obx.QueryIntegerProperty<Horse>(_entities[3].properties[1]);

  /// See [Horse.name].
  static final name =
      obx.QueryStringProperty<Horse>(_entities[3].properties[2]);
}

/// [Movement] entity fields to define ObjectBox queries.
class Movement_ {
  /// See [Movement.id].
  static final id =
      obx.QueryIntegerProperty<Movement>(_entities[4].properties[0]);

  /// See [Movement.score].
  static final score =
      obx.QueryIntegerProperty<Movement>(_entities[4].properties[1]);

  /// See [Movement.name].
  static final name =
      obx.QueryStringProperty<Movement>(_entities[4].properties[2]);

  /// See [Movement.comment].
  static final comment =
      obx.QueryStringProperty<Movement>(_entities[4].properties[3]);

  /// See [Movement.coefficient].
  static final coefficient =
      obx.QueryIntegerProperty<Movement>(_entities[4].properties[4]);
}

/// [Rider] entity fields to define ObjectBox queries.
class Rider_ {
  /// See [Rider.id].
  static final id = obx.QueryIntegerProperty<Rider>(_entities[5].properties[0]);

  /// See [Rider.level].
  static final level =
      obx.QueryIntegerProperty<Rider>(_entities[5].properties[1]);

  /// See [Rider.name].
  static final name =
      obx.QueryStringProperty<Rider>(_entities[5].properties[2]);

  /// See [Rider.usaweId].
  static final usaweId =
      obx.QueryStringProperty<Rider>(_entities[5].properties[3]);

  /// See [Rider.division].
  static final division =
      obx.QueryStringProperty<Rider>(_entities[5].properties[4]);

  /// See [Rider.horse].
  static final horse =
      obx.QueryRelationToOne<Rider, Horse>(_entities[5].properties[5]);

  /// See [Rider.speedTrial].
  static final speedTrial =
      obx.QueryRelationToOne<Rider, SpeedTrial>(_entities[5].properties[6]);

  /// See [Rider.cowTrial].
  static final cowTrial =
      obx.QueryRelationToOne<Rider, CowTrial>(_entities[5].properties[7]);

  /// See [Rider.dressageTrial].
  static final dressageTrial =
      obx.QueryRelationToOne<Rider, DressageTrial>(_entities[5].properties[8]);

  /// See [Rider.easeOfHandlingTrial].
  static final easeOfHandlingTrial =
      obx.QueryRelationToOne<Rider, EaseOfHandlingTrial>(
          _entities[5].properties[9]);
}

/// [Show] entity fields to define ObjectBox queries.
class Show_ {
  /// See [Show.id].
  static final id = obx.QueryIntegerProperty<Show>(_entities[6].properties[0]);

  /// See [Show.regionNumber].
  static final regionNumber =
      obx.QueryIntegerProperty<Show>(_entities[6].properties[1]);

  /// See [Show.showLicenseNumber].
  static final showLicenseNumber =
      obx.QueryIntegerProperty<Show>(_entities[6].properties[2]);

  /// See [Show.competitionName].
  static final competitionName =
      obx.QueryStringProperty<Show>(_entities[6].properties[3]);

  /// See [Show.facuilityNameandAddress].
  static final facuilityNameandAddress =
      obx.QueryStringProperty<Show>(_entities[6].properties[4]);

  /// See [Show.showDateAndStartTime].
  static final showDateAndStartTime =
      obx.QueryStringProperty<Show>(_entities[6].properties[5]);

  /// See [Show.showOrganizers].
  static final showOrganizers =
      obx.QueryStringVectorProperty<Show>(_entities[6].properties[6]);

  /// See [Show.isDraft].
  static final isDraft =
      obx.QueryBooleanProperty<Show>(_entities[6].properties[7]);

  /// See [Show.showTypeString].
  static final showTypeString =
      obx.QueryStringProperty<Show>(_entities[6].properties[8]);

  /// see [Show.riders]
  static final riders =
      obx.QueryRelationToMany<Show, Rider>(_entities[6].relations[0]);
}

/// [SpeedTrial] entity fields to define ObjectBox queries.
class SpeedTrial_ {
  /// See [SpeedTrial.id].
  static final id =
      obx.QueryIntegerProperty<SpeedTrial>(_entities[7].properties[0]);

  /// See [SpeedTrial.bonus].
  static final bonus =
      obx.QueryIntegerProperty<SpeedTrial>(_entities[7].properties[1]);

  /// See [SpeedTrial.finalSpeed].
  static final finalSpeed =
      obx.QueryIntegerProperty<SpeedTrial>(_entities[7].properties[2]);

  /// See [SpeedTrial.penalties].
  static final penalties =
      obx.QueryIntegerProperty<SpeedTrial>(_entities[7].properties[3]);

  /// See [SpeedTrial.initialSpeed].
  static final initialSpeed =
      obx.QueryIntegerProperty<SpeedTrial>(_entities[7].properties[4]);
}
