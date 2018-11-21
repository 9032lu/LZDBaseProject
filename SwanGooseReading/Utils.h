//
//  Utils.h
//  WormManager
//
//  Created by ZhangTu on 2018/1/12.
//  Copyright © 2018年 zhangtu. All rights reserved.
//

#ifndef Utils_h
#define Utils_h

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]

#define UIColorFromHex(s) [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s &0xFF00) >>8))/255.0 blue:((s &0xFF))/255.0 alpha:1.0]

#define fontScale [UIScreen mainScreen].bounds.size.width/375.0
#define bigFont [UIFont systemFontOfSize:24 * fontScale]
#define largeFont [UIFont systemFontOfSize:20 * fontScale]
#define BMTitleFont [UIFont systemFontOfSize:18 * fontScale]
#define BMNormalFont [UIFont systemFontOfSize:16 * fontScale]
#define BMFifteenFont [UIFont systemFontOfSize:16 * fontScale]

#define BMsmallFont [UIFont systemFontOfSize:14 * fontScale]
#define SAMCHAIN_SERVE @"com.swanGooseReading.www"
#define SAMCHAIN_UUID  @"uuid"

#define LZDMainColor  RGB(194,31,24)

#define  SETTitleTextColorFont  [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:largeFont,NSForegroundColorAttributeName:RGB(255,255,255)}];

//真机还是模拟器
#if TARGET_IPHONE_SIMULATOR
#define SIMULATOR 1
#elif TARGET_OS_IPHONE
#define SIMULATOR 0
#endif


#define ScreenWidth   [UIScreen mainScreen].bounds.size.width
#define ScreenHeight   [UIScreen mainScreen].bounds.size.height
// 判断是否为iPhone X 系列  这样写消除了在Xcode10上的警告。
#define iPhoneX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})


//#define iPhoneX (ScreenWidth == 375.f && ScreenHeight == 812.f ? YES : NO)
// Status bar height.
#define StatusBarHeight  (iPhoneX ? 44.f : 20.f)

// Navigation bar height.
#define NavigationBarHeight  44.f

// Tabbar height.
#define TabbarHeight  (iPhoneX ? (49.f+34.f) : 49.f)
// Tabbar safe bottom margin.
#define TabbarSafeBottomMargin (iPhoneX ? 34.f : 0.f)
// Status bar & navigation bar height.
#define StatusBarAndNavigationBarHeight  (iPhoneX ? 88.f : 64.f)

#define ViewSafeAreInsets(view) ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})

#define  PUSH(viewColler)  viewColler*vc =[[viewColler alloc]init];[self.navigationController pushViewController:vc animated:YES];

#define  POP   [self.navigationController popViewControllerAnimated:YES];

//打印的日志
#ifdef DEBUG
#define LZDLog(...) \
NSLog(@"%@第%d行:%@\n---------------------------",[[NSString stringWithFormat:@"%s",__FILE__] componentsSeparatedByString:@"/"][[[NSString stringWithFormat:@"%s",__FILE__] componentsSeparatedByString:@"/"].count-1], __LINE__, [NSString stringWithFormat:__VA_ARGS__]);
#else
#define LZDLog(...)
#endif

#define  BUILDIDNOTIFICATION @"buildIDNotification"

//图书图片占位图
#define BOOKPlaceHolderImgName @"bookCover"
#define HeaderPlaceHolderImgName @"资源 5"

#define BannedColor RGBA(200,103,53,1.0)


#define themeColor_O RGBA(239,197,53,1.0)

#define themeColor_light RGBA(242,220,153,1.0)

#define backgColor RGBA(234,234,234,1.0)
#define TEXTColor  RGBA(51,51,15,1.0)

#define TEXTLightGrayColor  RGBA(153,153,153,1.0)

/** 按钮颜色 */
#define ZTBTNCOLOR  RGBA(255, 180, 0,1)


#define  IP_   @"154"

#ifdef DEBUG

#define RequestTimeOut 150
#define  URLHeader   [NSString stringWithFormat:@"http://192.168.0.%@:8080/",IP_]

#else
#define RequestTimeOut 15


#define  URLHeader   @"http://t1.beijingzhangtu.com/"

#endif


/**
 图书图片
 */
#define  BookIconHeader  @"http://ti.beijingzhangtu.com:8088/api/pic/isbn/"


/**
 头型地址

 */
#define  IMGHeader   [NSString stringWithFormat:@"%@upload/",URLHeader]

