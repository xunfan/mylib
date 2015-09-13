S_DIR=/nfs/lander/working/xunfan/affinity_data/short_interval_probe/short_interval_probe/result_check_representativeness
XUN_LIB=~xunfan/lib_new

all: count_switching_google_PL.pdf \
	   count_switching_akamai_PL.pdf \
		 count_switching_google_PL.png \
		 count_switching_akamai_PL.png \
		 max_distance_per_user_cdf_PL_vs_BIG.pdf \
		 max_distance_per_user_cdf_PL_vs_BIG.png \
		 max_distance_per_user_cdf_PL_vs_BIG_no_stationary.pdf \
		 max_distance_per_user_cdf_PL_vs_BIG_no_stationary.png \
		 large_dist_per_user_count_cdf_PL_vs_BIG.pdf \
		 large_dist_per_user_count_cdf_PL_vs_BIG.png \
		 max_distance_per_user_cdf_PL_vs_BIG_no_stationary_no_BU.pdf  \
		 max_distance_per_user_cdf_PL_vs_BIG_no_stationary_no_BU.png
	   

count_switching_google_PL_raw: $(S_DIR)/count_switching_client_EDNS_red.py $(S_DIR)/times_google
	ls $(S_DIR)/data/google_sampled_15min/ | while read n; do cat $(S_DIR)/data/google_sampled_15min/$n | $(S_DIR)/count_switching_client_EDNS_red.py $(S_DIR)/times_google >> $(S_DIR)/result/count_switching_google_PL_raw; done

count_switching_akamai_PL_raw: $(S_DIR)/count_switching_client_cid_akamai_red.py $(S_DIR)/times_akamai
	ls $(S_DIR)/data/akamai_sampled_15min/ | while read n; do cat $(S_DIR)/data/akamai_sampled_15min/$n | $(S_DIR)/count_switching_client_cid_akamai_red.py $(S_DIR)/times_akamai >> $(S_DIR)/result/count_switching_akamai_PL_raw; done

distance_all_google_PL_raw: $(S_DIR)/affinity_distance_all_red_2014.py $(S_DIR)/times_google
	ls $(S_DIR)/data/google_sampled_15min/ | while read n; do cat $(S_DIR)/data/google_sampled_15min/$n | $(S_DIR)/affinity_distance_all_red_2014.py $(S_DIR)/times_google >> $(S_DIR)/result/distance_all_google_PL_raw; done

distance_all_akamai_PL_raw: $(S_DIR)/affinity_distance_all_apple_red_2014.py $(S_DIR)/times_akamai
	ls $(S_DIR)/data/akamai_sampled_15min/ | while read n; do cat $(S_DIR)/data/akamai_sampled_15min/$n | $(S_DIR)/affinity_distance_all_apple_red_2014.py $(S_DIR)/times_akamai >> $(S_DIR)/result/distance_all_akamai_PL_raw; done 

distance_all_google_PL_raw_no_BU: $(S_DIR)/affinity_distance_all_red_2014_no_BU.py $(S_DIR)/times_google
	ls $(S_DIR)/data/google_sampled_15min/ | while read n; do cat $(S_DIR)/data/google_sampled_15min/$n | $(S_DIR)/affinity_distance_all_red_2014_no_BU.py $(S_DIR)/times_google >> $(S_DIR)/result/distance_all_google_PL_raw_no_BU; done

max_distance_of_users_cdf_google_PL_no_stationary_no_BU: distance_all_google_PL_raw_no_BU
	cat $< | sed -n '/^MAX/p' | sed 's/^MAX: //' | awk '{print $$2}' | sort -n | $(XUN_LIB)/count_appearance.pl | sed '/^-/d' | $(XUN_LIB)/calc_cdf.pl > $@

max_distance_of_users_cdf_google_PL: distance_all_google_PL_raw
	cat $< | sed -n '/^MAX/p' | sed 's/^MAX: //' | awk '{print $$2}' | sort -n | $(XUN_LIB)/count_appearance.pl | $(XUN_LIB)/calc_cdf.pl > $@

max_distance_of_users_cdf_google_BIG: distance_all_google_BIG_raw
	cat $< | sed -n '/^MAX/p' | sed 's/^MAX: //' | awk '{print $$2}' | sort -n | $(XUN_LIB)/count_appearance.pl | $(XUN_LIB)/calc_cdf.pl > $@

