//
//  NSString+Helper.m
//  HaveFace
//
//  Created by CGM on 15/11/18.
//  Copyright © 2015年 CGM. All rights reserved.
//

#import "NSString+Helper.h"
@implementation NSString (Helper)

#pragma mark 是否空字符串 不为空返回no,为空返回yes
- (BOOL)isEmptyString {
    if (![self isKindOfClass:[NSString class]]) {
        return YES;
    }else if (self==nil) {
        return YES;
    }else if(!self) {
        // null object
        return TRUE;
    } else if(self==NULL) {
        // null object
        return TRUE;
    } else if([self isEqualToString:@"NULL"]) {
        // null object
        return TRUE;
    }else if([self isEqualToString:@"(null)"]){
        
        return TRUE;
    }else{
        //  使用whitespaceAndNewlineCharacterSet删除周围的空白字符串
        //  然后在判断首位字符串是否为空
        NSString *trimedString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([trimedString length] == 0) {
            // empty string
            return TRUE;
        } else {
            // is neither empty nor null
            return FALSE;
        }
    }
}

#pragma mark 判断不包含特殊符号
-(BOOL)isNumAndword{
    NSString *reges = @"^[A-Za-z0-9-.]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", reges];
    return [pred evaluateWithObject:self];
}

#pragma mark 判断是否是手机号
- (BOOL)checkTel {
    NSString *regex = @"^((13[0-9])|(14[0-9])|(16[0-9])|(17[0-9])|(15[0-9])|(18[0-9]|(19[0-9])|))\\d{8}$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:self];
}

#pragma mark 判断是否是邮箱
- (BOOL)isValidateEmail {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}


