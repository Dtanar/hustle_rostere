import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/data/data.dart';
import 'hustle.dart';

class HustleNotifier extends StateNotifier<HustleState> {
  final HustleRepository _hustleRepository;

  HustleNotifier(this._hustleRepository) : super(const HustleState.initial());

  Future<void> createHustle(Hustle hustle) async {
    try {
      await _hustleRepository.createHustle(hustle);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteHustle(Hustle hustle) async {
    try {
      await _hustleRepository.deleteHustle(hustle);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateHustle(Hustle hustle) async {
    try {
      final isCompleted = !hustle.isCompleted;
      final updatedHustle = hustle.copyWith(isCompleted: isCompleted);
      await _hustleRepository.updateHustle(updatedHustle);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getAllHustles() async {
    try {
      final hustles = await _hustleRepository.getAllHustles();
      state = state.copyWith(hustles: hustles);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
