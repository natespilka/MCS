%% Intro
%2/1/19; Nate Spilka
%the comments may have many misspellings
%The following script REQUIRES DDcode2 to run first

%% E+P SALIVA graph
% The following creates a graph that combines all participant blood-hormone
% levels

f=figure('Position', [10 10 3000 2000])%,'visible','off');

yyaxis right
s(1) = scatter(hormoneSalivaMCday(:,7),hormoneSalivaMCday(:,5),140);
ylabel('Estradiol (pg/mL)','FontSize',46);
ylim([0 2]);
set(f,'defaultAxesColorOrder',[1,0,0]);

hold on
yyaxis left
ylabel('Progesterone (ng/mL)','FontSize',46);
ylim([0 270]);
set(f,'defaultAxesColorOrder',[0,0,1]);
s(2) = scatter(hormoneSalivaMCday(:,7),hormoneSalivaMCday(:,6),140);

s(1).MarkerEdgeColor = 'r';
s(1).MarkerFaceColor = 'r';
s(2).MarkerFaceColor = 'b';
s(2).MarkerEdgeColor = 'b';

xticks([1,7,14,21,28])
xlim([0 29]);
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',36)


title('Estrogen and Progestrone Saliva Values','FontSize',60);

legend([s(1),s(2)],{'Estrogen','Progestrone'})
grid on
set(gcf,'color','w');

xlabel('Normalized Cycle Days','FontSize',46);

%print(gcf,'EPfigure.png','-dpng','-r300'); 



hold off


%% TEST SALIVA HORMONES graph
% The following creates a graph that combines all participant blood-hormone
% levels

f=figure('Position', [10 10 3000 2000])%,'visible','off');

yyaxis right
s(1) = scatter(AllhormoneSalivaMCday(:,10),AllhormoneSalivaMCday(:,7),140);
ylabel('Testosterone (pg/mL)','FontSize',46);
ylim([0 100]);
set(f,'defaultAxesColorOrder',[1,0,0]);

hold on
yyaxis left
ylabel('DHEAS (ng/mL)','FontSize',46);
ylim([0 25]);
set(f,'defaultAxesColorOrder',[0,0,1]);
s(2) = scatter(AllhormoneSalivaMCday(:,10),AllhormoneSalivaMCday(:,8),140);

s(1).MarkerEdgeColor = 'r';
s(1).MarkerFaceColor = 'r';
s(2).MarkerFaceColor = 'b';
s(2).MarkerEdgeColor = 'b';

xticks([1,7,14,21,28])
xlim([0 29]);
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',36)


title('Testosterone and DHEAS Saliva Values','FontSize',60);

legend([s(1),s(2)],{'Testosterone','DHEAS'})
grid on
set(gcf,'color','w');

xlabel('Normalized Cycle Days','FontSize',46);

%print(gcf,'EPfigure.png','-dpng','-r300'); 



hold off

%% Cortisol SALIVA HORMONES graph
% The following creates a graph that combines all participant blood-hormone
% levels

f=figure('Position', [10 10 3000 2000])%,'visible','off');

s(1) = scatter(AllhormoneSalivaMCday(:,10),AllhormoneSalivaMCday(:,9),140);
ylabel('Cortisol (ng/mL)','FontSize',46);
ylim([0 15]);
set(f,'defaultAxesColorOrder',[1,0,0]);

s(1).MarkerEdgeColor = 'r';
s(1).MarkerFaceColor = 'r';

xticks([1,7,14,21,28])
xlim([0 29]);
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',36)

title('Cortisol Saliva Values','FontSize',60);

set(gcf,'color','w');

xlabel('Normalized Cycle Days','FontSize',46);

%print(gcf,'EPfigure.png','-dpng','-r300'); 


hold off