#pragma mark 判断是否是纯数字
- (BOOL)isNumber {
    NSString *emailRegex = @"^[0-9]*$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

#pragma mark 清空字符串中的空白字符
- (NSString *)trimString {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

#pragma mark 返回沙盒中的文件路径
+ (NSString *)stringWithDocumentsPath:(NSString *)path {
    NSString *file = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    return [file stringByAppendingPathComponent:path];
}

#pragma mark 写入系统偏好
- (void)saveToNSDefaultsWithKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setObject:self forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark 一串字符在固定宽度下，正常显示所需要的高度 method
+ (CGFloat)autoHeightWithString:(NSString *)string Width:(CGFloat)width Font:(NSInteger)font {
    NSMutableParagraphStyle * paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineSpacing = 10;//行间距
    paragraph.paragraphSpacing = 50;//段落间隔
    paragraph.firstLineHeadIndent = 50;//首行缩近
    //绘制属性（字典）
    NSDictionary * dictA = @{NSFontAttributeName:[UIFont systemFontOfSize:font],
                             NSForegroundColorAttributeName:[UIColor greenColor],
                             NSBackgroundColorAttributeName:[UIColor grayColor],
                             NSParagraphStyleAttributeName:paragraph,
                             };

    //大小
    CGSize boundRectSize = CGSizeMake(width, MAXFLOAT);
    
    //调用方法,得到高度
    CGFloat newFloat = [string boundingRectWithSize:boundRectSize
                                            options: NSStringDrawingUsesLineFragmentOrigin
                        | NSStringDrawingUsesFontLeading
                                         attributes:dictA context:nil].size.height;
    return newFloat;
}

#pragma mark 一串字符在一行中正常显示所需要的宽度 method
+ (CGFloat)autoWidthWithString:(NSString *)string Font:(NSInteger)font {
    
    //大小
    CGSize boundRectSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
    //绘制属性（字典）
    NSDictionary *fontDict = @{ NSFontAttributeName: [UIFont systemFontOfSize:font]};
    //调用方法,得到高度
    CGFloat newFloat = [string boundingRectWithSize:boundRectSize
                                            options: NSStringDrawingUsesLineFragmentOrigin
                        | NSStringDrawingUsesFontLeading
                                         attributes:fontDict context:nil].size.width;
    return newFloat;
}

+ (NSAttributedString *)makeDeleteLine:(NSString *)string{
    string = [NSString stringWithFormat:@"<html><body style =\"font-size:12px;\"><s><font color=\"#B6B6B6\">%@</font></s></body></html>",string];
    NSAttributedString * attributeString = [[NSAttributedString alloc]initWithData:[string dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    return attributeString;
}

+ (NSString *)StringHaveNextLine:(NSArray *)array{
    NSString *lineString;
//    for (NSInteger index = 0; index < array.count; index ++) {
//        ZJPFriendInfoBrandList *infoBrand = array[index];
//        if (index == 0) {
//            lineString = [NSString stringWithFormat:@"%@",infoBrand.brandCNName];
//        }else{
//            lineString = [NSString stringWithFormat:@"%@\n%@",lineString,infoBrand.brandCNName];
//        }
//        
//    }
    return lineString;
}

+(NSString *)getTheNoNullStr:(id)str andRepalceStr:(NSString*)replace{
    NSString *string=nil;
    if (![str isKindOfClass:[NSNull class]]) {
        string =  [NSString stringWithFormat:@"%@",str];
        
        if (string.length ==0||(NSNull*)string == [NSNull null]||[string containsString:@"null"]) {
            string =replace;
        }
    }else{
        string =replace;
    }
    return string;
}


+(BOOL)ToadyisWeekDay;
{
    //计算week数
    NSCalendar * myCalendar = [NSCalendar currentCalendar];
    myCalendar.timeZone = [NSTimeZone systemTimeZone];
    
    
    NSInteger week = [[myCalendar components:NSCalendarUnitWeekday fromDate:[NSDate date]] weekday];
    NSLog(@"week : %zd",week);
    
    if (week>=2 && week<=6) {
        return NO;
    }else{
        return YES;
    }
//    switch (week) {
//        case 1:
//        {
//            return @"周日";
//        }
//        case 2:
//        {
//            return @"周一";
//        }
//        case 3:
//        {
//            return @"周二";
//        }
//        case 4:
//        {
//            return @"周三";
//        }
//        case 5:
//        {
//            return @"周四";
//        }
//        case 6:
//        {
//            return @"周五";
//        }
//        case 7:
//        {
//            return @"周六";
//        }
//    }
//    
//    return NO;
    
}
+(BOOL)TommoryisWeekDay;
{
    //计算week数
    NSCalendar * myCalendar = [NSCalendar currentCalendar];
    myCalendar.timeZone = [NSTimeZone systemTimeZone];
    
    
    NSInteger week = [[myCalendar components:NSCalendarUnitWeekday fromDate:[NSDate date]] weekday];
    NSLog(@"week : %zd",week);
    
    if (week>=1 && week<=5) {
        return NO;
    }else{
        return YES;
    }
}

+(NSString*)changeTimeStampToString:(NSString*)timeStamp WithFormmater:(NSString*)formmater;
{
    // timeStampString 是服务器返回的13位时间戳
    NSString *timeStampString  = timeStamp;
    NSTimeInterval interval;
    
    if (timeStampString.length>10) {
        // iOS 生成的时间戳是10位
        
        interval =[timeStampString doubleValue] / 1000.0;
    }else{
        interval =[timeStampString doubleValue];
    }
    
    
    
    NSDate *date  = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formmater];
    return  [formatter stringFromDate: date];
}

// 传内容string和字体大小，就可以计算多少行。

+(CGFloat)getLineNum:(NSString*)str  andfont:(UIFont*)font labelWidth:(CGFloat)width

{
    
    if (str.length<1)
        
    {
        
        return 0;
        
    }
    
    CGFloat oneRowHeight = [@"占位" sizeWithAttributes:@{NSFontAttributeName:font}].height;
    
    CGSize textSize = [str boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    
    CGFloat rows = textSize.height / oneRowHeight;
    
    return rows;
    
}



@end
