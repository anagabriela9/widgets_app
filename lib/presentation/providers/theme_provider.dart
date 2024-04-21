import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Estado => isDarkmodeProvider = boolean

// Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

// Un simple boolean
final isDarkmodeProvider = StateProvider((ref) => false);

// Un simple int
final selectedColorProvider = StateProvider((ref) => 0);



// Un objeto de tipo AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
); // para mantener un estado más elaborado


//Para controlar el tema: Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme>{

  // State = Estado = new AppTheme();
  ThemeNotifier(): super(AppTheme()); // Crea una primera instancia 

  
  void toggleDarkmode() {
    state = state.copyWith( isDarkmode: !state.isDarkmode );
  } 
  
  void changeColorIndex( int colorIndex ) {
    state = state.copyWith( selectedColor: colorIndex );
  }

  
}