Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0672ABF45
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 15:57:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9CC193C538F
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 15:57:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 10F023C1876
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 15:57:25 +0100 (CET)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 03A8E1A00F69
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 15:57:23 +0100 (CET)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A9EVwhO106313
 for <ltp@lists.linux.it>; Mon, 9 Nov 2020 09:57:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=PxBUMP4kyU63EIHZkxWXEnFG9cst6JcPdH/0vEKN6hg=;
 b=jkQVAReTn97dbthp5gATv4K0TBPYmuQvF77ozkZ19g7/LanFJc8KRLBBD3HhdBxHiS3O
 qr0vqAad0pH20NXd0IGj4QX++U3ZgKnFgCpKYwtJmOsrOzunowgHEdxrARsvNlaB5GGT
 IVgMLKqjsDxkEGDOoRlPNbs5uSMm2Fm50MrDxvZ6kwSdxKAQB4xsx47zN+fi9S6XCJd7
 0RXIW/Hrx8+h0y24bvOzfgE8qJwaNRNSB32QsGTQjdtoq48gEnF555tUrYr3EPaFICxj
 L14tDtJiBQiyuCrhcc72vuzKgJvhQXumQarPtGSk5PiYoxxEEeVViebvRekgmeaFmnSn jA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34q74ej0pj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Mon, 09 Nov 2020 09:57:20 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A9EqA8A019734
 for <ltp@lists.linux.it>; Mon, 9 Nov 2020 14:57:18 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 34nk7813f4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Mon, 09 Nov 2020 14:57:18 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A9EvFWW10879666
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Nov 2020 14:57:16 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C220DA4051;
 Mon,  9 Nov 2020 14:57:15 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 601A1A4059;
 Mon,  9 Nov 2020 14:57:15 +0000 (GMT)
Received: from oc8242746057.ibm.com.com (unknown [9.171.3.151])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  9 Nov 2020 14:57:15 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: ltp@lists.linux.it
Date: Mon,  9 Nov 2020 15:56:57 +0100
Message-Id: <20201109145657.602251-1-egorenar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-09_02:2020-11-05,
 2020-11-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 mlxlogscore=959 phishscore=0 spamscore=0
 impostorscore=0 suspectscore=1 mlxscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011090098
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/1] lib/tst_virt: support IBM/Z LPAR and z/VM
 virtualization environments
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Add 3 new virtualization types for IBM System Z architecture:
* VIRT_IBMZ (either LPAR ot z/VM)
* VIRT_IBMZ_LPAR (LPAR only)
* VIRT_IBMZ_ZVM (z/VM only)

VIRT_IBMZ is true when either VIRT_IBMZ_LPAR or VIRT_IBMZ_ZVM is true.

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
---

 v1 -> v2:
  * Remove redundancy by merging is_ibmz_lpar() and is_ibmz_zvm()
    into is_ibmz_vm()
  * Fix variable naming in is_ibmz_vm()

 include/tst_cpu.h |  3 +++
 lib/tst_virt.c    | 46 +++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/include/tst_cpu.h b/include/tst_cpu.h
index c83a58260..117e27087 100644
--- a/include/tst_cpu.h
+++ b/include/tst_cpu.h
@@ -12,6 +12,9 @@ long tst_ncpus_max(void);
 #define VIRT_ANY	0	/* catch-all argument for tst_is_virt() */
 #define VIRT_XEN	1	/* xen dom0/domU */
 #define VIRT_KVM	2	/* only default virtual CPU */
+#define VIRT_IBMZ	3	/* ibm system z */
+#define VIRT_IBMZ_LPAR	4	/* ibm system z lpar */
+#define VIRT_IBMZ_ZVM	5	/* ibm system z zvm */
 #define VIRT_OTHER	0xffff	/* unrecognized hypervisor */
 
 int tst_is_virt(int virt_type);
diff --git a/lib/tst_virt.c b/lib/tst_virt.c
index 914a08d96..86e7cf729 100644
--- a/lib/tst_virt.c
+++ b/lib/tst_virt.c
@@ -64,6 +64,41 @@ static int is_xen(void)
 	return 0;
 }
 
+static int is_ibmz_vm(int virt_type)
+{
+	FILE *sysinfo;
+	char line[64];
+	int found_lpar, found_zvm;
+
+	if (virt_type != VIRT_IBMZ_LPAR && virt_type != VIRT_IBMZ_ZVM)
+		return 0;
+
+	if (access("/proc/sysinfo", F_OK) != 0)
+		return 0;
+
+	sysinfo = SAFE_FOPEN(NULL, "/proc/sysinfo", "r");
+	found_lpar = 0;
+	found_zvm = 0;
+	while (fgets(line, sizeof(line), sysinfo) != NULL) {
+		if (strstr(line, "LPAR"))
+			found_lpar = 1;
+		else if (strstr(line, "z/VM"))
+			found_zvm = 1;
+	}
+
+	SAFE_FCLOSE(NULL, sysinfo);
+
+	if (virt_type == VIRT_IBMZ_LPAR)
+		return found_lpar && !found_zvm;
+	else
+		return found_lpar && found_zvm;
+}
+
+static int is_ibmz(void)
+{
+	return is_ibmz_vm(VIRT_IBMZ_LPAR) || is_ibmz_vm(VIRT_IBMZ_ZVM);
+}
+
 static int try_systemd_detect_virt(void)
 {
 	FILE *f;
@@ -102,6 +137,9 @@ static int try_systemd_detect_virt(void)
 	if (!strncmp("xen", virt_type, 3))
 		return VIRT_XEN;
 
+	if (!strncmp("zvm", virt_type, 3))
+		return VIRT_IBMZ_ZVM;
+
 	return VIRT_OTHER;
 }
 
@@ -118,11 +156,17 @@ int tst_is_virt(int virt_type)
 
 	switch (virt_type) {
 	case VIRT_ANY:
-		return is_xen() || is_kvm();
+		return is_xen() || is_kvm() || is_ibmz();
 	case VIRT_XEN:
 		return is_xen();
 	case VIRT_KVM:
 		return is_kvm();
+	case VIRT_IBMZ:
+		return is_ibmz();
+	case VIRT_IBMZ_LPAR:
+		return is_ibmz_vm(VIRT_IBMZ_LPAR);
+	case VIRT_IBMZ_ZVM:
+		return is_ibmz_vm(VIRT_IBMZ_ZVM);
 	case VIRT_OTHER:
 		return 0;
 	}
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
