%The following is for MCS participants

%12/1/18

%% BOLD and Struct

clear all
clc
subjects = char('MCS_068_');
TD1='TD1';
TD2='TD2';
TD3='TD3';

    command=['ls /project/psychimg2/Teri/MCS2/Anatomical/',subjects,TD1,'/MCS*struct.nii'];
    [p,struct1] = system(command);
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_Smk_Cue/',subjects,TD1,'/M*/M*007.*'];
    [p,BOLD1] = system(command);

    command=['ls /project/psychimg2/Teri/MCS2/Anatomical/',subjects,TD2,'/MCS*struct.nii'];
    [p,struct2] = system(command);
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_Smk_Cue/',subjects,TD2,'/M*/M*007.*'];
    [p,BOLD2] = system(command);
    
    command=['ls /project/psychimg2/Teri/MCS2/Anatomical/',subjects,TD3,'/MCS*struct.nii'];
    [p,struct3] = system(command);
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_Smk_Cue/',subjects,TD3,'/M*/M*007.*'];
    [p,BOLD3] = system(command);
    
    
    spm_check_registration(BOLD1,struct1,BOLD2,struct2,BOLD3,struct3)

%% BOLD and BOLD meanu

clear all
clc
subjects = char('MCS_068_');
TD1='TD1';
TD2='TD2';
TD3='TD3';
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_Smk_Cue/',subjects,TD1,'/M*/M*007.*'];
    [p,BOLD1] = system(command);
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_Smk_Cue/',subjects,TD1,'/M*/meanuMCS*.*'];
    [p,BOLDu1] = system(command);

    command=['ls /project/psychimg2/Teri/MCS2/BOLD_Smk_Cue/',subjects,TD2,'/M*/M*007.*'];
    [p,BOLD2] = system(command);
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_Smk_Cue/',subjects,TD2,'/M*/meanuMCS*.*'];
    [p,BOLDu2] = system(command);

    command=['ls /project/psychimg2/Teri/MCS2/BOLD_Smk_Cue/',subjects,TD3,'/M*/M*007.*'];
    [p,BOLD3] = system(command);    
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_Smk_Cue/',subjects,TD3,'/M*/meanuMCS*.*'];
    [p,BOLDu3] = system(command);

    
    
    spm_check_registration(BOLD1,BOLDu1,BOLD2,BOLDu2,BOLD3,BOLDu3)


%% Koala-ty Check

clear all
clc
subjects = char('MCS_073_');
TD1='TD1';
TD2='TD2';
TD3='TD3';


    command=['ls /project/psychimg2/Teri/MCS2/Anatomical/',subjects,TD1,'/MCS*struct.nii'];
    [p,struct1] = system(command);%struct
    
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_REST_post/DPARSF/FunImg/',subjects,TD1,'_POST/M*007.*'];
    [p,BoldRestPost1] = system(command);%BOLD rest post
    
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_REST_pre/DPARSF/FunImg/',subjects,TD1,'_PRE/M*007.*'];
    [p,BoldRestPre1] = system(command);%BOLD rest pre

    command=['ls /project/psychimg2/Teri/MCS2/BOLD_Smk_Cue/',subjects,TD1,'/M*/M*007.*'];
    [p,BOLD1] = system(command);%BOLD Unprocessed
    
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_Smk_Cue/',subjects,TD1,'/M*/meanuMCS*.*'];
    [p,BOLDu1] = system(command);%BOLD Processed

    %Potential alteration needed
    command=['ls /project/psychimg2/Teri/MCS2/work/',subjects,TD1,'/nii/ASL*MeanPerf_0018/s*.nii'];%Potential alteration needed
    [p,perfPost1] = system(command);%Perfusion post
    %Potential alteration needed
    
    %Potential alteration needed
    command=['ls /project/psychimg2/Teri/MCS2/work/',subjects,TD1,'/nii/ASL*MeanPerf_0011/s*.nii'];%Potential alteration needed
    [p,perfPre1] = system(command);%Perfusion pre
    %Potential alteration needed

