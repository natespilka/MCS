%% Intro
%Restructuring the AttnBias Data for analysis in matlab
%6/1/18; Nate Spilka
%the comments may have many misspellings


%% NBB ATTENTIONAL BIAS TASK

cd /project/psychimg2/Teri/Nate/DDanalysis/METADATA/NBB/AttentionalBias %set wd

[numDataAttBias, textDataAttBias, rawDataAttBias] = xlsread('AttBiasMerged9to52TD1.xlsx'); %Reading in the excel file
rawDataAttBias((1:2),:) = [];%remove headers
adjustedAttBiasDates = cell2mat(rawDataAttBias(:,16))-1; %Adjusted dates
rawDataAttBias(:,16) = num2cell(adjustedAttBiasDates); %puting the adjested dates back in
nbbCellAttBias = cell(length(allParticipantsMCSid),3); %This is the cell-house create for the Attentional Bias Data

for ii = 1:length(allParticipantsMCSid) %Starts at 2 since participant 002 did not complete an Attentional Bias task
    count1=1;count2=1;count3=1;
    for qq = 1:length(rawDataAttBias(:,1))
        if allParticipantsMCSid{ii} == rawDataAttBias{qq,2}
            %this loop puts all participant AttBias Data into their
            %respective cells
            if rawDataAttBias{qq,3} == 1
                nbbCellAttBias{ii,1}(count1,:) = rawDataAttBias(qq,:);
                count1 = count1+1;
            elseif rawDataAttBias{qq,3} == 2
                nbbCellAttBias{ii,2}(count2,:) = rawDataAttBias(qq,:);
                count2 = count2+1; 
            elseif rawDataAttBias{qq,3} == 3
                nbbCellAttBias{ii,3}(count3,:) = rawDataAttBias(qq,:);
                count3 = count3+1;     
            end            
        end        
    end   
end
