SHELL=/bin/bash
CONDATOOL=/opt/symbiflow/eos-s3/conda
TOP := helloworldfpga
VERILOG := helloworldfpga.v  
PARTNAME := PU64
DEVICE  := ql-eos-s3_wlcsp
PCF := quickfeather.pcf
SDC := helloworldfpga_dummy.sdc
BUILDDIR := build

 
.PHONY: all
all: ${BUILDDIR}/${TOP}.bit

${BUILDDIR}:
	mkdir ${BUILDDIR}

${BUILDDIR}/${TOP}.eblif: ${VERILOG} ${BUILDDIR}
	cd ${BUILDDIR} && synth -t ${TOP} -v ../${VERILOG} -d ${DEVICE} -p ../${PCF} -P ${PART} 2>&1 > ${TOP}.log

${BUILDDIR}/${TOP}.net: ${BUILDDIR}/${TOP}.eblif
	cd ${BUILDDIR} && pack -e ${TOP}.eblif -d ${DEVICE} -s ${SDC} 2>&1 >> ${TOP}.log

${BUILDDIR}/${TOP}.place: ${BUILDDIR}/${TOP}.net
	cd ${BUILDDIR} && place -e ${TOP}.eblif -d ${DEVICE} -p ../${PCF} -n ${TOP}.net -P ${PARTNAME} -s ${SDC} 2>&1 >> ${TOP}.log

${BUILDDIR}/${TOP}.route: ${BUILDDIR}/${TOP}.place
	cd ${BUILDDIR} && route -e ${TOP}.eblif -d ${DEVICE} -s ${SDC} 2>&1 >> ${TOP}.log

${BUILDDIR}/${TOP}.fasm: ${BUILDDIR}/${TOP}.route
	cd ${BUILDDIR} && write_fasm -e ${TOP}.eblif -d ${DEVICE} 2>&1 >> ${TOP}.log

${BUILDDIR}/${TOP}.bit: ${BUILDDIR}/${TOP}.fasm
	cd ${BUILDDIR} && write_bitstream -d ${DEVICE} -f ${TOP}.fasm -P ${PARTNAME} -b ${TOP}.bit 2>&1 >> ${TOP}.log

${BUILDDIR}/${TOP}_bit.h: ${BUILDDIR}/${TOP}.bit
	cd ${BUILDDIR} && write_bitheader -b ${TOP}.bit 2>&1 >> ${TOP}.log

${BUILDDIR}/${TOP}.jlink: ${BUILDDIR}/${TOP}.bit
	cd ${BUILDDIR} && write_jlink -f ${TOP}.fasm -P ${PACKAGENAME} -b ${TOP}.bit 2>&1 >> ${TOP}.log

${BUILDDIR}/${TOP}_jlink.h: ${BUILDDIR}/${TOP}.jlink
	cd ${BUILDDIR} && write_jlinkheader 2>&1 >> ${TOP}.log

${BUILDDIR}/${TOP}.post_v: ${BUILDDIR}/${TOP}.bit
	cd ${BUILDDIR} && \
	write_fasm2bels -e ${TOP}.eblif -d ${DEVICE} -p ../${PCF} -n ${TOP}.net -P ${PARTNAME} 2>&1 >> ${TOP}.log && \
	analysis -e ${TOP}.eblif -d ${DEVICE} -s ${SDC} 2>&1 >> ${TOP}.log

.PHONY: clean
clean:
	rm -rf ${BUILDDIR}





