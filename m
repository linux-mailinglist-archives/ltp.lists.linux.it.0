Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB01346B7E
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Mar 2021 22:59:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 49ABD3C9479
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Mar 2021 22:59:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 546A03C9461
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 22:58:42 +0100 (CET)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4C78C1A00E2B
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 22:58:41 +0100 (CET)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12NLnn8x091554; Tue, 23 Mar 2021 17:58:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=9eKvjcjZBFniaHdFKTfmdBeDmlmqjBmMqijXGGV/xsY=;
 b=W+RCU1E77KpGZJ1JXR3Pug9XajSeohbnMXH0RLbNm6Rlm2UHw93V+oXMHyIqmJLtba4p
 LyLMT3BDVWyLflbLg/fxwijxAcpsfd7WeALQE+9oigRzs8qYZ3nRWZSqqycyUSqitB9X
 PrIpd6N4uK1FbU5TRcZxwAPzOabmsvbv9o5jAv4EM4RxuLouYunuWlvpXRsT5iqIy3Nd
 UrBf1bZTKHlZXc+V0wryzjy7N7PJvZgLsFrpR4oTt58tk121OXRNUfgXSFB7Z4dwV12h
 SzorVfqUOGyJXo9n8yxP2J7oVkzzOv+57ucfumdmehcO24tXW8Rf+H3UXayO9YttBJUq lA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37frke84q8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 17:58:26 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12NLosQT094384;
 Tue, 23 Mar 2021 17:58:25 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37frke84pm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 17:58:25 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12NLvsq3001100;
 Tue, 23 Mar 2021 21:58:23 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 37d9a61y5y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 21:58:23 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12NLwKCc35651874
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Mar 2021 21:58:20 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98EBD4C044;
 Tue, 23 Mar 2021 21:58:20 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 424B44C04E;
 Tue, 23 Mar 2021 21:58:20 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 23 Mar 2021 21:58:20 +0000 (GMT)
From: Heiko Carstens <hca@linux.ibm.com>
To: Li Wang <liwang@redhat.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Date: Tue, 23 Mar 2021 22:58:18 +0100
Message-Id: <20210323215819.4161164-3-hca@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210323215819.4161164-1-hca@linux.ibm.com>
References: <YFmUrVOyX4q+8Dy9@osiris>
 <20210323215819.4161164-1-hca@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-23_11:2021-03-23,
 2021-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103230159
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] s390/vdso: fix arch_data access for
 __arch_get_hw_counter()
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Li Wang reported that clock_gettime(CLOCK_MONOTONIC_RAW, ...) returns
incorrect values when time is provided via vdso instead of system call:

vdso_ts_nsec = 4484351380985507, vdso_ts.tv_sec = 4484351, vdso_ts.tv_nsec = 380985507
sys_ts_nsec  = 1446923235377, sys_ts.tv_sec  = 1446, sys_ts.tv_nsec  = 923235377

Within the s390 specific vdso function __arch_get_hw_counter() tries
to read tod clock steering values from the arch_data member of the
passed in vdso_data structure.
However only the arch_data member of the first clock source base
(CS_HRES_COARSE) is initialized. For CS_RAW arch_data is not at all
initialized, which explains the incorrect returned values.

It is a bit odd to provide the required tod clock steering parameters
only within the first element of the _vdso_data array. However for
time namespaces even no member of the _timens_data array contains the
required data, which would make fixing __arch_get_hw_counter() quite
complicated.

Therefore simply add an s390 specific vdso data page which contains
the tod clock steering parameters. Everything else seems to be
unnecessary complex.

Reported-by: Li Wang <liwang@redhat.com>
Fixes: 1ba2d6c0fd4e ("s390/vdso: simplify __arch_get_hw_counter()")
Fixes: eeab78b05d20 ("s390/vdso: implement generic vdso time namespace support")
Link: https://lore.kernel.org/linux-s390/YFnxr1ZlMIOIqjfq@osiris
Signed-off-by: Heiko Carstens <hca@linux.ibm.com>
---
 arch/s390/Kconfig                         |  1 -
 arch/s390/include/asm/vdso.h              |  4 +++-
 arch/s390/include/asm/vdso/data.h         | 13 ------------
 arch/s390/include/asm/vdso/datapage.h     | 17 +++++++++++++++
 arch/s390/include/asm/vdso/gettimeofday.h | 11 ++++++++--
 arch/s390/kernel/time.c                   |  6 +++---
 arch/s390/kernel/vdso.c                   | 25 ++++++++++++++++++++---
 arch/s390/kernel/vdso64/vdso64.lds.S      |  3 ++-
 8 files changed, 56 insertions(+), 24 deletions(-)
 delete mode 100644 arch/s390/include/asm/vdso/data.h
 create mode 100644 arch/s390/include/asm/vdso/datapage.h

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index c1ff874e6c2e..532ce0fcc659 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -77,7 +77,6 @@ config S390
 	select ARCH_HAS_STRICT_MODULE_RWX
 	select ARCH_HAS_SYSCALL_WRAPPER
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
-	select ARCH_HAS_VDSO_DATA
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select ARCH_INLINE_READ_LOCK
 	select ARCH_INLINE_READ_LOCK_BH
