import 'package:eduhub/src/features/authentication/domain/entities/user_entity.dart';
import 'package:eduhub/src/features/authentication/domain/repositories/auth_repository.dart';
import 'package:eduhub/src/features/authentication/domain/usecases/login_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<AuthRepository>()])
import 'login_use_case_test.mocks.dart';

void main() {
  late LoginUseCase useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = LoginUseCase(mockRepository);
  });

  const tEmail = 'test@example.com';
  const tPassword = 'password';
  const tUser = UserEntity(id: '1', email: tEmail, name: 'Test User');

  test('should call login on the repository and return a user', () async {
    // Arrange
    when(mockRepository.login(tEmail, tPassword))
        .thenAnswer((_) async => tUser);

    // Act
    final result = await useCase(tEmail, tPassword);

    // Assert
    expect(result, tUser);
    verify(mockRepository.login(tEmail, tPassword)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
