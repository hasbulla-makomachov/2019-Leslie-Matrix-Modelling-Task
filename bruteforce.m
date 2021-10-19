birth_rate = [];
death_rate = [];
population = [];

min_birth = birth_rate(3) - 1.0;
max_birth = birth_rate(3);

death_rate(end) = [];
survival_rate = 1 - death_rate;

for idx = min_birth:0.01:max_birth
	birth_rate(3) = idx;
	leslie_matrix = diag(survival_rate.^5, -1);
	leslie_matrix(1, :) = birth_rate;
	dominant = max(abs(eigs(leslie_matrix)))
endfor