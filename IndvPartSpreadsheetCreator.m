%% Intro
%5/9/19; Nate Spilka
%the comments may have many misspellings
%The following script REQUIRES DDcode2 and BartDataRestructAndAnalysis to run first

%% Participnt spreadsheet
%this houses all longitudinal data for each participant
participantStruct = fieldnames(PARTICIPANTS);


for ii = 1%1:16%length(allParticipantsMCSid)
    %creating a cell matrix of the DD information
    l=[];DDinfo=[];
    ta=repmat(PARTICIPANTS(ii).(participantStruct{1}),length(PARTICIPANTS(ii).(participantStruct{5})(:,1)),1);
    ta=[ta,PARTICIPANTS(ii).(participantStruct{5})];
    ta2=num2cell(ta);
    for qq = [6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]
        ta2=[ta2,PARTICIPANTS(ii).(participantStruct{qq})];
    end
    DDinfo=vertcat(DDinfo,ta2);
    
%creating a matrix that contains all of the study measures (saliva, bloods,
%mceq1, wsrs, etc.
    l=repmat([PARTICIPANTS(ii).(participantStruct{1}),PARTICIPANTS(ii).(participantStruct{2})],length(PARTICIPANTS(ii).(participantStruct{4})(:,1)),1);
    for qq = [4,51,23:27,29:32,34,36:40,42,44:47,52]%the specific fields of interest

        if ~isempty(PARTICIPANTS(ii).(participantStruct{qq}))
            t = nan(length(PARTICIPANTS(ii).(participantStruct{4})(:,1)),length(PARTICIPANTS(ii).(participantStruct{qq})(1,:)));
            indx = find(ismember(PARTICIPANTS(ii).(participantStruct{4})(:,1),PARTICIPANTS(ii).(participantStruct{qq})(:,1)));
            indx2=find(~isnan(PARTICIPANTS(ii).(participantStruct{qq})(:,1)));
        elseif isempty(PARTICIPANTS(ii).(participantStruct{qq}))
            t = nan(length(PARTICIPANTS(ii).(participantStruct{4})(:,1)),length(PARTICIPANTS(12).(participantStruct{qq})(1,:)));
            indx=[];
        end
        if isempty(indx)
            l= horzcat(l,t);
        elseif ~isempty(indx)
            t(indx,:)= sortrows(PARTICIPANTS(ii).(participantStruct{qq})(indx2,:),1);
            l= horzcat(l,t);
        end

    end
    %merging the DD info and study measures info - mapped onto a set of
    %dates in the study.
    t = nan(length(PARTICIPANTS(ii).(participantStruct{4})(:,1)),length(DDinfo(1,:)));
    t=num2cell(t);
    for tt = 1:length(DDinfo(:,1))
        temp=find(DDinfo{tt,2}==PARTICIPANTS(ii).(participantStruct{4})(:,1));
        t(temp,:)=DDinfo(tt,:);        
    end
    l=num2cell(l);
    l= horzcat(l,t);
    indSpreadsheet=cell2table(l);
    
cd ../participantDataSpreadsheets/

    %writetable(indSpreadsheet,'spreadSheet011.xlsx')
    
cd ../Code4Git/

end

