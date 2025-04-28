CHAPTER ?= 2
ARCH ?= riscv64
LOG ?= info


test:
	python3 parser.py $(CHAPTER)
	
	cd ../arceos && \
	make run ARCH=$(ARCH) LOG=$(LOG) | tee ../oscamp-ci/stdout-ch$(CHAPTER)
	
	python3 check/ch$(CHAPTER)$(BASE_CHAR).py < stdout-ch$(CHAPTER) || (\
		exit 1 ; \
	)

.PHONY: test
