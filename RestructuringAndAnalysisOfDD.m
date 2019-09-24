%% Intro
%1/1/19; Nate Spilka
%the comments may have many misspellings
%The following script REQUIRES DDcode2 to run first

%THIS IS THE CODE FOR DD ANALYSIS

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

%% Selecting Specific fields in the DD for Analysis

DD4Analysis=[];
for ii = 1:length(A(:,1))
    if ~isempty(cell2mat(A(ii,30)))
        DD4Analysis(ii,:)=cell2mat(A(ii,[1,4,4:32,38,40,41,46,49:70,2])); %partcipant, normMCday, Flow, Cig#, CigLiking
    end
end

%Cleaning up the matrix
for ii = 1:length(DD4Analysis(1,:))
    temp=find(DD4Analysis(:,ii)==97);
    DD4Analysis(temp,ii)=NaN;
    temp=find(DD4Analysis(:,ii)==-8);
    DD4Analysis(temp,ii)=NaN;
end
DD4Analysis(:,2)=round(DD4Analysis(:,2));

final=[];participantsOfInterest=[2,9,11,14,15,26,28,34,33,36,35,37,40,42,43,49,50,52,53,57,58,61,64,63,66,68,73];

for ii = 1:length(participantsOfInterest)
indxDiffs=[];
    partIndx=find(DD4Analysis(:,1)==participantsOfInterest(ii));
    indxDiffs=find(diff(DD4Analysis(partIndx,2))<-14);
    indxDiffs=vertcat(indxDiffs,(length(partIndx)));
    
    cycles=length(indxDiffs);
    almostDone=[];
    for jj = 1:cycles
        temp1=indxDiffs(jj,1);

        if jj == 1
            index=((1:temp1));
            rpmat=repmat(jj,length(DD4Analysis(partIndx(index))),1);
            almostDone = [rpmat,DD4Analysis(partIndx(index),:)] ;
            final=vertcat(final,almostDone);
        elseif jj~=1
            index=((indxDiffs((jj-1),1)+1):temp1);
            rpmat=repmat(jj,length(DD4Analysis(partIndx(index))),1);
            almostDone = [rpmat,DD4Analysis(partIndx(index),:)] ;
            final=vertcat(final,almostDone);
        end
    end
end
finalNoDates=final(:,1:58);
table4Kev=array2table(finalNoDates);

%writetable(table4Kev,'DD_DataSet2_noWeekdays.xlsx')

%For Kev

%Normalizes for each field to then be abalyzed across individual days
%Columns: SubjID, NormDay, Flow, cIG#, normFlow, Cig#nORM, CigLikingnORM, marijnORM, MarijAmountnORM, marijLikingnORM, AlcnORM, AlcLikingnORM
len4Data=(length(DD4Analysis(1,:))-3); %minus two because of the first two columns
matrix4DD2=DD4Analysis(:,1:3);
tempMat=[];
for ii = 1:length(allParticipantsMCSid)

    partIndx=find(DD4Analysis(:,1)==allParticipantsMCSid{ii});
    %tempMat=repmat(nan,length(partIndx),len4Data);
    avg=nanmean(DD4Analysis(partIndx,4:57));
    normValues=DD4Analysis(partIndx,4:57)-avg;
	normalizedDD4Avalues = normValues./avg;
    tempMat=vertcat(tempMat,normalizedDD4Avalues);

end
matrix4DD2=[matrix4DD2,tempMat];

%% Adding days of the week

final2=[];
o=datestr(final(:,59),'mm/dd/yy');

man1=weekday(o);

final2=[final,man1];
kevMatrix=[final,man1];
 
table4Kev2=array2table(final2);

%writetable(table4Kev2,'DD_DataSet_Date_Weekdays1.xlsx')

allCycle7=find(final2(:,1)==7);
allCycle6=find(final2(:,1)==6);
final2(allCycle7,:)=[];
final2(allCycle6,:)=[];

