%% Intro
%Data restructuring and analysis for the BART Data
%6/1/18; Nate Spilka
%the comments may have many misspellings



%% NBB BART

cd /project/psychimg2/Teri/Nate/DDanalysis/METADATA/NBB/BART %set wd


[numDataBART, textDataBART, rawDataBART] = xlsread('Bart_Data_Merged_6.12.19.xlsx'); %Reading in the excel file
rawDataBART((1:2),:) = [];%remove headers
adjustedBARTDates = cell2mat(rawDataBART(:,14))-1;%Adjusted dates
rawDataBART(:,14) = num2cell(adjustedBARTDates);%puting the adjested dates back in
nbbCellBART = cell(length(unique(numDataBART(:,1))),3);%This is the cell-house create for the BART
BARTadjustData1 = cell(length(rawDataBART(:,1)),length(rawDataBART(1,:))); %BART Cell/House for data
exluCriteBART = [43004, 42988, 43229,43319,43337,43338];%0011-3; 14_2; 35_1;036(1TD),043(1TD);052_2_2;57_1;58
specialPartsBART = [43009, 43027, 43184, 43198,43212]; %014-3 (second); 014-3 (third);  035-3 (second); 035_2 (third);040_1 (last labeled as 1 is third)
count = 1;errorTallyBART=1;
mcsParticipants=unique(numDataBART(:,1));

%NOTE: this omits 036 and 043 since they only have 1 TD
for ii = 1:length(rawDataBART(:,1))
    if ~ismember(rawDataBART{ii,14},exluCriteBART)== 1 %exclude the scans of non-interest
        BARTadjustData1(count,:) = rawDataBART(ii,:);
        
        if rawDataBART{ii,14}==specialPartsBART(1) %014-3 (second)
            BARTadjustData1(count,3) = num2cell(2);
            count = count+1;
        elseif rawDataBART{ii,14}==specialPartsBART(2) %014-3 (third)
            BARTadjustData1(count,3) = num2cell(3);
            count = count+1;
        elseif rawDataBART{ii,14}==specialPartsBART(3) % 035-3 (second)
            BARTadjustData1(count,3) = num2cell(2);
            count = count+1;
        elseif rawDataBART{ii,14}==specialPartsBART(4) % 035-2 (third)
            BARTadjustData1(count,3) = num2cell(3);
            count = count+1;
        elseif rawDataBART{ii,14}==specialPartsBART(5) % 040_1 (third)
            BARTadjustData1(count,3) = num2cell(3);
            count = count+1;
            %52 for 10/5/18
        else
            count = count+1;
        end
    end
end


[numDataBARTmatcher, textDataBARTmatcher, rawDataBARTmatcher] = xlsread('BART_to_TD_Matcher.xlsx'); %Reading in the excel file

for ii =1:length(numDataBARTmatcher)
    for qq = 2:length(numDataBARTmatcher(1,:))
        try
            temp = numDataBARTmatcher(ii,qq)-1;
            numDataBARTmatcher(ii,qq) = temp; %Adjusting Dates!
        catch
        end
    end
end

for ii = 1:length(numDataBARTmatcher)
   for qq = 1:length(BARTadjustData1)
       
      if numDataBARTmatcher(ii,3)==BARTadjustData1{qq,14}
          BARTadjustData1{qq,14} = numDataBARTmatcher(ii,2);
          
      end
   end
end

for ii = 1:length(allParticipantsMCSid) %Starts at 2 since participant 002 did not complete an Attentional Bias task
    count1=1;count2=1;count3=1;
    for qq = 1:length(BARTadjustData1(:,1))
        if allParticipantsMCSid{ii,1} == BARTadjustData1{qq,2}
            %this loop puts all participant BART Data into their
            %respective cells
            if BARTadjustData1{qq,3} == 1
                nbbCellBART{ii,1}(count1,:) = BARTadjustData1(qq,:);
                count1 = count1+1;
            elseif BARTadjustData1{qq,3} == 2
                nbbCellBART{ii,2}(count2,:) = BARTadjustData1(qq,:);
                count2 = count2+1; 
            elseif BARTadjustData1{qq,3} == 3
                nbbCellBART{ii,3}(count3,:) = BARTadjustData1(qq,:);
                count3 = count3+1;     
            end            
        end        
    end   
end



table4BART=array2table(BARTadjustData1);

%writetable(table4BART,'rawBART_Data1_6.20.19_Nate.xlsx')



%% BART scoring

%ADD RT

