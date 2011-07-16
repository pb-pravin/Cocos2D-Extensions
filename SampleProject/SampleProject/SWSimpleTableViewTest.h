//
//  SWSimpleTableViewTest.h
//  SampleProject
//
//  Created by Serban Porumbescu on 7/15/11.


#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SWTableView.h"

@interface SWSimpleTableViewTest : CCLayer  <SWTableViewDataSource, 
                                             SWTableViewDelegate>
{
   SWTableView *myTable;
}

+ (id)scene;
@end