/**
 1.1.1、获取馆员信息（我的模块）
*/
#define Mine_getLibAdminInfo   [NSString stringWithFormat:@"%@librarian/mine/getLibAdminInfo.html",URLHeader]


/**
 1.1.2、馆员端绑定或修改手机号操作

 */
#define Mine_bindingPhone   [NSString stringWithFormat:@"%@librarian/mine/bindingPhone.html",URLHeader]


/**
 获取验证码
 */
#define Mine_getMessageCode [NSString stringWithFormat:@"%@librarian/index/getMessageCode.html", URLHeader]


/**
 1.1.3、头像上传

 */
#define Mine_editHeader [NSString stringWithFormat:@"%@librarian/mine/editHeader.html",URLHeader]


/**
 1.2.1、添加问题
 */
#define Mine_addContactZtProblem [NSString stringWithFormat:@"%@librarian/contactZtProblem/addContactZtProblem.html",URLHeader]



/**
 1.2.2、获得问题列表
 */
#define Mine_getContactZtProblemListr [NSString stringWithFormat:@"%@librarian/contactZtProblem/getContactZtProblemList.html",URLHeader]



/**
 1.2.3、馆员回复
 */
#define Mine_addContactZtReplyProblem [NSString stringWithFormat:@"%@librarian/contactZtProblemReply/addContactZtReplyProblem.html",URLHeader]
/**
 1.2.4、获得某个问题的详细回复列表
 */
#define Mine_getThisProblemReplyList [NSString stringWithFormat:@"%@librarian/contactZtProblem/getThisProblemReplyList.html",URLHeader]

/**
 2.1咨询建议
 2.1.1、根据状态获得咨询建议列表
 
 status  0待处理，1已处理
 type  1咨询建议（这里取1），2报误报缺
 */
#define Consultation_getConsultationOrMistakeListByStatus [NSString stringWithFormat:@"%@librarian/consultation/getConsultationOrMistakeListByStatus.html",URLHeader]



/**
 2.1.2、根据cardNumber搜索，获得咨询建议列表

 */
#define Consultation_searchConsultationOrMistakeList [NSString stringWithFormat:@"%@librarian/consultation/searchConsultationOrMistakeList.html",URLHeader]
/**
2.1.3、获得之前的咨询建议的回复
 */
#define Consultation_getAgoConsultationAndReplyDetail [NSString stringWithFormat:@"%@librarian/consultation/getAgoConsultationAndReplyDetail.html",URLHeader]
/**
 2.1.4、咨询意见的回复编辑操作
 */
#define Consultation_editConsultation [NSString stringWithFormat:@"%@librarian/consultation/editConsultation.html",URLHeader]


/**
 2.2读者信息
 2.2.1通过卡号或姓名搜索读者

 */
#define Reader_getReaderByKeywords [NSString stringWithFormat:@"%@librarian/reader/getReaderByKeywords.html", URLHeader]


/**
 2.2.2获取读者模块的记录数据信息

 */
#define Reader_getReaderRecords [NSString stringWithFormat:@"%@librarian/reader/getReaderRecords.html", URLHeader]


/**
 2.2.3 获取读者在借图书

 */
#define Reader_Borrow_getlist [NSString stringWithFormat:@"%@api/borrow/getList.html", URLHeader]

/**
 2.2.3 获取读者预约图书

 */
#define Reader_Appointment_getlist [NSString stringWithFormat:@"%@api/appointment/getList.html", URLHeader]



/**
 2.2.4 获取读者借阅历史
 
 */
#define Reader_Borrow_getOldList [NSString stringWithFormat:@"%@api/borrow/getOldList.html", URLHeader]


/**
 2.2.4 获取读者座位预约记录

 */
#define Reader_getYyseatRecords [NSString stringWithFormat:@"%@librarian/reader/getYyseatRecords.html", URLHeader]

/**
 2.2.5 获取研讨室预约记录

 
 */
#define Reader_getSeminarroomRecords [NSString stringWithFormat:@"%@librarian/reader/getSeminarroomRecords.html", URLHeader]
/**
 2.2.6 获取讲座预约记录
 */
#define Reader_getLectureRecords [NSString stringWithFormat:@"%@librarian/reader/getLectureRecords.html", URLHeader]


/**
 2.2.7 购买图书

 */
#define Reader_getBuyBookRecords [NSString stringWithFormat:@"%@librarian/reader/getBuyBookRecords.html", URLHeader]
/**
 2.2.8 续借记录
 
 */
