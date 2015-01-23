//
//  ViewController.m
//  CollectionViewCustom
//
//  Created by Mittal J. Banker on 1/23/15.
//  Copyright (c) 2015 digicorp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // APIRequester *_apiRequester = [[APIRequester alloc] init];
    NSString *urlAsString = [NSString stringWithFormat:API_URL_DEMO];
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    NSLog(@"%@", urlAsString);
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if (error) {
            //[self fetchingGroupsFailedWithError:error];
        } else {
            NSError *error = nil;
            NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
     
            arrData = jsonArray;
            [collectionView reloadData];
        }
    }];
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSections{
    return 1;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [arrData count];
}
 
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView1 cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    RecipeViewCell *cell = (RecipeViewCell *)[collectionView1 dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
  
    NSURL *imgURL = [NSURL URLWithString:[arrData[indexPath.row] objectForKey:@"url"]];
    recipeImageView.contentMode = UIViewContentModeScaleAspectFit;
    [recipeImageView setImageWithURL:imgURL
                    placeholderImage:[UIImage imageNamed:@"placeholder"]
                           completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
                               recipeImageView.contentMode = UIViewContentModeScaleAspectFit;
                               
                           }];

   // cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo-frame-2.png"]];
   // cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo-frame-selected.png"]];
    
    return cell;
}

@end
