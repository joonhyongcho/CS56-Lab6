/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "//thayerfs.thayer.dartmouth.edu/f001dt4/engs31/lab6final2/lab6tb.vhd";



static void work_a_1411082477_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 4472U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(107, ng0);
    t2 = (t0 + 5104);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(108, ng0);
    t2 = (t0 + 3248U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 4280);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(109, ng0);
    t2 = (t0 + 5104);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(110, ng0);
    t2 = (t0 + 3248U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 4280);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_1411082477_2372691052_p_1(char *t0)
{
    char *t1;
    char *t2;
    int64 t3;
    char *t4;
    int64 t5;
    int t6;
    int t7;
    char *t8;
    char *t9;
    int t10;
    int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    int t17;
    int t18;
    int t19;
    int t20;
    unsigned int t21;
    unsigned int t22;
    int t23;
    int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned char t29;
    char *t30;
    char *t31;

LAB0:    t1 = (t0 + 4720U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(119, ng0);
    t3 = (100 * 1000LL);
    t2 = (t0 + 4528);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(121, ng0);
    t2 = (t0 + 3248U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t5 = (t3 * 10);
    t2 = (t0 + 4528);
    xsi_process_wait(t2, t5);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(123, ng0);
    t2 = (t0 + 9036);
    *((int *)t2) = 0;
    t4 = (t0 + 9040);
    *((int *)t4) = 1;
    t6 = 0;
    t7 = 1;

LAB12:    if (t6 <= t7)
        goto LAB13;

LAB15:    xsi_set_current_line(141, ng0);
    t2 = (t0 + 5232);
    t4 = (t2 + 56U);
    t8 = *((char **)t4);
    t9 = (t8 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(144, ng0);
    t2 = (t0 + 5168);
    t4 = (t2 + 56U);
    t8 = *((char **)t4);
    t9 = (t8 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(145, ng0);
    t2 = (t0 + 3368U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t2 = (t0 + 4528);
    xsi_process_wait(t2, t3);

LAB41:    *((char **)t1) = &&LAB42;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB13:    xsi_set_current_line(124, ng0);
    t8 = (t0 + 9044);
    *((int *)t8) = 0;
    t9 = (t0 + 9048);
    *((int *)t9) = 9;
    t10 = 0;
    t11 = 9;

LAB16:    if (t10 <= t11)
        goto LAB17;

LAB19:
LAB14:    t2 = (t0 + 9036);
    t6 = *((int *)t2);
    t4 = (t0 + 9040);
    t7 = *((int *)t4);
    if (t6 == t7)
        goto LAB15;

LAB38:    t10 = (t6 + 1);
    t6 = t10;
    t8 = (t0 + 9036);
    *((int *)t8) = t6;
    goto LAB12;

LAB17:    xsi_set_current_line(125, ng0);
    t12 = (t0 + 5168);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = (unsigned char)2;
    xsi_driver_first_trans_fast(t12);
    xsi_set_current_line(126, ng0);
    t2 = (t0 + 3368U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t2 = (t0 + 4528);
    xsi_process_wait(t2, t3);

LAB22:    *((char **)t1) = &&LAB23;
    goto LAB1;

LAB18:    t2 = (t0 + 9044);
    t10 = *((int *)t2);
    t4 = (t0 + 9048);
    t11 = *((int *)t4);
    if (t10 == t11)
        goto LAB19;

LAB37:    t17 = (t10 + 1);
    t10 = t17;
    t8 = (t0 + 9044);
    *((int *)t8) = t10;
    goto LAB16;

LAB20:    xsi_set_current_line(128, ng0);
    t2 = (t0 + 9052);
    *((int *)t2) = 0;
    t4 = (t0 + 9056);
    *((int *)t4) = 7;
    t17 = 0;
    t18 = 7;

LAB24:    if (t17 <= t18)
        goto LAB25;

LAB27:    xsi_set_current_line(133, ng0);
    t2 = (t0 + 5168);
    t4 = (t2 + 56U);
    t8 = *((char **)t4);
    t9 = (t8 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(136, ng0);
    t3 = (200 * 1000000LL);
    t2 = (t0 + 4528);
    xsi_process_wait(t2, t3);

LAB35:    *((char **)t1) = &&LAB36;
    goto LAB1;

LAB21:    goto LAB20;

LAB23:    goto LAB21;

LAB25:    xsi_set_current_line(129, ng0);
    t8 = (t0 + 3488U);
    t9 = *((char **)t8);
    t8 = (t0 + 9052);
    t19 = *((int *)t8);
    t20 = (t19 - 7);
    t21 = (t20 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t8));
    t22 = (1U * t21);
    t12 = (t0 + 9044);
    t23 = *((int *)t12);
    t24 = (t23 - 0);
    t25 = (t24 * 1);
    t26 = (8U * t25);
    t27 = (0 + t26);
    t28 = (t27 + t22);
    t13 = (t9 + t28);
    t29 = *((unsigned char *)t13);
    t14 = (t0 + 5168);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t30 = (t16 + 56U);
    t31 = *((char **)t30);
    *((unsigned char *)t31) = t29;
    xsi_driver_first_trans_fast(t14);
    xsi_set_current_line(130, ng0);
    t2 = (t0 + 3368U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t2 = (t0 + 4528);
    xsi_process_wait(t2, t3);

LAB30:    *((char **)t1) = &&LAB31;
    goto LAB1;

LAB26:    t2 = (t0 + 9052);
    t17 = *((int *)t2);
    t4 = (t0 + 9056);
    t18 = *((int *)t4);
    if (t17 == t18)
        goto LAB27;

LAB32:    t19 = (t17 + 1);
    t17 = t19;
    t8 = (t0 + 9052);
    *((int *)t8) = t17;
    goto LAB24;

LAB28:    goto LAB26;

LAB29:    goto LAB28;

LAB31:    goto LAB29;

LAB33:    goto LAB18;

LAB34:    goto LAB33;

LAB36:    goto LAB34;

LAB39:    xsi_set_current_line(146, ng0);
    t2 = (t0 + 9060);
    *((int *)t2) = 0;
    t4 = (t0 + 9064);
    *((int *)t4) = 7;
    t6 = 0;
    t7 = 7;

LAB43:    if (t6 <= t7)
        goto LAB44;

LAB46:    xsi_set_current_line(150, ng0);
    t2 = (t0 + 5168);
    t4 = (t2 + 56U);
    t8 = *((char **)t4);
    t9 = (t8 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(152, ng0);
    t3 = (200 * 1000000LL);
    t2 = (t0 + 4528);
    xsi_process_wait(t2, t3);

LAB54:    *((char **)t1) = &&LAB55;
    goto LAB1;

LAB40:    goto LAB39;

LAB42:    goto LAB40;

LAB44:    xsi_set_current_line(147, ng0);
    t8 = (t0 + 3488U);
    t9 = *((char **)t8);
    t8 = (t0 + 9060);
    t10 = *((int *)t8);
    t11 = (t10 - 7);
    t21 = (t11 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t8));
    t22 = (1U * t21);
    t17 = (0 - 0);
    t25 = (t17 * 1);
    t26 = (8U * t25);
    t27 = (0 + t26);
    t28 = (t27 + t22);
    t12 = (t9 + t28);
    t29 = *((unsigned char *)t12);
    t13 = (t0 + 5168);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t30 = *((char **)t16);
    *((unsigned char *)t30) = t29;
    xsi_driver_first_trans_fast(t13);
    xsi_set_current_line(148, ng0);
    t2 = (t0 + 3368U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t2 = (t0 + 4528);
    xsi_process_wait(t2, t3);

LAB49:    *((char **)t1) = &&LAB50;
    goto LAB1;

LAB45:    t2 = (t0 + 9060);
    t6 = *((int *)t2);
    t4 = (t0 + 9064);
    t7 = *((int *)t4);
    if (t6 == t7)
        goto LAB46;

LAB51:    t10 = (t6 + 1);
    t6 = t10;
    t8 = (t0 + 9060);
    *((int *)t8) = t6;
    goto LAB43;

LAB47:    goto LAB45;

LAB48:    goto LAB47;

LAB50:    goto LAB48;

LAB52:    xsi_set_current_line(153, ng0);
    t2 = (t0 + 5232);
    t4 = (t2 + 56U);
    t8 = *((char **)t4);
    t9 = (t8 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(155, ng0);
    t3 = (200 * 1000000LL);
    t2 = (t0 + 4528);
    xsi_process_wait(t2, t3);

LAB58:    *((char **)t1) = &&LAB59;
    goto LAB1;

LAB53:    goto LAB52;

LAB55:    goto LAB53;

LAB56:    xsi_set_current_line(157, ng0);
    t2 = (t0 + 9068);
    *((int *)t2) = 0;
    t4 = (t0 + 9072);
    *((int *)t4) = 3;
    t6 = 0;
    t7 = 3;

LAB60:    if (t6 <= t7)
        goto LAB61;

LAB63:    xsi_set_current_line(174, ng0);
    t3 = (200 * 1000000LL);
    t2 = (t0 + 4528);
    xsi_process_wait(t2, t3);

LAB89:    *((char **)t1) = &&LAB90;
    goto LAB1;

LAB57:    goto LAB56;

LAB59:    goto LAB57;

LAB61:    xsi_set_current_line(158, ng0);
    t8 = (t0 + 9076);
    *((int *)t8) = 0;
    t9 = (t0 + 9080);
    *((int *)t9) = 9;
    t10 = 0;
    t11 = 9;

LAB64:    if (t10 <= t11)
        goto LAB65;

LAB67:
LAB62:    t2 = (t0 + 9068);
    t6 = *((int *)t2);
    t4 = (t0 + 9072);
    t7 = *((int *)t4);
    if (t6 == t7)
        goto LAB63;

LAB86:    t10 = (t6 + 1);
    t6 = t10;
    t8 = (t0 + 9068);
    *((int *)t8) = t6;
    goto LAB60;

LAB65:    xsi_set_current_line(159, ng0);
    t12 = (t0 + 5168);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = (unsigned char)2;
    xsi_driver_first_trans_fast(t12);
    xsi_set_current_line(160, ng0);
    t2 = (t0 + 3368U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t2 = (t0 + 4528);
    xsi_process_wait(t2, t3);

LAB70:    *((char **)t1) = &&LAB71;
    goto LAB1;

LAB66:    t2 = (t0 + 9076);
    t10 = *((int *)t2);
    t4 = (t0 + 9080);
    t11 = *((int *)t4);
    if (t10 == t11)
        goto LAB67;

LAB85:    t17 = (t10 + 1);
    t10 = t17;
    t8 = (t0 + 9076);
    *((int *)t8) = t10;
    goto LAB64;

LAB68:    xsi_set_current_line(162, ng0);
    t2 = (t0 + 9084);
    *((int *)t2) = 0;
    t4 = (t0 + 9088);
    *((int *)t4) = 7;
    t17 = 0;
    t18 = 7;

LAB72:    if (t17 <= t18)
        goto LAB73;

LAB75:    xsi_set_current_line(167, ng0);
    t2 = (t0 + 5168);
    t4 = (t2 + 56U);
    t8 = *((char **)t4);
    t9 = (t8 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(170, ng0);
    t3 = (200 * 1000000LL);
    t2 = (t0 + 4528);
    xsi_process_wait(t2, t3);

LAB83:    *((char **)t1) = &&LAB84;
    goto LAB1;

LAB69:    goto LAB68;

LAB71:    goto LAB69;

LAB73:    xsi_set_current_line(163, ng0);
    t8 = (t0 + 3488U);
    t9 = *((char **)t8);
    t8 = (t0 + 9084);
    t19 = *((int *)t8);
    t20 = (t19 - 7);
    t21 = (t20 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t8));
    t22 = (1U * t21);
    t12 = (t0 + 9076);
    t23 = *((int *)t12);
    t24 = (t23 - 0);
    t25 = (t24 * 1);
    t26 = (8U * t25);
    t27 = (0 + t26);
    t28 = (t27 + t22);
    t13 = (t9 + t28);
    t29 = *((unsigned char *)t13);
    t14 = (t0 + 5168);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t30 = (t16 + 56U);
    t31 = *((char **)t30);
    *((unsigned char *)t31) = t29;
    xsi_driver_first_trans_fast(t14);
    xsi_set_current_line(164, ng0);
    t2 = (t0 + 3368U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t2 = (t0 + 4528);
    xsi_process_wait(t2, t3);

LAB78:    *((char **)t1) = &&LAB79;
    goto LAB1;

LAB74:    t2 = (t0 + 9084);
    t17 = *((int *)t2);
    t4 = (t0 + 9088);
    t18 = *((int *)t4);
    if (t17 == t18)
        goto LAB75;

LAB80:    t19 = (t17 + 1);
    t17 = t19;
    t8 = (t0 + 9084);
    *((int *)t8) = t17;
    goto LAB72;

LAB76:    goto LAB74;

LAB77:    goto LAB76;

LAB79:    goto LAB77;

LAB81:    goto LAB66;

LAB82:    goto LAB81;

LAB84:    goto LAB82;

LAB87:    xsi_set_current_line(175, ng0);
    t2 = (t0 + 5232);
    t4 = (t2 + 56U);
    t8 = *((char **)t4);
    t9 = (t8 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(176, ng0);
    t3 = (200 * 1000000LL);
    t2 = (t0 + 4528);
    xsi_process_wait(t2, t3);

LAB93:    *((char **)t1) = &&LAB94;
    goto LAB1;

LAB88:    goto LAB87;

LAB90:    goto LAB88;

LAB91:    xsi_set_current_line(177, ng0);
    t2 = (t0 + 5232);
    t4 = (t2 + 56U);
    t8 = *((char **)t4);
    t9 = (t8 + 56U);
    t12 = *((char **)t9);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(179, ng0);

LAB97:    *((char **)t1) = &&LAB98;
    goto LAB1;

LAB92:    goto LAB91;

LAB94:    goto LAB92;

LAB95:    goto LAB2;

LAB96:    goto LAB95;

LAB98:    goto LAB96;

}


extern void work_a_1411082477_2372691052_init()
{
	static char *pe[] = {(void *)work_a_1411082477_2372691052_p_0,(void *)work_a_1411082477_2372691052_p_1};
	xsi_register_didat("work_a_1411082477_2372691052", "isim/lab6tb_isim_beh.exe.sim/work/a_1411082477_2372691052.didat");
	xsi_register_executes(pe);
}
