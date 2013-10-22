function [ output_args ] = plot_ss_roc(ss_roc_eta,ss_roc_wrf_d1,ss_roc_wrf_d2,ss_roc_wrf_d3,Namelist)
%PLOT_SS_ROC Summary of this function goes here
%   Detailed explanation goes here

subplot(2,2,1)
for i=1:4
    plot(ss_roc_eta(i,find(ss_roc_eta(i,:)~=-1 & (ss_roc_eta(i,:)~=0))),['-',Namelist{5}.color{7+i},Namelist{5}.markers(i)])
    hold on 
end
grid on; set(gca,'ylim',[-0.1 1],'xtick',[1:length(find(ss_roc_eta(i,:)~=-1 & (ss_roc_eta(i,:)~=0)))],'xticklabel',find(ss_roc_eta(i,:)~=-1 & (ss_roc_eta(i,:)~=0)));legend({'eta-18km-5','eta-18km-10','eta-18km-15','eta-18km-20'},'location','best')


subplot(2,2,2)
for i=1:4
    plot(ss_roc_wrf_d1(i,find(ss_roc_wrf_d1(i,:)~=-1 & (ss_roc_wrf_d1(i,:)~=0))),['-',Namelist{5}.color{7+i},Namelist{5}.markers(i)])
    hold on 
end
 grid on; set(gca,'ylim',[-0.1 1],'xticklabel',find(ss_roc_wrf_d1(i,:)~=-1 & (ss_roc_wrf_d1(i,:)~=0)));legend({'wrf-18km-5','wrf-18km-10','wrf-18km-15','wrf-18km-20'},'location','best')


subplot(2,2,3)
for i=1:4
    plot(ss_roc_wrf_d2(i,find(ss_roc_wrf_d2(i,:)~=-1 & (ss_roc_wrf_d2(i,:)~=0))),['-',Namelist{5}.color{7+i},Namelist{5}.markers(i)])
    hold on 
end
 grid on; set(gca,'ylim',[-0.1 1],'xticklabel',find(ss_roc_wrf_d2(i,:)~=-1 & (ss_roc_wrf_d2(i,:)~=0)));legend({'wrf-6km-5','wrf-6km-10','wrf-6km-15','wrf-6km-20'},'location','best')

subplot(2,2,4)
for i=1:4
    plot(ss_roc_wrf_d3(i,find(ss_roc_wrf_d3(i,:)~=-1 & (ss_roc_wrf_d3(i,:)~=0))),['-',Namelist{5}.color{7+i},Namelist{5}.markers(i)])
    hold on 
end
 grid on; set(gca,'ylim',[-0.1 1],'xtick',[1:length(find(ss_roc_wrf_d3(i,:)~=-1 & (ss_roc_wrf_d3(i,:)~=0)))],'xticklabel',find(ss_roc_wrf_d3(i,:)~=-1 & (ss_roc_wrf_d3(i,:)~=0)));legend({'wrf-2km-5','wrf-2km-10','wrf-2km-15','wrf-2km-20'},'location','best')

            save_dir=[Namelist{1}.stat_plot_dir,'\prob-plots']
            plot_filename=['\ss-roc_on_leadtimes']
                    if isdir(save_dir)
                       saveas(gcf,[save_dir plot_filename] ,'fig')
                       saveas(gcf,[save_dir plot_filename] ,'jpeg')

                    else
                        mkdir(save_dir)
                        saveas(gcf,[save_dir plot_filename] ,'fig')
                        saveas(gcf,[save_dir plot_filename] ,'jpeg')

                    end
            

end
