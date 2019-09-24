%% Intro
%1/1/19; Nate Spilka
%the comments may have many misspellings
%The following script REQUIRES DDcode2 to run first

%% Matching Bloods and Saliva values
% Matching Bloods and Saliva values for the same participants (in an
%attempt to quantify their relationship)
count=1;array4SandB=[];

for ii = 1:length(allParticipantsMCSid)
    try
    for uu = 1:length(PARTICIPANTS(ii).HormonesBloods(:,1))
        
        for qq = 1:length(PARTICIPANTS(ii).HormonesSaliva(:,1))
            
            if PARTICIPANTS(ii).HormonesSaliva(qq,1)==PARTICIPANTS(ii).HormonesBloods(uu,1)
                partTemp = allParticipantsMCSid{ii,1};
                bloodsInfo = PARTICIPANTS(ii).HormonesBloods(uu,[1,5,2,3]);%Date,NormDay,E,P
                salivaInfo = PARTICIPANTS(ii).HormonesSaliva(qq,[3,4]);%E,P
                array4SandB(count,:) = horzcat(partTemp,bloodsInfo,salivaInfo);
                count=count+1;
            end
        end
    end
    catch
        disp(['Participant :',num2str(allParticipantsMCSid{ii,1}),' doesnt have a match']);
    end
end
