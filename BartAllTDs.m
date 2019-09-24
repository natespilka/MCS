%% Intro
%Data restructuring and analysis for the BART Data
%7/1/18; Nate Spilka
%the comments may have many misspellings
%this requires DDcode2 to run prior to running this


%% NBB BART [REMASTERED]

cd /project/psychimg2/Teri/Nate/DDanalysis/METADATA/NBB/BART %set wd


[numDataBART, textDataBART, rawDataBART] = xlsread('Bart_Data_Merged_6.12.19.xlsx'); %Reading in the excel file

cd ../..
[numDataNbbScanDates, textDataNbbScanDates, rawDataNbbScanDates] = xlsread('Dates_NBB_SCAN_7.2.19.xlsx'); %Reading in the excel file

exluCriteBART = [43004, 42988, 43229,43319,43337,43338];%0011-3; 14_2; 35_1;036(1TD),043(1TD);052_2_2;57_1;58
specialPartsBART = [43009, 43027, 43184, 43198,43212]; %014-3 (second); 014-3 (third);  035-3 (second); 035_2 (third);040_1 (last labeled as 1 is third)
BartDates=[];
BartDates(:,1)=unique(numDataBART(:,13),'stable'); %find all dates (unique to all participants)

adjustedTxtBart4NumData=textDataBART;
adjustedTxtBart4NumData([1,2],:)=[];
for ii = 1:length(adjustedTxtBart4NumData)
    if strcmp(adjustedTxtBart4NumData{ii,44},'{ENTER}')==1
        numDataBART(ii,end)=1;
    else
        numDataBART(ii,end)=0;
    end
end

bartScoresAll=[];

for ii = 1:length(BartDates)
    
    bartPartIndx=find(numDataBART(:,13)==BartDates(ii));
    tdBartData=[];
    tdBartData=numDataBART(bartPartIndx,:);
    
    indxBartPumps=find(tdBartData(:,55)==1);
    pumps=[];
    pumps=mean(tdBartData(indxBartPumps,51));
    
    indxBartPops=find(tdBartData(:,46)==9);
    deleteFromPops=find(ismember(indxBartPops,indxBartPumps));
    indxBartPops(deleteFromPops)=[];
    pops=[];
    pops=length(indxBartPops);
    
    earnings=tdBartData(1,17);
    
    
    for jj = 1:length(allParticipantsMCSid)
        if PARTICIPANTS(jj).MCSid==tdBartData(1,1)
            dateINX=find((PARTICIPANTS(jj).DDAppendProjected(:,1))== BartDates(ii)-1);
            mcDay4BART=round(PARTICIPANTS(jj).DDAppendProjected(dateINX,3));%Normalized Rounded day
        end
    end
    
    phaseIndx=find(numDataNbbScanDates(:,2)==BartDates(ii));
    phase=numDataNbbScanDates(phaseIndx,9);
    scanDate=numDataNbbScanDates(phaseIndx,3);
    
    bartScoresAll(ii,:)=[tdBartData(1,1),BartDates(ii),scanDate,phase,mcDay4BART,pumps,pops,earnings];
end




      
        








