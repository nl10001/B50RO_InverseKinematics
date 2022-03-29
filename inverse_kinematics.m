
%Link lengths in mm
L1 = 100;
L2 = 100;
L3 = 100;
L5 = 100;

%input tcp poisition and orientation
prompt = "enter tcp position\n";
tcp_pos = input(prompt);
prompt2 = "enter tcp orientation\n";
tcp_angle = input(prompt2);
%convert input to radians 
tcp_angle = deg2rad(tcp_angle);

%calculatenew orientation
x_rot = [1 0 0; 0 cos(tcp_angle) -sin(tcp_angle); 0 sin(tcp_angle) cos(tcp_angle)];
y_rot = [cos(tcp_angle) 0 sin(tcp_angle); 0 1 0; -sin(tcp_angle) 0 cos(tcp_angle)];
z_rot = [cos(tcp_angle) -sin(tcp_angle) 0; sin(tcp_angle) cos(tcp_angle) 0; 0 0 1];
orient_matrix = x_rot * y_rot * z_rot;

%combine new orientation and tcp position
goal_matrix = [orient_matrix tcp_pos; 0 0 0 1];

%extract values from goal matrix
px = goal_matrix(1,4);
py = goal_matrix(2,4);
pz = goal_matrix(3,4);
r11 = goal_matrix(1,1);
r12 = goal_matrix(1,2);
r13 = goal_matrix(1,3);
r21 = goal_matrix(2,1);
r22 = goal_matrix(2,2);
r23 = goal_matrix(2,3);
r33 = goal_matrix(3,3);

%calculate theta1 through theta5
t1 = atan2(py, px);

t5 = atan2(r21*cos(t1) - r11*sin(t1), r22*cos(t1) - r12*sin(t1));

t234 = atan2(r13*cos(t1) + r23*sin(t1), r33);

c3 = (px^2 + py^2 + pz^2 - L2^2 - L3^2)/(2*L2*L3);

t3 = atan2(sqrt(1 - c3^2), c3);

t2 = -atan2(pz, sqrt(px^2 + py^2)) - atan2(L3*sin(t3), L2 + L3*cos(t3));

t4 = t234 - t2 - t3;

%t5 = cos(t234)*t1 - atan2(r21, r11);

%display values in degrees
disp(['theta 1 = ',num2str(rad2deg(t1))])
disp(['theta 2 = ',num2str(rad2deg(t2))])
disp(['theta 3 = ',num2str(rad2deg(t3))])
disp(['theta 4 = ',num2str(rad2deg(t4))])
disp(['theta 5 = ',num2str(rad2deg(t5))])

