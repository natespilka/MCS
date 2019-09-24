%% Code that I do not use often but do not want to delete
%Most of this will require DDcode2 to run first to initialize variables,
%structures, etc.

%This is a "non-junk-junkyard" file. It is a conglomerate of scripts
%related to the MCS study. 

%Began ~10/1/19
%finished ~3/1/19

%% Spreadsheet for Reagan (saliva, MCEQ, WSRS, etc.)
% reaganData2=[];count =1;
% for ii = 1:length(allParticipantsMCSid(:,1))
%     for qq = 1:3
%         reaganData1=[];
%         try
%         for jj = 1:length(PARTICIPANTS(ii).Shiff_Jarv(:,1))
%             if qq == PARTICIPANTS(ii).Shiff_Jarv(jj,1)
%                 reaganData1 = [reaganData1, PARTICIPANTS(ii).Shiff_Jarv(jj,:)];
%             end
%         end
%         reaganData2(count,:)= [allParticipantsMCSid{ii,1},reaganData1];
%         count = count+1;
%         catch
%         end
%     end
% end
% % 
% % reaganData2FINAL = cell2table(num2cell(reaganData2));
% % writetable(reaganData2FINAL,'shiffDATA1.txt');
% 
% partArray=[];
% reaganData=[];reaganDataFinal1=[]
% for ii = 2:length(allParticipantsMCSid(:,1))
%     try
%     partArray(1:3,1) = allParticipantsMCSid{ii,1};
%    
%     reaganData = [partArray PARTICIPANTS(ii).HormonesSaliva PARTICIPANTS(ii).MCEQ1(:,4:end) PARTICIPANTS(ii).MCEQ2(:,3:end) PARTICIPANTS(ii).WSRS(:,3:end)];
%     
%     reaganDataFinal1 = vertcat(reaganDataFinal1, reaganData);
%     catch
%     end
% end
% % 
% reaganDataFinal1FINAL = cell2table(num2cell(reaganDataFinal1));
% writetable(reaganDataFinal1FINAL,'TDmeasures2.txt');
% 
% 
% % 
% 
% % 
% %     PARTICIPANTS(ii).SHQ
% %     PARTICIPANTS(ii).FTND
% 
% 
% t = datetime(reaganDataFinal1(:,3),'ConvertFrom','datenum')
% t.Format = 'dd/MM/yy'
% reaganDataFinal1(:,3)=t;


% 
% 
% for ii = 1:length(allParticipantsMCSid(:,1))
%     try
%     partArray(1:3,1) = allParticipantsMCSid{ii,1};
%    
%     reaganData = [ PARTICIPANTS(ii).HormonesSaliva];
%     
%     reaganDataFinal1 = vertcat(reaganDataFinal1, reaganData);
%     catch
%     end
% end
% reaganDataSHQFinal=[];reaganDataSHQ=[];
% for ii = 1:length(allParticipantsMCSid(:,1))
%    % try
%    
%     reaganDataSHQ = [allParticipantsMCSid{ii,1} PARTICIPANTS(ii).SHQ];
%     
%     reaganDataSHQFinal = vertcat(reaganDataSHQFinal, reaganDataSHQ);
% 
% end



%% BART + other measures SPreadsheet creator

