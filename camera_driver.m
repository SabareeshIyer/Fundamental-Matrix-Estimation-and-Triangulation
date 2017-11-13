%camera driver
clear all
P1 = load('library1_camera.txt');
P2 = load('library2_camera.txt');
[U,S,V] = svd(P1);
center1 = V(:,end);
center1 = center1 ./ center1(4,1);
center1 = center1(1:3,1);

[U,S,V] = svd(P2);
center2 = V(:,end);
center2 = center2 ./ center2(4,1);
center2 = center2(1:3,1);

I1 = imread('library1.jpg');
I2 = imread('library2.jpg');
matches = load('library_matches.txt');       %given matches

p1 = matches(:, 1:2)';
p2=matches(:,3:4)';
x  = p1(1,:);
y  = p1(2,:);
xp = p2(1,:);
yp = p2(2,:);
N  = size(matches,1);
X=zeros(4,N);

for i=1:N
   A =  [   x(i)*P1(3,:) - P1(1,:);
            y(i)*P1(3,:) - P1(2,:);
            xp(i)*P1(3,:) - P2(1,:);
            yp(i)*P1(3,:) - P2(2,:)];

        [~,~,V] = svd(A,0);
        X(:,i) = V(:,end);
        X(:,i) = X(:,i) ./ X(4,i);
end

figure, scatter3(X(1,:),X(2,:),X(3,:),'b','fill'); hold on;
scatter3 (center1(1,1), center1(2,1),center1(3,1), 'filled'); hold on;
scatter3 (center2(1,1), center2(2,1),center2(3,1), 'filled'); hold on;
