//
//  TopRollView.m
//  自动轮播视图
//
//  Created by ma c on 16/3/29.
//  Copyright © 2016年 WY. All rights reserved.
//

#import "TopRollView.h"
#import "UIButton+WebCache.h"
#import "WYCustomButton.h"

#define WIDTH  self.frame.size.width
#define HEIGHT self.frame.size.height
#define BTN_TAG 200


@interface TopRollView ()<UIScrollViewDelegate>

///滚动视图 UIScrollView
@property (strong, nonatomic) UIScrollView *rollScroll;

///计时器用于控制图片自动滚动
@property (strong, nonatomic) NSTimer *timer;

///当前图片的索引
@property (assign, nonatomic) NSInteger index;

///用于记录外部传入图片的数量
@property (assign, nonatomic) NSInteger countArray;

///可变数组保存图片数量，前后各加一张图片
@property (strong, nonatomic) NSMutableArray *sevenArray;

@property (weak, nonatomic) UIPageControl *pageControl;

@end

@implementation TopRollView

- (void)setArrayImages:(NSArray *)arrayImages {
    _arrayImages = arrayImages;
    
    /** 记录数组的元素个数,方便后面使用*/
    self.countArray = arrayImages.count;
    
    /**
     *  在传进来的图片数组前后分别加入一张图片,最前面加原先的最后一张图，最后面加
     *  原先的第一张图
     */
    self.sevenArray = [NSMutableArray arrayWithArray:arrayImages];
    
    //最前面加原先的最后一张图
    [self.sevenArray insertObject:[arrayImages firstObject] atIndex:arrayImages.count];
    
    //最后面加原先的第一张图
    [self.sevenArray insertObject:[arrayImages lastObject] atIndex:0];
    
    /** 循环创建轮播视图上的按钮*/
    for (NSInteger i = 0; i < self.sevenArray.count; i ++) {
        
        UIButton *forBtn = [WYCustomButton buttonWithType:(UIButtonTypeCustom)];
        forBtn.tag = BTN_TAG + i;
        [forBtn setFrame:CGRectMake(i * WIDTH, 0, WIDTH, HEIGHT)];
        //            [forBtn setImage:[UIImage imageNamed:self.sevenArray[i]] forState:(UIControlStateNormal)];
        [forBtn sd_setImageWithURL:[NSURL URLWithString:self.sevenArray[i]] forState:(UIControlStateNormal)];
        [forBtn addTarget:self action:@selector(btnTouchActionFor:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.rollScroll addSubview:forBtn];
    }
    
    // UIScrollView 上的内容大小
    [self.rollScroll setContentSize:CGSizeMake(WIDTH * self.sevenArray.count, HEIGHT)];
    
    /** 创建 UIScrollView 的圆点页码 UIPageControl */
    UIPageControl *page = [[UIPageControl alloc] initWithFrame:CGRectMake(0, HEIGHT - 25, WIDTH, 25)];
    
    [page setUserInteractionEnabled:NO];
    
    ///设置 UIPageControl Tag 值 以方便查找
    [page setTag:100];
    
    //设置圆点个数
    [page setNumberOfPages:arrayImages.count];
    
    //设置圆点的默认颜色
    [page setPageIndicatorTintColor:[UIColor blackColor]];
    
    //设置圆点当前亮起的颜色
    [page setCurrentPageIndicatorTintColor:[UIColor redColor]];
    
    [self addSubview:page];
    self.pageControl = page;
    
    
    
    /** 创建一个计时器，执行自动轮播视图的功能*/
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    ///开启计时器
    //        [self.timer setFireDate:[NSDate distantPast]];
    
    /** 修改 self.timer 控件的优先级 和 用户事件的优先级一样(创建几次 写几次)*/
    //获取当前的消息循环对象
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    
    //改变 self.timer 对象的优先级
    [runLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    /** 给图片所以初始化为 1 */
    self.index = 1;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        /** 创建 UIScrollView*/
        self.rollScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
        [self.rollScroll setDelegate:self];
        [self.rollScroll setUserInteractionEnabled:YES];
        [self.rollScroll setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:self.rollScroll];
        
//        /** 记录数组的元素个数,方便后面使用*/
//        self.countArray = arrayImages.count;
//        
//        /**
//         *  在传进来的图片数组前后分别加入一张图片,最前面加原先的最后一张图，最后面加
//         *  原先的第一张图
//         */
//        self.sevenArray = [NSMutableArray arrayWithArray:arrayImages];
//        
//        //最前面加原先的最后一张图
//        [self.sevenArray insertObject:[arrayImages firstObject] atIndex:arrayImages.count];
//        
//        //最后面加原先的第一张图
//        [self.sevenArray insertObject:[arrayImages lastObject] atIndex:0];
//        
//        /** 循环创建轮播视图上的按钮*/
//        for (NSInteger i = 0; i < self.sevenArray.count; i ++) {
//            
//            UIButton *forBtn = [WYCustomButton buttonWithType:(UIButtonTypeCustom)];
//            forBtn.tag = BTN_TAG + i;
//            [forBtn setFrame:CGRectMake(i * WIDTH, 0, WIDTH, HEIGHT)];
////            [forBtn setImage:[UIImage imageNamed:self.sevenArray[i]] forState:(UIControlStateNormal)];
//            [forBtn sd_setImageWithURL:[NSURL URLWithString:self.sevenArray[i]] forState:(UIControlStateNormal)];
//            [forBtn addTarget:self action:@selector(btnTouchActionFor:) forControlEvents:(UIControlEventTouchUpInside)];
//            [self.rollScroll addSubview:forBtn];
//        }
        
        /** UIScrollView 的设置*/
        //边缘反弹关闭
        [self.rollScroll setBounces:NO];
        //起点为 (0,0)
        [self.rollScroll setContentOffset:CGPointMake(WIDTH, 0)];
//        // UIScrollView 上的内容大小
//        [self.rollScroll setContentSize:CGSizeMake(WIDTH * self.sevenArray.count, HEIGHT)];
        
        //开启分页效果
        [self.rollScroll setPagingEnabled:YES];
        //关闭水平滚动条
        [self.rollScroll setShowsHorizontalScrollIndicator:NO];
        //关闭垂直滚动条
        [self.rollScroll setShowsVerticalScrollIndicator:NO];
        
//        /** 创建 UIScrollView 的圆点页码 UIPageControl */
//        UIPageControl *page = [[UIPageControl alloc] initWithFrame:CGRectMake(0, HEIGHT - 25, WIDTH, 25)];
//        
//        [page setUserInteractionEnabled:NO];
//        
//        ///设置 UIPageControl Tag 值 以方便查找
//        [page setTag:100];
//        
//        //设置圆点个数
////        [page setNumberOfPages:arrayImages.count];
//        
//        //设置圆点的默认颜色
//        [page setPageIndicatorTintColor:[UIColor blackColor]];
//        
//        //设置圆点当前亮起的颜色
//        [page setCurrentPageIndicatorTintColor:[UIColor redColor]];
//        
//        [self addSubview:page];
//        self.pageControl = page;
        
//        /** 创建一个计时器，执行自动轮播视图的功能*/
//        self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
//        ///开启计时器
////        [self.timer setFireDate:[NSDate distantPast]];
//        
//        /** 修改 self.timer 控件的优先级 和 用户事件的优先级一样(创建几次 写几次)*/
//        //获取当前的消息循环对象
//        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
//        
//        //改变 self.timer 对象的优先级
//        [runLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
//        
//        /** 给图片所以初始化为 1 */
//        self.index = 1;
        
    }
    return self;
}

- (void)btnTouchActionFor:(UIButton *)forBtn {
    if (_btnTag) {
        _btnTag(forBtn.tag - BTN_TAG);
    }
}

/** 计时器的触发方法*/
- (void)timerAction {
    
    //设置本次 scrollView 应该滚动到的位置 (图片索引在 这个方法最后自加了，所以每次计时器调用，所获得的位置坐标都不一样)
    CGPoint offset = CGPointMake(WIDTH * self.index, 0);
    
    //获得 UIPageControl 对象
    UIPageControl *page = (UIPageControl *)[self viewWithTag:100];
    
    /**
     *  为保证最后一张图能连贯地滚动到第一张图，在图片数组后加的那张图片在
     *  此起作用。当滚动到倒数第二张图时，让之滚动到第一张图的替代（最后一张
     *  图）上，并在滚动结束的那一刻将图片直接切换到第一张图上。其他滚动操作
     *  无什么特别之处
     */
    
    /** 判断是否到了倒数第二张图片*/
    if (self.index == self.countArray + 1) {
        
        [UIView animateWithDuration:0.3 animations:^{
            
            //如果已经是 倒数第二张了，让之滚动到第一张图的替代（最后一张图）上
            [self.rollScroll setContentOffset:offset];
            
            //让 UIPageControl 当前亮起的为第一个圆点
            [page setCurrentPage:0];
            
        } completion:^(BOOL finished) {
            
            //在滚动结束的那一刻将图片直接切换到第一张 显示图上
            [self.rollScroll setContentOffset:CGPointMake(WIDTH, 0)];
        }];
        
    } else {
        
        //其他滚动操作无什么特别之处
        [UIView animateWithDuration:0.3 animations:^{
            
            //滚动到相应的位置
            [self.rollScroll setContentOffset:offset];
            
            //让相应的 圆点页码亮起
            [page setCurrentPage:self.index - 1];
            
        }];
    }
    
    //当图片滚动到最后一张图的时候需要让索引指向第二张图，以保证轮播连贯进行
    if (self.index == self.countArray + 1) {
        self.index = 2;
    } else {
        self.index ++;
    }
    
}

#pragma mark - UIScrollViewDelegate
//当对scrollView进行拖动的时候终止计时器的计时操作
/** UIScrollView 即将开始拖拽时调用的方法*/
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    //当对 scrollView 进行拖动的时候终止计时器的计时操作
    [self.timer setFireDate:[NSDate distantFuture]];
}