#define Reader_getRenewLogRecords [NSString stringWithFormat:@"%@librarian/reader/getRenewLogRecords.html", URLHeader]
/**
 2.2.9 转借记录
 */
#define Reader_getLibraryLentRecords [NSString stringWithFormat:@"%@librarian/reader/getLibraryLentRecords.html", URLHeader]
/**
 2.2.10 调拨记录
 */
#define Reader_getAllocationRecords [NSString stringWithFormat:@"%@librarian/reader/getAllocationRecords.html", URLHeader]

/**
 2.2.11找书记录

 */
#define Reader_getFindBookRecords [NSString stringWithFormat:@"%@librarian/reader/getFindBookRecords.html", URLHeader]
/**
 2.2.12荐购记录
 
 */
#define Reader_getRecommendRecords [NSString stringWithFormat:@"%@librarian/reader/getRecommendRecords.html", URLHeader]


/**
 2.2.13咨询意见
 
 */
#define Reader_getConsultationRecords [NSString stringWithFormat:@"%@librarian/reader/getConsultationRecords.html", URLHeader]


/**
 2.2.14图书评论
 */
#define Reader_getCommentRecords [NSString stringWithFormat:@"%@librarian/reader/getCommentRecords.html", URLHeader]

/**
 2.2.15图书评论
 */
#define Reader_getSeatNotContractRecords [NSString stringWithFormat:@"%@librarian/reader/getSeatNotContractRecords.html", URLHeader]

/**
 2.2.16通过咨询意见的id获取问答记录
 */
#define Reader_quickReply_getQuickReplyListByType [NSString stringWithFormat:@"%@librarian/quickReply/getQuickReplyListByType.html", URLHeader]

/**
 2.4消息模块
 2.4.1获取不同类型的消息列表
 */
#define Reader_Message_getMessageList [NSString stringWithFormat:@"%@librarian/message/getMessageList.html", URLHeader]

/**
 2.4.3获取消息详情
 */
#define Reader_Message_getMessageInfo [NSString stringWithFormat:@"%@librarian/message/getMessageInfo.html", URLHeader]

/**
2.4.2发送不同类型的消息列表
 */
#define Reader_Message_sendMessage [NSString stringWithFormat:@"%@librarian/message/sendMessage.html", URLHeader]


/**
 3、    图书模块
 3.0获取图书模块首页数据

 */

#define BOOKSERVICE_getHomePageData [NSString stringWithFormat:@"%@librarian/bookservice/getHomePageData.html", URLHeader]

/**
 3.1.1根据处理状态获取购书列表并分页（购书审批模块）

 <待处理和待下单>1代表待处理，3代表同意购买(待下单)
 */

#define BUYBOOKRECORD_getLibraryOrderList [NSString stringWithFormat:@"%@librarian/buybookrecord/getLibraryOrderList.html", URLHeader]

/**
 <已拒绝和图书状态模块待收货，已收货，已归还> 2代表已拒绝 ，,4待收货，5已收货（在借） ，6代表归还

 */


#define BUYBOOKRECORD_getBookStatusList [NSString stringWithFormat:@"%@librarian/buybookrecord/getBookStatusList.html", URLHeader]

/**
 3.1.2进行买书申请拒绝操作（支持批量操作）2代表已拒绝

 */
#define BUYBOOKRECORD_refuse [NSString stringWithFormat:@"%@librarian/buybookrecord/refuse.html", URLHeader]
/**
 3.1.3进行买书申请同意
 
 */
#define BUYBOOKRECORD_agreement [NSString stringWithFormat:@"%@librarian/buybookrecord/agreement.html", URLHeader]
/**
 3.1.4、批量提交订单到京东操作
 
 */
#define BUYBOOKRECORD_batch_submission [NSString stringWithFormat:@"%@librarian/buybookrecord/batch_submission.html", URLHeader]


/**
 3.1.5、通过订单号获取物流信息

 */
#define BUYBOOKRECORD_getLogisticsByOrderId [NSString stringWithFormat:@"%@librarian/buybookrecord/getLogisticsByOrderId.html", URLHeader]
/**
 3.1.6、购书模块加入黑名单操作
 
 */
#define BUYBOOKRECORD_joinBlackList [NSString stringWithFormat:@"%@librarian/buybookrecord/joinBlackList.html", URLHeader]
/**
 3.1.7、获取图书馆购书可用金额
 
 */
