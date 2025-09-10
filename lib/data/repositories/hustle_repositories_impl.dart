import '../data.dart';

class HustleRepositoriesImpl implements HustleRepository {
  final HustleDatasource _datasource;

  HustleRepositoriesImpl(this._datasource);

  @override
  Future<void> createHustle(Hustle hustle) async {
    try {
      await _datasource.addHustle(hustle);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> deleteHustle(Hustle hustle) async {
    try {
      await _datasource.deleteHustle(hustle);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<List<Hustle>> getAllHustles() async{
    try {
      return await _datasource.getAllHustles();
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> updateHustle(Hustle hustle) async{
    try {
      await _datasource.updateHustle(hustle);
    } catch (e) {
      throw '$e';
    }
  }
}
