//
//  NSString+Extend.m
//  CoreCategory
//
//  Created by 成林 on 15/4/6.
//  Copyright (c) 2015年 沐汐. All rights reserved.
//

#import "NSString+Extend.h"

@implementation NSString (Extend)


/**
 *  @method 获取指定宽度width的字符串的高度
 *
 *  @param text 文本
 *  @param Width 限制字符串显示区域的宽度
 *  @param font  Lab的Font
 *  @result CGFloat 返回的高度
 */
- (CGFloat)HeightWithConstrainedToWidth:(CGFloat)width LabFont:(UIFont *)font
{
    CGSize textSize=[self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)  options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    CGFloat height = textSize.height + 5;
    
    return height;
    
}

/**
 *  @method 获取指定高度height的字符串的宽度
 *
 *  @param text 文本
 *  @param Width 限制字符串显示区域的宽度
 *  @param font  Lab的Font
 *  @result CGFloat 返回的宽度
 */
- (CGFloat)widthWithConstrainedToHeight:(CGFloat)height LabFont:(UIFont *)font
{
    CGSize textSize =[self boundingRectWithSize:CGSizeMake(MAXFLOAT,height)  options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    CGFloat width = textSize.width + 5;
    
    return width;
    
}


/**
 *  @method 获取指定宽度width的带间距富文本的高度
 *
 *  @param text 富文本
 *  @param Width 限制字符串显示区域的宽度
 *  @param font  富文本的Font
 *  @param style  富文本的style
 *  @result CGFloat 返回的高度
 */
- (CGFloat)HeightWithAttributedString:(NSMutableAttributedString *)text andFont:(UIFont *)font ParagraphStyle:(NSMutableParagraphStyle *)style constrainedToWidth:(CGFloat)width
{
    
    CGRect rect;
    CGFloat height;
    
    CGRect textRect=[text boundingRectWithSize:CGSizeMake(width, MAXFLOAT)  options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading  context:nil];
    
    //文本的高度减去字体高度小于等于行间距，判断为当前只有1行
    if ((textRect.size.height - font.lineHeight) <= style.lineSpacing)
    {
        
        if ([self containChinese])//如果包含中文
        {
            rect = CGRectMake(textRect.origin.x, textRect.origin.y, textRect.size.width, textRect.size.height-style.lineSpacing);
            height = rect.size.height;
        }
        else
        {
            height = textRect.size.height;
        }
        
        
    }
    else
    {
        height = textRect.size.height;
    }
    
    return height;
    
}
/*
 判断如果包含中文
 */
- (BOOL)containChinese
{
    for(int i=0; i< [self length];i++){
        int a = [self characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff){
            return YES;
        }
    }
    return NO;
}
/*
 转码成UTf_8
 */
- (NSURL *)urlTransCoding
{
    //解码
    NSString *urlString = [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    //编码
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    return url;
}
/*
 删除字符串最后一位
 */
- (NSString *)clearLastString
{
    NSString *str = self;
    if(str.length > 0)
    {
        str =  [self substringWithRange:NSMakeRange(0, [str length] - 1)];
    }
    return str;
}
/**
 *  @method 时间戳装换为指定格式
 *
 *  @param time  时间戳
 *  @param formatter 转换格式
 *  @result NSString 字符串
 */
+ (NSString *)timestampChange:(NSInteger)time Formatter:(NSString *)formatter
{
    NSString *strTime;
    
    NSDate *newdate=[NSDate dateWithTimeIntervalSince1970:time/1000];//服务器传回来要除1000
    
    NSDateFormatter *dateformatter=[NSDateFormatter new];//定义时间格式
    
    [dateformatter setDateFormat:formatter];
    
    strTime =[dateformatter stringFromDate:newdate];//转为字符串
    
    return strTime;
}
/*
 字典转字符串
 */
+ (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}


/**< 判断是否有系统表情*/
-(BOOL)stringContainsEmoji
{
    __block BOOL returnValue = NO;
    
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop)
     
     {
         
         const unichar hs = [substring characterAtIndex:0];
         
         // surrogate pair
         
         if (0xd800 <= hs && hs <= 0xdbff)
             
         {
             
             if (substring.length > 1)
                 
             {
                 
                 const unichar ls = [substring characterAtIndex:1];
                 
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 
                 if (0x1d000 <= uc && uc <= 0x1f77f)
                     
                 {
                     
                     returnValue = YES;
                     
                 }
                 
             }
             
         }
         
         else if (substring.length > 1)
             
         {
             
             const unichar ls = [substring characterAtIndex:1];
             
             if (ls == 0x20e3)
                 
             {
                 
                 returnValue = YES;
                 
             }
             
         }
         
         else
             
         {
             
             // non surrogate
             
             if (0x2100 <= hs && hs <= 0x27ff)
                 
             {
                 
                 returnValue = YES;
                 
             }
             
             else if (0x2B05 <= hs && hs <= 0x2b07)
                 
             {
                 
                 returnValue = YES;
                 
             }
             
             else if (0x2934 <= hs && hs <= 0x2935)
                 
             {
                 
                 returnValue = YES;
                 
             }
             
             else if (0x3297 <= hs && hs <= 0x3299)
                 
             {
                 
                 returnValue = YES;
                 
             }
             
             else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50)
                 
             {
                 
                 returnValue = YES;
                 
             }
             
         }
         
     }];
    
    return returnValue;
    
}

@end
