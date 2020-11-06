Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CDA2A96B2
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Nov 2020 14:07:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EDBE23C60CE
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Nov 2020 14:06:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 02D1D3C60DA
 for <ltp@lists.linux.it>; Fri,  6 Nov 2020 14:06:43 +0100 (CET)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B34F0600847
 for <ltp@lists.linux.it>; Fri,  6 Nov 2020 14:06:42 +0100 (CET)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6D5uY6126676
 for <ltp@lists.linux.it>; Fri, 6 Nov 2020 08:06:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Mv2AilJGKmEGkfPd2QWUqKg0pMhPhwtJQntmoIEGAnI=;
 b=J1kAZofaJAThdwDW/0Gvr22hYMOXNdkCt8G4AfKy2n3/qtfcDEDoq3d4uQzNb8KOlb2d
 gQELixq4voWVbX9w3goiLPyf8smd9MppLNZAcMxLqsTsP2qlPjBtqdtq32rGb8+2jBb/
 5n6uhgo1df79uN5+KwT1cBaORm0ibjMb/NfBMo1eN560BiNODnp6lRKUnxb1lS03+Tpa
 YcTbKRRnHWNm7xpBNXVj0pHITz8h8ogD/KUAocT8py2hGruKa3C4avr6d5N0UtiYP5aN
 MXBqQQYOMhuYkCBcDCj7EzJbZHOEqWn+8I0wQG0Hk2GBph4Gk9FRsqswKJr+bBv2/LaC OQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34n72v80xm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Fri, 06 Nov 2020 08:06:41 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A6D37eO008205
 for <ltp@lists.linux.it>; Fri, 6 Nov 2020 13:06:39 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 34h01ue8tq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Fri, 06 Nov 2020 13:06:39 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A6D6adm9700026
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Nov 2020 13:06:36 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD75AAE057;
 Fri,  6 Nov 2020 13:06:36 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62C18AE055;
 Fri,  6 Nov 2020 13:06:36 +0000 (GMT)
Received: from oc8242746057.ibm.com.com (unknown [9.171.34.51])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 Nov 2020 13:06:36 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: ltp@lists.linux.it
Date: Fri,  6 Nov 2020 14:06:24 +0100
Message-Id: <20201106130624.454614-3-egorenar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201106130624.454614-1-egorenar@linux.ibm.com>
References: <20201106130624.454614-1-egorenar@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_04:2020-11-05,
 2020-11-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=1 bulkscore=0 phishscore=0
 mlxlogscore=852 mlxscore=0 adultscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011060090
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] lib/tst_virt: support IBM/Z LPAR and z/VM
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
Cc: Alexander Egorenkov <Alexander.Egorenkov@ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Alexander Egorenkov <Alexander.Egorenkov@ibm.com>

Add 3 new virtualization types for IBM System Z architecture:
* VIRT_IBMZ (either LPAR ot z/VM)
* VIRT_IBMZ_LPAR (LPAR only)
* VIRT_IBMZ_ZVM (z/VM only)

VIRT_IBMZ is true when either VIRT_IBMZ_LPAR or VIRT_IBMZ_ZVM is true.

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
---
 include/tst_cpu.h |  3 +++
 lib/tst_virt.c    | 62 ++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 64 insertions(+), 1 deletion(-)

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
index 914a08d96..c57d4fcfc 100644
--- a/lib/tst_virt.c
+++ b/lib/tst_virt.c
@@ -64,6 +64,57 @@ static int is_xen(void)
 	return 0;
 }
 
+static int is_ibmz_lpar(void)
+{
+	FILE *cpuinfo;
+	char line[64];
+	int found_lpar, found_zvm;
+
+	if (access("/proc/sysinfo", F_OK) != 0)
+		return 0;
+
+	cpuinfo = SAFE_FOPEN(NULL, "/proc/sysinfo", "r");
+	found_lpar = 0;
+	found_zvm = 0;
+	while (fgets(line, sizeof(line), cpuinfo) != NULL) {
+		if (strstr(line, "LPAR"))
+			found_lpar = 1;
+		else if (strstr(line, "z/VM"))
+			found_zvm = 1;
+	}
+
+	SAFE_FCLOSE(NULL, cpuinfo);
+	return found_lpar && !found_zvm;
+}
+
+static int is_ibmz_zvm(void)
+{
+	FILE *cpuinfo;
+	char line[64];
+	int found_lpar, found_zvm;
+
+	if (access("/proc/sysinfo", F_OK) != 0)
+		return 0;
+
+	cpuinfo = SAFE_FOPEN(NULL, "/proc/sysinfo", "r");
+	found_lpar = 0;
+	found_zvm = 0;
+	while (fgets(line, sizeof(line), cpuinfo) != NULL) {
+		if (strstr(line, "LPAR"))
+			found_lpar = 1;
+		else if (strstr(line, "z/VM"))
+			found_zvm = 1;
+	}
+
+	SAFE_FCLOSE(NULL, cpuinfo);
+	return found_lpar && found_zvm;
+}
+
+static int is_ibmz(void)
+{
+	return is_ibmz_lpar() || is_ibmz_zvm();
+}
+
 static int try_systemd_detect_virt(void)
 {
 	FILE *f;
@@ -102,6 +153,9 @@ static int try_systemd_detect_virt(void)
 	if (!strncmp("xen", virt_type, 3))
 		return VIRT_XEN;
 
+	if (!strncmp("zvm", virt_type, 3))
+		return VIRT_IBMZ_ZVM;
+
 	return VIRT_OTHER;
 }
 
@@ -118,11 +172,17 @@ int tst_is_virt(int virt_type)
 
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
+		return is_ibmz_lpar();
+	case VIRT_IBMZ_ZVM:
+		return is_ibmz_zvm();
 	case VIRT_OTHER:
 		return 0;
 	}
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
