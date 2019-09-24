%% Intro
%2/1/19; Nate Spilka
%the comments may have many misspellings
%The following script REQUIRES DDcode2 to run first

%% E:P Ratio for Bloods FIGURE

for ii = 1:length(mcDayEandP2(:,1))
    mcDayEandP2Ratio(ii,1)=mcDayEandP2(ii,5)/mcDayEandP2(ii,6);
end
figure
scatter(mcDayEandP2(:,3),mcDayEandP2Ratio(:,1))

f=figure('Position', [10 10 2000 1500]);%,'visible','off');

s(1) = scatter(mcDayEandP2(:,3),mcDayEandP2Ratio(:,1));
ylabel('Estradiol (pg/mL): Progestrone (ng/ml)','FontSize',18);
ylim([0 1200]);
set(f,'defaultAxesColorOrder',[1,0,0]);

hold on

s(1).MarkerEdgeColor = 'r';
s(1).MarkerFaceColor = 'r';

xticks([0,7,14,24,28])
xlim([0 28]);

title('Estrogen to Progestrone Ratio: Blood Values From all Participants','FontSize',20);

grid on
set(gcf,'color','w');

xlabel('Normalized Cycle Days','FontSize',18);

%saveas(gcf,sprintf('MCS_0%s.jpg',string(num2str(allParticipantsMCSid{ii,1}))))

hold off
