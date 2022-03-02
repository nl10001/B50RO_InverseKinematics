syms theta1 theta2 theta3 theta4 theta5 d1 a2 a3 d5 

T_01 = [cos(theta1) 0 -sin(theta1) 0; sin(theta1) 0 cos(theta1) 0; 0 -1 0 d1; 0 0 0 1];

T_12 = [cos(theta2) -sin(theta2) 0 a2*cos(theta2); sin(theta2) cos(theta2) 0 a2*sin(theta2); 0 0 1 0; 0 0 0 1];

T_23 = [cos(theta3) -sin(theta3) 0 a3*cos(theta3); sin(theta3) cos(theta3) 0 a3*sin(theta3); 0 0 1 0; 0 0 0 1];

T_34 = [cos(theta4) 0 -sin(theta4) 0; sin(theta4) 0 cos(theta4) 0; 0 -1 0 0; 0 0 0 1];

T_45 = [cos(theta5) -sin(theta5) 0 0; sin(theta5) cos(theta5) 0 0; 0 0 1 d5; 0 0 0 1];

T_05 = T_01*T_12*T_23*T_34*T_45;
M = simplify(T_05);
RHS = T_12*T_23*T_34*T_45;

LHS = simplify((inv(T_01))*T_05)
