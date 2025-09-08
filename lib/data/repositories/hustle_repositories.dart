import '../data.dart';

abstract class HustleRepository {
  Future<void> createHustle(Hustle hustle);
  Future<void> updateHustle(Hustle hustle);
  Future<void> deleteHustle(Hustle hustle);
  Future<List<Hustle>> getAllHustles();
}
