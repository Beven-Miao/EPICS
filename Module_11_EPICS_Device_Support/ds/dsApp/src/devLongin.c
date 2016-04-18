/* devLongin.c */
/* Example device support module */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>

#include "alarm.h"
#include "dbDefs.h"
#include "dbAccess.h"
#include "recGbl.h"
#include "devSup.h"
#include "longinRecord.h"
#include "epicsExport.h"

/*Create the dset for devLongin */
static long new_longin();

struct {
	long		number;
	DEVSUPFUN	report;
	DEVSUPFUN	init;
	DEVSUPFUN	init_record;
	DEVSUPFUN	get_ioint_info;
	DEVSUPFUN	read_longin;
}devLongin={
	5,
	NULL,
	NULL,
	NULL,
	NULL,
	new_longin,
};
epicsExportAddress(dset,devLongin);

static long new_longin(longinRecord *plongin)
{
    time_t t;
    struct tm *tm;

    time(&t);
    tm = localtime(&t);
    plongin->udf = FALSE;
    plongin->val = tm->tm_sec;

    return 0;
}
