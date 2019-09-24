%% Memory Task analysis
%this will analyze the memory task data (recall
%4/22/19; Nate Spilka
%to run, this needs to be in the same folder as all of the data with a
%"results" folder in the same directory.

function analysis_memory2(sessids)

cd /project/psychimg2/Reagan/NBB/MemoryTask/Data
partMemFiles=[sessids,'_testNum*'];
memoryDir = dir(partMemFiles);

for ii = 1:length(memoryDir)
    
    load(memoryDir(ii).name);
    
    tmp = strfind(memoryDir(ii).name,'_');
    tmp2 = strfind(memoryDir(ii).name,'.');
    date = memoryDir(ii).name((tmp(end)+1):(tmp2-1));%YearMonthDay
      
    t = datetime(str2num(date),'ConvertFrom','yyyymmdd');
    t.Format='MM/dd/yyyy';
    t=datenum(t);
    Hit = correctPercentage(1);
    CR = correctPercentage(2);
    FA=1-CR;
    FR=1-Hit;
    dp = norminv(Hit)-norminv(FA);
    results(ii,:)= [t,Hit,CR,FA,FR,dp];

end

index = {sessids,'Date','Hit','CR','FA','FR','DP'};
testType={'Par_1 (Practice)';'Par_2';'Par_3';'Par_4';'Par_5';};
resultsArray=nan(length(testType),length(index)-1);
resultsArray(1:length(results(:,1)),1:length(results(1,:))) = results;
results=[index;testType,num2cell(resultsArray)];
cd('Results')
filename = [sessids,'_result'];
save(filename, 'results');
cd ..

end