//
//  Define.h
//  PoorTravel
//
//  Created by zhoushuyang on 16/3/11.
//  Copyright © 2016年 周书阳. All rights reserved.
//

#ifndef Define_h
#define Define_h

#define  URL @"http://open.qyer.com/qyer/footprint/continent_list?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&lat=34.77419010092729&lon=113.6696828563265&page=1&track_app_channel=App%2520Store&track_app_version=6.8.5&track_device_info=iPhone%25204S&track_deviceid=0EE7A3E0-AAD8-436A-BFFC-ECC1ADE4A180&track_os=ios%25208.0.2&v=1"
#define DetailURL @"http://open.qyer.com/qyer/footprint/country_detail?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&country_id=###&lat=34.77650380247923&lon=113.6702420416546&page=1&track_app_channel=App%2520Store&track_app_version=6.8.5&track_device_info=iPhone%25204S&track_deviceid=0EE7A3E0-AAD8-436A-BFFC-ECC1ADE4A180&track_os=ios%25208.0.2&v=1"
#define LastUrl @"http://open.qyer.com/place/city/get_city_list?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&countryid=###&lat=34.77650380247923&lon=113.6702420416546&page=1&track_app_channel=App%2520Store&track_app_version=6.8.5&track_device_info=iPhone%25204S&track_deviceid=0EE7A3E0-AAD8-436A-BFFC-ECC1ADE4A180&track_os=ios%25208.0.2&v=1"
//第一个地图
#define mapURL @"http://open.qyer.com/qyer/map/city_list?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&country_id=###&lat=34.77419393220192&lon=113.6696817999624&page=1&track_app_channel=App%2520Store&track_app_version=6.8.5&track_device_info=iPhone%25204S&track_deviceid=0EE7A3E0-AAD8-436A-BFFC-ECC1ADE4A180&track_os=ios%25208.0.2&v=1"

//超值自由行 查看全部
//超值自由行
#define URL1 @"http://open.qyer.com/qyer/discount/tickets_freewalker?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&id=11&lat=34.77419393220192&lon=113.6696817999624&order=2&page=1&product_type=1016%2C1018%2C1020&time=1&track_app_channel=App%2520Store&track_app_version=6.8.5&track_device_info=iPhone%25204S&track_deviceid=0EE7A3E0-AAD8-436A-BFFC-ECC1ADE4A180&track_os=ios%25208.0.2&type=1&v=1"
//精彩当地游
#define URL2 @"http://open.qyer.com/qyer/discount/local_discount?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&id=11&lat=34.77814643987844&lon=113.6710034736142&order=2&page=1&product_type=2410&time=1&track_app_channel=App%2520Store&track_app_version=6.8.5&track_device_info=iPhone%25204S&track_deviceid=0EE7A3E0-AAD8-436A-BFFC-ECC1ADE4A180&track_os=ios%25208.0.2&type=1&v=1"

//超值自由行 Cell被点击
#define dicCountURL @"http://open.qyer.com/lastminute/get_detail?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&id=55189&lat=34.77419393220192&lon=113.6696817999624&page=1&track_app_channel=App%2520Store&track_app_version=6.8.5&track_device_info=iPhone%25204S&track_deviceid=0EE7A3E0-AAD8-436A-BFFC-ECC1ADE4A180&track_os=ios%25208.0.2&v=1"






//城市Cell 点击 后的 接口
#define CityDetail @"http://open.qyer.com/qyer/footprint/city_detail?city_id=50&client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&lat=34.77814643987844&lon=113.6710034736142&page=1&track_app_channel=App%2520Store&track_app_version=6.8.5&track_device_info=iPhone%25204S&track_deviceid=0EE7A3E0-AAD8-436A-BFFC-ECC1ADE4A180&track_os=ios%25208.0.2&v=1"
//精选按钮被点击
#define mguidURL @"http://open.qyer.com/qyer/footprint/mguide_list?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=10&id=50&lat=34.77814643987844&lon=113.6710034736142&page=1&track_app_channel=App%2520Store&track_app_version=6.8.5&track_device_info=iPhone%25204S&track_deviceid=0EE7A3E0-AAD8-436A-BFFC-ECC1ADE4A180&track_os=ios%25208.0.2&type=city&v=1"
//游玩按钮被点击
#define TravelUrl @"http://open.qyer.com/qyer/onroad/poi_list?category_id=32%2C147%2C148&city_id=50&client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&orderby=popular&page=1&track_app_channel=App%2520Store&track_app_version=6.8.5&track_device_info=iPhone%25204S&track_deviceid=0EE7A3E0-AAD8-436A-BFFC-ECC1ADE4A180&track_os=ios%25208.0.2&types=&v=1"
//美食
#define FoodURL @"http://open.qyer.com/qyer/onroad/poi_list?category_id=78&city_id=50&client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&orderby=popular&page=1&track_app_channel=App%2520Store&track_app_version=6.8.5&track_device_info=iPhone%25204S&track_deviceid=0EE7A3E0-AAD8-436A-BFFC-ECC1ADE4A180&track_os=ios%25208.0.2&types=&v=1"
//酒店
#define SleepURL @"http://open.qyer.com/qyer/hotel/search_list?checkin=2016-4-17%2000%3A00%3A01&checkout=2016-4-18%2023%3A59%3A59&city_id=50&client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&from_key=app_ios_city_search&lat=34.77814643987844&lon=113.6710034736142&orderby=1&page=1&track_app_channel=App%2520Store&track_app_version=6.8.5&track_device_info=iPhone%25204S&track_deviceid=0EE7A3E0-AAD8-436A-BFFC-ECC1ADE4A180&track_os=ios%25208.0.2&v=1"
#define searchURLSleep @"http://open.qyer.com/qyer/hotel/search_filters?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&lat=34.77814643987844&lon=113.6710034736142&page=1&track_app_channel=App%2520Store&track_app_version=6.8.5&track_device_info=iPhone%25204S&track_deviceid=0EE7A3E0-AAD8-436A-BFFC-ECC1ADE4A180&track_os=ios%25208.0.2&v=1"


