%% 1) Setup

%Files (in METADATA) are read in [POTENTIALLY processed] alphabetically

% - There are sections in this script that can be condenced (such as
%organizing/processing the data from each of the self-reports -HAM-A/D,
%PUM,etc.) but I have chosen not to becasue I do not want to risk the code
%breaking when/if the spreadsheet changes slightly. The way that it is set
%up at the moment attempts to avoid this potential issue.
%NOTE: There may be a number of misspellings in the comments. I apologize
%if this distresses you.

%Began 6/1/18
%end 2/1/19

clear all;  
clc;
cd '/project/psychimg2/Teri/Nate/DDanalysis'

%% 1a) To be updated with a new spreadsheet/data

%Paper pencile DD

%BART
%SRCT

%% 2) Read in Data (from excel - xlsx) - NOT DD DATA
cd METADATA %Change to the METADATA directory (location of all data)

%Files are read in alphabetically

%*CHANGE THIS*: make sure that when calling in all file names, that they
%match the file names in the METADATA directory (as file names may change
%in the future).

%ASI Data
[numDATAasiOrig,textDATAasiOrig,rawDATAasiOrig] = xlsread('DDanalysis_MCS_ASI.xlsx');
rawDataASI = rawDATAasiOrig; %Keeping the original data.
asiHeaderInd = find(strcmp(rawDataASI(:,1),'G1'));
rawDataASI(1:asiHeaderInd,:) = []; %knocking out the header

%CO Data
[numDATAcoOrig,textDATAcoOrig,rawDATAcoOrig] = xlsread('DDanalysis_MCS_CO_log.xlsx');
rawDataCO = rawDATAcoOrig; %Keeping the original data.
coHeaderInd = find(strcmp(rawDataCO(:,1),'Subject ID'));
rawDataCO(1:coHeaderInd,:) = []; %knocking out the header

%COPE Data
[numDATAcopeOrig,textDATAcopeOrig,rawDATAcopeOrig] = xlsread('DDanalysis_MCS_COPE.xlsx');
numDataCOPE = numDATAcopeOrig; %Keeping the original data. No need to kill headers since this is the numData

%Cotinine and Creatinine Data
[numDATAcot_creOrig,textDATAcot_creOrig,rawDATAcot_creOrig] = xlsread('DDanalysis_MCS_Cotinine_Creatinine_Log.xlsx');
rawDataCot_Cre = rawDATAcot_creOrig; %Keeping the original data
cot_creHeaderInd = find(strcmp(rawDataCot_Cre(:,1),'Subject ID'));
rawDataCot_Cre(1:cot_creHeaderInd,:) = []; %knocking out the header

%Demographic
[numDATAdemoOrig,textDATAdemoOrig,rawDATAdemoOrig] = xlsread('DDanalysis_MCS_demographics.5.18.18.xlsx'); %This is the 2nd tab of teh Bloods/Saliva spreadsheet in congroup
rawDataDemo = rawDATAdemoOrig; %Keeping the original data
rawDataDemo(1,:) = []; %knocking out the header

%First Day Menses
[numDATA1stOrig,textDATA1stOrig,rawDATA1stOrig] = xlsread('DDanalysis_MCS_FirstDayMenses.xlsx'); %This is the 2nd tab of teh Bloods/Saliva spreadsheet in congroup
numDataFDM = [numDATA1stOrig(:,1) (numDATA1stOrig(:,2:end)-1)]; %ADJUSTED DATES 

%FTND
[numDATAftndOrig,textDATAftndOrig,rawDATAftndOrig] = xlsread('DDanalysis_MCS_FTND_Scores.5.25.18.xlsx'); 
rawDATAftnd = rawDATAftndOrig; %Keeping the original data
rawDATAftnd(1,:) = []; %knocking out the header

%HAM-A Data
[numDATAhamaOrig,textDATAhamaOrig,rawDATAhamaOrig] = xlsread('DDanalysis_MCS_HAM_A.xlsx');
numDataHAMA = numDATAhamaOrig; %Keeping the original data. No need to omit the header becasue it is the numData

%HAM-D Data
[numDATAhamdOrig,textDATAhamdOrig,rawDATAhamdOrig] = xlsread('DDanalysis_MCS_HAM_D.xlsx');
numDataHAMD = numDATAhamdOrig; %Keeping the original data. No need to omit the header becasue it is the numData

%Hormone Levels BLOODS 
[numDATAbloodsOrig,textDATAbloodsOrig,rawDATAbloodsOrig] = xlsread('DDanalysis_MCS_MC_Blood_results.xlsx'); %This is the 1st tab of teh Bloods/Saliva spreadsheet in congroup
rawDataB = rawDATAbloodsOrig; %Keep the original and altered rawData seperate
bloodsStartRow = find(strcmp(rawDataB(:,1),'Passed Baseline')); %Identify the first rows to omit for the next line
rawDataB(1:bloodsStartRow,:) = []; %Omit the first rows that are not relivant to this analysis

%Hormone Levels SALIVA
%IMPORTANT NOTICE - DO NOT COPY AND PASTE THE ENTIRE SPREADSHEET BECASUE IT
%HAS CHANGED. ONLY COPY AND PASTE THE VALUES OF INTEREST FROM THE CONGROUP
%SPREADSHEET TO THIS SPREADSHEET.
[numDATAsalivaOrig,textDATAsalivaOrig,rawDATAsalivaOrig] = xlsread('DDanalysis_MCS_MC_Saliva_results.xlsx'); %This is the 2nd tab of teh Bloods/Saliva spreadsheet in congroup
rawDataS = rawDATAsalivaOrig; %Keep the original and altered rawData seperate
SalivaStartRow = find(strcmp(rawDataS(:,1),'Study I.D.')); %Identify the first rows to omit for the next line
rawDataS(1:SalivaStartRow,:) = []; %Omit the first rows that are not relivant to this analysis

%MCEQ PreScan (1) Data
[numDATAmceq1Orig,textDATAmceq1Orig,rawDATAmceq1Orig] = xlsread('DDanalysis_MCS_MCEQ_1.xlsx');
numDataMCEQ1 = numDATAmceq1Orig; %Keeping the original data. No need to omit the header becasue it is the numData

%MCEQ Scan (2) Data
[numDATAmceq2Orig,textDATAmceq2Orig,rawDATAmceq2Orig] = xlsread('DDanalysis_MCS_MCEQ_2.xlsx');
numDataMCEQ2 = numDATAmceq2Orig; %Keeping the original data. No need to omit the header becasue it is the numData

%MCS LEP TDs
[numDataLEP_TDsOrig,textDataLEP_TDsOrig,rawLEP_TDsOrig] = xlsread('MCS_LEP_TDs.xlsx');
rawLEP_TDs = rawLEP_TDsOrig; %Keeping the original data. No need to omit the header becasue it is the numData
temp = length(num2cell(numDataLEP_TDsOrig(:,2)-1));
rawLEP_TDs(1:temp,2) = num2cell(numDataLEP_TDsOrig(:,2)-1);%ADJUSTED DATES 
numLEP_TDs=numDataLEP_TDsOrig;%same thing for numData
numLEP_TDs(:,2)=numDataLEP_TDsOrig(:,2)-1;

%MCS HE TDs
[numDataHE_TDsOrig,textDataHE_TDsOrig,rawHE_TDsOrig] = xlsread('MCS_HE_TDs.xlsx');
rawHE_TDs = rawHE_TDsOrig; %Keeping the original data. No need to omit the header becasue it is the numData
temp = length(num2cell(numDataHE_TDsOrig(:,2)-1));
rawHE_TDs(1:temp,2) = num2cell(numDataHE_TDsOrig(:,2)-1);%ADJUSTED DATES 
numHE_TDs=numDataHE_TDsOrig;%same thing for numData
numHE_TDs(:,2)=numDataHE_TDsOrig(:,2)-1;

%MCS HP TDs
[numDataHP_TDsOrig,textDataHP_TDsOrig,rawHP_TDsOrig] = xlsread('MCS_HP_TDs.xlsx');
rawHP_TDs = rawHP_TDsOrig; %Keeping the original data. No need to omit the header becasue it is the numData
temp = length(num2cell(numDataHP_TDsOrig(:,2)-1));
rawHP_TDs(1:temp,2) = num2cell(numDataHP_TDsOrig(:,2)-1);%ADJUSTED DATES 
numHP_TDs=numDataHP_TDsOrig;%same thing for numData
numHP_TDs(:,2)=numDataHP_TDsOrig(:,2)-1;

%OPK Positive
[numDataPositiveOPKOrig,textDataPositiveOPKOrig,rawPositiveOPKOrig] = xlsread('positiveOPK.xlsx');
numDataPositiveOPK = numDataPositiveOPKOrig;
rawPositiveOPK = rawPositiveOPKOrig;%Keeping the original data. No need to omit the header becasue it is the numData
numDataPositiveOPK(:,2:(end-1)) = numDataPositiveOPK(:,2:(end-1))-1;%ADJUSTED DATES 

%OPK Negative
[numDataNegativeOPKOrig,textDataNegativeOPKOrig,rawNegativeOPKOrig] = xlsread('negativeOPK.xlsx');
numDataNegativeOPK = numDataNegativeOPKOrig;
rawNegativeOPK = rawNegativeOPKOrig;%Keeping the original data. No need to omit the header becasue it is the numData
numDataNegativeOPK(:,2:(end-1)) = numDataNegativeOPK(:,2:(end-1))-1;%ADJUSTED DATES 

%OPK Faint Lines
[numDataFaintLinesOrig,textDataFaintLinesOrig,rawFaintLinesOrig] = xlsread('FaintLinesOPK.xlsx');
numFaintLines = numDataFaintLinesOrig;%Keeping the original data. No need to omit the header becasue it is the numData
rawFaintLines = rawFaintLinesOrig;
numFaintLines(:,2:(end-1)) = numFaintLines(:,2:(end-1))-1;%ADJUSTED DATES 

%PUM (mood) Data
[numDATApumOrig,textDATApumOrig,rawDATApumOrig] = xlsread('DDanalysis_MCS_PUM.xlsx');
numDataPUM = numDATApumOrig; %Keeping the original data. No need to omit the header becasue it is the numData

%RSQ (Reasons for Smoking Questionnaire) Data
[numDATArsqOrig,textDATArsqOrig,rawDATArsqOrig] = xlsread('DDanalysis_MCS_RSQ.xlsx');
numDataRSQ = numDATArsqOrig; %Keeping the original data. No need to omit the header becasue it is the numData

%SCS (mood) Data
[numDATAscsOrig,textDATAscsOrig,rawDATAscsOrig] = xlsread('DDanalysis_MCS_SCS.xlsx');
numDataSCS = numDATAscsOrig; %Keeping the original data. No need to omit the header becasue it is the numData

%SHIFF_JARVICK Data
[numDATAshiffOrig,textDATAshiffOrig,rawDATAshiffOrig] = xlsread('DDanalysis_MCS_Shiffman-Jarvick_data.5.31.18.xlsx');
rawDataShiff = rawDATAshiffOrig; %Keeping the original data
shiffHeaderInd = find(strcmp(rawDataShiff(:,1),'Subject #'));
rawDataShiff(1:shiffHeaderInd,:) = []; %knocking out the header

%SHQ (Smoking History Questionnaire) Data
[numDATAshqOrig,textDATAshqOrig,rawDATAshqOrig] = xlsread('DDanalysis_MCS_SHQ.xlsx');
rawDataSHQ = rawDATAshqOrig; %Keeping the original data
shqHeaderInd = find(strcmp(rawDataSHQ(:,1),'SHQ001A'));
rawDataSHQ(1:shqHeaderInd,:) = []; %knocking out the header

%STRAP-R (mood) Data
[numDATAstraprOrig,textDATAstraprOrig,rawDATAstraprOrig] = xlsread('DDanalysis_MCS_STRAP-R.xlsx');
numDataSTRAPR = numDATAstraprOrig; %Keeping the original data. No need to omit the header becasue it is the numData

%VSEQ (Virtual shopping Excursion Questionnaire) Data
[numDATAvseqOrig,textDATAvseqOrig,rawDATAvseqOrig] = xlsread('DDanalysis_MCS_VSEQ.xlsx');
numDataVSEQ = numDATAvseqOrig; %Keeping the original data. No need to omit the header becasue it is the numData

