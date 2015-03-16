//
//  ViewController.m
//  DoubleHeadedLinkList
//
//  Created by sanjeev bharti on 3/15/15.
//  Copyright (c) 2015 sanjeev bharti. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (Node *)createNodeWithData :(int)data ;
- (void)animateLabel ;

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    [self animateLabel];
    
    for (int index = 0; index < 10 ; index++) {
        
        [self insertNode:head withData:arc4random() % 20000];
    }

    NSLog(@"\n\n\n Forward Traversal begin");
    traversalDirection = TraversalDirectionForward ;
    [self traversalLinklistwithRootNode:head];

    NSLog(@"\n\n\n Backward Traversal begin");
    traversalDirection = TraversalDirectionBackward ;
    [self traversalLinklistwithRootNode:tail];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - User Defined Methods

//methods to insert data to doubly link list
- (Node *)insertNode:(Node *)node withData:(int)data {
    
    if (head == NULL) {
        
        head = [self createNodeWithData:data];
        node = tail = head ;

    } else if (node == NULL) {
        
        node = [self createNodeWithData:data];
        tail = node ;

    } else {
        
        node.next = [self insertNode:node.next withData:data];
        node.next.back = node ;
    }
    
    return node ;
}

// traverse link list in two direction
- (void)traversalLinklistwithRootNode:(Node *)node {
    
    if (node == NULL) {
        
        return ;
        
    } else {
        
        NSLog(@"node data = %d",node.data);
        
        if (traversalDirection == TraversalDirectionForward) {
         
            [self traversalLinklistwithRootNode:node.next];
            
        } else {
        
            [self traversalLinklistwithRootNode:node.back];
        }
    }
}

#pragma mark - 
#pragma mark - Private Methods

- (Node *)createNodeWithData :(int)data {
    
    Node *_node = [[Node alloc] init];
    _node.data = data ;
    _node.next = NULL ;
    _node.back = NULL ;
    return _node ;
    
}

- (void)animateLabel {
    
    [UIView animateWithDuration:0.5f animations:^{
        
        lbldoubleHeaderLinkList.transform = CGAffineTransformMakeScale(1.6f, 1.6f) ;
        lbldoubleHeaderLinkList.alpha = 1.0f ;
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.4f animations:^{
            
            lbldoubleHeaderLinkList.transform = CGAffineTransformMakeScale(1.0f, 1.0f) ;
            lbldoubleHeaderLinkList.alpha = 0.0f ;
            
        } completion:^(BOOL finished) {
            
            [self animateLabel];
            
        }];
    }];
}

@end
