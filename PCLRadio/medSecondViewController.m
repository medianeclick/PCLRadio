//
//  medSecondViewController.m
//  PCLRadio
//
//  Created by Fernando Bueno Ceron on 4/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "medSecondViewController.h"


@implementation medSecondViewController


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


#pragma mark - View lifecycle

- (void)showWeb
{
    
	// Do any additional setup after loading the view, typically from a nib.
    // Do any additional setup after loading the view, typically from a nib.
    NSString *newsURLString; 
    NSURL *newsURL;    
    
    newsURLString = [[NSString alloc] initWithString:@"http://pclradio.es/movil/"];
    newsURL = [[NSURL alloc] initWithString:newsURLString];   
    
    UIView *contentView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	self.view = contentView;	
    
	CGRect webFrame = [[UIScreen mainScreen] applicationFrame];
	webFrame.origin.y = 0.0f;
	newsView = [[UIWebView alloc] initWithFrame:webFrame];
	newsView.backgroundColor = [UIColor blueColor];
	newsView.scalesPageToFit = YES;
	newsView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
	newsView.delegate = self;
	[self.view addSubview: newsView];
    [newsView loadRequest:[NSURLRequest requestWithURL:newsURL]];
    
	loadingView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
	loadingView.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
	loadingView.center = self.view.center;
	[self.view addSubview: loadingView];      
    
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
	// load error, hide the activity indicator in the status bar
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
	// report the error inside the webview
	NSString* errorString = [NSString stringWithFormat:
							 @"<html><center><br /><br /><font size=+5 color='red'>Error<br /><br />al cargar %@</font></br><input type='button' value='Inicio' onclick='javascript:window.location=\'http://www.pclradio.es/movil/\''</center></html>",
							 error.localizedDescription];
	[newsView loadHTMLString:errorString baseURL:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [loadingView setHidesWhenStopped:YES];    
    
    [self showWeb];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    loadingView.hidden=NO;
	[loadingView startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    loadingView.hidden=YES;
	[loadingView stopAnimating];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    newsView = nil;
    loadingView=nil;
    

}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
