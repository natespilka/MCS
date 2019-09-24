%% Intro
%Data restructuring and analysis for the SRCT Data
%7/1/18; Nate Spilka
%the comments may have many misspellings
%this requires DDcode2 to run prior to running this


%% NBB SRCT [REMASTERED]

cd 	/project/psychimg2/Teri/Nate/DDanalysis/METADATA/NBB/SRCT %set wd


[numDataSRCT2, textDataSRCT2, rawDataSRCT2] = xlsread('MergedData_6.28.19.xlsx'); %Reading in the excel file

dataEnd=find(~isnan(numDataSRCT2(:,1)),1,'last');
numDataSRCT2=numDataSRCT2(1:dataEnd,:);

cd ../..
[numDataNbbScanDates, textDataNbbScanDates, rawDataNbbScanDates] = xlsread('Dates_NBB_SCAN_7.2.19.xlsx'); %Reading in the excel file
numDataNbbScanDates(:,[2 3]) = numDataNbbScanDates(:,[2 3])-1;


exluCriteSRCT2 = [43004, 42988, 43229,43319,43337,43338];%0011-3; 14_2; 35_1;036(1TD),043(1TD);052_2_2;57_1;58
specialPartsSRCT2 = [43009, 43027, 43184, 43198,43212]; %014-3 (second); 014-3 (third);  035-3 (second); 035_2 (third);040_1 (last labeled as 1 is third)

SRCT2Dates=[];
dateIndx=find(~isnan(numDataSRCT2(:,1)));
SRCT2Dates(:,1)=numDataSRCT2(dateIndx,1);

%re-working the dates
temp = num2str(SRCT2Dates); 
year = temp(:,(end-1):end); %Years
day = temp(:,(end-3):(end-2));%day
month = temp(:,1:(end-4));%month
dateSRCT = strcat(month,'/',day,'/',year);%concatonate the mo/DAY/year
matlabDateSCRT = m2xdate(dateSRCT); 
numDataSRCT2(:,1)=matlabDateSCRT-1;

partScrtDates=unique(matlabDateSCRT,'stable')-1; %find all dates (unique to all participants)


adjustedTxtSRCT4NumData=textDataSRCT2;
adjustedTxtSRCT4NumData(1,:)=[];%remove the header
for ii = 1:length(numDataSRCT2)
    if (strcmp(adjustedTxtSRCT4NumData{ii,7}(1:8),'practise')==0)
        numDataSRCT2(ii,end)=1;
    else
        numDataSRCT2(ii,end)=0;
    end
    if ~isempty(adjustedTxtSRCT4NumData{ii,5}) %for the cells that are similar to "028-3"
        strPartNum=adjustedTxtSRCT4NumData{ii,5}(1:3);
        numDataSRCT2(ii,3)=str2num(strPartNum);
    end
end

srctScoresAll=nan(length(partScrtDates),10);
noPraSCRT=[];
%begin
for ii = 1:length(partScrtDates)
    
    srctPartIndx=find(numDataSRCT2(:,1)==partScrtDates(ii));
    tdSrctData=[];
    tdSrctData=numDataSRCT2(srctPartIndx,:);
    nonPracticeData=find(tdSrctData(:,end)==1);
    noPraSCRT=tdSrctData(nonPracticeData,:);%no practice trials

    %cleaning data
    lss200ms=find(noPraSCRT(:,17)<200);%less than 200ms
    grtr3000=find(noPraSCRT(:,17)>3000);%greater than 3000ms
    errorsINDX=find(noPraSCRT(:,16)==0);
    errorCount=length(find(noPraSCRT(:,16)==0)); %number of errors
    totalErrorRate=errorCount/length(noPraSCRT);
    
    stdRT=std(noPraSCRT(:,17));%std
    meanRT=mean(noPraSCRT(:,17));%mean
    stdPlusMean3X=meanRT+(stdRT*3);
    threeXstdINDX=find(noPraSCRT(:,17)>stdPlusMean3X);
    
    if totalErrorRate>.20
       disp('Participant: ',num2str(noPraSCRT(1,3)),' has a  greater than 20% error rate');
    end
    
    noPraSCRT([lss200ms',grtr3000',errorsINDX',threeXstdINDX'],:)=[];
    

    apprchAlcINDX = find(ismember(noPraSCRT(:,6),[3,5]));%approach alc indx
    avoidAlcINDX = find(ismember(noPraSCRT(:,6),[8,10]));%Avoid alc indx
    
    apprchAlcMEAN=mean(noPraSCRT(apprchAlcINDX,17));%approach alc MEAN
    avoidAlcMEAN=mean(noPraSCRT(avoidAlcINDX,17));%Avoid alc MEAN
        
    apprchAlcSTD=std(noPraSCRT(apprchAlcINDX,17));%approach alc std
    avoidAlcSTD=std(noPraSCRT(avoidAlcINDX,17));%Avoid alc std
    
    apprchBiasScore=avoidAlcMEAN-apprchAlcMEAN;%Approach bias score
    %positive scores indicate faster reaction times when required to approach, rather than avoid, alcohol-related pictures.
    
    for jj = 1:length(allParticipantsMCSid)
        if PARTICIPANTS(jj).MCSid==noPraSCRT(1,3)
            
            dateINX=find((PARTICIPANTS(jj).DDAppendProjected(:,1))==partScrtDates(ii));
            mcDay4SRCT=round(PARTICIPANTS(jj).DDAppendProjected(dateINX,3));%Normalized Rounded day
        end
    end
    
    phaseIndx=find(numDataNbbScanDates(:,2)==partScrtDates(ii));
    phase=numDataNbbScanDates(phaseIndx,9);
    scanDate=numDataNbbScanDates(phaseIndx,3);
    
    srctScoresAll(ii,:)=[noPraSCRT(1,3),partScrtDates(ii),scanDate,phase,mcDay4SRCT,apprchAlcMEAN,avoidAlcMEAN,apprchBiasScore,apprchAlcSTD,avoidAlcSTD];
    
    srctScoresAll4PARTICIPANTS(ii,:)=[partScrtDates(ii),noPraSCRT(1,3),scanDate,phase,mcDay4SRCT,apprchAlcMEAN,avoidAlcMEAN,apprchBiasScore,apprchAlcSTD,avoidAlcSTD];

end

%% Adding this data to PARTICIPANTS
% This requires DDcode2 to have already been run

for ii = 1:length(allParticipantsMCSid)
    srct4PARTICIPANTSindx=[];
    srct4PARTICIPANTSindx=find(allParticipantsMCSid{ii,1}==srctScoresAll4PARTICIPANTS(:,2));
 %   if isempty(srct4PARTICIPANTSindx)
  %      nan(1,length(srctScoresAll4PARTICIPANTS(1,:)));
    PARTICIPANTS(ii).SRCT= srctScoresAll4PARTICIPANTS(srct4PARTICIPANTSindx,:);
end






