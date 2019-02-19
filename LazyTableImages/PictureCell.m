//
//  PictureCell.m
//  LazyTableImages
//
//  Created by 李永杰 on 2019/2/19.
//  Copyright © 2019 Y了个J. All rights reserved.
//

#import "PictureCell.h"

@implementation PictureCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configUI];
    }
    return self;
}
-(void)configUI {
    [self.contentView addSubview:self.pictureImageView];
}
-(void)layoutSubviews {
    [super layoutSubviews];
    self.pictureImageView.frame = self.contentView.bounds;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(UIImageView *)pictureImageView {
    if (!_pictureImageView) {
        _pictureImageView = [[UIImageView alloc]init];
        _pictureImageView.contentMode = UIViewContentModeScaleAspectFill;
        _pictureImageView.clipsToBounds = YES;
    }
    return _pictureImageView;
}
@end
