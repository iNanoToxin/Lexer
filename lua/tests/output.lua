require('paths')
require('audio')
local __LVAR__ = require('moses')
local __LVAR__ = "vcc2016_training"
require('code.dtw.dtw')
require('code.world')
__GVAR__, __GVAR__, __GVAR__ = 1, 2, 3
local __LVAR__<X>, __LVAR__<Y>, __LVAR__<Z> = 4, 5, 6
function __MEMBER__.ofIterator(...)
    local __LVAR__ = {}
    for v in ... do
        arr[#arr + 1] = v
    end
    return arr
end
function __FUNC__(__PARAM__, __PARAM__)
    local __LVAR__ = __MEMBER__.concat(trainPath, speaker)
    local __LVAR__ = __MEMBER__.ofIterator(__MEMBER__.iterfiles(dir))
    local __LVAR__ = __MEMBER__.map(files, function(__PARAM__, __PARAM__)
        return __MEMBER__.concat(dir, fileName)
    end)
    return files
end
function __FUNC__(__PARAM__)
    local __LVAR__, __LVAR__ = __MEMBER__.load(wavFileName)
    local __LVAR__ = x[{
        {},
        1
    }]
    return __MEMBER__.pack(__MEMBER__.doAll(x, fs))
end
__GVAR__ = 2
function __FUNC__()
    local __LVAR__ = __MEMBER__.dir(trainPath)
    local __LVAR__ = trainPath .. "_feat"
    __MEMBER__.mkdir(trainFeatPath)
    local __LVAR__ = __MEMBER__.filter(speakers, function(__PARAM__, __PARAM__)
        return __MEMBER__:find("S") == 1
    end)
    local __LVAR__ = __MEMBER__.filter(speakers, function(__PARAM__, __PARAM__)
        return __MEMBER__:find("T") == 1
    end)
    if stage <= 1 then
        for __, speaker in ipairs(__MEMBER__.union(sourceSpeakers, targetSpeakers)) do
            __MEMBER__.mkdir(__MEMBER__.concat(trainFeatPath, speaker))
        end
        for __, speaker in ipairs(__MEMBER__.union(sourceSpeakers, targetSpeakers)) do
            local __LVAR__ = getTrainSamplesForSpeaker(trainPath, speaker)
            local __LVAR__ = __MEMBER__.map(trainSamples, function(__PARAM__, __PARAM__)
                return mungeToFeatures(fileName)
            end)
            __MEMBER__.eachi(sampleFeatures, function(__PARAM__, __PARAM__)
                local __LVAR__ = __MEMBER__.gsub(__MEMBER__.gsub(__MEMBER__[i], trainPath, trainFeatPath), ".wav", ".feat")
                local __LVAR__ = __MEMBER__.map(sampleFeature, function(__PARAM__, __PARAM__)
                    return __MEMBER__:float()
                end)
                __MEMBER__.save(fileName, floatSampleFeature)
            end)
        end
    end
    do
        return 
    end
    if stage <= 2 then
        local __LVAR__ = trainFeatPath .. "_pairs"
        __MEMBER__.mkdir(trainFeatPairPath)
        for __, sourceSpeaker in ipairs(sourceSpeakers) do
            for __, targetSpeaker in ipairs(targetSpeakers) do
                local __LVAR__ = getTrainSamplesForSpeaker(trainFeatPath, sourceSpeaker)
                local __LVAR__ = getTrainSamplesForSpeaker(trainFeatPath, targetSpeaker)
                local __LVAR__ = __MEMBER__.zip(sourceFiles, targetFiles)
                local __LVAR__ = __MEMBER__.concat(trainFeatPairPath, (sourceSpeaker .. "_") .. targetSpeaker)
                __MEMBER__.mkdir(pairPath)
                for uttNum, featFilePair in ipairs(trainPairs) do
                    local __LVAR__ = __MEMBER__.load(featFilePair[1])
                    local __LVAR__ = __MEMBER__.load(featFilePair[2])
                    local __LVAR__ = dtw(sourceData[3], targetData[3])
                    __MEMBER__.insert(featFilePair, path)
                    local __LVAR__ = uttNum + 100000
                    local __LVAR__ = __MEMBER__.concat(pairPath, uttNum .. ".feat")
                    print(savePath)
                    __MEMBER__.save(savePath, featFilePair)
                end
            end
        end
    end
end
function __FUNC__()
    local __LVAR__ = __MEMBER__.popen("ls -1 vcc2016_training_feat/*/*.feat")
    for fileName in __MEMBER__:lines() do
        local __LVAR__ = __MEMBER__.load(fileName)
        assert(featTable[1]:type() == "torch.DoubleTensor")
        local __LVAR__ = __MEMBER__.map(featTable, function(__PARAM__, __PARAM__)
            if __MEMBER__.type(tensor) == "torch.DoubleTensor" then
                return __MEMBER__:float()
            else
                return tensor
            end
        end)
        assert(floatFeatTable[1]:type() == "torch.FloatTensor")
        print(fileName)
        __MEMBER__.save(fileName, floatFeatTable)
    end
end
doubleToFloat()