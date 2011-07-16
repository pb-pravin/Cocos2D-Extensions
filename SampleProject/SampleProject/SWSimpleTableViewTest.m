//
//  SWSimpleTableViewTest.m
//  SampleProject
//
//  Created by Serban Porumbescu on 7/15/11.


#import "SWSimpleTableViewTest.h"
#import "SWTableViewCell.h"


@interface MyCell : SWTableViewCell 
{
   
}
@end

@implementation MyCell

- (id)init
{
   if(! (self = [super init]) )
      return nil;
   
   NSLog(@"nothing to see here");
   
   return self;
}

@end

@implementation SWSimpleTableViewTest

+ (id)scene {
	CCScene *scene = [CCScene node];
	
	[scene addChild:[self node]];
	
	return scene;
}

- (id)init
{
   if(! (self = [super init]) )
      return nil;
   
   self.isTouchEnabled = YES;
   
   CGSize size = CGSizeMake(100, 200);
   
   myTable = [[SWTableView viewWithDataSource:self size:size] retain];
   myTable.delegate = self;
   myTable.direction = SWScrollViewDirectionVertical;
   [self addChild:myTable];
   
   [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"cell.plist"];
   
   CGSize s = [[CCDirector sharedDirector] winSize];
   myTable.position = ccp(s.width * 0.5f, s.height * 0.5f);
   
   [myTable reloadData];
   
   return self;
}

- (void)table:(SWTableView*)table cellTouched:(SWTableViewCell*)cell
{
   NSLog(@"cell touched at index: %i", cell.idx);
}

-(CGSize)cellSizeForTable:(SWTableView *)table;
{
   return CGSizeMake(100, 44);
}

- (SWTableViewCell*)table:(SWTableView *)table cellAtIndex:(NSUInteger)idx;
{
   SWTableViewCell *cell;
   NSString *spriteName;
   CCSprite *sprite;
   
   cell       = [table dequeueCell];
   spriteName = [NSString stringWithFormat:@"cell%i.png", idx%10];
   sprite     = [CCSprite spriteWithSpriteFrameName:spriteName];
   
   if (!cell) 
   {
      cell = [[MyCell new] autorelease];
   }
   else // remove the cell's previously added children
   {
      [cell.children removeAllObjects];
   }
   [cell addChild:sprite];
   
   NSLog(@"num kids = %d", [[cell children] count]);
   
   return cell;
}

-(NSUInteger)numberOfCellsInTableView:(SWTableView *)table;
{
   return 20;
}


@end
