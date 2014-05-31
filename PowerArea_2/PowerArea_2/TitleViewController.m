//
//  TitleViewController.m
//  PowerArea_2
//
//  Created by e125719 on 2014/05/25.
//  Copyright (c) 2014年 e125719. All rights reserved.
//

#import "TitleViewController.h"
#import "AppDelegate.h"
#import "IdEntity.h"

@interface TitleViewController ()

@property (nonatomic, retain) NSManagedObjectContext *manageObjectContext;
- (IBAction)start:(id)sender;

@end

NSInteger count;

@implementation TitleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    AppDelegate *appdele = [UIApplication sharedApplication].delegate;
    self.manageObjectContext = appdele.manageObjectContext;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (int)countUnreadItems {
    // 検索リクエストのオブジェクトを生成します。
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    // 対象エンティティを指定します。
    NSEntityDescription *entity
    = [NSEntityDescription entityForName:@"IdEntity" inManagedObjectContext:self.manageObjectContext];
    [fetchRequest setEntity:entity];
    
    // キャッシュサイズや上限を指定します。
    [fetchRequest setFetchBatchSize:20];
    [fetchRequest setFetchLimit:0];
    
    // 検索条件を指定します。
    NSPredicate *pred
    = [NSPredicate predicateWithFormat:@"isError = 0"];
    [fetchRequest setPredicate:pred];
    
    // ソート条件を指定します。
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"user" ascending:NO];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];
    
    // 上記リクエストを元に件数を取得します。
    NSError *error = nil;
    count = [self.manageObjectContext countForFetchRequest:fetchRequest error:&error];
    
    // エラーがあった場合には、エラー情報を表示する。
    if (error) {
        NSLog(@"error occurred. error = %@", error);
    }
    
    return count;
}



- (IBAction)start:(id)sender {
    
    if (count == 0) {
        [self performSegueWithIdentifier:@"notdata" sender:self];
    }else{
        [self performSegueWithIdentifier:@"getdata" sender:self];
    }
    
    NSLog(@"%ld", (long)count);
}
@end
