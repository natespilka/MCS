%% Check realignment parameters </> -2/2

%1/1/19

clear all
clc

%cd /project/psychimg2/Teri/MCS2/BOLD_REST_post/DPARSF/RealignParameter
cd /project/psychimg2/Teri/MCS2/BOLD_REST_pre/DPARSF/RealignParameter

%cd /project/psychimg2/Teri/MCS2/BOLD_Smk_Cue


participants = dir('MCS*');
minMax=[];MaxAll=[];MinAll=[];
AllPart=cell(length(participants),1);

for ii = 1:length(participants)
    %try
    greater2=[];less2=[];
    
    cd(participants(ii).name);
    %smkCueScan = dir('MCS*');%for SMK CUE SCANS
    %cd(smkCueScan(1).name); %for SMK CUE SCANS
    rpTXTfile = dir('rp*');
    
    moevmentPLOT = load(rpTXTfile(1).name);
    greater2 = find(moevmentPLOT>=2);
    less2 = find(moevmentPLOT<=-2);
    
    maxXYZ = max(moevmentPLOT(:,1:3));
    minMaxXYZ(ii,2) = max(maxXYZ);
    minXYZ = min(moevmentPLOT(:,1:3));
    minMaxXYZ(ii,1) = min(minXYZ);
    
    % Find Max/Min Movement Values (Pitch, Roll, Yaw)
    max3 = max(moevmentPLOT(:,4:6));
    minMax(ii,2) = max(max3);
    min3 = min(moevmentPLOT(:,4:6));
    minMax(ii,1) = min(min3);
   
    AllPart(1,1) = cellstr(participants(ii).name);
    MinAll(ii,1:6) = min(moevmentPLOT(:,:));
    MaxAll(ii,1:6) = max(moevmentPLOT(:,:));
    
   % if ~isempty(greater2)||~isempty(less2)
    %    disp(['Participant: ',string(participants(ii).name)])

        figure('visible','off');
        subplot(2,1,1);
        m1 = plot(moevmentPLOT(:,1));
        hold
        m2 = plot(moevmentPLOT(:,2));
        m3 = plot(moevmentPLOT(:,3));
        title(['X, Y, Z', string(participants(ii).name)],'Interpreter','none');
        set([m1,m2,m3],'LineWidth', 1.5);
        ylim([-2.5 2.5]);
        
        %Threshold lines
        meanLineMax = refline(0,2);
        meanLineMax.Color = 'k';
        meanLineMax.LineStyle  ='- -';
        meanLineMin = refline(0,-2);
        meanLineMin.Color = 'k';
        meanLineMin.LineStyle  ='- -';
        legend([m1,m2,m3,meanLineMin],{'X','Y','Z','Threshold'});

        hold off

        subplot(2,1,2);
        m4 = plot(moevmentPLOT(:,4));
        hold
        m5 = plot(moevmentPLOT(:,5));
        m6 = plot(moevmentPLOT(:,6));
        title('Pitch, Roll, Yaw');
        set([m4,m5,m6],'LineWidth', 1.5);
        yticks([-.04, -.02,  0, .02,.04,])
        ylim([-.05 .05]);

        %Threshold lines
        meanLineMax = refline(0,.04);
        meanLineMax.Color = 'k';
        meanLineMax.LineStyle  ='- -';
        meanLineMin = refline(0,-.04);
        meanLineMin.Color = 'k';
        meanLineMin.LineStyle  ='- -';
        legend([m4,m5,m6,meanLineMin],{'Pitch','Roll', 'Yaw','Threshold'});

        hold off        
        
    %  end
    
     cd ../..
     cd('MovementImages')
     saveas(gcf,sprintf('%s.jpg',string(participants(ii).name)))
     cd ..
     cd('RealignParameter')
     %cd .. %the extra is for SMK CUE SCANS.
   % catch
    %    disp(['Participant:',string(rpTXTfile(1).name),' is a problem'])    
    %end
 end

indMaxOutliersXYZ = find(minMaxXYZ(:,2)>2); %The MAX OUTLIERS indecies XYZ
indMinOutliersXYZ = find(minMaxXYZ(:,1)<-2); %The MIN OUTLIERS indecies XYZ
valuesMaxOutliersXYZ = minMaxXYZ(indMaxOutliersXYZ,2); %The MAX OUTLIERS values
valuesMinOutliersXYZ = minMaxXYZ(indMinOutliersXYZ,1); %The MIN OUTLIERS values
participants(indMaxOutliersXYZ).name
participants(indMinOutliersXYZ).name

%Max/Min Movement Values (Pitch, Roll, Yaw)
minMean = mean(minMax(:,1));
minSTD = std(minMax(:,1));
minThreshold = minMean-(2*minSTD);

maxMean = mean(minMax(:,2));
maxSTD = std(minMax(:,2));
maxThreshold = maxMean+(2*maxSTD);

indMaxOutliers = find(minMax(:,2)>maxThreshold); %The MAX OUTLIERS indecies
indMinOutliers = find(minMax(:,1)<minThreshold); %The MIN OUTLIERS indecies

valuesMaxOutliers = minMax(indMaxOutliers,2); %The MAX OUTLIERS values
valuesMinOutliers = minMax(indMinOutliers,1); %The MIN OUTLIERS values

participants(indMaxOutliers).name %The participant MCS identifiers (MAX OUTLIERS)
participants(indMinOutliers).name %The participant MCS identifiers (MIN OUTLIERS)




%% 

% 
% figure
% scatter(1:length(minMax),minMax(:,1));
% hold on;
% scatter(1:length(minMax),minMax(:,2));
% title('Max and Min Movement Values for All Participants (BOLD Resting PRE-Smk)','FontSize',20);
% xlabel('Scan #','FontSize',18);
% ylabel('Max and Min Movement Values','FontSize',18);
% ylim([-.1 .05]);
% 
% %threshold lines
% thresholdLineMax = refline(0,maxThreshold);
% thresholdLineMax.Color = 'k';
% thresholdLineMin = refline(0,minThreshold);
% thresholdLineMin.Color = 'k';
% 
% %Mean value lines
% meanLineMax = refline(0,maxMean);
% meanLineMax.Color = 'k';
% meanLineMax.LineStyle  ='- -';
% meanLineMin = refline(0,minMean);
% meanLineMin.Color = 'k';
% meanLineMin.LineStyle  ='- -';
% 
% %0 value line
% lineAtZero = refline(0,0);
% lineAtZero.Color = 'k';
% lineAtZero.LineStyle  =':';
% dim = [.725 .75 .12 .125];
% str = {'... : Zero Line','- - - : Mean (of min/max)','____ : Mean-/+2xSTD (of min/max)'};
% annotation('textbox',dim,'String',str,'FitBoxToText','on');

%% Check Normalization
% 
% f=spm_select();
% 
% for i = 1:69
% 
% figure;
% 
% imshow(deblank(f(i,:)));
% 
% end
% 
% 


