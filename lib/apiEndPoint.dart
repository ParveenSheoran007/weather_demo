class ApiEndPoints{
  static String appId ()=> 'fe9c862d031a1ffc04111157bb5a3163';
  static String baseUrl ()=>'https://api.openweathermap.org/data/2.5/forecast?';
  static String weatherUrl ()=> '${baseUrl}lat=44.34&lon=10.99&appid=${appId()}';
}