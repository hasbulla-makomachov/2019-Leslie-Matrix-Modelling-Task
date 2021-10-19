birth_rate = [];
death_rate = [];
population = [];

total_population = [];

# remove female
population /= 2;

death_rate(end) = [];

survival_rate = 1 - death_rate;
leslie_matrix = diag(survival_rate.^5, -1);
leslie_matrix(1, :) = birth_rate;

dominant = max(abs(eigs(leslie_matrix)));

leslie_population = [];

for idx = 0:8
  population_ = sum(leslie_matrix^idx * population');
  leslie_population(end + 1) = population_;
  #printf("[population] all population %d year is %f\n", idx * 5, population_);
endfor

mean_growth = 0;
mean_ratio = 0;
mean_difference = 0;

for idx = 1:columns(leslie_population) - 1 
	growth = leslie_population(idx + 1) / leslie_population(idx);
	mean_growth += growth;
	#printf("[growth] growth %d year is %f\n", idx * 5, growth);
endfor	

for idx = 1:columns(total_population) - 1
	ratio = total_population(idx + 1) / total_population(idx);
	mean_ratio += ratio;
	#printf("[ratio] ratio %i year is %f\n", idx * 5, ratio);
endfor

for idx = 1:columns(total_population) - 1
	difference = abs(total_population(idx) - leslie_population(idx));
	mean_difference += difference;
	#printf("[difference] difference %i year is %f\n", idx * 5, difference);
endfor

printf("[growth] mean growth is %f\n", mean_growth / 8);
printf("[ratio] mean ratio is %f\n", mean_ratio / 8);
printf("[difference] mean difference is %f\n", mean_difference / 8);