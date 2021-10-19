birth_rate = [];
death_rate = [];
population = [];
total_population = [];

leslie_population = [];

death_rate(end) = [];
survival_rate = 1 - death_rate;

leslie_matrix = diag(survival_rate.^5, -1);
leslie_matrix(1, :) = birth_rate;

dominant = max(abs(eigs(leslie_matrix)));

ratios = population / sum(population);

for idx = 0:8
	population_matrix = leslie_matrix^idx * population';
	leslie_population(end + 1) = sum(population_matrix);
	total = total_population(idx + 1);

	for x = 1:9
		ratio =  ratios(x);
		diff_ = abs(sum(population_matrix) - total) * ratio;
		printf("[ratio] year: %f | age: %f | population space: %f\n", idx * 5, (x - 1) * 5, diff_);
	endfor

	printf("\n\n");
endfor