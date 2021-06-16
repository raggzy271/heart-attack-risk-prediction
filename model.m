clc; clear all; close all;

T = readtable('HeartAttack.csv'); %importing the data
A = table2array(T); %converting from table array to real array 

%visualizing the data
figure;
scatter(A(:,1), A(:, 2), 'filled');
title('Visualizing the Data');
xlabel('Blood Pressure');
ylabel('Cholestrol');

%training a k-means clustering algorithm
k = 2; %number of clusters
rng(1); %specifying the random seed
idx = kmeans(A, k, 'Start', 'sample', 'Replicates', 10, 'Display', 'final'); %stores each patient's cluster

%visualizing the data and their clustered regions
figure;
gscatter(A(:,1), A(:,2), idx, ['r', 'g']);
title('Risk of Heart Attack');
xlabel('Blood Pressure');
ylabel('Cholestrol');
legend('Low Risk', 'High Risk', 'Location','SouthEast');