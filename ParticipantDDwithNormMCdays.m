%% Intro
%1/1/19; Nate Spilka
%the comments may have many misspellings
%The following script REQUIRES DDcode2 to run first

%% DD with normalized MC Days 
%This will create a DD spreadsheet for each participant with all responses
%alligned with their normalized cycle days. 

participantStruct = fieldnames(PARTICIPANTS);
A=[];
for ii = 1:length(allParticipantsMCSid)
    try
    ta=repmat(PARTICIPANTS(ii).(participantStruct{1}),length(PARTICIPANTS(ii).(participantStruct{5})(:,1)),1);
    ta=[ta,PARTICIPANTS(ii).(participantStruct{5})];
    ta2=num2cell(ta);
    for qq = [6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]
        ta2=[ta2,PARTICIPANTS(ii).(participantStruct{qq})];
    end
    A=vertcat(A,ta2);
    catch
    end
end
%t=cell2table(A);

%writetable(t,'DD_32619.xlsx')