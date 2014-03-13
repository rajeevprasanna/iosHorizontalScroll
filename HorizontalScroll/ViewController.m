//
//  ViewController.m
//  HorizontalScroll
//
//  Created by Rajeev Kumar on 13/03/14.
//  Copyright (c) 2014 rajeev. All rights reserved.
//

#import "ViewController.h"
#import "MyCollectionViewCell.h"
#import "MyCollectionViewFlowLayout.h"

static NSString * CollectionCellIdentifier = @"Cells";

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController


- (NSArray *)allImages {
    static NSArray * AllImages = nil;
    if (AllImages == nil) {
        NSMutableArray * images = [NSMutableArray arrayWithCapacity:25];
        for(NSInteger i =0; i<25;i++)
        {
            [images addObject:[UIImage imageNamed:@"079aaac.jpg"]];
        }
        AllImages = images;
    }
    return AllImages;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Set the image names only
    // basis for allImages method
    
    // black (default) looks discomforting
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    // Load and register nib
    UINib * nib = [UINib nibWithNibName:NSStringFromClass([MyCollectionViewCell class]) bundle:[NSBundle mainBundle]];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:CollectionCellIdentifier];
    
    // Collection Layout Initialization
    // We subclassed because we wanted content size to be set which is
    // possible only by subclassing
    UICollectionViewFlowLayout * layout = [[MyCollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumInteritemSpacing = 10.0f;
    layout.itemSize = CGSizeMake(81.0f, 81.0f);
    layout.sectionInset = UIEdgeInsetsMake(10.0f, 20.0f, 10.0f, 20.0f);
    
    self.collectionView.collectionViewLayout = layout;
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    //    UIImage * img = [self allImages][0];
    //    NSLog(@"%f",img.size.width);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 25;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionCellIdentifier forIndexPath:indexPath];
    cell.imgView.image = [self allImages][indexPath.row];
    cell.imgView.contentMode = UIViewContentModeScaleAspectFill;
    return cell;
}

@end