%WSRS Data
[numDATAwsrsOrig,textDATAwsrsOrig,rawDATAwsrsOrig] = xlsread('DDanalysis_MCS_WSRS.xlsx');
numDataWSRS = numDATAwsrsOrig; %Keeping the original data. No need to omit the header becasue it is the numData

%WSRS Alc Data
[numDATAwsrsAlcOrig,textDATAwsrsAlcOrig,rawDATAwsrsAlcOrig] = xlsread('DDanalysis_MCS_WSRS_Alc.xlsx');
numDataWSRSAlc = numDATAwsrsAlcOrig; %Keeping the original data. No need to omit the header becasue it is the numData

%TLFB Data
[numDATAtlfbOrig,textDATAtlfbOrig,rawDATAtlfbOrig] = xlsread('DDanalysis_TLFB_MCS_4.24.17.xlsx');
rawDataTLFB = rawDATAtlfbOrig; %Keeping the original data
tlfbHeaderInd = find(strcmp(rawDataTLFB(:,1),'Subj ID')); %find the rows to omit for compiling data
rawDataTLFB(1:tlfbHeaderInd,:) = []; %knocking out the header

%% Read in all DD data

%Daily Diary Data (NO PAPER/PENCIL)
[numDATADailyD,textDATADailyD,rawDATADailyD] = xlsread('MCSDailyDiary_DATA_2019-05-29_1057.xlsx');%'MCS_DD_DATA_5-25-18.xlsx'); 
rawDataDD = rawDATADailyD;%preserve original data
rawDataDD(1,:) = []; %Kill the headers to have the same data type in each column (the headers are strings) 
emptyEntires = find(isnan(cell2mat(rawDataDD(:,6)))); %An attempt to omit all nan/glitch rows
rawDataDD(emptyEntires,:) = []; %Kill all rows wil no entries
rawDates = cell2mat(rawDataDD(:,5))-1; %ADJUSTED DATES
rawDataDD(:,5) = num2cell(rawDates);%ADJUSTED DATES

cd PaperPencil
%*CHANGE THIS* to be up to date: What follows are the paper/pencil DD
%participants. This must be hard coded. 
%Each of the following "Paper/Pencil DD" are individual to each participant
%and the excel file has been altered from the original on CONGROUP.
%When additional Paper/pencil DD data is present we need to do the follow (as it is shown
%below): (1) kill the headers in the new copy (4) adjust the dates - a two step
%process (a) converting from cell>string>datenum (b) converting from matlab
%date serial number format to the excel date serial number format (using
%the m2xdate function) (c) subtracting a day from all dates to adjust the
%days (becasue during the conversion process in (b), the dates jump forward
%a day - hence the "%ADJUSTED DATES" comments everywhere), (d) converting 
%the number array of date serial numbers to a cell array to then (e)throw
%the dates back into the DD matrix for that particular participant (e.g. 028)
%009 DD - Paper Pencil WAITING FOR THIS DATA

ppPartiDir = dir('DDanalysis_MCS_*');
ppDDPartiList = [9,11,15,28,34,35,37,50,52,58,61,68]; %HARD CODED - UPDATE WITH ALL PAPER-PENCIL-PARTICIPANTS 
%update the following section too
ppPartiCell = cell(length(ppDDPartiList),1);

for ii = 1:length(ppDDPartiList)
    if ismember(ppDDPartiList(ii),ppDDPartiList([1:3,8:12])) %HARD CODED - UPDATE WITH ALL PAPER-PENCIL-PARTICIPANTS 
        [numData, textData, rawData] = xlsread(ppPartiDir(ii).name);
        rawData(1,:) = []; %Kill the header
        ppDatesAdjust = cell2mat(rawData(:,5))-1; %ADJUSTED DATES
        rawData(:,5) = num2cell(ppDatesAdjust); %ADJUSTED DATES
        ppPartiCell{ii,1} = rawData;
    elseif ismember(ppDDPartiList(ii),ppDDPartiList(4:7)) %HARD CODED - UPDATE WITH ALL PAPER-PENCIL-PARTICIPANTS 
        [numData, textData, rawData] = xlsread(ppPartiDir(ii).name);
        rawData(1,:) = []; %Kill the headers to have the same data type in each column (the headers are strings)
        ppDatesAdjust = datenum(char(rawData(:,5))); %ADJUSTED DATES
        rawData(:,5) = num2cell(m2xdate(ppDatesAdjust)-1); %ADJUSTED DATES
        ppPartiCell{ii,1} = rawData;   
    end
end 

%% Adjusting the DD DataSet with th Paper/Pencil DDs

%The indecies for each day (of ecach participant) HARD CODED TO START AT
%THE SECOND ROW - this will be changed below since the indices for each
%participant will change once the Paper/Pencil DD entries are included
day1IndeciesOrig = find(strcmp(rawDataDD(:,2),'day_1_arm_1'));

ddEntries = diff(day1IndeciesOrig); %Number of DD entries perParticipant (sans the last participant)
lastEntry = ((length(rawDataDD)+1)-day1IndeciesOrig(end,1)); %Number of DD entries for the last participant
allDDentries = cat(1,ddEntries,lastEntry); %Number of DD entries for each participant
dataSetAllDD = rawDataDD(day1IndeciesOrig(1):(day1IndeciesOrig(1)+(allDDentries(1)-1)),:); %This initiates the dataSetAllDD matrix (which will expand from the lines that follow)
temp = [2,3,5,7,8,12,13,19,20,23,24,28]; %HARD CODED - UPDATE WITH ALL PAPER-PENCIL-PARTICIPANTS
count = 1;

%HARD CODED
%This for loop/If statement block populates the 'dataSetAllDD' matrix with
%both Paper/Pencil DD participant entries as well as non-Paper/Pencil
%entries. *CHANGE THIS* to be up to date with Paper/Pencil DD participant entries 
for ii = 2:length(day1IndeciesOrig)
    if ismember(ii,temp)
        dataSetAllDD = vertcat(dataSetAllDD,ppPartiCell{count}(:,:));
        count = count+1;
    else
        dataSetAllDD = vertcat(dataSetAllDD, rawDataDD(day1IndeciesOrig(ii):(day1IndeciesOrig(ii)+(allDDentries(ii)-1)),:));
    end
end

%The first DD day entry indices - including the Paper/pencil participant
%enties
day1IndeciesUPDATE = find(strcmp(dataSetAllDD(:,2),'day_1_arm_1'));

ddEntries = diff(day1IndeciesUPDATE); %the number of entries for each participant (this is taken by the difference between each day 1 index
lastEntry = ((length(dataSetAllDD)+1)-day1IndeciesUPDATE(end,1)); %Number of DD entries for the last participant
allDDentries = cat(1,ddEntries,lastEntry); %Number of DD entries for each participant

%% 3) Initialization COLOMNS [MCSid; DDid]
%   NOTE NOTE NOTE; I ADD 068 AND 073 TO THE DD EXCEL SINCE THEIR NUMBER
%   ID'S WERE OMITTED
%Participants
allParticipantsDDid =  dataSetAllDD(day1IndeciesUPDATE,1); %{5,6,7,9,10,12,14,15,16,17,18,19,20,21,22,23,24,26,27}.'; % DD IDs
allParticipantsMCSid = dataSetAllDD(day1IndeciesUPDATE,3); %{'MCS 002','MCS 009','MCS 011','MCS 014','MCS 015','MCS 026','MCS 028','MCS 034','MCS 033','MCS 036','MCS 032','MCS 035','MCS 037','MCS 040','MCS 042','MCS 041','MCS 043','MCS 049','MCS 050'}.'; %MCS IDs
allParticipantsCell = [allParticipantsMCSid,allParticipantsDDid]; %A cell containing both IDs

totalDaysDD = 130; %Total number of Daily Diaries

%% 4) Participant Data Structure Setup

%Headers for the PARTICIPANTS array
participantHeaders = {'MCSid','DDid'};
headersLeng = length(participantHeaders); %Header length

%Creating the PARTICIPANTS cell array
PARTICIPANTS = cell2struct(allParticipantsCell,{'MCSid','DDid'},2);

%Below is a creation of each field. To create a new field:
%1) Copy and paste -> 'tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).Demographic]=deal(tmp{:});'
%2) Change 'Demographic' to a differnt field name
%3) Run the line of code/script to create the field - then you can add to it

%'Demographic','CompletedDDdates','AllMCdates'
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).Demographic]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).DDAppendProjected]=deal(tmp{:}); 
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).CompletedDDdatesAppended]=deal(tmp{:}); 


%'Mood','MensSymptoms','Cigarettes','Marijuana','Alcohol','Combine',
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).Mood]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).MensSymptoms]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).Cigarettes]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).Marijuana]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).Alcohol]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).Combine]=deal(tmp{:});

%'Masterbate','SexV','OralR','OralP','SexA','Manual','OtherS',
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).Masterbate]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).SexV]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).OralR]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).OralP]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).SexA]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).Manual]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).OtherS]=deal(tmp{:});

%'Sleep','Food','Complete',
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).Sleep]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).Food]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).Complete]=deal(tmp{:});

%'Hormones','HAM_A&D','STRAP-R','FTND',
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).FTND]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).HormonesBloods]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).HormonesSaliva]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).HAM_A]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).HAM_D]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).STRAP_R]=deal(tmp{:});


%DMU Info
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).ASI]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).COPE]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).MCEQ1]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).MCEQ2]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).PUM]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).RSQ]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).SCS]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).SHQ]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).VSEQ]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).WSRS]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).WSRS_Alc]=deal(tmp{:});

%Additiona Data
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).CO]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).Cotinine_Creatinine]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).Shiff_Jarv]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).Shiff_Jarv2]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).TLFB]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).BART]=deal(tmp{:});

tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).PosOPK]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).NegOPK]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).FaintOPK]=deal(tmp{:});

tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).AllMCdates]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).CompletedDDdates]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).Date_TD_Phase]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).Date_Phase]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).SRCT]=deal(tmp{:});
tmp=cell(size(PARTICIPANTS)); [PARTICIPANTS(:).STOP]=deal(tmp{:});




%% COLOMN [AllMCdates] These are the true start dates of the MC - everything else is reported the day after (in the DD)

%Iterates through each participant individually to extract all MC dates/days
for kk = 1:length(allParticipantsMCSid(:,1)) %all participants (length)
    for it = 1:length(numDataFDM(:,1)) %all participants firstMCExcel info (length)
%this makes sure that the participant ID matches since the order of the participants in each spreadsheet is different        
        if allParticipantsMCSid{kk,1} == numDataFDM(it,1) %Match the participants (they are in different rows in the different datasets)
          %  try %for the NANs
                startOfNan = find(isnan(numDataFDM(it,:))==1); %Identifies the indeces of the NANS in this row 
                lastStartDate = startOfNan(1) - 1; %Using 'startOfNan' I now have the last reported 1st MC
                totalMCdays = (numDataFDM(it,2):numDataFDM(it,lastStartDate)).'; %All MC dates/days for this kk participant
                ind1stDay = find(ismember(totalMCdays,numDataFDM(it,2:end))); %Indeces of all 1st MC dates
                
                mcLengths = diff(ind1stDay); %All MC lengths
                meanLengthsMCSALL(kk,1) = mean(mcLengths);%collecting mean months for each participant
                mcLengthsAppend = vertcat(mcLengths,round(meanLengthsMCSALL(kk,1),0),round(meanLengthsMCSALL(kk,1),0)); %
