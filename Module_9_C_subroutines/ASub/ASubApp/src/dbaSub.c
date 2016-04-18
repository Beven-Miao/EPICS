#include <stdio.h>
#include <aSubRecord.h>
#include <registryFunction.h>
#include <epicsExport.h>
#include <recGbl.h>

static int calc_mass_center(aSubRecord *precord) {
	long i;
	float ma, mb, *pa, *pb, *pma, *pmb, *val;
	pa = (float *)precord->a;
	pb = (float *)precord->b;
	pma = (float *)precord->c;
	pmb = (float *)precord->d;
	val = (float *)precord->vala;
	ma = pma[0];
	mb = pmb[0];
	
	// raise a MAJOR CALC alarm when either of the points' mass is zero
	if (ma == 0 || mb == 0) {
		recGblSetSevr(precord,12,2);
		printf("Mass can't be zero!\n");
		printf("\n");
		return 0;
	}
	
	recGblSetSevr(precord,0,0);
		
	printf("ma: %1.1f, mb: %1.1f\n", ma, mb);
	for (i=0; i<precord->noa; i++) {
		val[i] = (ma * pa[i] + mb * pb[i]) / (ma + mb);
		printf("pa: %2.4f, pb: %2.4f, mc: %2.4f\n", pa[i], pb[i],val[i]);
	}
	printf("\n");

	return 0;
}
epicsRegisterFunction(calc_mass_center);
