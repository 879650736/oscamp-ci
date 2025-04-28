CHAPTER ?= 2
ARCH ?= riscv64
LOG ?= info


test:
	python3 parser.py $(CHAPTER)
	make -C run ARCH=$(BASE) TEST=$(CHAPTER)
	make -C ../arceos run ARCH=$(ARCH) LOG=$(LOG) | tee stdout-ch$(CHAPTER)
ifdef LAB
	python3 check/ch$(CHAPTER)$(BASE_CHAR).py < stdout-ch$(CHAPTER) || (\
		exit 1 ; \
	)
endif

.PHONY: test
