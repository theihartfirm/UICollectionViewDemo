//
//  ViewController.m
//  CollectionViewUsingObjC
//
//  Created by Hardik Trivedi on 07/06/2016.
//  Copyright © 2016 TheiHartFirm. All rights reserved.
//

#import "ViewController.h"
#import "CustomCollectionViewCell.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
{
    NSMutableArray *marrData;
}

@end

@implementation ViewController

#pragma mark - View Life Cycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadData];
}

#pragma mark - CollectionView Methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [marrData count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
//    
//    [cell setBackgroundColor:[[marrData objectAtIndex:indexPath.row] valueForKey:@"color"]];
    
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell.lblColorName setText:[[marrData objectAtIndex:indexPath.row] valueForKey:@"name"]];
    [cell setBackgroundColor:[[marrData objectAtIndex:indexPath.row] valueForKey:@"color"]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView setBackgroundColor:[[marrData objectAtIndex:indexPath.row] valueForKey:@"color"]];
}

#pragma mark - Other Methods

- (void)loadData
{
    marrData = [[NSMutableArray alloc] initWithObjects:
                @{@"name" : @"Red", @"color" : [UIColor redColor]},
                @{@"name" : @"Blue", @"color" : [UIColor blueColor]},
                @{@"name" : @"Green", @"color" : [UIColor greenColor]},
                @{@"name" : @"White", @"color" : [UIColor whiteColor]},
                @{@"name" : @"Yellow", @"color" : [UIColor yellowColor]}, nil];
}

@end