#define BUYBOOKRECORD_overdueNotice [NSString stringWithFormat:@"%@librarian/buybookrecord/overdueNotice.html", URLHeader]
/**
3.1.8、到期还书批量提醒
 */
#define BUYBOOKRECORD_getLibraryMone [NSString stringWithFormat:@"%@librarian/buybookrecord/getLibraryMoney.html", URLHeader]


/**
 3.2荐购
 3.2.1、根据处理状态和排序类型获取荐购列表并分页
 */
#define RECOMMEND_getRecommendList [NSString stringWithFormat:@"%@librarian/recommend/getRecommendList.html", URLHeader]
/**
 3.2.2、进行荐购审批操作（支持批量操作）
 */
#define RECOMMEND_approval [NSString stringWithFormat:@"%@librarian/recommend/approval.html", URLHeader]
/**
 3.2.3、荐购图书模块加入黑名单操作

 */
#define RECOMMEND_joinBlackList [NSString stringWithFormat:@"%@librarian/recommend/joinBlackList.html", URLHeader]


/**
 3.3找书
 3.3.1、通过状态获取找书数据

 */
#define FINDBOOK_getFindBookByState [NSString stringWithFormat:@"%@librarian/findbook/getFindBookByState.html", URLHeader]

/**
 3.3.2、开始找书操作（支持批量操作）
 
 */
#define FINDBOOK_startFindBooks [NSString stringWithFormat:@"%@librarian/findbook/startFindBooks.html", URLHeader]
/**
 3.3.3、未找到书操作
 
 */
#define FINDBOOK_notFoundBook [NSString stringWithFormat:@"%@librarian/findbook/notFoundBook.html", URLHeader]
/**
 3.3.3、确认馆藏码
 
 */
#define FINDBOOK_FoundBook [NSString stringWithFormat:@"%@librarian/findbook/FoundBook.html", URLHeader]


/**
 3.4送书
 3.4.1、通过状态获取送书数据
 
 */
#define SENDBOOK_getSendBookByState [NSString stringWithFormat:@"%@librarian/sendbook/getSendBookByState.html", URLHeader]
/**
 3.4.2、送书请求的同意、拒绝操作
 
 */
#define SENDBOOK_agreementSendBook [NSString stringWithFormat:@"%@librarian/sendbook/agreementSendBook.html", URLHeader]


/**
 3.5调拨
 3.5.1根据状态获取调拨数据
 
 */
#define ALLOCATION_getAllocationByState [NSString stringWithFormat:@"%@librarian/allocation/getAllocationByState.html", URLHeader]

/**
3.5.2、调拨请求的同意和拒绝
 */
#define ALLOCATION_approveAllocation [NSString stringWithFormat:@"%@librarian/allocation/approveAllocation.html", URLHeader]



/**
 3.6.2、获得续借列表
 
 */
#define BORROWBOOK_getRenewList [NSString stringWithFormat:@"%@librarian/borrowbook/getRenewList.html", URLHeader]

/**
 3.6.3、获得转借列表

 
 */
#define BORROWBOOK_getBookLentList [NSString stringWithFormat:@"%@librarian/borrowbook/getBookLentList.html", URLHeader]
/**
3.6.4、获得预约列表
 
 */
#define BORROWBOOK_getBookAppointmentList [NSString stringWithFormat:@"%@librarian/borrowbook/getBookAppointmentList.html", URLHeader]

/**
 3.7好书推荐
 3.7.1、获得新书到馆列表
 
 */
#define GOODBOOK_getNewBooks [NSString stringWithFormat:@"%@librarian/goodbook/getNewBooks.html", URLHeader]

/**
 3.7.2、获得馆员推荐类型列表及其列表对应的书目信息
 */
#define GOODBOOK_getGoodBookLevel [NSString stringWithFormat:@"%@librarian/goodbook/getGoodBookLevel.html", URLHeader]

/**
3.7.3、根据馆员推荐的子类型获取对应的书目

 */
#define GOODBOOK_getGoodBooksByTypeLevel [NSString stringWithFormat:@"%@librarian/goodbook/getGoodBooksByTypeLevel.html", URLHeader]
/**
 3.7.4、通过isbn查询图书

 */
#define GOODBOOK_getBookByISBN [NSString stringWithFormat:@"%@librarian/goodbook/getBookByISBN.html", URLHeader]
/**
3.7.5、在现有主题下添加新图书
 
 */
