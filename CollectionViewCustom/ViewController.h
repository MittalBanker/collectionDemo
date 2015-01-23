//
//  ViewController.h
//  CollectionViewCustom
//
//  Created by Mittal J. Banker on 1/23/15.
//  Copyright (c) 2015 digicorp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecipeViewCell.h"

@interface ViewController : UIViewController<UICollectionViewDelegate>{
    NSArray *arrData;
    IBOutlet UICollectionView *collectionView;
}

@end

