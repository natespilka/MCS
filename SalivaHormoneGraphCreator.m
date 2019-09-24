%% Intro
%1/1/19; Nate Spilka
%the comments may have many misspellings
%The following script REQUIRES DDcode2 to run first

%% Saliva-Hormone Figure Creator
cd /project/psychimg2/Teri/Nate/DDanalysis/METADATA %set wd


[numhormoneGraphs3TDsOrig,texthormoneGraphs3TDs,rawhormoneGraphs3TDs] = xlsread('hormoneGraphs3TDs.xlsx');
numhormoneGraphs3TDs = numhormoneGraphs3TDsOrig;
numhormoneGraphs3TDs(:,4) = numhormoneGraphs3TDs(:,4)-1; %ADJUSTED DATES


for ii = 1:3%:length(allParticipantsMCSid)
    figure('Position', [10 10 2500 1500])%,'visible','off')
    numTDs=0;
    for qq = 1:length(numhormoneGraphs3TDs(:,1))
        if numhormoneGraphs3TDs(qq,1)==allParticipantsMCSid{ii,1}
            
            s(1) = scatter(numhormoneGraphs3TDs(qq,3),numhormoneGraphs3TDs(qq,5),70);
            hold on
            s(2) = scatter(numhormoneGraphs3TDs(qq,3),numhormoneGraphs3TDs(qq,6),70);
            s(1).MarkerEdgeColor = 'r';
            s(1).MarkerFaceColor = 'r';
            s(2).MarkerFaceColor = 'b';
            s(2).MarkerEdgeColor = 'b';
            t=get(gca,'XTickLabel');
            set(gca,'XTickLabel',t,'fontsize',17);
            title(['MCS_0',num2str(numhormoneGraphs3TDs(qq,1)),': Saliva Hormones'],'FontSize',25,'Interpreter','none');
            MeanMCLength=PARTICIPANTS(ii).Demographic{1,end};
            ylabel('Estrogen (x100) and Progestrone Values (pg/mL)','FontSize',22);
            
            ylim([0 170]);

            TDdate=find(PARTICIPANTS(ii).DDAppendProjected(:,1)==numhormoneGraphs3TDs(qq,4));
            if numhormoneGraphs3TDs(qq,3)==1
                regDay1=PARTICIPANTS(ii).DDAppendProjected(TDdate,2);
                normDay1=PARTICIPANTS(ii).DDAppendProjected(TDdate,3); 
                str1 = strcat('TD1: MCday=',num2str(regDay1),'; NormMCday=',num2str(round(normDay1,2)));
            elseif numhormoneGraphs3TDs(qq,3)==2
                regDay2=PARTICIPANTS(ii).DDAppendProjected(TDdate,2);
                normDay2=PARTICIPANTS(ii).DDAppendProjected(TDdate,3); 
                str2 = strcat('TD2: MCday=',num2str(regDay2),'; NormMCday=',num2str(round(normDay2,2)));
            elseif numhormoneGraphs3TDs(qq,3)==3
                regDay3=PARTICIPANTS(ii).DDAppendProjected(TDdate,2);
                normDay3=PARTICIPANTS(ii).DDAppendProjected(TDdate,3); 
                str3 = strcat('TD3: MCday=',num2str(regDay3),'; NormMCday=',num2str(round(normDay3,2)));
            elseif numhormoneGraphs3TDs(qq,3)==4
                regDay4=PARTICIPANTS(ii).DDAppendProjected(TDdate,2);
                normDay4=PARTICIPANTS(ii).DDAppendProjected(TDdate,3);  
                str4 = strcat('TD4: MCday=',num2str(regDay4),'; NormMCday=',num2str(round(normDay4,2)));
            elseif numhormoneGraphs3TDs(qq,3)==5
                regDay5=PARTICIPANTS(ii).DDAppendProjected(TDdate,2);
                normDay5=PARTICIPANTS(ii).DDAppendProjected(TDdate,3); 
                str5 = strcat('TD5: MCday=',num2str(regDay5),'; NormMCday=',num2str(round(normDay5,2)));
            end
            
            legend([s(1),s(2)],{'Estrogen','Progestrone'})
            grid on
            set(gcf,'color','w');
            numTDs = numTDs +1;
        end
    end
    if numTDs==1
        set(gca,'xtick',1,'xticklabel',{[str1]});  
        xlim([0 4]);
        set(gca,'xlim',[0 4],'XLimMode','Manual');
    elseif numTDs==3
        set(gca,'xtick',1:3,'xticklabel',{[str1],[str2],[str3]});  
        xlim([0 4]);
        set(gca,'xlim',[0 4],'XLimMode','Manual');
    elseif numTDs==4
        set(gca,'xtick',1:4,'xticklabel',{[str1],[str2],[str3],[str4]});
        set(gca,'xlim',[0 5],'XLimMode','Manual');
    elseif numTDs==5
        set(gca,'xtick',1:5,'xticklabel',{[str1],[str2],[str3],[str4],[str5]});
        set(gca,'xlim',[0 6],'XLimMode','Manual');
    end
    xlabel([num2str(MeanMCLength),' = Mean MCLength'],'FontSize',22);
    handle = get(gca,'xlabel'); % handle to the label object
    xlblPosition = get(handle,'position') ;% get the current position property
    xlblPosition(2) = 1.4 * xlblPosition(2);        % double the distance, 
    set(handle,'position',xlblPosition);% negative values put the label below the axis
    
   %     cd SalivaImages
    %    saveas(gcf,sprintf('MCS_0%s.jpg',string(num2str(allParticipantsMCSid{ii,1}))))
     %   cd ..
        
    hold off
end

