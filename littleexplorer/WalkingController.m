//
//  WalkingController.m
//  littleexplorer
//
//  Created by iskander on 07/12/13.
//  Copyright (c) 2013 rhokexplorers. All rights reserved.
//

#import "WalkingController.h"
#import "Walking.h"
#import "IconDownloader.h"

@interface WalkingController () <UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableDictionary *imageDownloadsInProgress;

@end


@implementation WalkingController


NSMutableArray* data;

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
    [[self spinner] startAnimating];
    data = [[NSMutableArray alloc] initWithCapacity:5];
    self.imageDownloadsInProgress = [NSMutableDictionary dictionary];
    
    for(int i = 0; i< 5; i++){
        
        Walking* obj = [Walking new];
        
        obj.name = [NSString stringWithFormat:@"Percorso %i",i];
        obj.level = [NSString stringWithFormat:@"Level %i",i];
        obj.imageURLString = @"http://static1.wikia.nocookie.net/__cb20121106055761/rift/images/c/ca/Peace_of_the_Forest_Icon.png";

        [data addObject:obj];
    }
    
   [[self spinner] stopAnimating];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(data != nil)
        return 1;
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(data != nil)
        return [data count];
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"walking";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = (UITableViewCell *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    
    Walking* w =  [data objectAtIndex:indexPath.row];
    
    if(w != NULL){
        cell.textLabel.text = [w name];
        cell.detailTextLabel.text = [w level];
        
        if(!w.image)
        {
            if (self.tableView.dragging == NO && self.tableView.decelerating == NO)
            {
                [self startIconDownload:w forIndexPath:indexPath];
            }
            // if a download is deferred or in progress, return a placeholder image
            cell.imageView.image = [UIImage imageNamed:@"place.png"];
            
        }else{
            cell.imageView.image = w.image;
        }
        

    }else{
        //        nameLabel.text = @"No conversations yet";
        cell.textLabel.text = @"No conversations yet";
    }
    
    return cell;
}


- (void)startIconDownload:(Walking *)walking forIndexPath:(NSIndexPath *)indexPath
{
    IconDownloader *iconDownloader = [self.imageDownloadsInProgress objectForKey:indexPath];
    
    if (iconDownloader == nil)
    {
        iconDownloader = [[IconDownloader alloc] init];
        iconDownloader.walk = walking;
        [iconDownloader setCompletionHandler:^{
            
            UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
            
            // Display the newly loaded image
            cell.imageView.image = walking.image;
            
            // Remove the IconDownloader from the in progress list.
            // This will result in it being deallocated.
            [self.imageDownloadsInProgress removeObjectForKey:indexPath];
            
        }];
        [self.imageDownloadsInProgress setObject:iconDownloader forKey:indexPath];
        [iconDownloader startDownload];
    }
}

@end
