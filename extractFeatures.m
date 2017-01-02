function [maxi,maxT,mini,minT, suma, av,stdev,mintoav,mintomax,night,skew,kurt,varia]=extractFeatures(data)
maxi=zeros(size(data,1),1);
maxT=zeros(size(data,1),1);
mini=zeros(size(data,1),1);
minT=zeros(size(data,1),1);
suma=zeros(size(data,1),1);
av=zeros(size(data,1),1);
stdev=zeros(size(data,1),1);
mintoav=zeros(size(data,1),1);
mintomax=zeros(size(data,1),1);
night=zeros(size(data,1),1);
skew=zeros(size(data,1),1);
kurt=zeros(size(data,1),1);
varia=zeros(size(data,1),1);

[maxi,maxT]=max(data,[],2);
[mini,minT]=min(data,[],2);
suma=sum(data,2);
av=mean(data,2);
stdev=std(data,0,2);
mintoav=mini./av;
mintomax=mini./maxi;
night=sum(data(:,1:5),2)./suma*100; % This makes sense for day vs hour matrix ONLY
skew=skewness(data,1,2);
kurt=kurtosis(data,1,2);
varia=var(data,0,2);
end