// Copyright Evan Murray. All Rights Reserved. Revision History at http://github.com/emurray2/MusicalWeather

#import <AudioToolbox/AudioToolbox.h>
#import "Musical_Weather_Audio_UnitDSPKernelAdapter.h"

// Define parameter addresses.
extern const AudioUnitParameterID myParam1;

@interface Musical_Weather_Audio_UnitAudioUnit : AUAudioUnit

@property (nonatomic, readonly) Musical_Weather_Audio_UnitDSPKernelAdapter *kernelAdapter;
- (void)setupAudioBuses;
- (void)setupParameterTree;
- (void)setupParameterCallbacks;
@end