%adding two mean months in case the DD responses spill over a single month (This is the case for 50, 52, and 53)
                appendedDays = (ind1stDay(end)+mcLengthsAppend(end));
                ind1stDay2 = cat(1,ind1stDay, appendedDays,(appendedDays+mcLengthsAppend(end))); 
                
                projectedDays = ((totalMCdays(end)+1):(totalMCdays(end)+meanLengthsMCSALL(kk,1)*2)).'; %projectd days created by the mean

                totalMCdaysAppendedProjected = cat(1,totalMCdays, projectedDays);
                
                PARTICIPANTS(kk).AllMCdates(:,1) = totalMCdays; %Put all the (MC) dates into the field in PARTICIPANTS
                
                PARTICIPANTS(kk).DDAppendProjected(:,1) = totalMCdaysAppendedProjected;

                %Populates the 'AllMCdates' field with the MC days (col2) and normalized MC days (col3) 
                for ii = 1:(length(mcLengths))
                    mcIndivDays = (1:mcLengths(ii)).'; %an arrray of days from 1-(the end of the length of this particular cycle)
                    PARTICIPANTS(kk).AllMCdates((ind1stDay(ii):(ind1stDay(ii+1)-1)),2) = mcIndivDays; %Puts this^ value into the 'AllMCdates' field
                    normDayz = (((1:mcLengths(ii))/mcLengths(ii)).*28).'; %Normalizes all days that were extracted two lines prior
                    PARTICIPANTS(kk).AllMCdates((ind1stDay(ii):(ind1stDay(ii+1)-1)),3) = round(normDayz,2); %Puts this^ value into the 'AllMCdates' field
                end
                for ii = 1:(length(mcLengthsAppend))%this is for the appended MCS DD array
                    mcIndivDays2 = (1:mcLengthsAppend(ii)).'; %an arrray of days from 1-(the end of the length of this particular cycle)
                    PARTICIPANTS(kk).DDAppendProjected((ind1stDay2(ii):(ind1stDay2(ii+1)-1)),2) = mcIndivDays2; %Puts this^ value into the 'AllMCdates' field
                    normDayz2 = (((1:mcLengthsAppend(ii))/mcLengthsAppend(ii)).*28).'; %Normalizes all days that were extracted two lines prior
                    PARTICIPANTS(kk).DDAppendProjected((ind1stDay2(ii):(ind1stDay2(ii+1)-1)),3) = normDayz2; %Puts this^ value into the 'AllMCdates' field
                end
               
%             catch %For the nans - so that the code continues to run
%                 disp(['COLOMN [AllMCdates]: Catching Participant = ',num2str(kk)])
%                 continue
%            end
        end
    end
end

%% Each field within the DD [Mood; MensSymptoms...]

%Each DD catagory is inserted into its specified field in PARTICIPANTS
for ii = 1:length(allParticipantsMCSid(:,1)) %participants 2:5have too many glitches to be compatible here
    %Puts the mood responses in their respective participant associated cell.
    try
    entriesPerPartMOOD = dataSetAllDD((day1IndeciesUPDATE(ii):(day1IndeciesUPDATE(ii)+(allDDentries(ii)-1))),6:11);
    PARTICIPANTS(ii).Mood = entriesPerPartMOOD;  
    entriesPerPartMensSymp = dataSetAllDD((day1IndeciesUPDATE(ii):(day1IndeciesUPDATE(ii)+(allDDentries(ii)-1))),12:30);
    PARTICIPANTS(ii).MensSymptoms = entriesPerPartMensSymp;   
    entriesPerPartCig = dataSetAllDD((day1IndeciesUPDATE(ii):(day1IndeciesUPDATE(ii)+(allDDentries(ii)-1))),31:32);
    PARTICIPANTS(ii).Cigarettes = entriesPerPartCig;
    entriesPerPartMarij = dataSetAllDD((day1IndeciesUPDATE(ii):(day1IndeciesUPDATE(ii)+(allDDentries(ii)-1))),33:41);
    PARTICIPANTS(ii).Marijuana = entriesPerPartMarij;        
    entriesPerPartAlc = dataSetAllDD((day1IndeciesUPDATE(ii):(day1IndeciesUPDATE(ii)+(allDDentries(ii)-1))),42:47);
    PARTICIPANTS(ii).Alcohol = entriesPerPartAlc;        
    entriesPerPartCombine = dataSetAllDD((day1IndeciesUPDATE(ii):(day1IndeciesUPDATE(ii)+(allDDentries(ii)-1))),48:49);
    PARTICIPANTS(ii).Combine = entriesPerPartCombine;     
    entriesPerPartMast = dataSetAllDD((day1IndeciesUPDATE(ii):(day1IndeciesUPDATE(ii)+(allDDentries(ii)-1))),50:52);
    PARTICIPANTS(ii).Masterbate = entriesPerPartMast;   
    entriesPerPartSexV = dataSetAllDD((day1IndeciesUPDATE(ii):(day1IndeciesUPDATE(ii)+(allDDentries(ii)-1))),53:56);
    PARTICIPANTS(ii).SexV = entriesPerPartSexV;    
    entriesPerPartOralR = dataSetAllDD((day1IndeciesUPDATE(ii):(day1IndeciesUPDATE(ii)+(allDDentries(ii)-1))),57:60);
    PARTICIPANTS(ii).OralR = entriesPerPartOralR;           
    entriesPerPartOralP = dataSetAllDD((day1IndeciesUPDATE(ii):(day1IndeciesUPDATE(ii)+(allDDentries(ii)-1))),61:64);
    PARTICIPANTS(ii).OralP = entriesPerPartOralP;    
    entriesPerPartSexA = dataSetAllDD((day1IndeciesUPDATE(ii):(day1IndeciesUPDATE(ii)+(allDDentries(ii)-1))),65:68);
    PARTICIPANTS(ii).SexA = entriesPerPartSexA;     
    entriesPerPartManual = dataSetAllDD((day1IndeciesUPDATE(ii):(day1IndeciesUPDATE(ii)+(allDDentries(ii)-1))),69:71);
    PARTICIPANTS(ii).Manual = entriesPerPartManual;          
    entriesPerPartOtherS = dataSetAllDD((day1IndeciesUPDATE(ii):(day1IndeciesUPDATE(ii)+(allDDentries(ii)-1))),72:76);
    PARTICIPANTS(ii).OtherS = entriesPerPartOtherS;    
    entriesPerPartSleep = dataSetAllDD((day1IndeciesUPDATE(ii):(day1IndeciesUPDATE(ii)+(allDDentries(ii)-1))),77:90);
    PARTICIPANTS(ii).Sleep = entriesPerPartSleep;    
    entriesPerPartFood = dataSetAllDD((day1IndeciesUPDATE(ii):(day1IndeciesUPDATE(ii)+(allDDentries(ii)-1))),91:96);
    PARTICIPANTS(ii).Food = entriesPerPartFood;        
    entriesPerPartComp = dataSetAllDD((day1IndeciesUPDATE(ii):(day1IndeciesUPDATE(ii)+(allDDentries(ii)-1))),97);
    PARTICIPANTS(ii).Complete = entriesPerPartComp; 
    entriesPerPartDATE = cell2mat(dataSetAllDD((day1IndeciesUPDATE(ii):(day1IndeciesUPDATE(ii)+(allDDentries(ii)-1))),5)); %Original dates of DD entries for each paticipant
    %indicies of the original entries
    indecies = find(ismember(PARTICIPANTS(ii).AllMCdates(:,1),entriesPerPartDATE));
    indecies2 = find(ismember(PARTICIPANTS(ii).DDAppendProjected(:,1),entriesPerPartDATE));
    
    PARTICIPANTS(ii).CompletedDDdates = PARTICIPANTS(ii).AllMCdates(indecies,1:3);
    PARTICIPANTS(ii).CompletedDDdatesAppended = PARTICIPANTS(ii).DDAppendProjected((indecies2-1),1:3);%I am subtracting one since participants enter DD info for the previous day
    PARTICIPANTS(ii).AllMCdates(indecies,4) = 1;
    PARTICIPANTS(ii).DDAppendProjected(indecies2,4) = 1;
    
    if length(PARTICIPANTS(ii).CompletedDDdatesAppended(:,1))~=length(PARTICIPANTS(ii).Mood(:,1))
        disp(['CHECK PARTICIPANT ',num2str(ii),' since their DD entries and completed dates do not allign perfectly.']);
    end
    
    catch
        disp(['Each field within the DD [Mood; MensSymptoms...]: Catching Participant = ',num2str(ii)])
        continue
    end
%this algorithm can essentially be replicated for all fields BUT I need
%to apply this to the 130 days - not just the individual responses. 
end

%% ASI

%ASI Columns: Consult the DMU

for kk = 1:length(allParticipantsMCSid(:,1)) %all participants (length)
    for it = 1:length(rawDataASI(:,1)) %all participants in this spreadsheet  (length)
        %this makes sure that the participant ID matches since the order of the participants in each spreadsheet is different        
        if allParticipantsMCSid{kk,1}==rawDataASI{it,1}
            try
                asiQs = rawDataASI(it,2:end); %all responses 
                PARTICIPANTS(kk).ASI = asiQs; %put it all into PARTICIPANTS
            catch %in case I run into NANS
                continue
            end
        end
    end
end

%% [CO] Identifying the columns

%Identify the columns/rows for the MC lenghth
countCoLvl = 1; %setting the variables
for ii = 1:length(rawDataCO(coHeaderInd,:))
   try %for nans
      if strcmp(rawDATAcoOrig{coHeaderInd,ii}(1:4),'Test') == 1%identifying the column of interest
          colIndeciesCoLvls(countCoLvl,1) = ii;
          countCoLvl = countCoLvl + 1;%a counter that itterates properly for this particular array 
      end
   catch
       continue
    end
end

%% Extracting from CO to fit DD participant order [CO]

%CO Columns are as follows:
%1:TD Date; 2:CO Levels;

colIndeciesCoTD = find(strcmp(rawDATAcoOrig(coHeaderInd,:),'Date of TD')); 
%colIndeciesCoLvls = find((strcmp(rawDATAcoOrig(coHeaderInd,:),'Test Day 1')==1))&&find(strcmp(rawDATAcoOrig(coHeaderInd,:),'Test Day 2')==1)||find(strcmp(rawDATAcoOrig(coHeaderInd,:),'Test Day 3')==1); 

for kk = 1:length(allParticipantsMCSid(:,1)) %all participants (length)
    for it = 1:length(rawDataCO(:,1)) %all participants' CO info (length)
        %this makes sure that the participant ID matches since the order of the participants in each spreadsheet is different        
        if allParticipantsMCSid{kk,1} == str2double(rawDataCO{it,1}(5:end))
            try 
            for jj = 1:length(colIndeciesCoTD)
                coTdDate = cell2mat(rawDataCO(it,colIndeciesCoTD(jj)))-1; %ADJUSTED DATES
                coNumInd = find(~isletter(char(rawDataCO(it,colIndeciesCoLvls(jj))))); %finding the indices of all non-letter elements (numbers and spaces)
                coString = char(rawDataCO(it,colIndeciesCoLvls(jj))); %Converting from cell to string for the step below
                levelsCO = str2double(coString(coNumInd));  %CO levels for this participant
                %If any of the values are not a nan, what was recorded above is put into
                %PARTICIPANTS in the 'HormonesBloods' field
                togetherCO = [coTdDate levelsCO];
                PARTICIPANTS(kk).CO(jj,:) = togetherCO;
            end
            
            catch
                disp(['Extracting from CO to fit DD participant order [CO]: Catching Participant = ',num2str(kk)])
                continue
            end
%         elseif allParticipantsMCSid{kk,1}~=str2double(rawDataCO{it,1}(5:end))
%             PARTICIPANTS(kk).CO = nan(1,2);
        end
    end
end

%% COPE

%COPE Columns are as follows:
%1:Date COPE was taken; 2:DMU Assesment Code ****; 3-30:The 28 COPE questions;

for kk = 1:length(allParticipantsMCSid(:,1)) %all participants (length)
    for it = 1:length(numDataCOPE(:,1)) %all participants in this spreadsheet  (length)
        %this makes sure that the participant ID matches since the order of the participants in each spreadsheet is different        
        if allParticipantsMCSid{kk,1}==numDataCOPE(it,29)
            try
                samePartCope = find(allParticipantsMCSid{kk,1}==numDataCOPE(:,29)); %All entries for this kk participant
                for ii = 1:length(samePartCope)
                    partDateCope = numDataCOPE(samePartCope(ii),32)-1; %ADJUSTED DATES (column Identification is hard coded)
                    copeQs = numDataCOPE(samePartCope(ii),1:28); %all responses (column Identification is hard coded)
                    asesCope = numDataCOPE(samePartCope(ii),31); %assesment (column Identification is hard coded)
                    togetherCOPE = [partDateCope asesCope copeQs]; %combined all dimentions as specified above
                    PARTICIPANTS(kk).COPE(ii,:) = togetherCOPE; %put it all into PARTICIPANTS
                end
            catch %in case I run into NANS
                continue
            end
        end
    end
end

%% [Cotinine_Creatinine] Extracting the data and putting it into PARTICIPANTS

