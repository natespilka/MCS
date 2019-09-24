%% Figure FLOW (PERCENTAGE)

%4/1/19

%figure('Position', [10 10 3000 2000],'visible','off');

mcImage=imread('MCexpectedE_P2.png');
min_x = 0;
max_x = 29;
min_y = 0;
max_y = 100;

imagesc([min_x max_x], [min_y max_y], flipud(mcImage))
colormap(gray);
hold on
bar(prcntFlow,2.8,'FaceAlpha',.75,'EdgeColor','none');
prcntFlow=round(prcntFlow,2)
values=string(prcntFlow);
values(find(ismember(values,'0')))=' ';

values([3,15,22])=[values([3,15,22])+'%'];

xlabelNames={'Menstruation (Days 1-5)';'Ovulation (Days 12-16)';'Mid-Luteal (Days 20-24)'};
set(gca,'ydir','normal','xtick',[3,15,22],'xticklabel',xlabelNames,'TickLength',[0 0],'FontSize',32);
flipdim(mcImage,1);

title('Proportion of Reported Flow Between the Phases','FontSize',60);

text(1:length(prcntFlow),prcntFlow,values,'HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',26); 

ylabel('Proportion of Reported Flow','FontSize',46);
ylim([0 110]);
yticks([0:20:100]);
box off
set(gcf,'color','w');
txt = {'Progesterone: Dashed Line','Estrogen: Solid Line'};
text(25,100,txt,'FontSize',22)
ytickformat('percentage');

%print(gcf,'Flowfigure.png','-dpng','-r300'); 


hold off

%% Figure Bloat (PERCENTAGE)

mcImage=imread('MCexpectedE_P2.png');
min_x = 0;
max_x = 29;
min_y = 0;
max_y = 100;
 
figure('Position', [10 10 3000 2000],'visible','off');

imagesc([min_x max_x], [min_y max_y], flipud(mcImage))
colormap(gray);
hold on
bar(prcntBloat,2.8,'FaceAlpha',.75,'EdgeColor','none');
prcntBloat=round(prcntBloat,2)
values=string(prcntBloat);
values(find(ismember(values,'0')))=' ';

values([3,15,22])=[values([3,15,22])+'%'];

xlabelNames={'Menstruation (Days 1-5)';'Ovulation (Days 12-16)';'Mid-Luteal (Days 20-24)'};
set(gca,'ydir','normal','xtick',[3,15,22],'xticklabel',xlabelNames,'TickLength',[0 0],'FontSize',32);
flipdim(mcImage,1);

title('Proportion of Reported Bloating Between the Phases','FontSize',60);

text(1:length(prcntBloat),prcntBloat,values,'HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',26); 

ylabel('Proportion of Reported Bloating','FontSize',46);
ylim([0 110]);
yticks([0:20:100]);
box off
set(gcf,'color','w');
txt = {'Progesterone: Dashed Line','Estrogen: Solid Line'};
text(25,100,txt,'FontSize',22)
ytickformat('percentage');

print(gcf,'Bloatingfigure.png','-dpng','-r300'); 


hold off

%% Figure Cramp (PERCENTAGE)

mcImage=imread('MCexpectedE_P2.png');
min_x = 0;
max_x = 29;
min_y = 0;
max_y = 100;
 
figure('Position', [10 10 3000 2000],'visible','off');

imagesc([min_x max_x], [min_y max_y], flipud(mcImage))
colormap(gray);
hold on
bar(prcntCramp,2.8,'FaceAlpha',.75,'EdgeColor','none');
prcntCramp=round(prcntCramp,2)
values=string(prcntCramp);
values(find(ismember(values,'0')))=' ';

values([3,15,22])=[values([3,15,22])+'%'];

xlabelNames={'Menstruation (Days 1-5)';'Ovulation (Days 12-16)';'Mid-Luteal (Days 20-24)'};
set(gca,'ydir','normal','xtick',[3,15,22],'xticklabel',xlabelNames,'TickLength',[0 0],'FontSize',32);
flipdim(mcImage,1);

title('Proportion of Reported Cramping Between the Phases','FontSize',60);

text(1:length(prcntCramp),prcntCramp,values,'HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',26); 

ylabel('Proportion of Reported Cramping','FontSize',46);
ylim([0 110]);
yticks([0:20:100]);
box off
set(gcf,'color','w');
txt = {'Progesterone: Dashed Line','Estrogen: Solid Line'};
text(25,100,txt,'FontSize',22)
ytickformat('percentage');

print(gcf,'Crampsfigure.png','-dpng','-r300'); 


hold off



%% Figure Sex (PERCENTAGE)

mcImage=imread('MCexpectedE_P2.png');
min_x = 0;
max_x = 29;
min_y = 0;
max_y = 100;
 
figure('Position', [10 10 3000 2000],'visible','off');

imagesc([min_x max_x], [min_y max_y], flipud(mcImage))
colormap(gray);
hold on
bar(prcntSex,2.8,'FaceAlpha',.75,'EdgeColor','none');
prcntSex=round(prcntSex,2)
values=string(prcntSex);
values(find(ismember(values,'0')))=' ';

