%% Intro
%1/1/19; Nate Spilka
%the comments may have many misspellings
%The following script REQUIRES DDcode2 to run first


%% Blood Hormone Graph

%This will not run as it is programed since it requires access to the
%"database" - which is several lines (~2k) of code. Regardless, this is the
%logic of how I created the graphs.

%The following code creates an INDIVIDUAL bloods-graph (for each
%participant individually). To see all blood hormones levels on a single
%graph see "EstrogenAndProgestroneFigureCreator.m'

%Also, the comments may have many misspellings

%iterates through all participants
for ii = 1:length(allParticipantsMCSid)
    f=figure('Position', [10 10 2000 1500])%,'visible','off'); %creates a igure with the following specs
    
    MeanMCLength=PARTICIPANTS(ii).Demographic{1,end};%Mean MC length
    sortedParticipantB = sortrows(PARTICIPANTS(ii).HormonesBloods,5);%sorts the hormones in order of normalized MC
    
    yyaxis right%sets the right y axis
    s(1) = scatter(sortedParticipantB(:,5),sortedParticipantB(:,2)); %scatterplot for Estrogen
    ylabel('Estradiol (pg/mL)','FontSize',18);%right - y axis label
    ylim([0 500]); %y-axis limits
    set(f,'defaultAxesColorOrder',[1,0,0]);%An attempt to change this y-axis color to red (unsuccesful)

    hold on %tells matlab to apply the following lines to the same figure
    yyaxis left%sets the left y axis
    ylabel('Progesterone (ng/mL)','FontSize',18);%Left - y axis label
    ylim([0 30]);%left y-axis limits
    set(f,'defaultAxesColorOrder',[0,0,1]);%An attempt to change this y-axis color to blue (it was always blue)
    s(2) = scatter(sortedParticipantB(:,5),sortedParticipantB(:,3));%scatterplot for Progesterone

    s(1).MarkerEdgeColor = 'r';%Red plots for e
    s(1).MarkerFaceColor = 'r';
    s(2).MarkerFaceColor = 'b';%Red plots for P
    s(2).MarkerEdgeColor = 'b';

    xticks([0,7,14,24,28])%x-tick marks relative to mean MC
    xlim([0 28]);%x-axis limits
%Title includes participant, and mean MC length (in that order)
    title(['MCS_0',num2str(allParticipantsMCSid{ii,1}),': Blood Hormones  ||  Mean Menstrual Cycle Length= ',num2str(MeanMCLength)],'FontSize',20,'Interpreter','none');
%legend specs - mainly for E and P
    legend([s(1),s(2)],{'Estrogen','Progestrone'})
    grid on %creates a grid
    set(gcf,'color','w'); %sets all background clor to white

    xlabel('Normalized Cycle Days','FontSize',18); %X-axis label
    handle = get(gca,'xlabel'); % handle to the label object
    xlblPosition = get(handle,'position') ;% get the current position property
    xlblPosition(2) = 1.2 * xlblPosition(2);        % double the distance, 
    set(handle,'position',xlblPosition);% negative values put the label below the axis
     
    %saveas(gcf,sprintf('MCS_0%s.jpg',string(num2str(allParticipantsMCSid{ii,1})))) ;%saves the image

    hold off%takes the hold "off" for the following graph to-be creates (for-loop_
end