max_distance_of_users_cdf_google_PL_no_stationary: distance_all_google_PL_raw
	cat $< | sed -n '/^MAX/p' | sed 's/^MAX: //' | awk '{print $$2}' | sort -n | $(XUN_LIB)/count_appearance.pl | sed '/^-/d' | $(XUN_LIB)/calc_cdf.pl > $@

max_distance_of_users_cdf_google_BIG_no_stationary: distance_all_google_BIG_raw
	cat $< | sed -n '/^MAX/p' | sed 's/^MAX: //' | awk '{print $$2}' | sort -n | $(XUN_LIB)/count_appearance.pl | sed '/^-/d' | $(XUN_LIB)/calc_cdf.pl > $@

max_distance_of_users_cdf_akamai_PL: distance_all_akamai_PL_raw
	cat $< | sed -n '/^MAX/p' | sed 's/^MAX: //' | awk '{print $$2}' | sort -n | $(XUN_LIB)/count_appearance.pl | $(XUN_LIB)/calc_cdf.pl > $@

max_distance_of_users_cdf_akamai_BIG: distance_all_akamai_BIG_raw
	cat $< | sed -n '/^MAX/p' | sed 's/^MAX: //' | awk '{print $$2}' | sort -n | $(XUN_LIB)/count_appearance.pl | $(XUN_LIB)/calc_cdf.pl > $@

max_distance_of_users_cdf_akamai_PL_no_stationary: distance_all_akamai_PL_raw
	cat $< | sed -n '/^MAX/p' | sed 's/^MAX: //' | awk '{print $$2}' | sort -n | $(XUN_LIB)/count_appearance.pl | sed '/^-/d' | $(XUN_LIB)/calc_cdf.pl > $@

max_distance_of_users_cdf_akamai_BIG_no_stationary: distance_all_akamai_BIG_raw
	cat $< | sed -n '/^MAX/p' | sed 's/^MAX: //' | awk '{print $$2}' | sort -n | $(XUN_LIB)/count_appearance.pl | sed '/^-/d' | $(XUN_LIB)/calc_cdf.pl > $@

max_distance_per_user_cdf_PL_vs_BIG.pdf: max_distance_per_user_cdf_PL_vs_BIG.gp max_distance_of_users_cdf_google_PL max_distance_of_users_cdf_google_BIG max_distance_of_users_cdf_akamai_PL max_distance_of_users_cdf_akamai_BIG
	gnuplot max_distance_per_user_cdf_PL_vs_BIG.gp

max_distance_per_user_cdf_PL_vs_BIG_no_stationary.pdf: max_distance_per_user_cdf_PL_vs_BIG_no_stationary.gp max_distance_of_users_cdf_google_PL_no_stationary max_distance_of_users_cdf_google_BIG_no_stationary max_distance_of_users_cdf_akamai_PL_no_stationary max_distance_of_users_cdf_akamai_BIG_no_stationary
	gnuplot max_distance_per_user_cdf_PL_vs_BIG_no_stationary.gp

max_distance_per_user_cdf_PL_vs_BIG_no_stationary_no_BU.pdf: max_distance_per_user_cdf_PL_vs_BIG_no_stationary_no_BU.gp max_distance_of_users_cdf_google_PL_no_stationary_no_BU max_distance_of_users_cdf_google_BIG_no_stationary max_distance_of_users_cdf_akamai_PL_no_stationary max_distance_of_users_cdf_akamai_BIG_no_stationary
	gnuplot max_distance_per_user_cdf_PL_vs_BIG_no_stationary_no_BU.gp

count_switching_google_PL: count_switching_google_PL_raw
	cat $< | awk '{print $$1}' | sort -n | $(XUN_LIB)/count_appearance.pl > $@

count_switching_akamai_PL: count_switching_akamai_PL_raw
	cat $< | awk '{print $$1}' | sort -n | $(XUN_LIB)/count_appearance.pl > $@

count_switching_google_PL.pdf: count_switching_google_PL.gp count_switching_google_PL
	gnuplot count_switching_google_PL.gp

count_switching_akamai_PL.pdf: count_switching_akamai_PL.gp count_switching_akamai_PL
	gnuplot count_switching_akamai_PL.gp


%.png: %.pdf
	pdftoppm $< | pnmtopng > $@
