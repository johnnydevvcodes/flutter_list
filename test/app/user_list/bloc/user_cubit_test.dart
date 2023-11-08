import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_list/app/user_list/bloc/user_cubit.dart';
import 'package:flutter_list/app/user_list/bloc/user_state.dart';
import 'package:flutter_list/core/core.dart';
import 'package:flutter_list/data/user_list_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepo extends Mock implements UserRepo {}

void main() {
  const name = 'UserCubit';
  late UserRepo userRepo;
  late UserCubit cubit;
  final users = [
    UserEntity(id: '1', name: 'testuser', imageUrl: 'url'),
    UserEntity(id: '1', name: 'testuser', imageUrl: 'url'),
    UserEntity(id: '1', name: 'testuser', imageUrl: 'url'),
  ];

  setUp(() async {
    userRepo = MockUserRepo();
    cubit = UserCubit(userRepo);
  });

  group('test $name', () {
    blocTest(
      'check $name ErrorState',
      setUp: () async {
        when(() => userRepo.getUsers()).thenAnswer((invocation) async =>
            await Future.value((<UserEntity>[], 'error')));
      },
      build: () => cubit,
      act: (c) => c.initialize(),
      expect: () => [
        isA<LoadingState>(),
        isA<ErrorState>().having((p0) => p0.error, 'desc', 'error')
      ],
    );
    blocTest(
      'check $name EmptyState',
      setUp: () async {
        when(() => userRepo.getUsers()).thenAnswer(
            (invocation) async => await Future.value((<UserEntity>[], '')));
      },
      build: () => cubit,
      act: (c) => c.initialize(),
      expect: () => [
        isA<LoadingState>(),
        isA<EmptyState>(),
      ],
    );
    blocTest(
      'check $name UsersLoadedState',
      setUp: () async {
        when(() => userRepo.getUsers())
            .thenAnswer((invocation) async => await Future.value((users, '')));
      },
      build: () => cubit,
      act: (c) => c.initialize(),
      expect: () => [
        isA<LoadingState>(),
        isA<UsersLoadedState>().having((p0) => p0.users, 'desc', users)
      ],
    );
  });
}