//当对scrollView的拖动停止时，重新开始对计时器的计时操作
/** UIScrollView 拖拽结束时调用的方法*/
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    //当对scrollView的拖动停止时，重新开始对计时器的计时操作,需要从新创建一个计时器，并开启自动轮播方法
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    
    //开启计时器
//    [self.timer setFireDate:[NSDate distantPast]];
    
    /** 修改 self.timer 控件的优先级 和 用户事件的优先级一样(创建几次 写几次)*/
//    获取当前的消息循环对象
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    
//    改变 self.timer 对象的优先级
    [runLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
}

/**
 *  滚动轮播器不仅支持自动滚动，还应支持手动滑动
 *  因此设置此代理方法。之所以用这个方法而不是上一方法是因为这一方法能精准判
 *  断scrollView停止滑动的那一刻，而上一方法会造成一瞬间的卡屏
 */
// UIScrollView 滚动结束时调用的方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    //获取结束滚动时的偏移量
    CGPoint offset = scrollView.contentOffset;
    
    //获取 UIPagecontroller控件
    UIPageControl *page = (UIPageControl *)[self viewWithTag:100];
    
    //当滑动到最后一张图时（数组的第一张图的替代）
    if (offset.x == WIDTH * (self.countArray + 1)) {
        
        //将图片滑动到数组的第 2 张图上
        [scrollView setContentOffset:CGPointMake(WIDTH, 0)];
        
        //让 UIPageControl 当前亮起的为第一个圆点
        [page setCurrentPage:0];
        
        
        //当滑动到第一张图（数组的最后一张图的替代）时
    } else if (offset.x == 0) {
        
        //将图片滑动到数组的倒数第二张图上
        [scrollView setContentOffset:CGPointMake(WIDTH * self.countArray, 0)];
        
        //让 UIPageControl 当前亮起的为倒数第二个圆点
        [page setCurrentPage:self.countArray - 1];
        
        
        //其它情况根据视图滚动到第几张图片就让 UIPageControl 的第几个圆点亮起
    } else {
        
        
        NSInteger indexPage = (NSInteger)(offset.x - WIDTH) / WIDTH;
        page.currentPage = indexPage;
    }
    
    //通过 UIPageControl 当前显示的页数获得当前页数的索引
    self.index = page.currentPage + 1;
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