diff --git a/arch/s390/include/asm/vdso.h b/arch/s390/include/asm/vdso.h
index b45e3dddd2c2..0d047f519df6 100644
--- a/arch/s390/include/asm/vdso.h
+++ b/arch/s390/include/asm/vdso.h
@@ -3,17 +3,19 @@
 #define __S390_VDSO_H__
 
 #include <vdso/datapage.h>
+#include <asm/vdso/datapage.h>
 
 /* Default link address for the vDSO */
 #define VDSO64_LBASE	0
 
-#define __VVAR_PAGES	2
+#define __VVAR_PAGES	3
 
 #define VDSO_VERSION_STRING	LINUX_2.6.29
 
 #ifndef __ASSEMBLY__
 
 extern struct vdso_data *vdso_data;
+extern struct s390_vdso_data *s390_vdso_data;
 
 int vdso_getcpu_init(void);
 
diff --git a/arch/s390/include/asm/vdso/data.h b/arch/s390/include/asm/vdso/data.h
deleted file mode 100644
index 7b3cdb4a5f48..000000000000
--- a/arch/s390/include/asm/vdso/data.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __S390_ASM_VDSO_DATA_H
-#define __S390_ASM_VDSO_DATA_H
-
-#include <linux/types.h>
-#include <vdso/datapage.h>
-
-struct arch_vdso_data {
-	__u64 tod_steering_delta;
-	__u64 tod_steering_end;
-};
-
-#endif /* __S390_ASM_VDSO_DATA_H */
diff --git a/arch/s390/include/asm/vdso/datapage.h b/arch/s390/include/asm/vdso/datapage.h
new file mode 100644
index 000000000000..bfae78d814af
--- /dev/null
+++ b/arch/s390/include/asm/vdso/datapage.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __S390_ASM_VDSO_DATAPAGE_H
+#define __S390_ASM_VDSO_DATAPAGE_H
+
+#include <linux/types.h>
+
+#ifndef __ASSEMBLY__
+
+struct s390_vdso_data {
+	__u64 tod_steering_delta;
+	__u64 tod_steering_end;
+};
+
+extern struct s390_vdso_data _s390_data __attribute__((visibility("hidden")));
+
+#endif /* __ASSEMBLY__ */
+#endif /* __S390_ASM_VDSO_DATAPAGE_H */
diff --git a/arch/s390/include/asm/vdso/gettimeofday.h b/arch/s390/include/asm/vdso/gettimeofday.h
index ed89ef742530..bbd6da6b1651 100644
--- a/arch/s390/include/asm/vdso/gettimeofday.h
+++ b/arch/s390/include/asm/vdso/gettimeofday.h
@@ -9,6 +9,7 @@
 #include <asm/timex.h>
 #include <asm/unistd.h>
 #include <asm/vdso.h>
+#include <asm/vdso/datapage.h>
 #include <linux/compiler.h>
 
 #define vdso_calc_delta __arch_vdso_calc_delta
@@ -22,14 +23,20 @@ static __always_inline const struct vdso_data *__arch_get_vdso_data(void)
 	return _vdso_data;
 }
 
+static __always_inline const struct s390_vdso_data *__get_s390_vdso_data(void)
+{
+	return &_s390_data;
+}
+
 static inline u64 __arch_get_hw_counter(s32 clock_mode, const struct vdso_data *vd)
 {
+	const struct s390_vdso_data *svd = __get_s390_vdso_data();
 	u64 adj, now;
 
 	now = get_tod_clock();
-	adj = vd->arch_data.tod_steering_end - now;
+	adj = svd->tod_steering_end - now;
 	if (unlikely((s64) adj > 0))
-		now += (vd->arch_data.tod_steering_delta < 0) ? (adj >> 15) : -(adj >> 15);
+		now += (svd->tod_steering_delta < 0) ? (adj >> 15) : -(adj >> 15);
 	return now;
 }
 