%%%%%%%%%%%%%%%%%%%%%%%%

    command=['ls /project/psychimg2/Teri/MCS2/Anatomical/',subjects,TD2,'/MCS*struct.nii'];
    [p,struct2] = system(command);%struct
    
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_REST_post/DPARSF/FunImg/',subjects,TD2,'_POST/M*007.*'];
    [p,BoldRestPost2] = system(command);%BOLD rest post
    
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_REST_pre/DPARSF/FunImg/',subjects,TD2,'_PRE/M*007.*'];
    [p,BoldRestPre2] = system(command);%BOLD rest pre

    command=['ls /project/psychimg2/Teri/MCS2/BOLD_Smk_Cue/',subjects,TD2,'/M*/M*007.*'];
    [p,BOLD2] = system(command);%BOLD Unprocessed
    
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_Smk_Cue/',subjects,TD2,'/M*/meanuMCS*.*'];
    [p,BOLDu2] = system(command);%BOLD Processed
    
    %Potential alteration needed
    command=['ls /project/psychimg2/Teri/MCS2/work/',subjects,TD2,'/nii/ASL*MeanPerf_0018/s*.nii'];%Potential alteration needed
    [p,perfPost2] = system(command);%Perfusion post
    %Potential alteration needed
    
    %Potential alteration needed
    command=['ls /project/psychimg2/Teri/MCS2/work/',subjects,TD2,'/nii/ASL*MeanPerf_0011/s*.nii'];%Potential alteration needed
    [p,perfPre2] = system(command);%Perfusion pre
    %Potential alteration needed

%%%%%%%%%%%%%%%%%%%%%%%%

    command=['ls /project/psychimg2/Teri/MCS2/Anatomical/',subjects,TD3,'/MCS*struct.nii'];
    [p,struct3] = system(command);%struct
    
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_REST_post/DPARSF/FunImg/',subjects,TD3,'_POST/M*007.*'];
    [p,BoldRestPost3] = system(command);%BOLD rest post
    
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_REST_pre/DPARSF/FunImg/',subjects,TD3,'_PRE/M*007.*'];
    [p,BoldRestPre3] = system(command);%BOLD Unprocessed
    
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_Smk_Cue/',subjects,TD3,'/M*/M*007.*'];
    [p,BOLD3] = system(command);%BOLD Unprocessed
    
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_Smk_Cue/',subjects,TD3,'/M*/meanuMCS*.*'];
    [p,BOLDu3] = system(command);%BOLD Processed
   
    %Potential alteration needed
    command=['ls /project/psychimg2/Teri/MCS2/work/',subjects,TD3,'/nii/ASL*MeanPerf_0018/s*.nii'];%Potential alteration needed
    [p,perfPost3] = system(command);%Perfusion post
    %Potential alteration needed

    %Potential alteration needed
    command=['ls /project/psychimg2/Teri/MCS2/work/',subjects,TD3,'/nii/ASL*MeanPerf_0011/s*.nii'];%Potential alteration needed
    [p,perfPre3] = system(command);%Perfusion pre
    %Potential alteration needed

%%%    %%%    %%%   %%%
    
    spm_check_registration(...
        struct1,BoldRestPost1,BoldRestPre1,BOLD1,BOLDu1,perfPost1,perfPre1,...
        struct2,BoldRestPost2,BoldRestPre2,BOLD2,BOLDu2,perfPost2,perfPre2,...
        struct3,BoldRestPost3,BoldRestPre3,BOLD3,BOLDu3,perfPost3,perfPre3)
    
    
    
%% Koala-ty Check with Anatomicals