%% Holidays
% 
% 
% %42883,43247,43611 %memorial day 2017,2018,2019
% %42919, 43284, 43649 %July4th (dont forget about the day prior)
% %42981, 43345, 43709 %Labor Day 
% %43016, 43380, 43751 %Columbus Day
% %43093, 43458, 43823 %Xmas day (dont forget about the day prior FOR THE LAST TWO NOT 2017)
% %43100, 43465, 43830 %newYearDay (dont forget about the day prior NOT FOR THE FIRST)
% 
% holidays=[42883,43247,43611, 42918, 42919, 43283,43284, 43648,43649,42981, 43345, 43709,43016, 43380, 43751,43093, 43457, 43458, 43822, 43823, 43100, 43464, 43465, 43829, 43830];
% h1=nan(10,length(holidays));
% final3=final2;
% for ii = 1:length(holidays)
%     temp1=find(final3(:,59)==holidays(ii));
%     h1(1:length(temp1),ii)=temp1;
% end
% 
% oneColumnWITHNAN=reshape(h1,[],1);
% 
% oneColumn=oneColumnWITHNAN(~isnan(oneColumnWITHNAN));
% 
% final3(oneColumn,35:36)=0;
% 
% 
% for ii = 1:7
%     tmp1=[];
%     tmp1=find(final3(:,60)==ii);
%     tmp2(ii)=nansum(final3(tmp1,35));
% 
% end
% figure
%  bar(tmp2)
%  title('alc no holidays')
% 
% table4Kev3=array2table(final3);
% 
% writetable(table4Kev3,'DD_DataSet_Date_Weekdays1_NoHolidays.xlsx')
% 



%% For raw numbers figs

%comment this out when the following sections are run
DD4Analysis2=sortrows(matrix4DD2,[2 1]);

%h=find(t(:,30)>5);
%t(h,30)=nan;

%DD4Analysis2=sortrows(DD4Analysis,[2 1]); %for raw scores - not normalized
participantsOfInterest=[2,9,11,14,15,26,28,34,33,36,35,37,40,42,43,49,50,52,53,57,58,61,64,63,66,68,73];

t=[];temp1=[];
for jj = 1:28
    for ii = 1:length(participantsOfInterest)
        participantMcMeans=[];
        indx1=find(DD4Analysis2(:,2)==jj);
        indx2=find(DD4Analysis2(indx1,1)==participantsOfInterest(ii));
        temp1=DD4Analysis2(indx1(indx2,1),4:end);
        if length(temp1(:,1))==1
            tempMean=temp1;
        elseif length(temp1(:,1)>1)
            tempMean=nanmean(temp1);
        end 
        participantMcMeans=[participantsOfInterest(ii),jj,tempMean];
        t=vertcat(t,participantMcMeans);
    end
end

g=[];
for ii = 1:28

    tmp=find(t(:,2)==ii);
    tmp2MEAN=nanmean(t(tmp,:));
    g=vertcat(g,tmp2MEAN);
    
end


for ii = 1:28
    dayTemp=find(final2(:,3)==ii);
    dayMcFreq(ii,1)=nansum(final2(dayTemp,15));
end

f=figure('Position', [100 100 1000 750]);%,'visible','off');

s(1) = bar(dayMcFreq);
ylabel('CRAMPS','FontSize',18);
%ylim([-1 1]);
set(f,'defaultAxesColorOrder',[1,0,0]);

hold on

xticks([1,7,14,21,28])
xlim([0 29]);

title('Cramps as a Function of the MC','FontSize',20);

grid on
set(gcf,'color','w');

xlabel('Normalized Cycle Days','FontSize',18);

%saveas(gcf,sprintf('MCS_0%s.jpg',string(num2str(allParticipantsMCSid{ii,1}))))

hold off


%% Create a normalized version of the above matrix

%Columns: SubjID, NormDay, Flow, cIG#, normFlow, Cig#nORM, CigLikingnORM, marijnORM, MarijAmountnORM, marijLikingnORM, AlcnORM, AlcLikingnORM
len4Data=(length(DD4Analysis(1,:))-2); %minus two because of the first two columns
matrix4DD=DD4Analysis(:,[1,2]);
temp=[];
for ii = 1:length(allParticipantsMCSid)

    partIndx=find(DD4Analysis(:,1)==allParticipantsMCSid{ii});
    tempMat=repmat(nan,length(partIndx),len4Data);
    avg=nanmean(DD4Analysis(partIndx,3:end));
    normValues=DD4Analysis(partIndx,3:end)-avg;
	normalizedDD4Avalues = normValues./avg;
    temp=vertcat(temp,normalizedDD4Avalues);

