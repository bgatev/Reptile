//
//  ViewController.m
//  try2
//
//  Created by admin on 10/26/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>


@interface ViewController ()

@end

@implementation ViewController

@synthesize playPauseButton;
@synthesize volumeControl;
@synthesize alertLabel;
@synthesize audioPlayer;

- (IBAction)volumeDidChange:(UISlider *)slider {
    //Handle the slider movement
    [audioPlayer setVolume:[slider value]];
}

- (IBAction)togglePlayingState:(id)button {
    //Handle the button pressing
    [self togglePlayPause];
}

-(void) dealloc {
    self.playPauseButton = nil;
    self.volumeControl = nil;
    self.alertLabel = nil;
    self.audioPlayer = nil;
    
    //[playPauseButton release];
    //[volumeControl release];
    //[alertLabel release];
    //[audioPlayer release];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
    //Once the view has loaded then we can register to begin recieving controls and we can become the first responder
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    //End recieving events
    [[UIApplication sharedApplication] endReceivingRemoteControlEvents];
    [self resignFirstResponder];
}

- (void)playAudio {
    //Play the audio and set the button to represent the audio is playing
    [audioPlayer play];
    [playPauseButton setTitle:@"Pause" forState:UIControlStateNormal];
}

- (void)pauseAudio {
    //Pause the audio and set the button to represent the audio is paused
    [audioPlayer pause];
    [playPauseButton setTitle:@"Play" forState:UIControlStateNormal];
}

- (void)togglePlayPause {
    //Toggle if the music is playing or paused
    if (!self.audioPlayer.playing) {
        [self playAudio];
        
    } else if (self.audioPlayer.playing) {
        [self pauseAudio];
        
    }
}

//Make sure we can recieve remote control events
- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)remoteControlReceivedWithEvent:(UIEvent *)event {
    //if it is a remote control event handle it correctly
    if (event.type == UIEventTypeRemoteControl) {
        if (event.subtype == UIEventSubtypeRemoteControlPlay) {
            [self playAudio];
        } else if (event.subtype == UIEventSubtypeRemoteControlPause) {
            [self pauseAudio];
        } else if (event.subtype == UIEventSubtypeRemoteControlTogglePlayPause) {
            [self togglePlayPause];
        }
    }
}

- (void)viewDidLoad {
  self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"13.3.jpg"]];
    
    PFObject *testObject = [PFObject objectWithClassName:@"Promotions"];
    testObject[@"City"] = @"Sofia";
    [testObject saveInBackground];
    
    
    [super viewDidLoad];
    
    //Check Connection example
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    
    if (networkStatus == NotReachable) {
        //no internet
        
    } else {
        // has internet
        
    }
    
    
    //Declare the audio file location and settup the player
    NSURL *audioFileLocationURL = [[NSBundle mainBundle] URLForResource:@"sound" withExtension:@"caf"];

    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioFileLocationURL error: &error];

    [audioPlayer setNumberOfLoops:-1];
    
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
        
        [[self volumeControl] setEnabled:NO];
        [[self playPauseButton] setEnabled:NO];
        
        [[self alertLabel] setText:@"Unable to load file"];
        [[self alertLabel] setHidden:NO];
    } else {
        [[self alertLabel] setText:[NSString stringWithFormat:@"%@ has loaded", @"Sound.caf"]];
        [[self alertLabel] setHidden:NO];
        
        //Make sure the system follows our playback status
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
        [[AVAudioSession sharedInstance] setActive: YES error: nil];
        
        //Load the audio into memory
        [audioPlayer prepareToPlay];
    }
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)swipeBackLeft:(UIStoryboardSegue *)segue {
    
   
}

- (IBAction)swipeBackRight:(UIStoryboardSegue *)otherSegue {
    
  
}

@end
