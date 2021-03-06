// Copyright Evan Murray. All Rights Reserved. Revision History at http://github.com/emurray2/MusicalWeather

import Foundation
import CoreAudioKit

public class MusicalWeatherPlugin: AUAudioUnit {
    private let kernelAdapter: DSPKernelAdapter
    lazy private var inputBusArray: AUAudioUnitBusArray = {
        AUAudioUnitBusArray(audioUnit: self,
                            busType: .input,
                            busses: [kernelAdapter.inputBus])
    }()
    lazy private var outputBusArray: AUAudioUnitBusArray = {
        AUAudioUnitBusArray(audioUnit: self,
                            busType: .output,
                            busses: [kernelAdapter.outputBus])
    }()
    public override var inputBusses: AUAudioUnitBusArray {
        return inputBusArray
    }
    public override var outputBusses: AUAudioUnitBusArray {
        return outputBusArray
    }
    // MARK: View Configurations
    public override func supportedViewConfigurations(_ availableViewConfigurations: [AUAudioUnitViewConfiguration]) -> IndexSet {
        var indexSet = IndexSet()

        let config = AUAudioUnitViewConfiguration(width: 0.0, height: 0.0, hostHasController: false)
        for (_, _) in [config].enumerated() {
            indexSet.insert(0)
        }
        select(config)
        return indexSet
    }
    public override init(componentDescription: AudioComponentDescription, options: AudioComponentInstantiationOptions = []) throws {
        kernelAdapter = DSPKernelAdapter()
        try super.init(componentDescription: componentDescription, options: options)
    }
    public override var maximumFramesToRender: AUAudioFrameCount {
        get {
            return kernelAdapter.maximumFramesToRender
        }
        set {
            if !renderResourcesAllocated {
                kernelAdapter.maximumFramesToRender = newValue
            }
        }
    }
    public override func allocateRenderResources() throws {
        if kernelAdapter.outputBus.format.channelCount != kernelAdapter.inputBus.format.channelCount {
            throw NSError(domain: NSOSStatusErrorDomain, code: Int(kAudioUnitErr_FailedInitialization), userInfo: nil)
        }
        try super.allocateRenderResources()
        kernelAdapter.allocateRenderResources()
    }
    public override func deallocateRenderResources() {
        super.deallocateRenderResources()
        kernelAdapter.deallocateRenderResources()
    }
    public override var internalRenderBlock: AUInternalRenderBlock {
        return kernelAdapter.internalRenderBlock()
    }
}
