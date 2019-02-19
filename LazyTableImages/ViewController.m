//
//  ViewController.m
//  LazyTableImages
//
//  Created by 李永杰 on 2019/2/19.
//  Copyright © 2019 Y了个J. All rights reserved.
//

#import "ViewController.h"
#import "PictureCell.h"
#import "PictureModel.h"
#import "UIImageView+WebCache.h"

#define NavigationHeight    CGRectGetMaxY(self.navigationController.navigationBar.frame)
#define ScreenWidth         [UIScreen mainScreen].bounds.size.width
#define ScreenHeight        [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView    *tableView;
@property (nonatomic,strong) UIButton       *sizeButton;
@property (nonatomic,strong) UIButton       *cleanButton;

@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self initData];
    [self configUI];
    
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.tableView.delegate = nil;
    self.tableView.dataSource = nil;
}
#pragma mark - methods
-(void)initData {
    self.dataArray = [NSMutableArray array];
    NSArray *urlArr = @[@"http://img0.imgtn.bdimg.com/it/u=417632846,2333435476&fm=26&gp=0.jpg",
                        @"http://img1.imgtn.bdimg.com/it/u=2735633715,2749454924&fm=26&gp=0.jpg",
                        @"http://img3.imgtn.bdimg.com/it/u=68497256,1867509505&fm=26&gp=0.jpg",
                        @"http://img5.imgtn.bdimg.com/it/u=793627359,1081752008&fm=26&gp=0.jpg",
                        @"http://img1.imgtn.bdimg.com/it/u=3406860327,2276285180&fm=26&gp=0.jpg",
                        @"http://img1.imgtn.bdimg.com/it/u=1991330897,4086113112&fm=26&gp=0.jpg",
                        @"http://img2.imgtn.bdimg.com/it/u=3713806002,3991493148&fm=26&gp=0.jpg",
                        @"http://img5.imgtn.bdimg.com/it/u=3736047088,2183190371&fm=26&gp=0.jpg",
                        @"http://img1.imgtn.bdimg.com/it/u=3645827370,514348399&fm=26&gp=0.jpg",
                        @"http://img5.imgtn.bdimg.com/it/u=1609607614,1890482461&fm=26&gp=0.jpg",
                        @"http://img0.imgtn.bdimg.com/it/u=4198798863,3740808115&fm=26&gp=0.jpg",
                        @"http://img4.imgtn.bdimg.com/it/u=3229056056,665881334&fm=26&gp=0.jpg",
                        @"http://img3.imgtn.bdimg.com/it/u=4090805771,1265731136&fm=26&gp=0.jpg",
                        @"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=128446076,1071153413&fm=26&gp=0.jpg",
                        @"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=618052011,155537526&fm=26&gp=0.jpg",
                        @"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=4003313886,2792135108&fm=26&gp=0.jpg",
                        @"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=607949396,3056706906&fm=26&gp=0.jpg",
                        @"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=4142023755,381672158&fm=26&gp=0.jpg",
                        @"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2896266543,4230801478&fm=26&gp=0.jpg",
                        @"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3264605054,53266527&fm=11&gp=0.jpg",
                        @"http://img5.imgtn.bdimg.com/it/u=1541532060,3486897645&fm=26&gp=0.jpg",
                        @"http://img3.imgtn.bdimg.com/it/u=3800920670,280015555&fm=26&gp=0.jpg",
                        @"http://img4.imgtn.bdimg.com/it/u=4103975128,1667207632&fm=26&gp=0.jpg",
                        @"http://img1.imgtn.bdimg.com/it/u=906341111,76239566&fm=26&gp=0.jpg",
                        @"http://img3.imgtn.bdimg.com/it/u=1851315227,1693544446&fm=26&gp=0.jpg",
                        @"http://img2.imgtn.bdimg.com/it/u=19880608,2030574208&fm=26&gp=0.jpg",
                        @"http://img3.imgtn.bdimg.com/it/u=1353770580,4177570951&fm=26&gp=0.jpg",
                        @"http://img5.imgtn.bdimg.com/it/u=969311350,751381297&fm=26&gp=0.jpg",
                        @"http://img2.imgtn.bdimg.com/it/u=2411411883,255895907&fm=26&gp=0.jpg",
                        @"http://img2.imgtn.bdimg.com/it/u=1103657041,2822108077&fm=26&gp=0.jpg",
                        @"http://img5.imgtn.bdimg.com/it/u=161888459,1712714238&fm=26&gp=0.jpg",
                        @"http://img1.imgtn.bdimg.com/it/u=2567260870,175786323&fm=26&gp=0.jpg",
                        @"http://img2.imgtn.bdimg.com/it/u=494598606,1689358148&fm=26&gp=0.jpg",
                        @"http://img1.imgtn.bdimg.com/it/u=120474146,3725974433&fm=26&gp=0.jpg"
                        ];
    for (int i = 0; i<urlArr.count; i++) {
        PictureModel *model = [[PictureModel alloc]init];
        model.imageUrl = urlArr[i];
        [self.dataArray addObject:model];
    }
}
-(void)configUI {
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.sizeButton];
    [self.view addSubview:self.cleanButton];
}
#pragma mark - action
-(void)getCacheSize:(UIButton *)sender {
    CGFloat size = [[SDImageCache sharedImageCache] getSize]/1024/1024.0;
    [sender setTitle:[NSString stringWithFormat:@"%.2fM",size] forState:UIControlStateNormal];
}
-(void)cleanCache {
    /*
     异步清除所有磁盘缓存映像。非阻塞方法-立即返回。
     */
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
        
    }];
    /*
     清除所有缓存镜像
     */
    [[SDImageCache sharedImageCache] clearMemory];
    /*
     异步将所有过期的缓存映像从磁盘中删除。非阻塞方法-立即返回。
     */
    [[SDImageCache sharedImageCache] deleteOldFilesWithCompletionBlock:^{
    }];
}
-(void)loadImagesForVisableCells {
    NSArray * visibleCells = [self.tableView indexPathsForVisibleRows];
    for (NSIndexPath *indexPath in visibleCells) {
        PictureModel *model = self.dataArray[indexPath.row];
        if (model.picture == nil) {
            [self startDownload:model forIndexPath:indexPath];
        }
    }
}
-(void)startDownload:(PictureModel *)model forIndexPath:(NSIndexPath *)indexPath {
    UIImageView *tmpImageView = [[UIImageView alloc]init];
    NSURL *url = [NSURL URLWithString:model.imageUrl];
    [tmpImageView sd_setImageWithURL:url placeholderImage:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        tmpImageView.image = image;
        // 加载当前cell的图片
        PictureCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        cell.pictureImageView.image = image;
    }];
}
#pragma mark - dataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PictureCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    if (cell == nil) {
        cell = [[PictureCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellid"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    PictureModel *model = self.dataArray[indexPath.row];
    if (model.picture) {
        // 有缓存
        cell.pictureImageView.image = model.picture;
    }else {
        cell.pictureImageView.image = [UIImage imageNamed:@"yishuzi.jpg"];
        // 停止拖拽或者滑动结束，加载当前cell
        if (tableView.dragging == NO && tableView.decelerating == NO) {
            [self startDownload:model forIndexPath:indexPath];
        }
    }
    return cell;
}
#pragma mark - delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 300;
}
#pragma mark - scrollview delegate
// 拖拽结束，加速拖拽会触发下面的方法，减速匀速拖拽不触发，因为加速总会减速
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    // 慢速拖拽
    if (!decelerate) {
        [self loadImagesForVisableCells];
    }
}
// 快速拖拽，减速完成
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self loadImagesForVisableCells];
}
#pragma mark - lazy
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        UIView *view = [[UIView alloc] init];
        _tableView.tableFooterView = view;
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        [_tableView registerClass:[PictureCell class] forCellReuseIdentifier:@"cellid"];
    }
    return _tableView;
}
-(UIButton *)sizeButton {
    if (!_sizeButton) {
        _sizeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sizeButton.frame = CGRectMake(20, NavigationHeight + 10, 100, 40);
        [_sizeButton setTitle:@"获取size" forState:UIControlStateNormal];
        [_sizeButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        _sizeButton.layer.cornerRadius = 10;
        _sizeButton.clipsToBounds = YES;
        _sizeButton.layer.borderWidth = 1;
        _sizeButton.layer.borderColor = [UIColor blueColor].CGColor;
        [_sizeButton addTarget:self action:@selector(getCacheSize:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sizeButton;
}
-(UIButton *)cleanButton {
    if (!_cleanButton) {
        _cleanButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _cleanButton.frame = CGRectMake(ScreenWidth / 2 - 50, NavigationHeight + 10, 100, 40);
        [_cleanButton setTitle:@"清理缓存" forState:UIControlStateNormal];
        [_cleanButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        _cleanButton.layer.cornerRadius = 10;
        _cleanButton.clipsToBounds = YES;
        _cleanButton.layer.borderWidth = 1;
        _cleanButton.layer.borderColor = [UIColor blueColor].CGColor;
        [_cleanButton addTarget:self action:@selector(cleanCache) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cleanButton;
}

@end
