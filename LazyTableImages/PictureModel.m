//
//  PictureModel.m
//  LazyTableImages
//
//  Created by 李永杰 on 2019/2/19.
//  Copyright © 2019 Y了个J. All rights reserved.
//

#import "PictureModel.h"
#import "UIImageView+WebCache.h"

@implementation PictureModel

-(UIImage *)picture {
    if (self.imageUrl) {
        NSURL *pathUrl = [NSURL URLWithString:self.imageUrl];
        SDWebImageManager *manager = [SDWebImageManager sharedManager];
        [manager diskImageExistsForURL:pathUrl completion:nil];
        _picture = [[manager imageCache]imageFromDiskCacheForKey:pathUrl.absoluteString];
    }
    return _picture;
}

@end