[numDataBARTOutcasts, textDataBARTOutcasts, rawDataBARTOutcasts] = xlsread('BART_Outcasts.xlsx'); %Reading in the excel file
numBARTOutcasts=numDataBARTOutcasts;
numBARTOutcasts(:,2:3)=numDataBARTOutcasts(:,2:3)-1;%Adjusted Dates


nbbCellBartScores = cell(length(allParticipantsMCSid),3);%This is the cell-house create for the BART
bartScoresMatrix=[];count=1;count2=1;count3=1;
for ii = 1:length(allParticipantsMCSid)-1
    for kk = 1:3
        t=1;k=1;pops=[];pumps=[];
        if ~isempty(nbbCellBART{ii,kk})
            for qq = 1:length(nbbCellBART{ii,kk})
                if strcmp(nbbCellBART{ii,kk}{qq,44},'{ENTER}')==1
                    pumps(t,1) = nbbCellBART{ii,kk}{qq,52};
                    t = t+1;
                elseif nbbCellBART{ii,kk}{qq,47}==9
                    pops(k,1) = k;
                    k = k+1;
                end
            end
        nbbCellBartScores{ii,kk}(1,1) = nbbCellBART{ii,kk}{1,2};%participant
        nbbCellBartScores{ii,kk}(1,2) = nbbCellBART{ii,kk}{1,14};%Date
        nbbCellBartScores{ii,kk}(1,3) = mean(pumps);
        nbbCellBartScores{ii,kk}(1,4) = length(pops);
        nbbCellBartScores{ii,kk}(1,5) = nbbCellBART{ii,kk}{1,18}; %Earnings
        
        try
            if ismember(nbbCellBART{ii,kk}{1,14},numBARTOutcasts(:,2))
                phaseINX=find((PARTICIPANTS(ii).Date_TD_Phase(:,2))== numBARTOutcasts(count2,3));
                count2=count2+1;
                phaseTD=PARTICIPANTS(ii).Date_TD_Phase(phaseINX,2:4);
            else
                phaseINX=find((PARTICIPANTS(ii).Date_TD_Phase(:,2))== nbbCellBART{ii,kk}{1,14});
                phaseTD=PARTICIPANTS(ii).Date_TD_Phase(phaseINX,2:4);

            end
        catch
            phaseINX=find((PARTICIPANTS(ii).Date_TD_Phase(:,2))== numBARTOutcasts(count2,3));
            count3=count3+1;
            phaseTD=PARTICIPANTS(ii).Date_TD_Phase(phaseINX,2:4);

            disp(['participant:',num2str(allParticipantsMCSid{ii}),'didnt make it through'])
        end
        
        dateINX=find((PARTICIPANTS(ii).DDAppendProjected(:,1)+1)== nbbCellBART{ii,kk}{1,14});
        mcDay4BART=round(PARTICIPANTS(ii).DDAppendProjected(dateINX,3));%Normalized Rounded day
        if mcDay4BART>28
            mcDay4BART=1;
        end
        
        bartScoresMatrix(count,:)= [nbbCellBART{ii,kk}{1,2},nbbCellBART{ii,kk}{1,14},kk,mcDay4BART,phaseTD,mean(pumps),length(pops),nbbCellBART{ii,kk}{1,18}];
        count=count+1;
        
        % This requires DDcode2 to have already been run
        if allParticipantsMCSid{ii,1}==nbbCellBartScores{ii,kk}(1,1)
            PARTICIPANTS(ii).BART(kk,:) = nbbCellBartScores{ii,kk}(1,2:end);
        elseif allParticipantsMCSid{ii,1}~=nbbCellBartScores{ii,kk}(1,1)
            PARTICIPANTS(ii).BART = nan(1,4);
        end
        
        end
    end 
end


%% Finding BART TDs that do not line up perfectly with the scan days

count=1;bartOutcasts=[];
for ii = 1:length(allParticipantsMCSid)
    for qq = 1:3
        try
        if (nbbCellBART{ii,qq}{1,14}~=PARTICIPANTS(ii).HormonesSaliva(qq,1))==1
            bartOutcasts(count,1)=nbbCellBART{ii,qq}{1,2};
            bartOutcasts(count,2)=nbbCellBART{ii,qq}{1,14};
            bartOutcasts(count,3)=PARTICIPANTS(ii).HormonesSaliva(qq,1);
            count=count+1;
        else
            bartIncasts2(ii,1)=nbbCellBART{ii,qq}{1,2};
        end
        catch
            disp(['Row:', num2str(ii),' is not in the BART']);
        end
    end
end