colIndeciesCotDate = find(strcmp(rawDATAcot_creOrig(cot_creHeaderInd,:),'Date'));
colIndeciesCot = find(strcmp(rawDATAcot_creOrig(cot_creHeaderInd,:),'Cotinine (ng/mL)')); %Shiff Begning Columns
colIndeciesCre = find(strcmp(rawDATAcot_creOrig(cot_creHeaderInd,:),'Creatinine (mg/dL)')); %Shiff end Columns

for kk = 1:length(allParticipantsMCSid(:,1)) %all participants (length)
    for it = 1:length(numDATAcot_creOrig) %all participants Cotinine_Creatinine info (length)
        %this makes sure that the participant ID matches since the order of the participants in each spreadsheet is different        
        if allParticipantsMCSid{kk,1}==str2double(rawDataCot_Cre{it,1}(5:end))
            try
            for jj = 1:length(colIndeciesCotDate) %iterates through each column of interest below
                %The following are values from the Cotinine_Creatinine log for each
                %participant as it iterates through (as specified by kk/it)
                dateCot_Cre = cell2mat(rawDataCot_Cre(it,colIndeciesCotDate(jj)))-1; %ADJUSTED DATES
                levelsCot = rawDataCot_Cre{it,colIndeciesCot(jj)}; 
                levelsCre = rawDataCot_Cre{it,colIndeciesCre(jj)};
                if ischar(levelsCot) == 1 %sometimes the Cot is a string ('<300')
                    levelsCot = 299.99; %This is the value if the cell is a string - THIS IS NOT CORRECTED FOR 'PENDING' VALUES
                end
                if ischar(levelsCre) == 1  %sometimes the Creat is a string ('>400')
                    levelsCre = 400.99; %This is the value if the cell is a string
                end
                %If any of the values are not a nan, what was recorded above is put into
                %PARTICIPANTS in the 'HormonesSaliva' field
                togetherCot_Creat=[dateCot_Cre levelsCot levelsCre];
                PARTICIPANTS(kk).Cotinine_Creatinine(jj,:) = togetherCot_Creat;
            end            
            catch %in case I run into NANS
                disp(['[Cotinine_Creatinine] Extracting the data and putting it into PARTICIPANTS: Catching Participant = ',num2str(kk)])
                continue
            end
%         elseif allParticipantsMCSid{kk,1}~=str2double(rawDataCO{it,1}(5:end))
%             PARTICIPANTS(kk).Cotinine_Creatinine = nan(1,3);
        end
    end
end

%% Demographic - First Day Menses information/processing is above

%Columns are as follows:
%1:DOB; 2:Age At Start of Study; 3:Gender; 4:Race; 5:Ethnicity;
%6:Handedness; 7:Education; 8:Cig Per Day(CPD); 9:Years Smoked; 10: Pack
%Years = [(CPD x Years Smoked)/20] <- the number of cigarettes in a pack
%11: Mean MC length (average from all cycle lengths that they provided)

for kk = 1:length(allParticipantsMCSid(:,1)) %all participants (length)
    for it = 1:length(rawDataDemo(:,1)) %all participants Demographic info (length)
        %this makes sure that the participant ID matches since the order of the participants in each spreadsheet is different        
        if allParticipantsMCSid{kk,1}==str2double(rawDataDemo{it,1}(5:end))
            try %For the nans - so that the code continues to run
                demoInfo = rawDataDemo(it,2:end); %DOB ARE NON-ADJUSTED DATES
                demo_MCSlen = [demoInfo meanLengthsMCSALL(kk)];
                PARTICIPANTS(kk).Demographic = demo_MCSlen; %Puts this^ value into the 'Demographic' field                      
            catch %For the nans - so that the code continues to run
                disp(['Demographic: Catching Participant = ',num2str(kk)])
                continue
            end
        end
    end
end

%% Extracting from FTND to fit DD participant order [FTND] - First Day Menses information/processing is above

%FTND Columns are as follows:
%Col1-Col6 are the individual FTND scores. Col 7 (the last column) is the mean of the scores.

%Extracting the data that is in the FTND and putting it into its respective field in PARTICIPANTS
for kk = 1:length(allParticipantsMCSid(:,1))
    for it = 1:length(rawDATAftnd(:,1))
        %this makes sure that the participant ID matches since the order of the participants in each spreadsheet is different        
        if allParticipantsMCSid{kk,1}==str2double(rawDATAftnd{it,1}(5:end)) 
            ftndScores = numDATAftndOrig(it,:); %extracting the scores for this individual participant
            PARTICIPANTS(kk).FTND = ftndScores; %putting the scores from the line above into 'FTND' in PARTICIPANTS
        
%         elseif allParticipantsMCSid{kk,1}~=str2double(rawDATAftnd{it,1}(5:end)) 
%             PARTICIPANTS(kk).FTND = nan(1,7);
        end
    end
end

%% HAM-A

%HAM-A Columns are as follows:
%1:Date HAM-A was taken; 2:DMU Assesment Code ****; 3:Total HAM-A score; 4-17:The 14 HAM-A questions;

for kk = 1:length(allParticipantsMCSid(:,1)) %all participants (length)
    for it = 1:length(numDataHAMA(:,1)) %all participants in this spreadsheet  (length)
        %this makes sure that the participant ID matches since the order of the participants in each spreadsheet is different        
        if allParticipantsMCSid{kk,1}==numDataHAMA(it,16)
            try
                samePartHAMA = find(allParticipantsMCSid{kk,1}==numDataHAMA(:,16)); %All entries for this kk participant
                for ii = 1:length(samePartHAMA)
                    partDateHAMA = numDataHAMA(samePartHAMA(ii),19)-1; %ADJUSTED DATES (column Identification is hard coded)
                    hamaQs = numDataHAMA(samePartHAMA(ii),1:14); %all responses  (column Identification is hard coded)
                    asesHAMA = numDataHAMA(samePartHAMA(ii),18); %assesment (column Identification is hard coded)
                    totalHAMA = numDataHAMA(samePartHAMA(ii),15); %total score (column Identification is hard coded)
                    togetherHAMA = [partDateHAMA asesHAMA totalHAMA hamaQs]; %combined all dimentions as specified above
                    PARTICIPANTS(kk).HAM_A(ii,:) = togetherHAMA; %put it all into PARTICIPANTS
                end
            catch %in case I run into NANS
                continue
            end
        end
    end
end

%% HAM-D

%HAM-D Columns are as follows:
%1:Date HAM-D was taken; 2:DMU Assesment Code ****; 3:Total HAM-D score; 4-17:The 14 HAM-D questions;

for kk = 1:length(allParticipantsMCSid(:,1)) %all participants (length)
    for it = 1:length(numDataHAMD(:,1)) %all participants in this spreadsheet  (length)
        %this makes sure that the participant ID matches since the order of the participants in each spreadsheet is different        
        if allParticipantsMCSid{kk,1}==numDataHAMD(it,29)
            try
                samePartHAMD = find(allParticipantsMCSid{kk,1}==numDataHAMD(:,29)); %All entries for this kk participant
                for ii = 1:length(samePartHAMD)
                    partDateHAMD = numDataHAMD(samePartHAMD(ii),32)-1; %ADJUSTED DATES (column Identification is hard coded)
                    hamdQs = numDataHAMD(samePartHAMD(ii),1:27); %all responses (column Identification is hard coded)
                    asesHAMD = numDataHAMD(samePartHAMD(ii),31); %assesment (column Identification is hard coded)
                    totalHAMD = numDataHAMD(samePartHAMD(ii),28); %total score (column Identification is hard coded)
                    togetherHAMD = [partDateHAMD asesHAMD totalHAMD hamdQs]; %combined all dimentions as specified above
                    PARTICIPANTS(kk).HAM_D(ii,:) = togetherHAMD; %put it all into PARTICIPANTS
                end
            catch %in case I run into NANS
                continue
            end
%         elseif allParticipantsMCSid{kk,1}~=numDataHAMD(it,29)
%             PARTICIPANTS(kk).HAM_D = nan(1,length(togetherHAMD(1,:)));
        end
    end
end

%% Extracting from bloods to fit DD participant order [HormonesBloods]

%Bloods Columns are as follows:
%1:Blood Draw Date; 2:Estrogen Levels; 3:Progesterone Levels;

specsRow = find(strcmp(rawDATAbloodsOrig(:,1),'Study I.D.')); %the row that holds the col titles/identifiers
colIndeciesBlooDraw = find(strcmp(rawDATAbloodsOrig(specsRow,:),'Date of Blood Draw')); 
colIndeciesE = find(strcmp(rawDATAbloodsOrig(specsRow,:),'Blood E (pg/mL)')); 
colIndeciesP = find(strcmp(rawDATAbloodsOrig(specsRow,:),'Blood P (ng/mL)')); 

