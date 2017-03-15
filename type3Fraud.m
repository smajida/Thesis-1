function [f_Data, y, F_Data, Y] = type3Fraud (Data)
% Fraud can be interrapted on days and hours
% with different intensity per hour and day
F_Data=Data;
Y=zeros(size(Data,1),1);
[fraudDays] = initFraudperMatrix(Data);
% dstart=fraudDays(1); 
for i=1:length(fraudDays)
  [tstart, duration, intensity] = initFraudperRow (Data); %intensity not needed
  for j=tstart:(tstart+duration)
    [patates, agouria, hour_intensity] = initFraudperRow (Data); %patates-agouria not needed
    F_Data(fraudDays(i),j)=...
      hour_intensity*Data(fraudDays(i),j);
  end
  Y(fraudDays(i),1)=1;
end
f_Data_temp=F_Data(:)';
f_Data=f_Data_temp';
y=1;
end