clear all
clc
subjects = char('MCS_066_');
TD1='TD1';
TD2='TD2';
TD3='TD3';


    command=['ls /project/psychimg2/Teri/MCS2/Anatomical/',subjects,TD1,'/MCS*struct.nii'];
    [p,struct1] = system(command);%struct
    
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_REST_post/DPARSF/FunImg/',subjects,TD1,'_POST/M*007.*'];
    [p,BoldRestPost1] = system(command);%BOLD rest post
    
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_REST_pre/DPARSF/FunImg/',subjects,TD1,'_PRE/M*007.*'];
    [p,BoldRestPre1] = system(command);%BOLD rest pre

    command=['ls /project/psychimg2/Teri/MCS2/BOLD_Smk_Cue/',subjects,TD1,'/M*/M*007.*'];
    [p,BOLD1] = system(command);%BOLD Unprocessed

    command=['ls /project/psychimg2/Teri/MCS2/perf_rest_post/Anatomical/',subjects,TD1,'/M*struct.*'];
    [p,perfPostAnat1] = system(command);%Perfusion post ANATOMICAL
    
    %Potential alteration needed
    command=['ls /project/psychimg2/Teri/MCS2/work/',subjects,TD1,'/nii/ASL*MeanPerf_0018/s*.nii'];%Potential alteration needed
    [p,perfPost1] = system(command);%Perfusion pre
    %Potential alteration needed
    
    command=['ls /project/psychimg2/Teri/MCS2/perf_rest_pre/Anatomical/',subjects,TD1,'/M*struct.*'];
    [p,perfPreAnat1] = system(command);%Perfusion pre ANATOMICAL
    
    %Potential alteration needed
    command=['ls /project/psychimg2/Teri/MCS2/work/',subjects,TD1,'/nii/ASL*MeanPerf_0011/s*.nii'];%Potential alteration needed
    [p,perfPre1] = system(command);%Perfusion pre
    %Potential alteration needed

%%%%%%%%%%%%%%%%%%%%%%%%

    command=['ls /project/psychimg2/Teri/MCS2/Anatomical/',subjects,TD2,'/MCS*struct.nii'];
    [p,struct2] = system(command);%struct
    
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_REST_post/DPARSF/FunImg/',subjects,TD2,'_POST/M*007.*'];
    [p,BoldRestPost2] = system(command);%BOLD rest post
    
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_REST_pre/DPARSF/FunImg/',subjects,TD2,'_PRE/M*007.*'];
    [p,BoldRestPre2] = system(command);%BOLD rest pre

    command=['ls /project/psychimg2/Teri/MCS2/BOLD_Smk_Cue/',subjects,TD2,'/M*/M*007.*'];
    [p,BOLD2] = system(command);%BOLD Unprocessed
    
    command=['ls /project/psychimg2/Teri/MCS2/perf_rest_post/Anatomical/',subjects,TD2,'/M*struct.*'];
    [p,perfPostAnat2] = system(command);%Perfusion post ANATOMICAL
    
    %Potential alteration needed
    command=['ls /project/psychimg2/Teri/MCS2/work/',subjects,TD2,'/nii/ASL*MeanPerf_0018/s*.nii'];%Potential alteration needed
    [p,perfPost2] = system(command);%Perfusion pre
    %Potential alteration needed
    
    command=['ls /project/psychimg2/Teri/MCS2/perf_rest_pre/Anatomical/',subjects,TD2,'/M*struct.*'];
    [p,perfPreAnat2] = system(command);%Perfusion pre ANATOMICAL
    
    %Potential alteration needed
    command=['ls /project/psychimg2/Teri/MCS2/work/',subjects,TD2,'/nii/ASL*MeanPerf_0011/s*.nii'];%Potential alteration needed
    [p,perfPre2] = system(command);%Perfusion pre
    %Potential alteration needed