%to convert pg/ml we multiply the ng/ml by 1000 (progesterone#*1000)

%PROBLEM PARTICIPANTS:
%LEP: 014LEP,057LEP. 11HE, 34HE, 58HE
% 
% dateExceptionsBART = [43032, 43389, 43033, 43166];
% 
% phaseStruct.LEP = rawLEP_TDs;
% phaseStruct.HE = rawHE_TDs;
% phaseStruct.HP = rawHP_TDs;
% hormoneNames = fieldnames(phaseStruct);
% 
% 
% temp = [];
% hormBartDataStruct.LEP = temp;
% hormBartDataStruct.HE = temp;
% hormBartDataStruct.HP = temp;
% 
% hormBartDataNames = fieldnames(hormBartDataStruct);
% 
% 
% for gg = 1:length(fieldnames(phaseStruct))
% 
%     count=1;array1=[];
%     for jj = 1:length(phaseStruct.(hormoneNames{gg})) %itterate through hormone spreadsheet
%         for ii = 1:length(allParticipantsMCSid(:,1))%itterate through participants MCSid
%             if phaseStruct.(hormoneNames{gg}){jj,1}==allParticipantsMCSid{ii,1}
% 
%                 for qq = 1:3
%                     try
%                     if nbbCellBartScores{ii,qq}(1,2)== phaseStruct.(hormoneNames{gg}){jj,2} %For the BART
%                    % if numSRCT_Scores{ii,qq}(1,2)== phaseStruct.(hormoneNames{gg}){jj,2} %For the SRCT
% 
%                    %     numSRCT_Scores
% 
%                         index1 = find(PARTICIPANTS(ii).BART(:,1)== phaseStruct.(hormoneNames{gg}){jj,2});
%                         index2 = find(PARTICIPANTS(ii).HormonesSaliva(:,1)==phaseStruct.(hormoneNames{gg}){jj,2});
%                         %index3 = find(PARTICIPANTS(ii).HormonesBloods(:,1)==rawLEP_TDs{jj,2});
%                         %index4 = find(PARTICIPANTS(ii).HAM_A(:,1)==rawLEP_TDs{jj,2});
%                         %index5 = find(PARTICIPANTS(ii).HAM_D(:,1)==rawLEP_TDs{jj,2});
%                         
%                         
%                         bartPumpsPops = PARTICIPANTS(26).BART(:,2:4);%ADD the BART
%                         hormoneData = cell2mat(phaseStruct.(hormoneNames{gg})(jj,1:4)); %cols 1-5 LEPtd 
%                         SalivaData = PARTICIPANTS(ii).HormonesSaliva(index2,3:end);%cols6-11 Saliva Hormones
%                         %BloodData = PARTICIPANTS(ii).HormonesBloods(index3,2:end);%cols 12&13 blood Hormones
% 
%                         EtoPratioSaliva = SalivaData(1,1)/SalivaData(1,2); %Saliva E:P ratio
%                         %EtoPratioBloods = BloodData(1,1)/BloodData(1,2); %Bloods E:P ratio
%                         cpd = PARTICIPANTS(ii).Demographic{1,8};%CPD
%                         ftndScore = PARTICIPANTS(ii).FTND(end); %FTND
%                      %   hamAScore = PARTICIPANTS(ii).HAM_A(index4,3);%HAM A
%                       %  hamDScore = PARTICIPANTS(ii).HAM_D(index5,3);%HAM D
% 
%                         temp=[];
%                         temp = find(PARTICIPANTS(ii).CompletedDDdatesAppended(:,1)==(phaseStruct.(hormoneNames{gg}){jj,2}+1));
% 
%                         if isempty(temp)
%                             temp2 = NaN(1,25);
%                             disp(['participant=',num2str(allParticipantsMCSid{ii}),' cell=',num2str(qq)])
%                             hormBartDataStruct.(hormBartDataNames{gg})(count,:) = [hormoneData,SalivaData,EtoPratioSaliva,bartPumpsPops, cpd,ftndScore,temp2];
%                             count = count+1;
%                         elseif ~isempty(temp)
%                             mood = PARTICIPANTS(ii).Mood(temp,1:end);
%                             mensSympt = PARTICIPANTS(ii).MensSymptoms(temp,1:end);
%                             sleep = PARTICIPANTS(ii).Sleep((temp-1),1:end);
%                             hormBartDataStruct.(hormBartDataNames{gg})(count,:) = [hormoneData,SalivaData,EtoPratioSaliva,bartPumpsPops, cpd,ftndScore,cell2mat(mood),cell2mat(mensSympt)];
%                             count = count+1;
%                         end
%                     end
%                     catch
%                        disp(['Compiling Bart Massive dataset - Issues with participant ',num2str(allParticipantsMCSid{ii})]) 
%                     end
%                 end
%             end
%         end
%     end
% end

%% Repeated Measures ANOVA 
% rowVecPart = [1:length(prefMean)]';
% 
% t=table(rowVecPart,prefMean(:,1),prefMean(:,2),prefMean(:,3),prefMean(:,4),...
% 
%     prefMean(:,5),prefMean(:,6),prefMean(:,7),prefMean(:,8),prefMean(:,9),prefMean(:,10),...
% 
%     prefMean(:,11),prefMean(:,12),'VariableNames',{'Participants','Exposure1','Exposure2','Exposure3',...
% 
%     'Exposure4','Exposure5','Exposure6','Exposure7','Exposure8','Exposure9','Exposure10','Exposure11','Exposure12'});
% 
% expos=table([1:12]','VariableNames',{'Exposures'});
% 
%  
% 
% rm = fitrm(t,'Exposure1-Exposure12~Participants','WithinDesign',expos);
% 
%  
% 
% rmaResults = ranova(rm);
% 
%  

