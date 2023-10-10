require('paths')
require('audio')
local __VAR__ = require('moses')
local __VAR__ = "vcc2016_training"
require('code.dtw.dtw')
require('code.world')
a.x, b.y, c.z = 1, 2, 3
local __VAR__<X>, __VAR__<Y>, __VAR__<Z> = 4, 5, 6
function table.ofIterator(...)
    local __VAR__ = {}
    for v in g, h, j do
        arr[#arr + 1] = v
    end
    return arr
end
dog(a[X], b, c)
function getTrainSamplesForSpeaker(trainPath, speaker)
    local __VAR__ = paths.concat(trainPath, speaker)
    local __VAR__ = table.ofIterator(paths.iterfiles(dir))
    local __VAR__ = _.map(files, function(k, fileName)
        return paths.concat(dir, fileName)
    end)
    return files
end
function mungeToFeatures(wavFileName)
    local __VAR__, __VAR__ = audio.load(wavFileName)
    local __VAR__ = x[{
        {},
        1
    }]
    return table.pack(world.doAll(x, fs))
end
__VAR__ = 2
function main()
    local __VAR__ = paths.dir(trainPath)
    local __VAR__ = trainPath .. "_feat"
    paths.mkdir(trainFeatPath)
    local __VAR__ = _.filter(speakers, function(k, dirName)
        return dirName:find("S") == 1
    end)
    local __VAR__ = _.filter(speakers, function(k, dirName)
        return dirName:find("T") == 1
    end)
    if stage <= 1 then
        for __, speaker in ipairs(_.union(sourceSpeakers, targetSpeakers)) do
            paths.mkdir(paths.concat(trainFeatPath, speaker))
        end
        for __, speaker in ipairs(_.union(sourceSpeakers, targetSpeakers)) do
            local __VAR__ = getTrainSamplesForSpeaker(trainPath, speaker)
            local __VAR__ = _.map(trainSamples, function(__, fileName)
                return mungeToFeatures(fileName)
            end)
            _.eachi(sampleFeatures, function(i, sampleFeature)
                local __VAR__ = string.gsub(string.gsub(trainSamples[i], trainPath, trainFeatPath), ".wav", ".feat")
                local __VAR__ = _.map(sampleFeature, function(__, tensor)
                    return tensor:float()
                end)
                torch.save(fileName, floatSampleFeature)
            end)
        end
    end
    do
        return 
    end
    if stage <= 2 then
        local __VAR__ = trainFeatPath .. "_pairs"
        paths.mkdir(trainFeatPairPath)
        for __, sourceSpeaker in ipairs(sourceSpeakers) do
            for __, targetSpeaker in ipairs(targetSpeakers) do
                local __VAR__ = getTrainSamplesForSpeaker(trainFeatPath, sourceSpeaker)
                local __VAR__ = getTrainSamplesForSpeaker(trainFeatPath, targetSpeaker)
                local __VAR__ = _.zip(sourceFiles, targetFiles)
                local __VAR__ = paths.concat(trainFeatPairPath, (sourceSpeaker .. "_") .. targetSpeaker)
                paths.mkdir(pairPath)
                for uttNum, featFilePair in ipairs(trainPairs) do
                    local __VAR__ = torch.load(featFilePair[1])
                    local __VAR__ = torch.load(featFilePair[2])
                    local __VAR__ = dtw(sourceData[3], targetData[3])
                    table.insert(featFilePair, path)
                    local __VAR__ = uttNum + 100000
                    local __VAR__ = paths.concat(pairPath, uttNum .. ".feat")
                    print(savePath)
                    torch.save(savePath, featFilePair)
                end
            end
        end
    end
end
function doubleToFloat()
    local __VAR__ = io.popen("ls -1 vcc2016_training_feat/*/*.feat")
    for fileName in fileNames:lines() do
        local __VAR__ = torch.load(fileName)
        assert(featTable[1]:type() == "torch.DoubleTensor")
        local __VAR__ = _.map(featTable, function(__, tensor)
            if torch.type(tensor) == "torch.DoubleTensor" then
                return tensor:float()
            else
                return tensor
            end
        end)
        assert(floatFeatTable[1]:type() == "torch.FloatTensor")
        print(fileName)
        torch.save(fileName, floatFeatTable)
    end
end
doubleToFloat()