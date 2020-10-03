nodename:=$(shell uname -n)

all: turbo fast_flatten distinct_id stacked_plot time_distribution minified_inputs comparison large_files clmul vectorized_classification

checkht: 
	-./scripts/ht.py	

.PHONY: checkht


growing: 
	git submodule update --init --recursive
	cd library/simdjson && make clean && cd ../..
	docker build  -f experiments/growing/Dockerfile -t growing .
	$(eval outputdir:=$(PWD)/results/$(nodename)/growing)
	@echo $(outputdir)
	mkdir -p $(outputdir)
	docker run --privileged -v $(outputdir):/results growing
	@echo "results have been copied to $(outputdir)"

turbo: 
	cd experiments/turbo && docker build -t turbo .
	$(eval outputdir:=$(PWD)/results/$(nodename)/turbo)
	mkdir -p $(outputdir)
	docker run --privileged -v $(outputdir):/results turbo
	@echo "results have been copied to $(outputdir)"

vectorized_classification: checkht
	git submodule update --init --recursive
	cd library/simdjson && make clean && cd ../..
	docker build  -f experiments/vectorized_classification/Dockerfile -t vectorized_classification .
	$(eval outputdir:=$(PWD)/results/$(nodename)/vectorized_classification)
	@echo $(outputdir)
	mkdir -p $(outputdir)
	docker run --privileged -v $(outputdir):/results vectorized_classification
	@echo "results have been copied to $(outputdir)"



clmul: checkht
	git submodule update --init --recursive
	cd library/simdjson && make clean && cd ../..
	docker build  -f experiments/clmul/Dockerfile -t clmul .
	$(eval outputdir:=$(PWD)/results/$(nodename)/clmul)
	@echo $(outputdir)
	mkdir -p $(outputdir)
	docker run --privileged -v $(outputdir):/results clmul
	@echo "results have been copied to $(outputdir)"



fast_flatten: checkht
	git submodule update --init --recursive
	cd library/simdjson && make clean && cd ../..
	docker build  -f experiments/fast_flatten/Dockerfile -t fast_flatten .
	$(eval outputdir:=$(PWD)/results/$(nodename)/fast_flatten)
	@echo $(outputdir)
	mkdir -p $(outputdir)
	docker run --privileged -v $(outputdir):/results fast_flatten
	@echo "results have been copied to $(outputdir)"


large_files: checkht
	git submodule update --init --recursive
	cd library/simdjson && make clean && cd ../..
	docker build  -f experiments/large_files/Dockerfile -t large_files .
	$(eval outputdir:=$(PWD)/results/$(nodename)/large_files)
	@echo $(outputdir)
	mkdir -p $(outputdir)
	docker run --privileged -v $(outputdir):/results large_files
	@echo "results have been copied to $(outputdir)"



distinct_id: checkht
	git submodule update --init --recursive
	cd library/simdjson && make clean && cd ../..
	docker build  -f experiments/distinct_id/Dockerfile -t distinct_id .
	$(eval outputdir:=$(PWD)/results/$(nodename)/distinct_id)
	@echo $(outputdir)
	mkdir -p $(outputdir)
	docker run --privileged -v $(outputdir):/results distinct_id
	@echo "results have been copied to $(outputdir)"


comparison: checkht
	git submodule update --init --recursive
	git -C library/simdjson clean -xdf .
	docker build  -f experiments/comparison/Dockerfile -t comparison .
	$(eval outputdir:=$(PWD)/results/$(nodename)/comparison)
	@echo $(outputdir)
	mkdir -p $(outputdir)
	docker run --privileged -v $(outputdir):/results comparison
	@echo "results have been copied to $(outputdir)"


stacked_plot: checkht
	git submodule update --init --recursive
	cd library/simdjson && make clean && cd ../..
	docker build  -f experiments/stacked_plot/Dockerfile -t stacked_plot .
	$(eval outputdir:=$(PWD)/results/$(nodename)/stacked_plot)
	@echo $(outputdir)
	mkdir -p $(outputdir)
	docker run --privileged -v $(outputdir):/results stacked_plot
	@echo "results have been copied to $(outputdir)"



time_distribution: checkht
	git submodule update --init --recursive
	cd library/simdjson && make clean && cd ../..
	docker build  -f experiments/time_distribution/Dockerfile -t time_distribution .
	$(eval outputdir:=$(PWD)/results/$(nodename)/time_distribution)
	@echo $(outputdir)
	mkdir -p $(outputdir)
	docker run --privileged -v $(outputdir):/results time_distribution
	@echo "results have been copied to $(outputdir)"

minified_inputs: checkht
	git submodule update --init --recursive
	cd library/simdjson && make clean && cd ../..
	docker build  -f experiments/minified_inputs/Dockerfile -t minified_inputs .
	$(eval outputdir:=$(PWD)/results/$(nodename)/minified_inputs)
	@echo $(outputdir)
	mkdir -p $(outputdir)
	docker run --privileged -v $(outputdir):/results minified_inputs
	@echo "results have been copied to $(outputdir)"