end
matrix4DD=[matrix4DD,temp];

%to identify all marij smokers/non-smokers
% temp = find(matrix4DD(:,7)>10);
% matrix4DD(temp,:)=[];


%% Creating the bins


ddStruct.to4 = [];ddStruct.to8 = [];ddStruct.to12 = [];ddStruct.to16 = [];
ddStruct.to20 = [];ddStruct.to24 = [];ddStruct.to28 = [];

ddStructNAMES = fieldnames(ddStruct);
    
numbs=0:4:28;
for ii = 1:length(numbs)-1
    if ii==7
        indx4bins = find(matrix4DD(:,2)>=(numbs(ii))&matrix4DD(:,2)<=(numbs(ii+1)));
    elseif ii~=7
        indx4bins = find(matrix4DD(:,2)>=(numbs(ii))&matrix4DD(:,2)<(numbs(ii+1)));
    end
    ddStruct.(ddStructNAMES{ii})= matrix4DD(indx4bins,:);
end            
                

%% Manipulation Check #1 Flow as a function of the MC 
%Columns: SubjID, 2: NormDay, 3: Flow, 4: cIG#, 5: normFlow, 6: Cig#, 7: CigLiking, 
%8: marij, 9: MarijAmount, 10: marijLiking, 11: Alc, 12: AlcLiking

ddHistStruct.to4 = [];ddHistStruct.to8 = [];ddHistStruct.to12 = [];ddHistStruct.to16 = [];
ddHistStruct.to20 = [];ddHistStruct.to24 = [];ddHistStruct.to28 = [];

ddHistStructNAMES = fieldnames(ddHistStruct);

participantsOfInterest=[2,9,11,14,15,26,28,34,33,36,35,37,40,42,43,49,50,52,53,57,58,61,64,63,66,68,73];

for ii=1:length(ddHistStructNAMES)

    partMeanValues=[];
    for jj = 1:length(participantsOfInterest)
        if (jj~=11 || jj~=16)
            partIndx= find(ddStruct.(ddStructNAMES{ii})(:,1)==participantsOfInterest(jj));
            partMeanValues(jj,:) = nanmean(ddStruct.(ddStructNAMES{ii})(partIndx,:));      
        end
    end
    ddHistStruct.(ddHistStructNAMES{ii})=partMeanValues;
    
end

values4Hist=[];
for ii = 1:length(ddHistStructNAMES)
    values4Hist(ii,:)=nanmean(ddHistStruct.(ddHistStructNAMES{ii}));
end
% 
% figure
% bar(values4Hist(:,28))
% title('#Cigs')
% figure
% bar(values4Hist(:,29))
% title('How enjoyable were the cigs')
% figure
% bar(values4Hist(:,30))
% title('Marij?')
% figure
% bar(values4Hist(:,31))
% title('#AmntMarij')
% figure
% bar(values4Hist(:,32))
% title('How enjoyable was the Marij')
% figure
% bar(values4Hist(:,33))
% title('Alc?')
% figure
% bar(values4Hist(:,34))
% title('How enjoyable was the Alc')

%% MC mean, std

