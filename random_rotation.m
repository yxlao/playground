for i=1:1000;
  [Q,~] = qr(randn(3));
  Q(:,1)=Q(:,1)*(2*(rand>0.5)-1);
  Q(:,2)=det(Q)*Q(:,2);
  dirs(:,i) = Q*[1 0 0]';
end;

scatter3(dirs(1,:), dirs(2,:), dirs(3,:));
axis equal vis3d;
