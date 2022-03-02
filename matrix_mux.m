syms theta1 theta2 theta3 theta4 theta5 l2 l3 l4 

T_01 = [cos(theta1) -sin(theta1) 0 0; sin(theta1) cos(theta1) 0 0; 0 0 1 0; 0 0 0 1];

T_12 = [cos(theta2) -sin(theta2) 0 0; 0 0 -1 0; sin(theta2) cos(theta2) 0 0; 0 0 0 1];

T_23 = [cos(theta3) -sin(theta3) 0 l2; sin(theta3) cos(theta3) 0 0; 0 0 1 0; 0 0 0 1];

T_34 = [cos(theta4) -sin(theta4) 0 l3; sin(theta4) cos(theta4) 0 0; 0 0 1 0; 0 0 0 1];

T_45 = [cos(theta5) -sin(theta5) 0 l4; 0 0 1 0; -cos(theta5) -sin(theta5) 0 0; 0 0 0 1];

T_05 = T_01*T_12*T_23*T_34*T_45;
M = simplify(T_05)