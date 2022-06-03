// Copyright Evan Murray. All Rights Reserved. Revision History at http://github.com/emurray2/MusicalWeather

import Foundation

public class MusicalWeatherPlugin: AUAudioUnit {
    private let kernelAdapter: DSPKernelAdapter
    public override init(componentDescription: AudioComponentDescription, options: AudioComponentInstantiationOptions = []) throws {
        kernelAdapter = DSPKernelAdapter()
        try super.init(componentDescription: componentDescription, options: options)
    }
}
