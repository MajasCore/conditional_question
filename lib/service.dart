import 'package:conditional_question/cq_brain.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setup(){
locator.registerSingleton<CQBrain>(CQBrain());

}