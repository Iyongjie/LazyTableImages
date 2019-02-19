//
//  PictureModel.h
//  LazyTableImages
//
//  Created by 李永杰 on 2019/2/19.
//  Copyright © 2019 Y了个J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PictureModel : NSObject
@property (nonatomic,copy)   NSString   *imageUrl;
@property (nonatomic,strong) UIImage    *picture;
@end

