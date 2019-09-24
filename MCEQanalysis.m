%% Intro
%4/26/19; Nate Spilka
%the comments may have many misspellings

%% mCEQ analysis
cd /project/psychimg2/Teri/Nate/DDanalysis/METADATA
%ASL Pre Craving mCEQ
[numMceqAslOrig,textMceqAslOrig,rawMceqAslOrig] = xlsread('ASL_Pre_Craving_mCEQ_scores_30April20191.xlsx');
numMceqAsl = numMceqAslOrig; %Keeping the original data. No need to omit the header becasue it is the numData

mn=[];sd=[];
for ii =1:3%LEP,HE,HP
    indx=find(numMceqAsl(:,2)==-ii);
    for jj = 3:length(numMceqAsl(1,:))
        mn(ii,jj-2)=mean(numMceqAsl(indx,jj));
        sd(ii,jj-2)=(std(numMceqAsl(indx,jj)))/sqrt(length(numMceqAsl(indx,jj)));
    end
end

indx1=find(numMceqAsl(:,2)==-1);
indx2=find(numMceqAsl(:,2)==-2);
indx3=find(numMceqAsl(:,2)==-3);

for jj = 3:length(numMceqAsl(1,:))
    
    [h,p(1,jj-2)]=ttest(numMceqAsl(indx1,jj),numMceqAsl(indx2,jj));%LEP VS HE
    [h,p(2,jj-2)]=ttest(numMceqAsl(indx1,jj),numMceqAsl(indx3,jj));%LEP VS HP
    [h,p(3,jj-2)]=ttest(numMceqAsl(indx2,jj),numMceqAsl(indx3,jj));%HE VS HP
    
end