diff --git a/arch/s390/kernel/time.c b/arch/s390/kernel/time.c
index e37285a5101b..ec5c12e541aa 100644
--- a/arch/s390/kernel/time.c
+++ b/arch/s390/kernel/time.c
@@ -83,7 +83,7 @@ void __init time_early_init(void)
 
 	/* Initialize TOD steering parameters */
 	tod_steering_end = tod_clock_base.tod;
-	vdso_data->arch_data.tod_steering_end = tod_steering_end;
+	s390_vdso_data->tod_steering_end = tod_steering_end;
 
 	if (!test_facility(28))
 		return;
@@ -381,8 +381,8 @@ static void clock_sync_global(unsigned long delta)
 		panic("TOD clock sync offset %li is too large to drift\n",
 		      tod_steering_delta);
 	tod_steering_end = now + (abs(tod_steering_delta) << 15);
-	vdso_data->arch_data.tod_steering_end = tod_steering_end;
-	vdso_data->arch_data.tod_steering_delta = tod_steering_delta;
+	s390_vdso_data->tod_steering_end = tod_steering_end;
+	s390_vdso_data->tod_steering_delta = tod_steering_delta;
 
 	/* Update LPAR offset. */
 	if (ptff_query(PTFF_QTO) && ptff(&qto, sizeof(qto), PTFF_QTO) == 0)
diff --git a/arch/s390/kernel/vdso.c b/arch/s390/kernel/vdso.c
index 8c4e07d533c8..4f1dba52b240 100644
--- a/arch/s390/kernel/vdso.c
+++ b/arch/s390/kernel/vdso.c
@@ -29,9 +29,16 @@ static union {
 	u8			page[PAGE_SIZE];
 } vdso_data_store __page_aligned_data;
 
+static union {
+	struct s390_vdso_data	data;
+	u8			page[PAGE_SIZE];
+} s390_vdso_page __page_aligned_data;
+
 struct vdso_data *vdso_data = vdso_data_store.data;
+struct s390_vdso_data *s390_vdso_data = &s390_vdso_page.data;
 
 enum vvar_pages {
+	VVAR_S390_PAGE_OFFSET,
 	VVAR_DATA_PAGE_OFFSET,
 	VVAR_TIMENS_PAGE_OFFSET,
 	VVAR_NR_PAGES,
@@ -109,14 +116,26 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 	vm_fault_t err;
 
 	switch (vmf->pgoff) {
+	case VVAR_S390_PAGE_OFFSET:
+		pfn = virt_to_pfn(s390_vdso_data);
+		break;
 	case VVAR_DATA_PAGE_OFFSET:
+		/*
+		 * Fault in VVAR s390 page too, since it will be
+		 * accessed to get tod clock steering data anyway.
+		 */
+		addr = vma->vm_start + VVAR_S390_PAGE_OFFSET * PAGE_SIZE;
+		pfn = virt_to_pfn(s390_vdso_data);
+		err = vmf_insert_pfn(vma, addr, pfn);
+		if (unlikely(err & VM_FAULT_ERROR))
+			return err;
+		addr = vma->vm_start + VVAR_TIMENS_PAGE_OFFSET * PAGE_SIZE;
 		pfn = virt_to_pfn(vdso_data);
 		if (timens_page) {
 			/*
-			 * Fault in VVAR page too, since it will be accessed
-			 * to get clock data anyway.
+			 * Fault in VVAR data page too, since it will be
+			 * accessed to get clock data anyway.
 			 */
-			addr = vmf->address + VVAR_TIMENS_PAGE_OFFSET * PAGE_SIZE;
 			err = vmf_insert_pfn(vma, addr, pfn);
 			if (unlikely(err & VM_FAULT_ERROR))
 				return err;
diff --git a/arch/s390/kernel/vdso64/vdso64.lds.S b/arch/s390/kernel/vdso64/vdso64.lds.S
index 518f1ea405f4..d38e5475df65 100644
--- a/arch/s390/kernel/vdso64/vdso64.lds.S
+++ b/arch/s390/kernel/vdso64/vdso64.lds.S
@@ -13,7 +13,8 @@ ENTRY(_start)
 
 SECTIONS
 {
-	PROVIDE(_vdso_data = . - __VVAR_PAGES * PAGE_SIZE);
+	PROVIDE(_s390_data = . - __VVAR_PAGES * PAGE_SIZE);
+	PROVIDE(_vdso_data = _s390_data + PAGE_SIZE);
 #ifdef CONFIG_TIME_NS
 	PROVIDE(_timens_data = _vdso_data + PAGE_SIZE);
 #endif
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
