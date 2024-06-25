import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:weather_demo/Screen/response/weatherResponse.dart';
import 'package:weather_demo/Service/provider.dart';
import 'package:weather_demo/constant/constantWidget.dart';
import 'package:weather_demo/constant/constant_text_field.dart';
import 'package:weather_demo/constant/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  late WeatherProvider weatherProvider;
  @override
  void initState(){
    weatherProvider = Provider.of<WeatherProvider>(context,listen: false);
    featchWeather();
    super.initState();
  }

  Future featchWeather() async{
    await weatherProvider.fetchWeatherPro(context,longitude: weatherProvider.longitude,latitude: weatherProvider.latitude,zipCode: '');
  }
  WeatherResponse? weatherResponse;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<WeatherProvider>(
        builder: ((context,weatherProvider,child){
          if(weatherProvider.loading){
            return  Center(child: Container(
                height: size.height,
                width: size.width,
                child: shimmerList(context)));
          }
          final weatherResponse = weatherProvider.weatherResponse;
          if(weatherResponse != null){
            return SingleChildScrollView(
              child: Container(
                height: size.height*1.2,
                width: size.width,
                color: Colors.black,
                child: Column(
                  children: [
                    const SizedBox(height: 70,),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: weatherProvider.searchClick  ? InputField(
                          type: TextInputType.number,
                          controller: weatherProvider?.searchController,
                          placeholder: 'Enter your ZipCode',
                          submitted: (value) async {
                            await  weatherProvider.fetchWeatherPro(context,
                              longitude: weatherProvider.longitude,
                              latitude: weatherProvider.latitude,
                              zipCode: value, // Assuming searchController is a TextEditingController
                            );
                          },
                        ) : Row(
                          children: [
                            const Text('Weather',style: TextStyle(
                              fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white,
                            ),),
                            const Spacer(),
                            GestureDetector(
                                onTap: () async {
                                  await weatherProvider.getCurrentLocation(context);
                                },
                                child: const Icon(Icons.location_on,color: Colors.white,)),
                            const SizedBox(width: 20,),
                            GestureDetector(
                                onTap: (){
                                  weatherProvider.searchBtnClick();
                                },
                                child: const Icon(Icons.search,color: Colors.white,))
                          ],
                        )
                    ),

                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Text( DateFormat('dd MMM yyyy').format(DateTime.now()),style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),),
                          const Spacer(),

                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    selectCloudIcon(weatherProvider.weatherResponse!.list!.first.weather!.first.icon!.toString()),
                    const SizedBox(height: 20,),
                    Text(weatherProvider.weatherResponse?.list!.first.weather!.first.description ?? '',
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w200
                      ),
                    ),
                    const SizedBox(height: 16,),
                    Text('${WeatherProvider.kelvinToCelsius(weatherProvider.weatherResponse?.list?.first.main?.temp!.toDouble() ?? 0.0).toString()} \u00B0',
                      style: const TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    const SizedBox(height: 16,),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        showWeatherDetail(size,firstTitle: 'Humidity',firstSubTitle: "${weatherProvider.weatherResponse!.list!.first.main!.humidity!.toString()}%",secondSubTitle: '${weatherProvider.weatherResponse!.list?.first.main!.temp.toString()}hPa',secondTitle: 'Pressure'),
                        const Spacer(),
                        showWeatherDetail(size,firstTitle: 'City',firstSubTitle: weatherProvider.weatherResponse!.city!.name.toString(),secondSubTitle: '${WeatherProvider.windSpeed(weatherProvider.weatherResponse!.list!.first.wind!.speed!.toDouble())}km/h',secondTitle: 'Speed'),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    weatherProvider.weatherResponse!.list!.isNotEmpty ?
                    Expanded(
                      child: ListView.builder(
                        // shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: weatherProvider.weatherResponse!.list!.length,
                          itemBuilder: (context,index){
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: InkWell(
                                onTap: (){
                                  showWeatherDetails(list:weatherProvider.weatherResponse!.list![index],city: weatherProvider.weatherResponse?.city,main: weatherProvider.weatherResponse!.list![index].main);
                                },
                                child: Container(
                                  //height: 400,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(color: Colors.white,width: 1)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(WeatherProvider.getDateFromDateTimeString(weatherProvider.weatherResponse!.list![index].dtTxt!),style: const TextStyle(color: Colors.white),),
                                        Text(WeatherProvider.getTimeFromDateTimeString(weatherProvider.weatherResponse!.list![index].dtTxt!),style: const TextStyle(color: Colors.white),),
                                        Container(height: 50,width: 50,decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage('https://openweathermap.org/img/w/${weatherProvider.weatherResponse!.list![index].weather!.first.icon!}.png'),
                                                fit: BoxFit.fill
                                            )
                                        ),),
                                        Text('${WeatherProvider.kelvinToCelsius(weatherProvider.weatherResponse!.list![index].main!.temp!.toDouble(),)}\u00B0',style: const TextStyle(color: Colors.white),),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ) : const SizedBox(),
                    const SizedBox(height: 10,),
                    const Spacer(),
                  ],
                ),
              ),
            );
          }
          else{
            return Container(
              height: size.height,
              width: size.width,
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Please try again',style: TextStyle(color: Colors.white),),
                  const SizedBox(height: 10,),
                  ElevatedButton(onPressed: () async {
                    await weatherProvider.fetchWeatherPro(context,longitude: weatherProvider.longitude,latitude: weatherProvider.latitude,zipCode: '');
                  }, child: const Text('Retry')),
                ],
              ),
            );
          }
        }),
      ),
    );
  }

  Padding showWeatherDetail(Size size,{required String firstTitle,required String firstSubTitle,required String secondTitle,required String secondSubTitle}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: size.width/2.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.1),
              offset: const Offset(0, 1), // Offset
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(firstTitle,style: const TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.bold),),
              Text(firstSubTitle,style: const TextStyle(color: Colors.white,fontSize: 20),),
              Text(secondTitle,style: const TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.bold),),
              Text(secondSubTitle,style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w100),)
            ],
          ),
        ),
      ),
    );
  }


  void showWeatherDetails({required WeatherData list,required City? city,required Main? main}) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        Size size = MediaQuery.of(context).size;
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: StatefulBuilder(
            // This is the key widget
            builder: (BuildContext context, StateSetter setStateModal) {
              // StateSetter to update the modal's state
              return SizedBox(
                height: size.height/1.2,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 50,),
                      Container(height: 150,width: 150,decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage('https://openweathermap.org/img/w/${list.weather!.first.icon!}.png'),
                              fit: BoxFit.cover
                          )
                      ),),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text('${WeatherProvider.kelvinToCelsius(list.main!.temp!.toDouble(),)}\u00B0',style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: Colors.blue),),
                              const Text('',style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: Colors.blue),),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black,width: 1)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: rowWidget('Sun Rise',WeatherProvider.convertTimeZoneToTime(city!.sunrise!.toInt())),
                        ),),
                      const SizedBox(height: 20,),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black,width: 1)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: rowWidget('Sun Set',WeatherProvider.convertTimeZoneToTime(city!.sunrise!.toInt())),
                          )),
                      const SizedBox(height: 20,),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black,width: 1)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: rowWidget('Temp min','${WeatherProvider.kelvinToCelsius(main?.tempMin!.toDouble() ?? 0.0).toString()} \u00B0',),
                          )),
                      const SizedBox(height: 20,),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black,width: 1)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: rowWidget('Temp max','${WeatherProvider.kelvinToCelsius(main?.tempMax!.toDouble() ?? 0.0).toString()} \u00B0'),
                          )),
                      const SizedBox(height: 20,),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black,width: 1)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: rowWidget('Humidity',"${main!.humidity!.toString()}%"),
                          )),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

