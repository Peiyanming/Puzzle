//
//  ViewController.m
//  Puzzle
//
//  Created by vmeet on 16/1/11.
//  Copyright (c) 2016年 PeiYanMing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableArray *_positionModeImage;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    [arr addObject:@"1.png"];
    [arr addObject:@"2.png"];
//    [arr addObject:@"3.png"];
//    [arr addObject:@"4.png"];
    [self makeGroupAvatar:arr];
}

- (UIImage *)makeGroupAvatar: (NSMutableArray *)imageArray {
    if ([imageArray count] == 0)return nil;
    
    UIView *groupAvatarView = [[UIView alloc]initWithFrame:CGRectMake(0,0,193,193)];
    groupAvatarView.backgroundColor = [UIColor lightGrayColor];
    
    for (int i = 0; i < [imageArray count]; i++){
        UIImageView *tempImageView;
        if ([imageArray count] == 1){
             tempImageView = [[UIImageView alloc]initWithFrame:[[[self addImageposition1:imageArray]objectAtIndex:i]CGRectValue]];
        }else if ([imageArray count] == 2){
            tempImageView = [[UIImageView alloc]initWithFrame:[[[self addImageposition2:imageArray]objectAtIndex:i]CGRectValue]];
        }else if ([imageArray count] == 3){
            tempImageView = [[UIImageView alloc]initWithFrame:[[[self addImageposition3:imageArray]objectAtIndex:i]CGRectValue]];
        }else if ([imageArray count] >= 4){
            tempImageView = [[UIImageView alloc]initWithFrame:[[[self addImageposition4:imageArray]objectAtIndex:i]CGRectValue]];
        }
        [tempImageView setImage:[UIImage imageNamed:[imageArray objectAtIndex:i]]];
//        [tempImageView setContentMode:UIViewContentModeScaleAspectFill];
        [groupAvatarView addSubview:tempImageView];
    }
    
    //把UIView设置为image并修改图片大小55*55
    UIImage *reImage = [self scaleToSize:[self convertViewToImage:groupAvatarView]size:CGSizeMake(55, 55)];
    NSData *data = UIImageJPEGRepresentation(reImage, 1.0);
    NSString *docStr = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *imgFile = [docStr stringByAppendingPathComponent:@"123.png"];
    [data writeToFile:imgFile atomically:NO];
    return reImage;
}

-(NSMutableArray *)addImageposition1:(NSMutableArray *)imageArray{   //初始化1图片模式
    NSMutableArray *positionFor4ModeImage = [[NSMutableArray alloc] init];
    
    float viewHW = 193;
    CGRect tempMode4Rect;
    float mode4PositionX = 0;
    float mode4PositionY = 0;
    float mode4PositionW = viewHW;
    float mode4PositionH = viewHW;
    
    tempMode4Rect = CGRectMake(mode4PositionX, mode4PositionY, mode4PositionW, mode4PositionH);
    [positionFor4ModeImage addObject:[NSValue valueWithCGRect:tempMode4Rect]];
    return positionFor4ModeImage;
}

-(NSMutableArray *)addImageposition2:(NSMutableArray *)imageArray{   //初始化2图片模式
    NSMutableArray *positionFor4ModeImage = [[NSMutableArray alloc] init];
    float viewHW = 193;
    for(int i = 0; i < imageArray.count; i++){
        CGRect tempMode4Rect;
        float mode4PositionX = 0;
        float mode4PositionY = 0;
        float mode4PositionW = (viewHW-4)/2;
        float mode4PositionH = viewHW;
        switch (i) {
            case 0:
                break;
            case 1:
                mode4PositionX = mode4PositionW+4;
                break;
            default:
                break;
        }
        tempMode4Rect = CGRectMake(mode4PositionX, mode4PositionY, mode4PositionW, mode4PositionH);
        [positionFor4ModeImage addObject:[NSValue valueWithCGRect:tempMode4Rect]];
    }
    return positionFor4ModeImage;
}

-(NSMutableArray *)addImageposition3:(NSMutableArray *)imageArray{   //初始化3图片模式
    NSMutableArray *positionFor4ModeImage = [[NSMutableArray alloc] init];
    float viewHW = 193;
    for(int i = 0; i < imageArray.count; i++){
        CGRect tempMode4Rect;
        float mode4PositionX = 0;
        float mode4PositionY = 0;
        float mode4PositionW = (viewHW-4)/2;
        float mode4PositionH = mode4PositionW;
        switch (i) {
            case 0:
                mode4PositionH = viewHW;
                break;
            case 1:
                mode4PositionX = 4+mode4PositionW;
                break;
            case 2:
                mode4PositionX = 98.5;
                mode4PositionY = 4+mode4PositionH;
                break;
            default:
                break;
        }
        tempMode4Rect = CGRectMake(mode4PositionX, mode4PositionY, mode4PositionW, mode4PositionH);
        [positionFor4ModeImage addObject:[NSValue valueWithCGRect:tempMode4Rect]];
    }
    return positionFor4ModeImage;
}

-(NSMutableArray *)addImageposition4:(NSMutableArray *)imageArray{   //初始化4图片模式
    NSMutableArray *positionFor4ModeImage = [[NSMutableArray alloc] init];
    float viewHW = 193;
    for(int i = 0; i < imageArray.count; i++){
        CGRect tempMode4Rect;
        float mode4PositionX = 0;
        float mode4PositionY = 0;
        float mode4PositionW = (viewHW-4)/2;
        float mode4PositionH = (viewHW-4)/2;
        switch (i) {
            case 0:
                break;
            case 1:
                mode4PositionX = 4+mode4PositionW;
                break;
            case 2:
                mode4PositionY = 4+mode4PositionW;
                break;
            case 3:
                mode4PositionX = 4+mode4PositionW;
                mode4PositionY = 4+mode4PositionW;
                break;
            default:
                break;
        }
        tempMode4Rect = CGRectMake(mode4PositionX, mode4PositionY, mode4PositionW, mode4PositionH);
        [positionFor4ModeImage addObject:[NSValue valueWithCGRect:tempMode4Rect]];
    }
    return positionFor4ModeImage;
}

-(UIImage*)convertViewToImage:(UIView*)v{
    
    CGSize s = v.bounds.size;
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了，关键就是第三个参数。
    UIGraphicsBeginImageContextWithOptions(s, YES, [UIScreen mainScreen].scale);
    [v.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

@end