#define GOODBOOK_addGoodBookAndTyprLevel [NSString stringWithFormat:@"%@librarian/goodbook/addGoodBookAndTyprLevel.html", URLHeader]


/**
 3.8图书评论
3.8.1、通过不同的排序方式获取书评列表
 */
#define BOOKCOMMENT_getCommentByType [NSString stringWithFormat:@"%@librarian/comment/getCommentByType.html", URLHeader]


/**
3.8.2、隐藏、恢复评论
 
 */
#define BOOKCOMMENT_hideOrShowComment [NSString stringWithFormat:@"%@librarian/comment/hideOrShowComment.html", URLHeader]
/**
 3.8.3、禁言操作

 
 */
#define BOOKCOMMENT_banned [NSString stringWithFormat:@"%@librarian/comment/banned.html", URLHeader]

/**
 3.8.4、解禁操作

 */
#define BOOKCOMMENT_openBanned [NSString stringWithFormat:@"%@librarian/comment/openBanned.html", URLHeader]

/**
3.8.5、获取禁言列表
 */
#define BOOKCOMMENT_getCommentBlackList [NSString stringWithFormat:@"%@librarian/comment/getCommentBlackList.html", URLHeader]
/**
 3.8.6、获取图书的评论并分页
 */
#define BOOKCOMMENT_getCommentPeople [NSString stringWithFormat:@"%@librarian/comment/getCommentPeople.html", URLHeader]

/**
 4、登录
 4.2找回密码

 */
#define Login_index_forgetPassword [NSString stringWithFormat:@"%@librarian/index/forgetPassword.html", URLHeader]


/*
 
 5 空间座位
 5.1.0获取房间座位布局图，前端提供网页
 **/

#define SEAT_seatViewUrl  [NSString stringWithFormat:@"%@librarian/seat/seatViewUrl.html", URLHeader]

/**
 5.1.1 获取楼宇ID
 
 */
#define SEAT_getBuildByLibraryId  [NSString stringWithFormat:@"%@librarian/seat/getBuildByLibraryId.html", URLHeader]

/**
 5.1.2 通过楼宇id获取楼层和房间

 */
#define SEAT_getFloorAndRoom  [NSString stringWithFormat:@"%@librarian/seat/getFloorAndRoom.html", URLHeader]

/**
 5.1.3 离座提醒（给长时间离座的用户推送提醒消息,支持一次提醒多个用户，注意，测试请用掌图书蜗测试，不能用正式学校测试）

 */
#define SEAT_leaveSeatRemind  [NSString stringWithFormat:@"%@librarian/seat/leaveSeatRemind.html", URLHeader]

/**
 5.1.4 点击座位时，获取座位的预约信息

 */
#define SEAT_getYySeatAppointmentInfo  [NSString stringWithFormat:@"%@librarian/seat/getYySeatAppointmentInfo.html", URLHeader]

/**
5.1.5 清除违约记录
 */
#define SEAT_clearSeatDefaultRecord  [NSString stringWithFormat:@"%@librarian/seat/clearSeatDefaultRecord.html", URLHeader]

/**
5.1.6 通过楼宇获取不同楼层及房间的ibeacon设备
 */
#define SEAT_getRoomIbeacons  [NSString stringWithFormat:@"%@librarian/seat/getRoomIbeacons.html", URLHeader]

/**
5.1.7 ibeacon报修
 */
#define SEAT_repair  [NSString stringWithFormat:@"%@librarian/seat/repair.html", URLHeader]

/**
 5.1.8 解绑ibeacon
 */
#define SEAT_unbind  [NSString stringWithFormat:@"%@librarian/seat/unbind.html", URLHeader]

/**
 5.1.9 通过图书馆id获取未使用的ibeacon
 */
#define SEAT_getNnusedIbeaconsByLibraryId  [NSString stringWithFormat:@"%@librarian/seat/getNnusedIbeaconsByLibraryId.html", URLHeader]

/**
 5.1.10 给房间添加ibeacon（支持批量操作）
 */
#define SEAT_addIbeacons  [NSString stringWithFormat:@"%@librarian/seat/addIbeacons.html", URLHeader]
/**
 5.1.11 通过楼宇获取违约记录
 */
#define SEAT_getSeatDefaultRecord  [NSString stringWithFormat:@"%@librarian/seat/getSeatDefaultRecord.html", URLHeader]