//地图
#define MapURL @"http://open.qyer.com/qyer/map/poi_list?cate_id=32&city_id=51&client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&lat=34.77814643987844&lon=113.6710034736142&page=1&track_app_channel=App%2520Store&track_app_version=6.8.5&track_device_info=iPhone%25204S&track_deviceid=0EE7A3E0-AAD8-436A-BFFC-ECC1ADE4A180&track_os=ios%25208.0.2&v=1"
//城市实用信息
#define CityUserfulURL @"http://open.qyer.com/qyer/place/city_useful_info?city_id=51&client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&lat=34.77814643987844&lon=113.6710034736142&page=1&track_app_channel=App%2520Store&track_app_version=6.8.5&track_device_info=iPhone%25204S&track_deviceid=0EE7A3E0-AAD8-436A-BFFC-ECC1ADE4A180&track_os=ios%25208.0.2&v=1"
//*******City查看全部
//精彩当地游
#define CityLocalURL @"http://open.qyer.com/qyer/discount/local_discount?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&id=51&lat=34.77814643987844&lon=113.6710034736142&order=2&page=1&product_type=2410&time=1&track_app_channel=App%2520Store&track_app_version=6.8.5&track_device_info=iPhone%25204S&track_deviceid=0EE7A3E0-AAD8-436A-BFFC-ECC1ADE4A180&track_os=ios%25208.0.2&type=2&v=1"
//超值自由行
#define CityDiscountULR @"http://open.qyer.com/qyer/discount/local_discount?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&id=51&lat=34.77814643987844&lon=113.6710034736142&order=2&page=1&product_type=2410&time=1&track_app_channel=App%2520Store&track_app_version=6.8.5&track_device_info=iPhone%25204S&track_deviceid=0EE7A3E0-AAD8-436A-BFFC-ECC1ADE4A180&track_os=ios%25208.0.2&type=2&v=1"
//Cell 被点击
#define CityCellClick @"http://open.qyer.com/lastminute/get_detail?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&id=67359&lat=34.77814643987844&lon=113.6710034736142&page=1&track_app_channel=App%2520Store&track_app_version=6.8.5&track_device_info=iPhone%25204S&track_deviceid=0EE7A3E0-AAD8-436A-BFFC-ECC1ADE4A180&track_os=ios%25208.0.2&v=1"



//*******超值自由行 查看全部
//超值自由行
#define FreeURL @"http://open.qyer.com/qyer/discount/tickets_freewalker?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&id=51&lat=34.77814643987844&lon=113.6710034736142&order=2&page=1&product_type=1016%2C1018%2C1020&time=1&track_app_channel=App%2520Store&track_app_version=6.8.5&track_device_info=iPhone%25204S&track_deviceid=0EE7A3E0-AAD8-436A-BFFC-ECC1ADE4A180&track_os=ios%25208.0.2&type=2&v=1"
////精彩当地游
#define FreeLocal @"http://open.qyer.com/qyer/discount/tickets_freewalker?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&id=51&lat=34.77814643987844&lon=113.6710034736142&order=2&page=1&product_type=1016%2C1018%2C1020&time=1&track_app_channel=App%2520Store&track_app_version=6.8.5&track_device_info=iPhone%25204S&track_deviceid=0EE7A3E0-AAD8-436A-BFFC-ECC1ADE4A180&track_os=ios%25208.0.2&type=2&v=1"
//cell被点击
#define ClickURL @"http://open.qyer.com/lastminute/get_detail?client_id=qyer_ios&client_secret=cd254439208ab658ddf9&count=20&id=69884&lat=34.77814643987844&lon=113.6710034736142&page=1&track_app_channel=App%2520Store&track_app_version=6.8.5&track_device_info=iPhone%25204S&track_deviceid=0EE7A3E0-AAD8-436A-BFFC-ECC1ADE4A180&track_os=ios%25208.0.2&v=1"
#endif /* Define_h */
