//
//  TableViewCell.m
//  XRWebImage
//
//  Created by Ru on 23/2/17.
//  Copyright © 2017年 Ru. All rights reserved.
//

#import "TableViewCell.h"
#import "AppInfo.h"
#import "UIImageView+extension.h"

@interface TableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;


@end

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setInfo:(AppInfo *)info {
    _info = info;
    
    self.nameLabel.text = info.name;
    self.numLabel.text = info.download;
    
    [self.iconView xr_setImageUrl:info.icon];
}
@end
