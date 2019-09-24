%% Intro
%Data restructuring and analysis for the SRCT Data
%7/1/18; Nate Spilka
%the comments may have many misspellings
%this requires DDcode2 to run prior to running this


%% NBB STOP-TASK [REMASTERED]

cd 	/project/psychimg2/Teri/Nate/DDanalysis/METADATA
[numSTOP2, textSTOP2, rawSTOP2] = xlsread('STOP-IT_Results_Nate_7.2.19 (1).xlsx'); %Reading in the excel file
dates4STOP=[];
dates4STOP(:,1)=numSTOP2(:,12)-1;%adjusted Dates
STOP4part=[dates4STOP, numSTOP2];


for ii = 1:length(allParticipantsMCSid)
    stop4PARTICIPANTSindx=[];
    stop4PARTICIPANTSindx=find(allParticipantsMCSid{ii,1}==STOP4part(:,2));
    PARTICIPANTS(ii).STOP= STOP4part(stop4PARTICIPANTSindx,:);
end