values([3,15,22])=[values([3,15,22])+'%'];

xlabelNames={'Menstruation (Days 1-5)';'Ovulation (Days 12-16)';'Mid-Luteal (Days 20-24)'};
set(gca,'ydir','normal','xtick',[3,15,22],'xticklabel',xlabelNames,'TickLength',[0 0],'FontSize',32);
flipdim(mcImage,1);

title('Proportion of Reported Sexual Activity Between the Phases','FontSize',60);

text(1:length(prcntSex),prcntSex,values,'HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',26); 

ylabel('Proportion of Reported Sexual Activity','FontSize',46);
ylim([0 110]);
yticks([0:20:100]);
box off
set(gcf,'color','w');
txt = {'Progesterone: Dashed Line','Estrogen: Solid Line'};
text(25,100,txt,'FontSize',22)
ytickformat('percentage');

print(gcf,'Sexfigure.png','-dpng','-r300'); 

hold off

%% Figure Marijuana (PERCENTAGE)

mcImage=imread('MCexpectedE_P2.png');
min_x = 0;
max_x = 29;
min_y = 0;
max_y = 100;
 
%figure('Position', [10 10 3000 2000]);%,'visible','off');

imagesc([min_x max_x], [min_y max_y], flipud(mcImage))
colormap(gray);
hold on
bar(prcntMarProp,2.8,'FaceAlpha',.75,'EdgeColor','none');
prcntMarProp=round(prcntMarProp,2)
values=string(prcntMarProp);
values(find(ismember(values,'0')))=' ';

values([3,15,22])=[values([3,15,22])+'%'];

xlabelNames={'Menstruation (Days 1-5)';'Ovulation (Days 12-16)';'Mid-Luteal (Days 20-24)'};
set(gca,'ydir','normal','xtick',[3,15,22],'xticklabel',xlabelNames,'TickLength',[0 0],'FontSize',32);
flipdim(mcImage,1);

title('Proportion of Marijuana Use Between the Phases','FontSize',60);

text(1:length(prcntMarProp),prcntMarProp,values,'HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',26); 

ylabel('Proportion of Reported Marijuana Use','FontSize',46);
ylim([0 110]);
yticks([0:20:100]);
box off
set(gcf,'color','w');
txt = {'Progesterone: Dashed Line','Estrogen: Solid Line'};
text(25,100,txt,'FontSize',22)
ytickformat('percentage');


hold off

%% Figure Alcohol (PERCENTAGE) - WEEK NOT MC

figure('Position', [10 10 3000 2000],'visible','off');

bar(prcntAlcWeek2,.8,'FaceAlpha',.75,'EdgeColor','none');
hold on
prcntAlcWeek2=round(prcntAlcWeek2,2)
values=string(prcntAlcWeek2);
values(find(ismember(values,'0')))=' ';

values([1:7])=[values([1:7])+'%'];

xlabelNames={'Monday';'Tuesday';'Wednesday';'Thursday';'Friday';'Saturday';'Sunday'};
set(gca,'ydir','normal','xtick',[1:7],'xticklabel',xlabelNames,'TickLength',[0 0],'FontSize',32);

title('Proportion of Reported Alcohol Consumption During the Week','FontSize',60);

text(1:length(prcntAlcWeek2),prcntAlcWeek2,values,'HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',26); 

ylabel('Proportion of Reported Alcohol Consumption','FontSize',46);
ylim([0 25]);
yticks([0:5:25]);
ytickformat('percentage');
box off
set(gcf,'color','w');

print(gcf,'AlcoholWeekfigure.png','-dpng','-r300'); 


hold off

%% Figure Cig (Mean)

mcImage=imread('MCexpectedE_P2.png');
min_x = 0;
max_x = 29;
min_y = 0;
max_y = 15;
 
figure('Position', [10 10 3000 2000],'visible','off');

imagesc([min_x max_x], [min_y max_y], flipud(mcImage))
colormap(gray);
hold on
bar(cigPhaseMean2,2.8,'FaceAlpha',.75,'EdgeColor','none');
cigPhaseMean2=round(cigPhaseMean2,2)
values=string(cigPhaseMean2);
values(find(ismember(values,'0')))=' ';

er=errorbar(1:22,cigPhaseMean2,cigPhaseStd2,'.', 'LineWidth', 3);
er.Color=[0 0 0];

xlabelNames={'Menstruation (Days 1-5)';'Ovulation (Days 12-16)';'Mid-Luteal (Days 20-24)'};
set(gca,'ydir','normal','xtick',[3,15,22],'xticklabel',xlabelNames,'TickLength',[0 0],'FontSize',32);
flipdim(mcImage,1);

title('Average Reported Number of Cigarettes Smoked Per-Day','FontSize',60);

% text(1:length(cigPhaseMean2),cigPhaseMean2,values,'HorizontalAlignment',...
%    'center','VerticalAlignment','baseline','FontSize',20); 


ylabel('Number of Cigarettes Smoked','FontSize',46);
ylim([0 15]);
yticks([0:5:15]);
box off
set(gcf,'color','w');
txt = {'Progesterone: Dashed Line','Estrogen: Solid Line'};
text(25,[max_y-2],txt,'FontSize',22)