indxParticipantsOfInterest=find(ismember(cell2mat(allParticipantsMCSid),(participantsOfInterest')));

for ii = 1: length(indxParticipantsOfInterest)
    meanMCArray(ii,1)=PARTICIPANTS(indxParticipantsOfInterest(ii)).Demographic{end};
end
overalMCMean=mean(meanMCArray);
overalMCstd=std(meanMCArray);


%% Frequencies for ALC


%for alc onl use those specific participants (lso other substances)
temp2(:)=[];participantsOfInterestALC=[2,9,11,14,15,26,28,33,36,35,37,40,42,43,49,50,52,53,57,58,61,63,66,68,73]; %34 and 64 are omitted
for ii = 1:length(participantsOfInterestALC)
    temp1=[];
    temp1 = find(final2(:,2)==participantsOfInterestALC(ii));
    temp2(ii,1) = final2(temp1(end),59)- final2(temp1(1),59);
    temp2(ii,2)=temp2(ii,1)/7;
    temp2(ii,3)=nansum(final2(temp1,36));
    temp2(ii,4)= temp2(ii,3)/temp2(ii,2);

end

avgDrinksPerWeek=mean(temp2(:,4));

stdDrinksPerWeek=std(temp2(:,4));

%Includ all 25 participants? one drinks a lot and one only had one

%% Frequencies for Marijuana


%for alc onl use those specific participants (lso other substances)
temp2(:)=[];participantsOfInterestMarij=[2,9,11,15,26,28,33,35,37,42,49,50,52,53,58,61,63,68];%14,34,36,40,43,57,64,66,73

for ii = 1:length(participantsOfInterestMarij)
    temp1=[];
    temp1 = find(final2(:,2)==participantsOfInterestMarij(ii));
    temp2(ii,1) = final2(temp1(end),59)- final2(temp1(1),59);
    temp2(ii,2)=temp2(ii,1)/7;
    temp2(ii,3)=nansum(final2(temp1,33));
    temp2(ii,4)= temp2(ii,3)/temp2(ii,2);

end

avgGramsPerWeek=mean(temp2(:,4));

stdGramsPerWeek=std(temp2(:,4));

%Includ all 25 participants? one drinks a lot and one only had one


%% Frequencies for Mast+Vag


temp2(:)=[];participantsOfInterestSEX=[2,9,14,15,26,28,34,33,36,35,37,40,42,43,49,50,52,53,57,58,61,64,66,68,73];%11,63,


for ii = 1:length(participantsOfInterestSEX)
    temp1=[];
    temp1 = find(final2(:,2)==participantsOfInterestSEX(ii));
    temp2(ii,1) = final2(temp1(end),59)- final2(temp1(1),59);
    temp2(ii,2)=temp2(ii,1)/7;
    temp2(ii,3)=nansum(final2(temp1,[38,41]),'all');
    temp2(ii,4)= temp2(ii,3)/temp2(ii,2);

end

avgSexPerWeek=mean(temp2(:,4));

stdSexPerWeek=std(temp2(:,4));

%Includ all 25 participants? one drinks a lot and one only had one


%% Cycle variables

for ii = 1:length(participantsOfInterest)
    ndx=find(final2(:,2)==participantsOfInterest(ii));
    cycleHaus(ii,1)=participantsOfInterest(ii);
    cycleHaus(ii,2)=max(final2(ndx,1));
   
end

avgNumbOfCycles=mean(cycleHaus(:,2));
totalCycles=sum(cycleHaus(:,2));

%% Prep "kevMatrix2" matrix for figures
lep=[1:5];
he=[12:16];
hp=[20:24];
allPhases=[1:5,12:16,20:24];

%Creating a matrix with the three phases
natePhase3=find(ismember(kevMatrix(:,3),allPhases));
kevMatrix2=kevMatrix(natePhase3,:);

%Removing 6th and 7th cycles
allCycle7=find(kevMatrix2(:,1)==7);
allCycle6=find(kevMatrix2(:,1)==6);
kevMatrix2(allCycle7,:)=[];
kevMatrix2(allCycle6,:)=[];

%% Flow
%AllFlow
anyFlowINX=find(kevMatrix2(:,16)>0);
prcntFlow=[];
%Flow from each cycle
allFlowLEP=find(ismember(kevMatrix2(anyFlowINX,3),lep));
allFlowHE=find(ismember(kevMatrix2(anyFlowINX,3),he));
allFlowHP=find(ismember(kevMatrix2(anyFlowINX,3),hp));
prcntFlow(:)=[];
%Percent of flow from each cycle
prcntFlow(1,3)=(length(allFlowLEP)/length(anyFlowINX))*100;
prcntFlow(1,15)=(length(allFlowHE)/length(anyFlowINX))*100;
prcntFlow(1,22)=(length(allFlowHP)/length(anyFlowINX))*100;

%% Bloat
%All Bloat
anyBloatINX=find(kevMatrix2(:,13)>0);
prcntBloat=[];
%Bloat from each cycle
allBloatLEP=find(ismember(kevMatrix2(anyBloatINX,3),lep));
allBloatHE=find(ismember(kevMatrix2(anyBloatINX,3),he));
allBloatHP=find(ismember(kevMatrix2(anyBloatINX,3),hp));
prcntBloat(:)=[];
%Percent of Bloat from each cycle
prcntBloat(1,3)=(length(allBloatLEP)/length(anyBloatINX))*100;
prcntBloat(1,15)=(length(allBloatHE)/length(anyBloatINX))*100;
prcntBloat(1,22)=(length(allBloatHP)/length(anyBloatINX))*100;


%% Cramps
%All Cramp
anyCrampINX=find(kevMatrix2(:,15)>0);
prcntCramp=[];
%Bloat from each cycle
allCrampLEP=find(ismember(kevMatrix2(anyCrampINX,3),lep));
allCrampHE=find(ismember(kevMatrix2(anyCrampINX,3),he));
allCrampHP=find(ismember(kevMatrix2(anyCrampINX,3),hp));

prcntCramp(:)=[];
%Percent of Bloat from each cycle
prcntCramp(1,3)=(length(allCrampLEP)/length(anyCrampINX))*100;
prcntCramp(1,15)=(length(allCrampHE)/length(anyCrampINX))*100;
prcntCramp(1,22)=(length(allCrampHP)/length(anyCrampINX))*100;

%% Cigarettes mean by phase


cigMeanLEP_HE_HP=[];
for ii = 1:length(participantsOfInterest)
    
    partInd=find(kevMatrix2(:,2)==participantsOfInterest(ii));
    
    cigMeanLEP_HE_HPCHECKING(ii,1)=nanmean(kevMatrix2(partInd,30));

    allCigLEP=find(ismember(kevMatrix2(partInd,3),lep));
    allCigHE=find(ismember(kevMatrix2(partInd,3),he));
    allCigHP=find(ismember(kevMatrix2(partInd,3),hp));
    
    cigMeanLEP_HE_HP(ii,1)=nanmean(kevMatrix2(partInd(allCigLEP),30));
    cigMeanLEP_HE_HP(ii,2)=nanmean(kevMatrix2(partInd(allCigHE),30));
    cigMeanLEP_HE_HP(ii,3)=nanmean(kevMatrix2(partInd(allCigHP),30));
    
    cigEnjMedianLEP_HE_HP(ii,1)=nanmean(kevMatrix2(partInd(allCigLEP),31));
    cigEnjMedianLEP_HE_HP(ii,2)=nanmean(kevMatrix2(partInd(allCigHE),31)); %%% MEAN OR MEDIAN??????*???
    cigEnjMedianLEP_HE_HP(ii,3)=nanmean(kevMatrix2(partInd(allCigHP),31));

end
cigPhaseMean=mean(cigMeanLEP_HE_HP);
errorBarCigSEM=std(cigMeanLEP_HE_HP)/(sqrt(length(participantsOfInterest)));

%means for the figure
cigPhaseMean2=nan(1,22);
cigPhaseMean2(1,[3,15,22])=cigPhaseMean;

%STD for the figure
cigPhaseStd2=nan(1,22);
cigPhaseStd2(1,[3,15,22])=errorBarCigSEM;

cigPhaseEnjMedian=mean(cigEnjMedianLEP_HE_HP);
cigPhaseEnjStd=std(cigEnjMedianLEP_HE_HP);

%% Alc by phase

% WARNING - THIS REQUIRES THE FILE BELOW - NOT THE REGULAR "FINAL2" SHEET


%table4Kev=array2table(final2);

%writetable(table4Kev,'DD_AlcSpecific.xlsx')
[numDATAalc,textDATAalc,rawDATAalc] = xlsread('DD_AlcSpecific.xlsx'); %This is the 2nd tab of teh Bloods/Saliva spreadsheet in congroup

allCycle7=find(numDATAalc(:,1)==7);
allCycle6=find(numDATAalc(:,1)==6);
numDATAalc(allCycle7,:)=[];
numDATAalc(allCycle6,:)=[];

alcMeanLEP_HE_HP=[];
for ii = 1:length(participantsOfInterestALC)
    
    partInd=find(numDATAalc(:,2)==participantsOfInterestALC(ii));
    
    allAlcLEP=find(ismember(numDATAalc(partInd,3),lep));
    allAlcHE=find(ismember(numDATAalc(partInd,3),he));
    allAlcHP=find(ismember(numDATAalc(partInd,3),hp));
    
    %LEP
    alcFreqLEP=numDATAalc(partInd(allAlcLEP),[36:38]);
    alcFreqLEP2=nansum((alcFreqLEP),2);
    alcMeanLEP_HE_HP(ii,1)=nanmean((alcFreqLEP2));
    %HE
    alcFreqHE=numDATAalc(partInd(allAlcHE),[36:38]);
    alcFreqHE2=nansum((alcFreqHE),2);
    alcMeanLEP_HE_HP(ii,2)=nanmean((alcFreqHE2));
    %HP
    alcFreqHP=numDATAalc(partInd(allAlcHP),[36:38]);
    alcFreqHP2=nansum((alcFreqHP),2);
    alcMeanLEP_HE_HP(ii,3)=nanmean((alcFreqHP2));

    
    %alcEnjMedianLEP_HE_HP(ii,1)=nanmean(kevMatrix2(partInd(allAlcLEP),31));
    %alcEnjMedianLEP_HE_HP(ii,2)=nanmean(kevMatrix2(partInd(allAlcHE),31)); %%% MEAN OR MEDIAN??????*???
    %alcEnjMedianLEP_HE_HP(ii,3)=nanmean(kevMatrix2(partInd(allAlcHP),31));

end
%alcMeanLEP_HE_HP(isnan(alcMeanLEP_HE_HP))=0; %Use this if you would like
%to turn all NANs into ZEROS - is this proper?

alcPhaseMean=nanmean(alcMeanLEP_HE_HP);

errorBarAlcSEM=nanstd(alcPhaseMean)/(sqrt(length(participantsOfInterestALC)));

%means for the figure
alcPhaseMean2=nan(1,22);
alcPhaseMean2(1,[3,15,22])=alcPhaseMean;

%STD for the figure
alcPhaseStd2=nan(1,22);
alcPhaseStd2(1,[3,15,22])=errorBarAlcSEM;

% 
% alcPhaseEnjMedian=mean(alcEnjMedianLEP_HE_HP);
% alcPhaseEnjStd=std(alcEnjMedianLEP_HE_HP);


%% Marijuana mean by phase


MarijMeanLEP_HE_HP=[];
for ii = 16:length(participantsOfInterestMarij)
    
    partInd=find(kevMatrix2(:,2)==participantsOfInterestMarij(ii));
    
    allMarijLEP=find(ismember(kevMatrix2(partInd,3),lep));
    allMarijHE=find(ismember(kevMatrix2(partInd,3),he));
    allMarijHP=find(ismember(kevMatrix2(partInd,3),hp));
    
    MarijMeanLEP_HE_HP(ii,1)=nanmean(kevMatrix2(partInd(allMarijLEP),33));
    MarijMeanLEP_HE_HP(ii,2)=nanmean(kevMatrix2(partInd(allMarijHE),33));
    MarijMeanLEP_HE_HP(ii,3)=nanmean(kevMatrix2(partInd(allMarijHP),33));
    
    marijEnjMedianLEP_HE_HP(ii,1)=nanmean(kevMatrix2(partInd(allMarijLEP),31));
    marijEnjMedianLEP_HE_HP(ii,2)=nanmean(kevMatrix2(partInd(allMarijHE),31)); %%% MEAN OR MEDIAN??????*???
    marijEnjMedianLEP_HE_HP(ii,3)=nanmean(kevMatrix2(partInd(allMarijHP),31));

end
MarijMeanLEP_HE_HP(isnan(MarijMeanLEP_HE_HP))=0;

marijPhaseMean=nanmean(MarijMeanLEP_HE_HP);
errorBarMarijSEM=nanstd(MarijMeanLEP_HE_HP)/(sqrt(length(participantsOfInterestMarij)));

%means for the figure
marijPhaseMean2=nan(1,22);
marijPhaseMean2(1,[3,15,22])=marijPhaseMean;

%STD for the figure
marijPhaseStd2=nan(1,22);
marijPhaseStd2(1,[3,15,22])=errorBarMarijSEM;

% 
% marijPhaseEnjMedian=mean(marijEnjMedianLEP_HE_HP);
% marijPhaseEnjStd=std(marijEnjMedianLEP_HE_HP);
% 

%% Marijuana Proportion by phase (PERCENTAGE)

%All Marijuana
anyMarPropINX=find(kevMatrix2(:,32)>0);
prcntMarProp=[];
%Marijuana from each cycle
allMarPropLEP=find(ismember(kevMatrix2(anyMarPropINX,3),lep));
allMarPropHE=find(ismember(kevMatrix2(anyMarPropINX,3),he));
allMarPropHP=find(ismember(kevMatrix2(anyMarPropINX,3),hp));

prcntMarProp(:)=[];
%Percent of Marijuana from each cycle
prcntMarProp(1,3)=(length(allMarPropLEP)/length(anyMarPropINX))*100;
prcntMarProp(1,15)=(length(allMarPropHE)/length(anyMarPropINX))*100;
prcntMarProp(1,22)=(length(allMarPropHP)/length(anyMarPropINX))*100;

%% Alc Proportion by phase (PERCENTAGE)

%All alc
anyAlcPropINX=find(kevMatrix2(:,35)>0);
prcntAlcProp=[];
%alc from each cycle
allAlcPropLEP=find(ismember(kevMatrix2(anyAlcPropINX,3),lep));
allAlcPropHE=find(ismember(kevMatrix2(anyAlcPropINX,3),he));
allAlcPropHP=find(ismember(kevMatrix2(anyAlcPropINX,3),hp));

prcntAlcProp(:)=[];
%Percent of alc from each cycle
prcntAlcProp(1,3)=(length(allAlcPropLEP)/length(anyAlcPropINX))*100;
prcntAlcProp(1,15)=(length(allAlcPropHE)/length(anyAlcPropINX))*100;
prcntAlcProp(1,22)=(length(allAlcPropHP)/length(anyAlcPropINX))*100;


%% Sex by phase

anySex=nansum(kevMatrix2(:,[38,41]),2);
allSexIndx=find(anySex(:,1)>0);
prcntSex=[];
%Sex prcntAlcProp each phase
allSexLEP=find(ismember(kevMatrix2(allSexIndx,3),lep));
allSexHE=find(ismember(kevMatrix2(allSexIndx,3),he));
allSexHP=find(ismember(kevMatrix2(allSexIndx,3),hp));

prcntSex(:)=[];
%Percent of Bloat from each cycle
prcntSex(1,3)=(length(allSexLEP)/length(allSexIndx))*100;
prcntSex(1,15)=(length(allSexHE)/length(allSexIndx))*100;
prcntSex(1,22)=(length(allSexHP)/length(allSexIndx))*100;


%% Alc as a function of the week
%All alc
anyAlcINX=find(final2(:,35)==1);

for ii=1:7
    alcWeekFreq(1,ii)=length(find(final2(anyAlcINX,60)==ii));
end

totalAlcWeek = sum(alcWeekFreq);

for ii=1:7
    prcntAlcWeek(1,ii)=(alcWeekFreq(ii)/totalAlcWeek)*100;
end

prcntAlcWeek2 = prcntAlcWeek(1,[2:7,1]);
%bar(prcntAlcWeek2)


weekArray=[2:5];
weekENDArray=[6,7,1];
anyAlcINX=find(final2(:,35)==1);

allweekdays=find(ismember(final2(:,60),weekArray));
allweekENDdays=find(ismember(final2(:,60),weekENDArray));

alcWeekActivity= find(final2(allweekdays,35)==1);

prcntWeekAlc=length(alcWeekActivity)/length(anyAlcINX);

alcWeekEndActivity= find(final2(allweekENDdays,35)==1);

prcntWeekEndAlc=length(alcWeekEndActivity)/length(anyAlcINX);

% 
% [h,p] = chi2gof(x,'Alpha',0.01)