%%%%%%%%%%%%%%%%%%%%%%%%

    command=['ls /project/psychimg2/Teri/MCS2/Anatomical/',subjects,TD3,'/MCS*struct.nii'];
    [p,struct3] = system(command);%struct
    
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_REST_post/DPARSF/FunImg/',subjects,TD3,'_POST/M*007.*'];
    [p,BoldRestPost3] = system(command);%BOLD rest post
    
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_REST_pre/DPARSF/FunImg/',subjects,TD3,'_PRE/M*007.*'];
    [p,BoldRestPre3] = system(command);%BOLD Unprocessed
    
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_Smk_Cue/',subjects,TD3,'/M*/M*007.*'];
    [p,BOLD3] = system(command);%BOLD Unprocessed
    
    command=['ls /project/psychimg2/Teri/MCS2/perf_rest_post/Anatomical/',subjects,TD3,'/M*struct.*'];
    [p,perfPostAnat3] = system(command);%Perfusion post ANATOMICAL
    
    %Potential alteration needed
    command=['ls /project/psychimg2/Teri/MCS2/work/',subjects,TD3,'/nii/ASL*MeanPerf_0018/s*.nii'];%Potential alteration needed
    [p,perfPost3] = system(command);%Perfusion pre
    %Potential alteration needed

    command=['ls /project/psychimg2/Teri/MCS2/perf_rest_pre/Anatomical/',subjects,TD3,'/M*struct.*'];
    [p,perfPreAnat3] = system(command);%Perfusion post ANATOMICAL
    
    %Potential alteration needed
    command=['ls /project/psychimg2/Teri/MCS2/work/',subjects,TD3,'/nii/ASL*MeanPerf_0011/s*.nii'];%Potential alteration needed
    [p,perfPre3] = system(command);%Perfusion pre
    %Potential alteration needed

%%%    %%%    %%%   %%%
    
    spm_check_registration(...
        struct1,BoldRestPost1,BoldRestPre1,BOLD1,perfPostAnat1,perfPost1,perfPreAnat1,perfPre1,...
        struct2,BoldRestPost2,BoldRestPre2,BOLD1,perfPostAnat2,perfPost2,perfPreAnat2,perfPre2,...
        struct3,BoldRestPost3,BoldRestPre3,BOLD1,perfPostAnat3,perfPost3,perfPreAnat3,perfPre3)
    
    
%% Images to check after each scan
    
clear all
clc
subjects = char('MCS_077_');
TD='TD2';



    command=['ls /project/psychimg2/Teri/MCS2/Anatomical/',subjects,TD,'/MCS*struct.nii'];
    [p,struct1] = system(command);%struct
    
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_REST_post/DPARSF/FunImg/',subjects,TD,'_POST/M*007.*'];
    [p,BoldRestPost1] = system(command);%BOLD rest post
        
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_REST_post/DPARSF/T1Img/',subjects,TD,'_POST/M*struct.*'];
    [p,BoldRestPostStruct1] = system(command);%BOLD rest post T IMAGE
    
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_REST_pre/DPARSF/FunImg/',subjects,TD,'_PRE/M*007.*'];
    [p,BoldRestPre1] = system(command);%BOLD rest pre

    command=['ls /project/psychimg2/Teri/MCS2/BOLD_REST_pre/DPARSF/T1Img/',subjects,TD,'_PRE/M*struct.*'];
    [p,BoldRestPreStruct1] = system(command);%BOLD rest post T IMAGE
    
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_Smk_Cue/',subjects,TD,'/M*/M*007.*'];
    [p,BOLD1] = system(command);%BOLD Unprocessed
   
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_ITC/',subjects,TD,'/M*ITC1/M*007.*'];
    [p,BOLDitc1] = system(command);%BOLD Unprocessed
    
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_ITC/',subjects,TD,'/M*ITC2/M*007.*'];
    [p,BOLDitc2] = system(command);%BOLD Unprocessed

    command=['ls /project/psychimg2/Teri/MCS2/perf_rest_post/Anatomical/',subjects,TD,'/M*struct.*'];
    [p,perfPostAnat1] = system(command);%Perfusion post ANATOMICAL
    
    command=['ls /project/psychimg2/Teri/MCS2/perf_rest_post/',subjects,TD,'/M*/M*007.*'];
    [p,perfPost1] = system(command);%Perfusion post
    
    command=['ls /project/psychimg2/Teri/MCS2/perf_rest_pre/Anatomical/',subjects,TD,'/M*struct.*'];
    [p,perfPreAnat1] = system(command);%Perfusion pre ANATOMICAL
    
    command=['ls /project/psychimg2/Teri/MCS2/perf_rest_pre/',subjects,TD,'/M*/M*007.*'];
    [p,perfPre1] = system(command);%Perfusion pre
    
    
      spm_check_registration(struct1,BoldRestPost1,BoldRestPostStruct1,...
          BoldRestPre1,BoldRestPreStruct1, BOLD1,BOLDitc1,BOLDitc2,perfPostAnat1,perfPost1,perfPreAnat1,perfPre1)
    
    %BOLDitc1,BOLDitc2,