print(gcf,'Cigarettesfigure.png','-dpng','-r300'); 


hold off

%% Figure Marijuana (Mean)

mcImage=imread('MCexpectedE_P2.png');
min_x = 0;
max_x = 29;
min_y = 0;
max_y = 1.25;
 
figure('Position', [10 10 3000 2000],'visible','off');

imagesc([min_x max_x], [min_y max_y], flipud(mcImage))
colormap(gray);
hold on
bar(marijPhaseMean2,2.8,'FaceAlpha',.75,'EdgeColor','none');
marijPhaseMean2=round(marijPhaseMean2,2)
values=string(marijPhaseMean2);
values(find(ismember(values,'0')))=' ';

er=errorbar(1:22,marijPhaseMean2,marijPhaseStd2,'.', 'LineWidth', 3);
er.Color=[0 0 0];

xlabelNames={'Menstruation (Days 1-5)';'Ovulation (Days 12-16)';'Mid-Luteal (Days 20-24)'};
set(gca,'ydir','normal','xtick',[3,15,22],'xticklabel',xlabelNames,'TickLength',[0 0],'FontSize',32);
flipdim(mcImage,1);

title('Average Reported Amount of Marijuana Consumed Per-Day (grams)','FontSize',60);

% text(1:length(cigPhaseMean2),cigPhaseMean2,values,'HorizontalAlignment',...
%    'center','VerticalAlignment','baseline','FontSize',20); 



ylabel('Amount of Marijuana Consumed Per-Day (grams)','FontSize',46);
ylim([0 1.25]);
yticks([0:.25:1.25]);
box off
set(gcf,'color','w');
txt = {'Progesterone: Dashed Line','Estrogen: Solid Line'};
text(25,1.1,txt,'FontSize',22)

hold off



%% Figure Alcohol (Mean)

mcImage=imread('MCexpectedE_P2.png');
min_x = 0;
max_x = 29;
min_y = 0;
max_y = 1.75;
 
figure('Position', [10 10 3000 2000]);%,'visible','off');

imagesc([min_x max_x], [min_y max_y], flipud(mcImage))
colormap(gray);
hold on
bar(alcPhaseMean2,2.8,'FaceAlpha',.75,'EdgeColor','none');
alcPhaseMean2=round(alcPhaseMean2,2)
values=string(alcPhaseMean2);
values(find(ismember(values,'0')))=' ';

er=errorbar(1:22,alcPhaseMean2,alcPhaseStd2,'.', 'LineWidth', 3);
er.Color=[0 0 0];

xlabelNames={'Menstruation (Days 1-5)';'Ovulation (Days 12-16)';'Mid-Luteal (Days 20-24)'};
set(gca,'ydir','normal','xtick',[3,15,22],'xticklabel',xlabelNames,'TickLength',[0 0],'FontSize',32);
flipdim(mcImage,1);

title('Average Reported Number of Alcoholic Standard Drinks Consumed Per-Day','FontSize',60);

% text(1:length(cigPhaseMean2),cigPhaseMean2,values,'HorizontalAlignment',...
%    'center','VerticalAlignment','baseline','FontSize',20); 



ylabel('Number of Alcoholic Standard Drinks Consumed Per-Day','FontSize',46);
ylim([0 1.75]);
yticks([0:.25:1.75]);
box off
set(gcf,'color','w');
txt = {'Progesterone: Dashed Line','Estrogen: Solid Line'};
text(25,1.6,txt,'FontSize',22)

hold off


%% Figure Alc (PERCENTAGE)

mcImage=imread('MCexpectedE_P2.png');
min_x = 0;
max_x = 29;
min_y = 0;
max_y = 100;
 
figure('Position', [10 10 3000 2000],'visible','off');

imagesc([min_x max_x], [min_y max_y], flipud(mcImage))
colormap(gray);
hold on
bar(prcntAlcProp,2.8,'FaceAlpha',.75,'EdgeColor','none');
prcntAlcProp=round(prcntAlcProp,2)
values=string(prcntAlcProp);
values(find(ismember(values,'0')))=' ';

values([3,15,22])=[values([3,15,22])+'%'];

xlabelNames={'Menstruation (Days 1-5)';'Ovulation (Days 12-16)';'Mid-Luteal (Days 20-24)'};
set(gca,'ydir','normal','xtick',[3,15,22],'xticklabel',xlabelNames,'TickLength',[0 0],'FontSize',32);
flipdim(mcImage,1);

title('Proportion of Reported Alcohol Consumption Between the Phases','FontSize',60);

text(1:length(prcntAlcProp),prcntAlcProp,values,'HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',26); 

ylabel('Proportion of Reported Alcohol Consumption','FontSize',46);
ylim([0 110]);
yticks([0:20:100]);
box off
set(gcf,'color','w');
txt = {'Progesterone: Dashed Line','Estrogen: Solid Line'};
text(25,100,txt,'FontSize',22)
ytickformat('percentage');

print(gcf,'Alcoholfigure.png','-dpng','-r300'); 

hold off


