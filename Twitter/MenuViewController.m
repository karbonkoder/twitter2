//
//  MenuViewController.m
//  Twitter
//
//  Created by Ankush Raina on 11/19/15.
//  Copyright © 2015 Ankush Raina. All rights reserved.
//

#import "MenuViewController.h"
#import "TweetsViewController.h"

@interface MenuViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *menuItems;
@property (strong, nonatomic) NSArray *viewControllers;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.menuItems = @[@"Profile", @"Home", @"Mentions"];
    self.viewControllers = @[[[TweetsViewController alloc] init], [[TweetsViewController alloc] init], [[TweetsViewController alloc] init]];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];// [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];

    cell.textLabel.text = self.menuItems[indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.hamburgerViewController.contentViewController = self.viewControllers[indexPath.row];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
