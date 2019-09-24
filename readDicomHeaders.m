%% Reading DICOM Headers

%6/1/19

%Navigate to the directory with the DICOMS of interest
%e.g. "/project/psychimg2/Reagan/HengyiDATA/RS009/DICOM/13072316/52000000"

%If the DICOM File names do not start with a 5, then change it in the line
%below

headers = dir('5*');%Find all directories that have the prefix "5"
PartHeaders = headers(7).name;%read in the file
    
info=dicominfo(PartHeaders);
weight=info.PatientWeight
height=info.Height


