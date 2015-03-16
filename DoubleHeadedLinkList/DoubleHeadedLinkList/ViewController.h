//
//  ViewController.h
//  DoubleHeadedLinkList
//
//  Created by sanjeev bharti on 3/15/15.
//  Copyright (c) 2015 sanjeev bharti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Node.h"

enum {
    
    TraversalDirectionForward = 0 ,
    TraversalDirectionBackward
    
};

@interface ViewController : UIViewController {
    
    Node *root ;
    Node *tail ;
    int traversalDirection ;
}

//methods to insert data to doubly link list
- (Node *)insertNode:(Node *)node withData:(int)data ;

// traverse link list in two direction
- (void)traversalLinklistwithRootNode:(Node *)node ;

@end

