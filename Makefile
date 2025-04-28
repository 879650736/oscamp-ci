
CHAPTER ?= u1
ARCH ?= riscv64
LOG ?= info
A ?= tour/u_1_0
BLK ?= n

SHELL := /bin/bash

# 根据CHAPTER设置循环范围和章节号
ifeq ($(CHAPTER),u1)
RANGE := 1 2 3 4 5 6
CHAPTER_NUM := 1
else ifeq ($(CHAPTER),u2)
RANGE := 7 8
CHAPTER_NUM := 2
BLK := y
else ifeq ($(CHAPTER),m)
RANGE := 1 2 3
CHAPTER_NUM := 3
BLK := y
else ifeq ($(CHAPTER),h1)
RANGE := 1
CHAPTER_NUM := 4
BLK := y
else ifeq ($(CHAPTER),h2)
RANGE := 2
CHAPTER_NUM := 5
BLK := y
else ifeq ($(CHAPTER),h3)
RANGE := 3
CHAPTER_NUM := 6
BLK := y
endif

testu:
	rm -f ./stdout*
	cd ../arceos && \
	for i in $(RANGE); do \
		rm -f pflash.img; \
		rm -f disk.img; \
		make pflash_img ARCH=$(ARCH); \
		make disk_img ARCH=$(ARCH); \
		make run ARCH=$(ARCH) LOG=$(LOG) A=tour/u_$${i}_0 BLK=$(BLK) | tail -n 20; \
	done | tee -a ../oscamp-ci/stdout-ch$(CHAPTER)
	python3 check/ch$(CHAPTER_NUM).py < stdout-ch$(CHAPTER) || (exit 1)

testm:
	rm -f ./stdout*
	cd ../arceos && \
	for i in $(RANGE); do \
		make payload; \
		if [$$(i) -eq 3]; then \
			./update_disk.sh ./payload/hello_c/hello; \
		else \
			./update_disk.sh ./payload/origin/origin; \
		fi; \
		make run ARCH=$(ARCH) LOG=$(LOG) A=tour/m_$${i}_0 BLK=$(BLK) | tail -n 20; \
	done | tee -a ../oscamp-ci/stdout-ch$(CHAPTER)
	python3 check/ch$(CHAPTER_NUM).py < stdout-ch$(CHAPTER) || (exit 1)

testh1:
	rm -f ./stdout*
	cd ../arceos && \
	for i in $(RANGE); do \
		make payload; \
		./update_disk.sh ./payload/skernel/skernel; \
		make run ARCH=$(ARCH) LOG=$(LOG) A=tour/h_$${i}_0 BLK=$(BLK) | tail -n 20; \
	done | tee -a ../oscamp-ci/stdout-ch$(CHAPTER)
	python3 check/ch$(CHAPTER_NUM).py < stdout-ch$(CHAPTER) || (exit 1)

testh2:
	rm -f ./stdout*
	cd ../arceos && \
	for i in $(RANGE); do \
		rm -f pflash.img; \
		rm -f disk.img; \
		make pflash_img ARCH=$(ARCH); \
		make disk_img ARCH=$(ARCH); \
		./update_disk.sh tour/u_3_0/u_3_0_riscv64-qemu-virt.bin; \
		make run ARCH=$(ARCH) LOG=$(LOG) A=tour/h_$${i}_0 BLK=$(BLK) | tail -n 20; \
	done | tee -a ../oscamp-ci/stdout-ch$(CHAPTER)
	python3 check/ch$(CHAPTER_NUM).py < stdout-ch$(CHAPTER) || (exit 1)

testh3:
	rm -f ./stdout*
	cd ../arceos && \
	for i in $(RANGE); do \
		make A=tour/u_6_0/ ; \
		./update_disk.sh tour/u_6_0/u_6_0_riscv64-qemu-virt.bin; \
		make run ARCH=$(ARCH) LOG=$(LOG) A=tour/h_$${i}_0 BLK=$(BLK) | tail -n 20; \
	done | tee -a ../oscamp-ci/stdout-ch$(CHAPTER)
	python3 check/ch$(CHAPTER_NUM).py < stdout-ch$(CHAPTER) || (exit 1)

.PHONY: testu testm testh1 testh2 testh3