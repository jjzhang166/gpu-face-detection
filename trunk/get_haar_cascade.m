function [haarCascade] = get_haar_cascade(fileName)
    xDoc = xmlread(fileName);
    
    sizeArr = convert_data_items(...
        xDoc.getElementsByTagName('size'),...
        @(x) cellfun(@str2num, regexp(char(x), '\s+', 'split')));
    
    
    haarCascade.size.w = sizeArr(1);
    haarCascade.size.h = sizeArr(2);
    
    xmlStagesItem = xDoc.getElementsByTagName('stages').item(0);
    allStages = [];
    for i = 0 : (xmlStagesItem.getLength - 1)
        xmlStageItem = xmlStagesItem.item(i);
        if itemIsText(xmlStageItem)
            continue;
        end
        
        stage.treshold = convert_data_items(...
            xmlStageItem.getElementsByTagName('stage_threshold'), ...
            @(x) (str2double(char(x))));
        
        stage.parent = convert_data_items(...
            xmlStageItem.getElementsByTagName('parent'), ...
            @(x) (str2num(char(x))));
        
        stage.next = convert_data_items(...
            xmlStageItem.getElementsByTagName('next'), ...
            @(x) (str2num(char(x))));
        
        xmlTrees = xmlStageItem.getElementsByTagName('trees').item(0);
        
        allTrees = [];
        
        for j = 0 : (xmlTrees.getLength - 1)
            xmlTree = xmlTrees.item(j);
            if itemIsText(xmlTree)
                continue;
            end
            
            tree.threshold = convert_data_items(...
                xmlTree.getElementsByTagName('threshold'), ...
                @(x) (str2double(char(x))));
            
            tree.leftVal = convert_data_items(...
                xmlTree.getElementsByTagName('left_val'), ...
                @(x) (str2double(char(x))));
            
            tree.rightVal = convert_data_items(...
                xmlTree.getElementsByTagName('rigth_val'), ...
                @(x) (str2double(char(x))));
            
            rectsArr = convert_data_items(...
                xmlTree.getElementsByTagName('rects').item(0), ...
                @(x) cellfun(@str2double, (regexp(char(x), '\s+', 'split'))));
            
            rects = [];
            
            for k = 1 : size(rectsArr, 1)
                rect.x = rectsArr(k, 1);
                rect.y = rectsArr(k, 2);
                rect.w = rectsArr(k, 3);
                rect.h = rectsArr(k, 4);
                rect.wg = rectsArr(k, 5);
                
                rects = [rects; rect];
            end
            
            tree.feature.rects = rects;
            
            
            tree.feature.tilted = convert_data_items(...
                xmlTree.getElementsByTagName('tilted'), ...
                @(x) (str2double(char(x))));
            
            allTrees = [allTrees; tree];
            
        end
        
        stage.trees = allTrees;
        
        allStages = [allStages; stage];
        
    end
    
    haarCascade.stages = allStages;
    
end