/**
 5.2研讨室
 5.2.1 通过分馆和状态获得研讨室审批数据
 */
#define SEMINARROOM_getFutureSeminarroomDateByStatus  [NSString stringWithFormat:@"%@librarian/seminarroom/getFutureSeminarroomDateByStatus.html", URLHeader]

/**
 5.2.3 审批研讨室申请
 */
#define SEMINARROOM_applySeminarroom  [NSString stringWithFormat:@"%@librarian/seminarroom/applySeminarroom.html", URLHeader]


/**
 5.2.4 获得预约情况
 */
#define SEMINARROOM_getSeminarroomAppointmentDetail  [NSString stringWithFormat:@"%@librarian/seminarroom/getSeminarroomAppointmentDetail.html", URLHeader]

/**
 5.2.5 通过图书馆、研讨室ID、开始时间、结束时间获得详情
 */
#define SEMINARROOM_getAppointmentDetailByTime  [NSString stringWithFormat:@"%@librarian/seminarroom/getAppointmentDetailByTime.html", URLHeader]

/**
 5.2.6 通过图书馆、分馆ID获得研讨室信息
 */
#define SEMINARROOM_getYySeminarroomInfoList  [NSString stringWithFormat:@"%@librarian/seminarroom/getYySeminarroomInfoList.html", URLHeader]



/**
 5.2.5 确认签到
 */
#define SEMINARROOM_agreeSignIn  [NSString stringWithFormat:@"%@librarian/seminarroom/agreeSignIn.html", URLHeader]


/**
 5.3讲座
 
 */
#define LECTURE_getLecturesByType  [NSString stringWithFormat:@"%@librarian/lecture/getLecturesByType.html", URLHeader]
/**
 5.3.1讲座详情
 */
#define LECTURE_getLectureDetails  [NSString stringWithFormat:@"%@librarian/lecture/getLectureDetails.html", URLHeader]

/**
 5.3.2新增讲座
 */
#define LECTURE_addLecture  [NSString stringWithFormat:@"%@librarian/lecture/addLecture.html", URLHeader]
/**
 
5.3.3修改讲座
*/
#define LECTURE_saveLecture  [NSString stringWithFormat:@"%@librarian/lecture/saveLecture.html", URLHeader]


/**
 5.3.4教研性讲座转换为确定性讲座

*/
#define LECTURE_changeToensureLecture  [NSString stringWithFormat:@"%@librarian/lecture/changeToensureLecture.html", URLHeader]


/**
 5.3.5取消讲座
 
 */
#define LECTURE_cancelLecture  [NSString stringWithFormat:@"%@librarian/lecture/cancelLecture.html", URLHeader]


/**
 6.1 馆员端设备报修
 6.1.0 获取报修列表并分页（支持通过条件来筛选）
 */

#define EQUIPMENT_getEquipmentRepairList  [NSString stringWithFormat:@"%@/librarian/equipmentRepairRecord/getEquipmentRepairList.html", URLHeader]


/**
6.1.1 获取报修记录的详情（包括照片和详情）
 */
#define EQUIPMENT_getEquipmentRepairDetails  [NSString stringWithFormat:@"%@/librarian/equipmentRepairRecord/getEquipmentRepairDetails.html", URLHeader]

/**
6.1.2 接受、派工，完成，拒绝等操作

 */
#define EQUIPMENT_handleEquipmentRepair  [NSString stringWithFormat:@"%@/librarian/equipmentRepairRecord/handleEquipmentRepair.html", URLHeader]



/**
 7 扫一扫
 7.1.1扫一扫通过isbn获取购书模块在借中的买书列表
 */
#define SCANING_inTheBorrowBuyBookRecords  [NSString stringWithFormat:@"%@librarian/buybookrecord/inTheBorrowBuyBookRecords.html", URLHeader]

/**
 7.1.2归还图书操作
 */
#define SCANING_returnBuyBook  [NSString stringWithFormat:@"%@librarian/buybookrecord/returnBuyBook.html", URLHeader]


/**
 7.2.1扫一扫中的图书调拨模块获取调拨中的数据
 */
#define SCANING_getAllocationList  [NSString stringWithFormat:@"%@librarian/allocation/getAllocationList.html", URLHeader]
/**
 7.2.2调拨已完成操作
 */
#define SCANING_finishAllocation  [NSString stringWithFormat:@"%@librarian/allocation/finishAllocation.html", URLHeader]






#endif /* Utils_h */