%% Imaging Meeting participant Images to present
    
clear all
clc
subjects = char('MCS_066_');
TD='TD2';



    command=['ls /project/psychimg2/Teri/MCS2/Anatomical/',subjects,TD,'/MCS*struct.nii'];
    [p,struct1] = system(command);%struct
    
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_REST_post/DPARSF/FunImg/',subjects,TD,'_POST/M*007.*'];
    [p,BoldRestPost1] = system(command);%BOLD rest post
    
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_REST_pre/DPARSF/FunImg/',subjects,TD,'_PRE/M*007.*'];
    [p,BoldRestPre1] = system(command);%BOLD rest pre

    command=['ls /project/psychimg2/Teri/MCS2/BOLD_Smk_Cue/',subjects,TD,'/M*/M*007.*'];
    [p,BOLD1] = system(command);%BOLD Unprocessed

    command=['ls /project/psychimg2/Teri/MCS2/perf_rest_post/Anatomical/',subjects,TD,'/M*struct.*'];
    [p,perfPostAnat1] = system(command);%Perfusion post ANATOMICAL
    
    %Potential alteration needed
    command=['ls /project/psychimg2/Teri/MCS2/work/',subjects,TD,'/nii/ASL*MeanPerf_0018/s*.nii'];%Potential alteration needed
    [p,perfPost1] = system(command);%Perfusion post
    %Potential alteration needed
   
    command=['ls /project/psychimg2/Teri/MCS2/perf_rest_pre/Anatomical/',subjects,TD,'/M*struct.*'];
    [p,perfPreAnat1] = system(command);%Perfusion pre ANATOMICAL
    
    %Potential alteration needed
    command=['ls /project/psychimg2/Teri/MCS2/work/',subjects,TD,'/nii/ASL*MeanPerf_0011/s*.nii'];%Potential alteration needed
    [p,perfPre1] = system(command);%Perfusion pre
    %Potential alteration needed
    
      spm_check_registration(struct1,BoldRestPost1,BoldRestPre1,BOLD1,perfPostAnat1,perfPost1,perfPreAnat1,perfPre1)
    
      
%%   Check Alc cues

clear all
clc
subjects = char('MCS_052_');
TD='TD3';
    command=['ls /project/psychimg2/Teri/MCS2/BOLD_Alc_Cue/',subjects,TD,'/M*/M*007.*'];
    [p,BOLD1] = system(command);%BOLD Unprocessed
    
    spm_check_registration(BOLD1)
    
%% Movement

clear all
clc
subjects = char('MCS_077_TD2');
sufixBOLD = '_BOLD_Smk';
subjSufBOLD = [subjects,sufixBOLD];
cd /project/psychimg2/Teri/MCS2/BOLD_Smk_Cue
t=dir(subjects);
cd(subjects)
for ii =1:length(t)
    if strcmp(t(ii).name,subjSufBOLD)
        cd(t(ii).name)
    end
end

movementTXT = ['rp_',subjects,'_00001.txt'];

moevmentPLOT = load(movementTXT);

figure
subplot(2,1,1);
m1 = plot(moevmentPLOT(:,1));
hold
m2 = plot(moevmentPLOT(:,2));
m3 = plot(moevmentPLOT(:,3));
title(['X, Y, Z',string(subjects)],'Interpreter','none');
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
ylim([-.06 .06]);

%Threshold lines
meanLineMax = refline(0,.02);
meanLineMax.Color = 'k';
meanLineMax.LineStyle  ='- -';
meanLineMin = refline(0,-.02);
meanLineMin.Color = 'k';
meanLineMin.LineStyle  ='- -';
legend([m4,m5,m6,meanLineMin],{'Pitch','Roll', 'Yaw','Threshold'});
cd ../../..
set(gcf,'color','w');
hold off








    
    
    