endBloods = find(strcmp(rawDataB(:,1),'Screenfails'))-2; %We are not intersted in participants past 'screenfails'
%All rows of interest (free of nans and anything after 'excluded
%participants') -> will be the 'bloodsNoNansInd' variable
bloodsNoNansInd=[];count=1;
for ii = 1:endBloods
    if ~isnan(rawDataB{ii,1})
       bloodsNoNansInd(count,1) = ii;
       count = count +1;
    end
end

%Extracting the data that is in the BLODDS (hormone information) and
%putting it into its respective field in PARTICIPANTS
for kk = 1:length(allParticipantsMCSid(:,1)) %all participants (length)
    for it = 1:length(bloodsNoNansInd) %all participants' bloods info (length)
        %this makes sure that the participant ID matches since the order of the participants in each spreadsheet is different        
        if allParticipantsMCSid{kk,1}==str2double(rawDataB{it,1}(5:end))
            %try 
            for jj = 1:length(colIndeciesBlooDraw)
                bDrawDate = cell2mat(rawDataB(it,colIndeciesBlooDraw(jj)))-1; %ADJUSTED DATES
                levelsE = rawDataB{it,colIndeciesE(jj)}; %Estrogen and Pregestrone levels for this participant 
                levelsP = rawDataB{it,colIndeciesP(jj)};
                if ischar(levelsP) == 1 %sometimes the progestrone is a string ('<.2')
                    levelsP = .199; %This is the value if the cell is a string
                end
                if ischar(levelsE) == 1  %sometimes the Estrogen is a string ('<20.')
                    levelsE = 19.999; %This is the value if the cell is a string
                end
                %If any of the values are not a nan, what was recorded above is put into
                %PARTICIPANTS in the 'HormonesBloods' field
                if (~isnan(bDrawDate) || ~isnan(levelsE) || ~isnan(levelsP) || ~isnan(levelsP)) == 1
                    togetherBLOODS = [bDrawDate levelsE (levelsP)]; 
                    PARTICIPANTS(kk).HormonesBloods(jj,:) = togetherBLOODS;    %put into PARTICIPANTS
                end    
            end            
%             catch
%                 disp(['Extracting from bloods to fit DD participant order [HormonesBloods]: Catching Participant = ',num2str(kk)])
%                 continue
%             end
%         elseif allParticipantsMCSid{kk,1}~=str2double(rawDataB{it,1}(5:end))
%             PARTICIPANTS(kk).HormonesBloods = nan(1,length(togetherBLOODS(1,:)));
        end
    end
end

%% Adding to BLOODS ##ADD TO THE SECION ABOVE TO CONDENCE WHEN I HAVE TIME

for ii = 1:length(allParticipantsMCSid)
    regDayHorm=[];normDayHorm=[];
    try
    for uu = 1:length(PARTICIPANTS(ii).HormonesBloods(:,1))
        TDdateBloods=find(PARTICIPANTS(ii).DDAppendProjected(:,1)==PARTICIPANTS(ii).HormonesBloods(uu,1));
        regDayHorm(uu,1)=PARTICIPANTS(ii).DDAppendProjected(TDdateBloods,2);
        normDayHorm(uu,1)=PARTICIPANTS(ii).DDAppendProjected(TDdateBloods,3);
    end
    PARTICIPANTS(ii).HormonesBloods(1:uu,4)=regDayHorm;
    PARTICIPANTS(ii).HormonesBloods(1:uu,5)=normDayHorm;    
    catch
        disp(['When adding values to BLOODS section, participant ',num2str(allParticipantsMCSid{ii,1}),' seems to not have any bloods information.'])
    end
end


%% Extracting from saliva to fit DD participant order [HormonesSaliva]

%Saliva Columns are as follows:
%1:Saliva Draw Date; 2:Estrogen Levels; 3:Progesterone Levels;
%4:Testosterone Levels; 5:DHEA Levels; 6:Cortisol Levels

colIndeciesSampleDate = find(strcmp(rawDATAsalivaOrig(SalivaStartRow,:),'Date of Sample Collection')); 
colIndeciesEs = find(strcmp(rawDATAsalivaOrig(SalivaStartRow,:),'Estradiol (pg/mL)')); 
colIndeciesPr = find(strcmp(rawDATAsalivaOrig(SalivaStartRow,:),'Progesterone (pg/mL)')); 
colIndeciesT = find(strcmp(rawDATAsalivaOrig(SalivaStartRow,:),'Testosterone (pg/mL)')); 
colIndeciesDHEAS = find(strcmp(rawDATAsalivaOrig(SalivaStartRow,:),'DHEAS (ng/mL)')); 
colIndeciesCort = find(strcmp(rawDATAsalivaOrig(SalivaStartRow,:),'Cortisol (ng/mL)')); 

endSaliva = find(strcmp(rawDataS(:,1),'Exluded/WD/LTFU after Baseline'))-1; %We are not intersted in nans and excluded participants 
%All non-nan rows in the saliva spreadsheet to help with data extraction
SalivaNoNansInd=[];count=1;
for ii = 1:endSaliva
    if ~isnan(rawDataS{ii,1})
       SalivaNoNansInd(count,1) = ii;
       count = count +1;
    end
end

%Extracting the data that is in the saliva (hormone information) and
%putting it into its respective field in PARTICIPANTS
for kk = 1:length(allParticipantsMCSid(:,1)) %all participants (length)
    for it = 1:length(SalivaNoNansInd) %all participants' saliva info (length)
        %this makes sure that the participant ID matches since the order of the participants in each spreadsheet is different        
        if allParticipantsMCSid{kk,1}==str2double(rawDataS{it,1}(5:end))
%             try
            for jj = 1:length(colIndeciesSampleDate) %iterates through each column of interest below
                %The following are values from the saliva log for each
                %participant as it iterates through (as specified by kk/it)
                dateS = cell2mat(rawDataS(it,colIndeciesSampleDate(jj)))-1; %ADJUSTED DATES
                levelsES = rawDataS{it,colIndeciesEs(jj)}; 
                levelsPS = rawDataS{it,colIndeciesPr(jj)};
                levelsT = rawDataS{it,colIndeciesT(jj)};
                levelsDHEAS = rawDataS{it,colIndeciesDHEAS(jj)};
                levelsCort = rawDataS{it,colIndeciesCort(jj)};
                if ischar(levelsPS) == 1 %sometimes the progestrone is a string ('<5')
                    levelsPS = 4.999; %This is the value if the cell is a string
                end
                if ischar(levelsES) == 1  %sometimes the Estrogen is a string ('<.5')
                    levelsES = .4999; %This is the value if the cell is a string
                end
                %If any of the values are not a nan, what was recorded above is put into
                %PARTICIPANTS in the 'HormonesSaliva' field
                if (~isnan(dateS) || ~isnan(levelsES) || ~isnan(levelsPS) || ~isnan(levelsT) || ~isnan(levelsDHEAS) || ~isnan(levelsCort)) == 1 
                    togetherSALIVA = [dateS jj levelsES levelsPS levelsT levelsDHEAS levelsCort];
                    PARTICIPANTS(kk).HormonesSaliva(jj,:) = togetherSALIVA;
                end    
            end            
%             catch %in case I run into NANS
%                 disp(['Extracting from saliva to fit DD participant order [HormonesSaliva]: Catching Participant = ',num2str(kk)])
%                 continue
%             end
%         elseif allParticipantsMCSid{kk,1}~=str2double(rawDataS{it,1}(5:end))
%             PARTICIPANTS(kk).HormonesSaliva = nan(1,length(togetherSALIVA(1,:)));
        end
    end
end

%% Adding to SALIVA ##ADD TO THE SECION ABOVE TO CONDENCE WHEN I HAVE TIME

for ii = 1:length(allParticipantsMCSid)
    regDayHormS=[];normDayHormS=[];
    try
    for uu = 1:length(PARTICIPANTS(ii).HormonesSaliva(:,1))
        TDdateSaliva=find(PARTICIPANTS(ii).DDAppendProjected(:,1)==PARTICIPANTS(ii).HormonesSaliva(uu,1));
        regDayHormS(uu,1)=PARTICIPANTS(ii).DDAppendProjected(TDdateSaliva,2);
        normDayHormS(uu,1)=PARTICIPANTS(ii).DDAppendProjected(TDdateSaliva,3);
    end
    PARTICIPANTS(ii).HormonesSaliva(1:uu,8)=regDayHormS;
    PARTICIPANTS(ii).HormonesSaliva(1:uu,9)=normDayHormS;    
    catch
        disp(['When adding values to SALIVA section, participant ',num2str(allParticipantsMCSid{ii,1}),' seems to not have any saliva information.'])
    end
end


%% MCEQ1

exluCriteMCSEQ1 = [43004, 42988, 43156, 43167, 43229];%0011-3; 14_2; 28TD4; 35TD2, 035TD5

%MCEQ1 Columns are as follows:
%1:Date MCEQ1 was taken; 2:Date; 3:DMU Assesment Code ****; 4-:The  MCEQ1 questions;

%*** This relies on the reported time and date of the last cigarette to be in the
%same columns (first and last)

for kk = 1:length(allParticipantsMCSid(:,1)) %all participants (length)
    for it = 1:length(numDataMCEQ1(:,1)) %all participants in this spreadsheet  (length)
        %this makes sure that the participant ID matches since the order of the participants in each spreadsheet is different        
        if allParticipantsMCSid{kk,1}==numDataMCEQ1(it,14)
            try
                count = 1;
                samePartMceq = find(allParticipantsMCSid{kk,1}==numDataMCEQ1(:,14)); %All entries for this kk participant
                samePartMceqSORTED = sortrows(numDataMCEQ1(samePartMceq,:),16);
                for ii = 1:length(samePartMceqSORTED)
                    partDateMceq1 = samePartMceqSORTED(ii,17)-1; %ADJUSTED DATES (column Identification is hard coded)
                    if ~ismember(partDateMceq1,exluCriteMCSEQ1)
                        mceq1Date = samePartMceqSORTED(ii,end)-1; %ADJUSTED DATES reported time and date of the last cigarette(column Identification is hard coded)
                        mceq1Qs = samePartMceqSORTED(ii,1:13); %all responses  (column Identification is hard coded)
                        asesMceq1 = samePartMceqSORTED(ii,16); %assesment (column Identification is hard coded)
                        if asesMceq1==3 && allParticipantsMCSid{kk,1}==35 %this is for the 1,3,4TD for 035
                            asesMceq1 = 2;
                        elseif asesMceq1==6 %this is when TD4 is used
                            asesMceq1 = 3;
                        end
                        togetherMCEQ1 = [partDateMceq1 asesMceq1 mceq1Date mceq1Qs]; %combined all dimentions as specified above
                        PARTICIPANTS(kk).MCEQ1(count,:) = togetherMCEQ1; %put it all into PARTICIPANTS
                        count = count+1;
                    end
                end
            catch %in case I run into NANS
                continue
            end
%         elseif allParticipantsMCSid{kk,1}~=numDataMCEQ1(it,14)
%             PARTICIPANTS(kk).MCEQ1 = nan(1,16);
        end
    end
end


%% MCEQ2
exluCriteMCSEQ2 = [43004, 42988, 43156, 43167, 43229];%0011-3; 14_2; 28TD4; 35TD2, 035TD5

%MCEQ2 Columns are as follows:
%1:Date MCEQ2 was taken; 2:DMU Assesment Code ****; 3-:The  MCEQ2 questions;

for kk = 1:length(allParticipantsMCSid(:,1)) %all participants (length)
    for it = 1:length(numDataMCEQ2(:,1)) %all participants in this spreadsheet  (length)
        %this makes sure that the participant ID matches since the order of the participants in each spreadsheet is different        
        if allParticipantsMCSid{kk,1}==numDataMCEQ2(it,4)
            try
                count=1;
                samePartMceq2 = find(allParticipantsMCSid{kk,1}==numDataMCEQ2(:,4)); %All entries for this kk participant
                samePartMceq2SORTED = sortrows(numDataMCEQ2(samePartMceq2,:),6);
                for ii = 1:length(samePartMceq2SORTED)
                    partDateMceq2 = samePartMceq2SORTED(ii,7)-1; %ADJUSTED DATES (column Identification is hard coded)
                    if ~ismember(partDateMceq2,exluCriteMCSEQ2)
                        mceq2Qs = samePartMceq2SORTED(ii,1:3); %all responses  (column Identification is hard coded)
                        asesMceq2 = samePartMceq2SORTED(ii,6); %assesment (column Identification is hard coded)
                        if asesMceq2==3 && allParticipantsMCSid{kk,1}==35 %this is for the 1,3,4TD for 035
                            asesMceq2 = 2;
                        elseif asesMceq2==6 %this is when TD4 is used
                            asesMceq2 = 3;
                        end
                        togetherMCEQ2 = [partDateMceq2 asesMceq2 mceq2Qs]; %combined all dimentions as specified above
                        PARTICIPANTS(kk).MCEQ2(count,:) = togetherMCEQ2; %put it all into PARTICIPANTS
                        count = count+1;
                    end
                end
            catch %in case I run into NANS
                continue
            end
%         elseif allParticipantsMCSid{kk,1}~=numDataMCEQ2(it,4)
%             PARTICIPANTS(kk).MCEQ2 = nan(1,5);
        end
    end
end

%% OPK
opkNames.pos=[];
opkStruct.PosOPK =numDataPositiveOPK;
opkStruct.NegOPK=numDataNegativeOPK;
opkStruct.FaintOPK=numFaintLines;
opkNames=fieldnames(opkStruct);

for ii = 1:length(allParticipantsMCSid(:,1)) %all participants (length)
    for jj = 1:length(opkNames)

        tempIndx=find(allParticipantsMCSid{ii,1}==opkStruct.(opkNames{jj})(:,1));
        temp2=opkStruct.(opkNames{jj})(tempIndx,2:end-1);
        transposedDates=temp2(~isnan(temp2))';
        
        PARTICIPANTS(ii).(opkNames{jj})=transposedDates;
    end
end






%% PUM

%PUM Columns are as follows:
%1:Date PUM was taken; 2:DMU Assesment Code ****; 3-16:The 14 PUM questions;

for kk = 1:length(allParticipantsMCSid(:,1)) %all participants (length)
    for it = 1:length(numDataPUM(:,1)) %all participants in this spreadsheet  (length)
        %this makes sure that the participant ID matches since the order of the participants in each spreadsheet is different        
        if allParticipantsMCSid{kk,1}==numDataPUM(it,15)
            try
                samePartPUM = find(allParticipantsMCSid{kk,1}==numDataPUM(:,15)); %All entries for this kk participant
                for ii = 1:length(samePartPUM)
                    partDatePUM = numDataPUM(samePartPUM(ii),18)-1; %ADJUSTED DATES (column Identification is hard coded)
                    pumQs = numDataPUM(samePartPUM(ii),1:14); %all responses  (column Identification is hard coded)
                    asesPUM = numDataPUM(samePartPUM(ii),17); %assesment (column Identification is hard coded)
                    togetherPUM = [partDatePUM asesPUM pumQs]; %combined all dimentions as specified above
                    PARTICIPANTS(kk).PUM(ii,:) = togetherPUM; %put it all into PARTICIPANTS
                end
            catch %in case I run into NANS
                continue
            end
        end
    end
end

%% RSQ

%RSQ Columns are as follows:
%1:Date RSQ was taken; 2:DMU Assesment Code ****; 3-:The  RSQ questions;

for kk = 1:length(allParticipantsMCSid(:,1)) %all participants (length)
    for it = 1:length(numDataRSQ(:,1)) %all participants in this spreadsheet  (length)
        %this makes sure that the participant ID matches since the order of the participants in each spreadsheet is different        
        if allParticipantsMCSid{kk,1}==numDataRSQ(it,35)
            try
                partDateRSQ = numDataRSQ(it,38)-1; %ADJUSTED DATES (column Identification is hard coded)
                rsqQs = numDataRSQ(it,1:34); %all responses  (column Identification is hard coded)
                asesRSQ = numDataRSQ(it,37); %assesment (column Identification is hard coded)
                togetherRSQ = [partDateRSQ asesRSQ rsqQs]; %combined all dimentions as specified above
                PARTICIPANTS(kk).RSQ = togetherRSQ; %put it all into PARTICIPANTS
            catch %in case I run into NANS
                continue
            end
        end
    end
end

%% SCS

%SCS Columns are as follows:
%1:Date SCS was taken; 2:DMU Assesment Code ****; 3-:The SCS questions;

for kk = 1:length(allParticipantsMCSid(:,1)) %all participants (length)
    for it = 1:length(numDataSCS(:,1)) %all participants in this spreadsheet  (length)
        %this makes sure that the participant ID matches since the order of the participants in each spreadsheet is different        
        if allParticipantsMCSid{kk,1}==numDataSCS(it,11)
            try
                samePartSCS = find(allParticipantsMCSid{kk,1}==numDataSCS(:,11)); %All entries for this kk participant
                for ii = 1:length(samePartSCS)
                    partDateSCS = numDataSCS(samePartSCS(ii),end)-1; %ADJUSTED DATES (column Identification is hard coded)
                    scsQs = numDataSCS(samePartSCS(ii),1:10); %all responses  (column Identification is hard coded)
                    asesSCS = numDataSCS(samePartSCS(ii),13); %assesment (column Identification is hard coded)
                    togetherSCS = [partDateSCS asesSCS scsQs]; %combined all dimentions as specified above
                    PARTICIPANTS(kk).SCS(ii,:) = togetherSCS; %put it all into PARTICIPANTS
                end
            catch %in case I run into NANS
                continue
            end
        end
    end
end

%% [Shiffman Jarvick]

%I may need to revisit this for debugging
%Refer to the excel file for columns

shiffPartNumb = []; %only non-nans
for ii = 1:length(rawDataShiff(:,1))
    try
    if ~isnan(char(rawDataShiff(ii,1)))
        shiffPartNumb = ii;
    end
    catch
        continue
    end
end

colIndeciesBegShiff = find(strcmp(rawDATAshiffOrig(shiffHeaderInd,:),'1. Heart beating faster?')); %Shiff Begning Columns
colIndeciesEndShiff = find(strcmp(rawDATAshiffOrig(shiffHeaderInd,:),'Focus/Concentration')); %Shiff end Columns

pre_post=2;
for kk = 1:length(allParticipantsMCSid(:,1)) %all participants (length)
    for it = 1:shiffPartNumb %all participants Shiff  (length)
    %this makes sure that the participant ID matches since the order of the participants in each spreadsheet is different        
        if allParticipantsMCSid{kk,1}==str2double(rawDataShiff{it,1}(5:end))
            count3Shiff = 1;everyOtherCounter=1;
            try
                for ii = 1:length(PARTICIPANTS(kk).HormonesSaliva(:,1))
                    for qq = 1:pre_post
                        preOrPost = qq;
                        dateShiff = PARTICIPANTS(kk).HormonesSaliva(ii,1);
                        shiffData = rawDataShiff(it,(colIndeciesBegShiff(count3Shiff):colIndeciesEndShiff(count3Shiff)));
                        allShiffData = [dateShiff everyOtherCounter preOrPost shiffData];
                        PARTICIPANTS(kk).Shiff_Jarv(count3Shiff,:) = cell2mat(allShiffData);
                        count3Shiff = count3Shiff + 1;
                    end
                    everyOtherCounter = everyOtherCounter + 1;
                end        
            catch %in case I run into NANS
                disp(['[Shiffman Jarvick]: Catching Participant = ',num2str(kk)])
                continue
            end
%         elseif allParticipantsMCSid{kk,1}~=str2double(rawDataShiff{it,1}(5:end))
%          PARTICIPANTS(kk).Shiff_Jarv = nan(1,26);
        end
    end
end

for ii = 1:length(allParticipantsMCSid)
    try
    for it=1:(length(PARTICIPANTS(ii).Shiff_Jarv(:,2))/2)
        indx=find(PARTICIPANTS(ii).Shiff_Jarv(:,2)==it);
        horzcatSJ=[PARTICIPANTS(ii).Shiff_Jarv(indx(1),:),PARTICIPANTS(ii).Shiff_Jarv(indx(2),:)];
        PARTICIPANTS(ii).Shiff_Jarv2(it,:)=horzcatSJ;
    end
    catch
    end
end

%% SHQ

%SHQ Columns are as follows:
%1:Date SHQ was taken; 2:DMU Assesment Code ****; 3-:The SHQ questions;

for kk = 1:length(allParticipantsMCSid(:,1)) %all participants (length)
    for it = 1:length(rawDataSHQ(:,1)) %all participants in this spreadsheet  (length)
        %this makes sure that the participant ID matches since the order of the participants in each spreadsheet is different        
        if allParticipantsMCSid{kk,1}==rawDataSHQ{it,23}
            try
                partDateSHQ = cell2mat(rawDataSHQ(it,end))-1; %ADJUSTED DATES (column Identification is hard coded)
                shqQs = rawDataSHQ(it,1:22); %all responses  (column Identification is hard coded)
                asesSHQ = rawDataSHQ{it,25}; %assesment (column Identification is hard coded)
                togetherSHQ = [partDateSHQ asesSHQ shqQs]; %combined all dimentions as specified above
                PARTICIPANTS(kk).SHQ = togetherSHQ; %put it all into PARTICIPANTS
            catch %in case I run into NANS
                continue
            end
        end
    end
end

%% STRAP-R

%STRAP-R Columns are as follows:
%1:Date STRAP-R was taken; 2:DMU Assesment Code ****; 3-:The STRAP-R questions;

for kk = 1:length(allParticipantsMCSid(:,1)) %all participants (length)
    for it = 1:length(numDataSTRAPR(:,1)) %all participants in this spreadsheet  (length)
        %this makes sure that the participant ID matches since the order of the participants in each spreadsheet is different        
        if allParticipantsMCSid{kk,1}==numDataSTRAPR(it,19)
            try
                samePartSTRAPR = find(allParticipantsMCSid{kk,1}==numDataSTRAPR(:,19)); %All entries for this kk participant
                for ii = 1:length(samePartSTRAPR)
                    partDateSTRAPR = numDataSTRAPR(samePartSTRAPR(ii),end)-1; %ADJUSTED DATES (column Identification is hard coded)
                    scsQs = numDataSTRAPR(samePartSTRAPR(ii),1:18); %all responses  (column Identification is hard coded)
                    asesSTRAPR = numDataSTRAPR(samePartSTRAPR(ii),21); %assesment (column Identification is hard coded)
                    togetherSTRAPR = [partDateSTRAPR asesSTRAPR scsQs]; %combined all dimentions as specified above
                    PARTICIPANTS(kk).STRAP_R(ii,:) = togetherSTRAPR; %put it all into PARTICIPANTS
                end
            catch %in case I run into NANS
                continue
            end
        end
    end
end

%% VSEQ 

%VSEQ Columns are as follows:
%1:Date VSEQ was taken; 2:DMU Assesment Code ****; 3-:The VSEQ questions;

for kk = 1:length(allParticipantsMCSid(:,1)) %all participants (length)
    for it = 1:length(numDataVSEQ(:,1)) %all participants in this spreadsheet  (length)
        %this makes sure that the participant ID matches since the order of the participants in each spreadsheet is different        
        if allParticipantsMCSid{kk,1}==numDataVSEQ(it,5)
            try
                samePartVSEQ = find(allParticipantsMCSid{kk,1}==numDataVSEQ(:,5)); %All entries for this kk participant
                for ii = 1:length(samePartVSEQ)
                    partDateVSEQ = numDataVSEQ(samePartVSEQ(ii),end)-1; %ADJUSTED DATES (column Identification is hard coded)
                    vseqQs = numDataVSEQ(samePartVSEQ(ii),1:4); %all responses  (column Identification is hard coded)
                    asesVSEQ = numDataVSEQ(samePartVSEQ(ii),7); %assesment (column Identification is hard coded)
                    togetherVSEQ = [partDateVSEQ asesVSEQ vseqQs]; %combined all dimentions as specified above
                    PARTICIPANTS(kk).VSEQ(ii,:) = togetherVSEQ; %put it all into PARTICIPANTS
                end
            catch %in case I run into NANS
                continue
            end
        end
    end
end

%% WSRS 

exluCriteWSRS = [43004, 42988, 43156, 43167, 43229];%0011-3; 14_2; 28TD4; 35TD2, 035TD5

%WSRS Columns are as follows:
%1:Date WSRS was taken; 2:DMU Assesment Code ****; 3-:The WSRS questions;

for kk = 1:length(allParticipantsMCSid(:,1)) %all participants (length)
    for it = 1:length(numDataWSRS(:,1)) %all participants in this spreadsheet  (length)
        %this makes sure that the participant ID matches since the order of the participants in each spreadsheet is different        
        if allParticipantsMCSid{kk,1}==numDataWSRS(it,(end-3))
            try
                count=1;
                samePartWSRS = find(allParticipantsMCSid{kk,1}==numDataWSRS(:,(end-3))); %All entries for this kk participant
                for ii = 1:length(samePartWSRS)
                    partDateWSRS = numDataWSRS(samePartWSRS(ii),end)-1; %ADJUSTED DATES (column Identification is hard coded)
                    if ~ismember(partDateWSRS,exluCriteWSRS)
                        wsrsQs = numDataWSRS(samePartWSRS(ii),1:(end-4)); %all responses  (column Identification is hard coded)
                        asesWSRS = numDataWSRS(samePartWSRS(1),(end-1)); %assesment (column Identification is hard coded)
                        if asesWSRS==3 && allParticipantsMCSid{kk,1}==35 %this is for the 1,3,4TD for 035
                            asesWSRS = 2;
                        elseif asesWSRS==6 %this is when TD4 is used
                            asesWSRS = 3;
                        end
                        
                        togetherWSRS = [partDateWSRS asesWSRS wsrsQs]; %combined all dimentions as specified above
                        PARTICIPANTS(kk).WSRS(count,:) = togetherWSRS; %put it all into PARTICIPANTS
                        count= count+1;
                    else
                        continue
                    end
                end
            catch %in case I run into NANS
                continue
            end
%         elseif allParticipantsMCSid{kk,1}~=numDataWSRS(it,(end-3))
%             PARTICIPANTS(kk).WSRS = nan(1,26);
        end
    end
end

%% WSRS_Alc

%WSRS_Alc Columns are as follows:
%1:Date WSRS_Alc was taken; 2:DMU Assesment Code ****; 3-:The WSRS_Alc questions;

for kk = 1:length(allParticipantsMCSid(:,1)) %all participants (length)
    for it = 1:length(numDataWSRSAlc(:,1)) %all participants in this spreadsheet  (length)
        %this makes sure that the participant ID matches since the order of the participants in each spreadsheet is different        
        if allParticipantsMCSid{kk,1}==numDataWSRSAlc(it,(end-3))
            try
                samePartWSRSAlc = find(allParticipantsMCSid{kk,1}==numDataWSRSAlc(:,(end-3))); %All entries for this kk participant
                for ii = 1:length(samePartWSRSAlc)
                    partDateWSRSAlc = numDataWSRSAlc(samePartWSRSAlc(ii),end)-1; %ADJUSTED DATES (column Identification is hard coded)
                    wsrsAlcQs = numDataWSRSAlc(samePartWSRSAlc(ii),1:(end-4)); %all responses  (column Identification is hard coded)
                    asesWSRSAlc = numDataWSRSAlc(samePartWSRSAlc(ii),(end-1)); %assesment (column Identification is hard coded)
                    togetherWSRSAlc = [partDateWSRSAlc asesWSRSAlc wsrsAlcQs]; %combined all dimentions as specified above
                    PARTICIPANTS(kk).WSRS_Alc(ii,:) = togetherWSRSAlc; %put it all into PARTICIPANTS
                end
            catch %in case I run into NANS
                continue
            end
         elseif allParticipantsMCSid{kk,1}~=numDataWSRSAlc(it,(end-3))
             PARTICIPANTS(kk).WSRS_Alc(1,:) = nan(1,14);
        end
    end
end

%% [TLFB]

%I may need to revisit this for debugging
%Refer to the excel file for columns

dateColTLFB = find(strcmp(rawDATAtlfbOrig(tlfbHeaderInd,:),'1. Date')); %Date Column
datesTLFB = cell2mat(rawDataTLFB(:,dateColTLFB))-1; %ADJUSTED DATES

for kk = 1:length(allParticipantsMCSid(:,1)) %all participants (length)
    for it = 1:length(rawDataTLFB(:,1)) %all participants TLFB  (length)
        %this makes sure that the participant ID matches since the order of the participants in each spreadsheet is different        
        if allParticipantsMCSid{kk,1}==str2double(rawDataTLFB{it,1}(5:end))
            try
                dateTLFB = datesTLFB(it,1);                
                restTLFB = rawDataTLFB(it,(dateColTLFB+1):end);
                togetherTLFB = [dateTLFB restTLFB];
                PARTICIPANTS(kk).TLFB = togetherTLFB;        
            catch %in case I run into NANS
                disp(['[TLFB]: Catching Participant = ',num2str(kk)])
                continue
            end
        end
    end
end

%% NBB ATTENTIONAL BIAS TASK

cd ..
cd NBB/AttentionalBias
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

%% NBB SCRT
 
cd ..
cd SRCT/
[numDataSRCT, textDataSRCT, rawDataSRCT] = xlsread('SRCT_Merged_9to53TD1.xlsx');
rawDataSRCT(1,:) = [];%remove headers
srctEntries = find(cellfun(@isnan,rawDataSRCT(:,20))); %Establishing where the summary data starts
srctSummArray = rawDataSRCT((length(srctEntries)+1):end,20:end); %saving the summary data
SRCTadjustData1 = cell(length(rawDataSRCT),19); %SRCT Cell/House for data
nbbCellSRCT = cell(length(allParticipantsMCSid),3); %cell setup
nbbCellSRCT_FINAL = cell(length(allParticipantsMCSid),3); %cell setup
count = 1;errorTallySRCT=1;
%below are exceptions - whether they must be removed or included but
%treated differently.
exluCriteSRCT = [43004, 42988, 43229,43319,43337,43338];%0011-3; 14_2; 35_1
specialPartsSRCT = [100217, 102017, 92217, 11518, 22318, 32618, 40918, 80818]; %014-3 (second); 014-3 (third); 0015-3; 34_1 (first); 34_1 (second); 035-3 (second); 035_2 (third); 52_1(second)

for ii = 1:length(srctEntries(:,1))
    if ~ismember(rawDataSRCT{ii,3},exluCriteSRCT)== 1 %exclude the scans of non-interest
        SRCTadjustData1(count,:) = rawDataSRCT(ii,1:19);
        
        %re-working the dates
        temp = num2str(rawDataSRCT{ii,3}); 
        year = temp((end-1):end); %Years
        month = temp((end-3):(end-2));%Months
        day = temp(1:(end-4));%days
        dateSRCT = strcat(day,'/',month,'/',year);%concatonate the day/mo/year
        matlabDateSCRT = m2xdate(dateSRCT)-1; %ADJUSTED DATES
        SRCTadjustData1(count,3) = num2cell(matlabDateSCRT);

        if rawDataSRCT{ii,3}==specialPartsSRCT(1) %014-3 (second)
            SRCTadjustData1(count,5) = num2cell(14);
            SRCTadjustData1(count,6) = num2cell(2);
            count = count+1;
        elseif rawDataSRCT{ii,3}==specialPartsSRCT(2) %014-3 (third)
            SRCTadjustData1(count,5) = num2cell(14);
            SRCTadjustData1(count,6) = num2cell(3);
            count = count+1;
        elseif rawDataSRCT{ii,3}==specialPartsSRCT(3) %0015-3
            SRCTadjustData1(count,5) = num2cell(15);
            SRCTadjustData1(count,6) = num2cell(3);
            count = count+1;
        elseif rawDataSRCT{ii,3}==specialPartsSRCT(4) %34_1 (first)
            SRCTadjustData1(count,5) = num2cell(34);
            SRCTadjustData1(count,6) = num2cell(1);
            count = count+1;
        elseif rawDataSRCT{ii,3}==specialPartsSRCT(5) %34_1 (second)
            SRCTadjustData1(count,5) = num2cell(34);
            SRCTadjustData1(count,6) = num2cell(2);
            count = count+1;
        elseif rawDataSRCT{ii,3}==specialPartsSRCT(6) % 035-3 (second)
            SRCTadjustData1(count,5) = num2cell(35);
            SRCTadjustData1(count,6) = num2cell(2);
            count = count+1;
        elseif rawDataSRCT{ii,3}==specialPartsSRCT(7) % 035-2 (third)
            SRCTadjustData1(count,5) = num2cell(35);
            SRCTadjustData1(count,6) = num2cell(3);
            count = count+1;
        elseif rawDataSRCT{ii,3}==specialPartsSRCT(8) % 052_1 (second)
            SRCTadjustData1(count,5) = num2cell(52);
            SRCTadjustData1(count,6) = num2cell(2);
            count = count+1;
        elseif isa(rawDataSRCT{ii,5},'char') %everything else
            partiNumbSRCT = str2double(rawDataSRCT{ii,5}(1:3));
            SRCTadjustData1(count,5) = num2cell(partiNumbSRCT);
            SRCTadjustData1(count,6) = num2cell(3);
            count = count+1;
        else
            count = count+1;
        end
    end
end


%to check the original mean values - only comment the </>-related lines out
count=1;count1=1;
for ii = 1:length(SRCTadjustData1)
    try
    if (strcmp(SRCTadjustData1{ii,7}(1:8),'practise')==0) %prune the practice trials
        if SRCTadjustData1{ii,18} == 1 %prune  errors
            if (SRCTadjustData1{ii,19} > 200 && SRCTadjustData1{ii,19} < 3000)==1 %prune the hanous RT

                SRCTadjustData2(count,:) = SRCTadjustData1(ii,1:19); %first cleaned dataset (Sans 3xSTD and participants who had a >20% mistake rate)
                count = count+1;
            
            elseif (SRCTadjustData1{ii,19} < 200 || SRCTadjustData1{ii,19} > 3000)==1
                SRCTerrors(errorTallySRCT,:) = SRCTadjustData1(ii,1:19); %keep track of errors for>20%
                errorTallySRCT = errorTallySRCT + 1;
            end
        elseif SRCTadjustData1{ii,18} == 0
            SRCTerrors(errorTallySRCT,:) = SRCTadjustData1(ii,1:19); %keep track of errors for>20%
            errorTallySRCT = errorTallySRCT + 1;
        end
    elseif (strcmp(SRCTadjustData1{ii,7}(1:8),'practise')==1)
        practiceTrialsSRCT(count1,:) = SRCTadjustData1(ii,1:19); %removing practice trials
        count1= count1+1;
    end
    catch
    end
end

for ii = 1:length(allParticipantsMCSid(:,1))
    for jj = 1:3 %to itterate through each cell
        count1=1;
        for qq = 1:length(SRCTadjustData2(:,1))
            if allParticipantsMCSid{ii} == SRCTadjustData2{qq,5}
                if SRCTadjustData2{qq,6} == jj
                    nbbCellSRCT{ii,jj}(count1,:) = SRCTadjustData2(qq,1:19); %put first cleaned dataset into a respective cell
                    count1 = count1+1;
                end
            end
        end
        try
            tempSRCTmeans(ii,jj) = num2cell(mean(cell2mat(nbbCellSRCT{ii,jj}(:,19)))); %throwing means of each scan into their respective cells
            tempSRCTstd(ii,jj) = num2cell(std(cell2mat(nbbCellSRCT{ii,jj}(:,19)))); %std
            exCriteSRCTstdx3(ii,jj) = num2cell(cell2mat(tempSRCTmeans(ii,jj))+(cell2mat(tempSRCTmeans(ii,jj))*3)); %std3x
        catch
        end
        
        for kk = 1:3 %create cell for <20%
            count=1;
            for ss = 1:length(SRCTerrors(:,1))
                if allParticipantsMCSid{ii} == SRCTerrors{ss,5}
                    if SRCTerrors{ss,6}==kk%keeps track of errors for each participant
                        SRCTerrorsCELL{ii,kk}(count,:) = SRCTerrors(ss,:);
                        count = count + 1; 
                    end
                end
            end
        end
    end
end

errorTallySRCT2=1; count=1;
%implementing the 3xSTD
for ii = 1:length(allParticipantsMCSid(:,1))
    for kk = 1:3
        for qq = 1:length(SRCTadjustData2(:,1))
            if allParticipantsMCSid{ii,1} == SRCTadjustData2{qq,5}
                if SRCTadjustData2{qq,6}==kk
                    if SRCTadjustData2{qq,19} < exCriteSRCTstdx3{ii,kk} %Checking whether the respective participant RT is less than 3xSTD+mean
                        SRCTadjustData3(count,:) = SRCTadjustData2(qq,:);
                        count = count + 1;
                    elseif SRCTadjustData2{qq,19} > exCriteSRCTstdx3{ii,kk}
                            SRCTerrors2(errorTallySRCT2,:) = SRCTadjustData2(qq,:); %keep track of errors
                            errorTallySRCT2 = errorTallySRCT2 + 1;
%    Revisit this                     if SRCTadjustData2{qq,6}==kk
%    Having looked                         SRCTerrorsCELL{ii,kk} = vertcat(SRCTerrorsCELL{ii,kk}(end,:),SRCTadjustData2(qq,:));
%    at FOXLAB code                     end
                    end
                end
            end
        end
    end
end

count=1;
for ii = 1:length(allParticipantsMCSid(:,1)) %Check/boot participants that have a >20% error rate
    for kk = 1:3
        for qq = 1:length(SRCTadjustData3(:,1))
            if allParticipantsMCSid{ii,1} == SRCTadjustData3{qq,5}
                if SRCTadjustData3{qq,6}==kk
                    if (length(nbbCellSRCT{ii,kk}(:,1))/168)>.8 %if the success rate is >.8 (less than a 20% failiur rate) 
                        SRCTadjustDataFINAL(count,:) = SRCTadjustData3(qq,:); %The final/clean SRCT spreadsheet
                        count = count + 1; 
                    elseif (length(nbbCellSRCT{ii,kk}(:,1))/168)<.8 %lets us know if there is a participant with a >20% faliur rate
                        disp(['Participant: ',num2str(allParticipantsMCSid{3,1}),' has a greater than 20% error rate.']);
                    end
                end
            end
        end
    end
end


%creating the final CELL spreadsheet as well as mean, STD, and STD3x (as
%instructed for scoring by the paper) 
for ii = 1:length(allParticipantsMCSid(:,1))
    for jj = 1:3
        count1=1;
        for qq = 1:length(SRCTadjustDataFINAL(:,1))
            if allParticipantsMCSid{ii} == SRCTadjustDataFINAL{qq,5}
                if SRCTadjustDataFINAL{qq,6} == jj
                    nbbCellSRCT_FINAL{ii,jj}(count1,:) = SRCTadjustDataFINAL(qq,:); %put everything into a respective cell
                    count1 = count1+1;
                end
            end
        end
        try %recording mean, STD, and STD3x
            tempSRCTmeansFINAL(ii,jj) = num2cell(mean(cell2mat(nbbCellSRCT_FINAL{ii,jj}(:,19)))); %throwing means of each scan into their respective cells
            tempSRCTstdFINAL(ii,jj) = num2cell(std(cell2mat(nbbCellSRCT_FINAL{ii,jj}(:,19)))); %std
            exCriteSRCTstdx3FINAL(ii,jj) = num2cell(cell2mat(tempSRCTmeans(ii,jj))+(cell2mat(tempSRCTmeans(ii,jj))*3)); %std3x
        catch
        end
    end
end
      
%% SRCT scoring #this is not correct since I need average across avoid/approach the differnt stim
for ii = 1:length(allParticipantsMCSid(:,1))
    allmeans_scores=[];
    for kk = 1:3
        count1=1; count2=1;count3=1;
        try
        for qq = 1:length(SRCTadjustDataFINAL(:,1))
            if allParticipantsMCSid{ii,1} == SRCTadjustDataFINAL{qq,5}
                SRCTmeans_score{ii,kk}(1,1) = num2cell(mean(cell2mat(nbbCellSRCT_FINAL{ii,kk}(:,19)))); %overal mean
            
                if strcmp(SRCTadjustDataFINAL{qq,7},'main_approach_alc') == 1 %collecting approach information
                    allmeans_scores(count1,1)= SRCTadjustDataFINAL{qq,19};
                    count1 = count1+1;   
                elseif strcmp(SRCTadjustDataFINAL{qq,7},'main_avoid_alc') == 1%collecting avoid information
                    allmeans_scores(count2,2)= SRCTadjustDataFINAL{qq,19};
                    count2 = count2+1;
                elseif strcmp(SRCTadjustDataFINAL{qq,7},'main_left_alc') == 1%collecting left information
                    allmeans_scores(count3,3)= SRCTadjustDataFINAL{qq,19};
                    count3 = count3+1;
                end
            end
        end
        SRCTmeans_score{ii,kk}{1,2} = mean(nonzeros(allmeans_scores(:,1))); %Mean approach 
        SRCTmeans_score{ii,kk}{1,3} = mean(nonzeros(allmeans_scores(:,2))); %Mean avoid 
        SRCTmeans_score{ii,kk}{1,4} = mean(nonzeros(allmeans_scores(:,3))); %Mean left 
        SRCTmeans_score{ii,kk}{1,5} = mean(nonzeros(allmeans_scores(:,2)))-mean(nonzeros(allmeans_scores(:,1))); %SRCT score
        catch
            disp(['Participant: ',num2str(allParticipantsMCSid{ii,1}),' session ',num2str(kk),' didnt work out for SRCT']);
        end
    end
end

%Overall mean (RT); Mean approach (RT); Mean Avoid (RT); Mean Left (RT); Approach Bias *Score* (RT)

%"positive scores indicate faster reaction times when required to approach,
%rather than avoid, alcohol-related pictures" -> From the Caren paper


for ii = 1:length(allParticipantsMCSid(:,1))
    try
    for kk = 1:3
        if allParticipantsMCSid{ii,1}==SRCTmeans_score{ii,kk}(1,1)
            PARTICIPANTS(ii).BART(kk,:) = nbbCellBartScores{ii,kk}(1,2:end);
%         elseif allParticipantsMCSid{ii,1}~=nbbCellBartScores{ii,kk}(1,1)
%             PARTICIPANTS(ii).BART = nan(1,4);
        end
    end
    catch
    end
end

%% Organizing the scoring from the Data that the SRCT Spits out

[numSRCT_ScoresOrig,textSRCT_Scores,rawSRCT_Scores] = xlsread('SRCT_Scores.xlsx');
numSRCT_Scores=numSRCT_ScoresOrig;
% rawDataASI = rawDATAasiOrig; %Keeping the original data.
% asiHeaderInd = find(strcmp(rawDataASI(:,1),'G1'));
% rawDataASI(1:asiHeaderInd,:) = []; %knocking out the header

for ii = 1:length(numSRCT_Scores)
       %re-working the dates
        temp = num2str(numSRCT_Scores(ii,1)); 
        year = temp((end-1):end); %Years
        month = temp((end-3):(end-2));%Months
        day = temp(1:(end-4));%days
        dateSRCT = strcat(day,'/',month,'/',year);%concatonate the day/mo/year
        matlabDateSCRT = m2xdate(dateSRCT)-1; %ADJUSTED DATES
        numSRCT_Scores(ii,1) = matlabDateSCRT;
end

%% NBB STOP TASK ANALYZE-IT

cd ..
cd StopTask/ %Changing directories to the StopTask
stopANALYZEexcelFiles = dir('results*');%Find all directories that have the prefix "results"
analyzeItAll=[]; %The spreadsheet for all ANALYZE-IT data
for ii = 1:3
    [numdataANALYZE,textdataANALYZE,rawdataANALYZE] = xlsread(stopANALYZEexcelFiles(ii).name);%read in the ANALYZE-IT file
    sessionSTOP = repmat(ii,length(numdataANALYZE(:,1)),1); %making an array of the participants ID#s so that it will succesfully combine with the spreadsheet below
    analyzeItAll = vertcat(analyzeItAll,[numdataANALYZE,sessionSTOP]);%Putting the participant ID# into the spreadsheet
end
analyzeItAllMatrix = sortrows(analyzeItAll,[1,11]);%sorts the participants by participant ID# and TD#

%% NBB STOP TASK Individuals

nbbPartiDir = dir('MCS_*'); %Find all directories that have the prefix "MCS_"
nbbCellStop = cell(length(allParticipantsMCSid),3); %creating a cell-home for stop Task participants
stopTaskAllSheet = []; %this will house all stop-task data

for ii = 1:length(allParticipantsMCSid(:,1))%itterates through each participants
    count = 1;
    for qq = 1:length(nbbPartiDir)%itterates through each paticipant in the directory 
        partiFromFile = str2double(nbbPartiDir(qq).name(5:7)); %convert the string (from the file) to a double
        if allParticipantsMCSid{ii,1} == partiFromFile
            cd(nbbPartiDir(qq).name); %this will change dir as the for loop iterates
            partiExcel = dir('stop-*'); %find the file that starts with "stop-"
            [numDataSTOP, textDataSTOP, rawDataSTOP] = xlsread(partiExcel.name);%read in that^ file
            partNumb = repmat([allParticipantsMCSid{ii,1},count],length(numDataSTOP(:,1)),1);
            %This^ creates a matrix with the participant MCS# and the session# to add to the combined spreadsheet 
            stopTaskAllSheet = vertcat(stopTaskAllSheet, [partNumb, numDataSTOP]); %concatoniate all individual SST spreadsheets (as well as "partNumb" to the front)
            nbbCellStop{ii,count} = numDataSTOP; %Put each participant/session into their respective cell
            stopTaskMeans{ii,count} = mean(numDataSTOP(:,7)); %Put each participant/session mean into their respective cells
            count = count + 1;
            cd ..
        end 
    end
    for kk = 1:length(analyzeItAllMatrix(:,1)) %itterates through each paticipant's score in the ANALYZE-IT spreadsheet
        for qq = 1:3 %this is for each nbbCell
            if allParticipantsMCSid{ii,1}==analyzeItAllMatrix(kk,1)
                try
                if analyzeItAllMatrix(kk,11) == qq
                    stopTaskScores{ii,qq} = analyzeItAllMatrix(kk,:); %Organizing all of the STOP-IT/ANALYZE-IT scores
                end
                catch
                end
            end
        end
    end
end


%% DD Compliance
%omit the following: 10,11,16,17

l=[];
for ii = 1:length(allParticipantsMCSid(:,1))
    try
    temp1 = length(PARTICIPANTS(ii).CompletedDDdatesAppended(:,1));
    temp2 = (PARTICIPANTS(ii).CompletedDDdatesAppended(end,1)-PARTICIPANTS(ii).CompletedDDdatesAppended(1,1))+1;
    l(ii,1) = (temp1/temp2)*100;
    catch
    end
end

overallComplianceDD = mean(nonzeros(l));

%%
%      %Single time assesment:
%      PARTICIPANTS(ii).Demographic
%      PARTICIPANTS(ii).FTND
%      PARTICIPANTS(ii).ASI
%      PARTICIPANTS(ii).RSQ
%      PARTICIPANTS(ii).SHQ
%      PARTICIPANTS(ii).TLFB


%% Datastructure for the bloods graph

participantStruct = fieldnames(PARTICIPANTS);
mcDayEandP=[];
for ii = 1:length(allParticipantsMCSid)

    if ~isempty(PARTICIPANTS(ii).(participantStruct{23}))
    
        temp = PARTICIPANTS(ii).(participantStruct{4})(:,1:3);
        t = repmat(nan,length(PARTICIPANTS(ii).(participantStruct{4})(:,1)),length(PARTICIPANTS(ii).(participantStruct{23})(1,:)));
        indx = find(ismember(temp(:,1),PARTICIPANTS(ii).(participantStruct{23})(:,1)));

        if isempty(indx)
            temp= horzcat(temp,t);
        elseif ~isempty(indx)
            t(indx,:)= sortrows(PARTICIPANTS(ii).(participantStruct{23}),1);
            temp= horzcat(temp,t);
        end

    %     catch
    %         disp(['The following participant was/were not included: ',num2str(ii)])
    %     end
        mcDayEandP=vertcat(mcDayEandP,temp);
    end

end

%All E+P bloods as a function of the MC
indx2 = find(~isnan(mcDayEandP(:,5)));
mcDayEandP2=mcDayEandP(indx2,:);
temp3=find(ismember(mcDayEandP2(:,6),118));%knocks out an outlier 
mcDayEandP2(temp3,:)=[];


%% Datastructure for the HORMONES graph

cd /project/psychimg2/Teri/Nate/DDanalysis/METADATA %set wd


[numhormoneGraphs3TDsOrig2,texthormoneGraphs3TDs2,rawhormoneGraphs3TDs2] = xlsread('hormoneGraphs3TDs2.xlsx');
numhormoneGraphs3TDs2 = numhormoneGraphs3TDsOrig2;
numhormoneGraphs3TDs2(:,4) = numhormoneGraphs3TDs2(:,4)-1; %ADJUSTED DATES

count=1;temp=[];hormoneSalivaMCday=[];

for ii = 1:length(allParticipantsMCSid) %by participant
    
    part4SalivaHormsINDX = find(PARTICIPANTS(ii).MCSid==numhormoneGraphs3TDs2(:,1));%by participant
    part4SalivaHorms = numhormoneGraphs3TDs2(part4SalivaHormsINDX,:);
    dateMatchedINDX =find(ismember(PARTICIPANTS(ii).DDAppendProjected(:,1),part4SalivaHorms(:,4)));

    roundedNormDay=round(PARTICIPANTS(ii).DDAppendProjected(dateMatchedINDX,3));
    temp=[part4SalivaHorms, roundedNormDay];
    hormoneSalivaMCday=vertcat(hormoneSalivaMCday,temp);

end


%% Hormones Phase TDs Dates Boom

hormPhaseStruct.LEP = numLEP_TDs;
hormPhaseStruct.HE = numHE_TDs;
hormPhaseStruct.HP = numHP_TDs;

hormPhaseStructNames = fieldnames(hormPhaseStruct);

for ii = 1:length(allParticipantsMCSid)
    for gg = 1:length(fieldnames(hormPhaseStruct))
        partINX=find(allParticipantsMCSid{ii}==hormPhaseStruct.(hormPhaseStructNames{gg})(:,1));
        if isempty(partINX)
            PARTICIPANTS(ii).Date_TD_Phase(gg,:)=nan(1,4);
        else
            PARTICIPANTS(ii).Date_TD_Phase(gg,:)=hormPhaseStruct.(hormPhaseStructNames{gg})(partINX,:);
            PARTICIPANTS(ii).Date_Phase(gg,:)=hormPhaseStruct.(hormPhaseStructNames{gg})(partINX,[2,4]);

        end
    end
end

%This checks if the dates line up with the TDs
checkingParticipants=[2:9,12:15,18:27];
for ii = 1:length(checkingParticipants)
    for gg = 1:length(fieldnames(hormPhaseStruct))
        partINX=find(PARTICIPANTS(checkingParticipants(ii)).Date_TD_Phase(:,2)==PARTICIPANTS(checkingParticipants(ii)).HormonesSaliva(:,1));
        
    end
end

%% Datastructure for the ALL HORMONES graph

cd /project/psychimg2/Teri/Nate/DDanalysis/METADATA %set wd


[numAllHormones4GraphsOrig,textAllHormones4GraphsOrig,rawAllHormones4GraphsOrig] = xlsread('AllHormones4Graphs.xlsx');
numAllHormones4Graphs = numAllHormones4GraphsOrig;
numAllHormones4Graphs(:,4) = numAllHormones4Graphs(:,4)-1; %ADJUSTED DATES

count=1;temp=[];AllhormoneSalivaMCday=[];roundedNormDay=[];

for ii = 1:length(allParticipantsMCSid) %by participant
    
    part4AllSalivaHormsINDX = find(PARTICIPANTS(ii).MCSid==numAllHormones4Graphs(:,1));%by participant
    part4AllSalivaHorms = numAllHormones4Graphs(part4AllSalivaHormsINDX,:);
    AlldateMatchedINDX =find(ismember(PARTICIPANTS(ii).DDAppendProjected(:,1),part4AllSalivaHorms(:,4)));

    roundedNormDay=round(PARTICIPANTS(ii).DDAppendProjected(AlldateMatchedINDX,3));
    temp=[part4AllSalivaHorms, roundedNormDay];
    AllhormoneSalivaMCday=vertcat(AllhormoneSalivaMCday,temp);

end







