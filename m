Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D0B397079
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:36:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 961203C5FC2
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:36:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A2C363C5592
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:36:26 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 190FD6003CB
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:36:24 +0200 (CEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1519Xpub113416
 for <ltp@lists.linux.it>; Tue, 1 Jun 2021 05:36:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=sUlh5Fx+ICmntUFdwyDAlMR1dzxB8Fn0c1cg36xURls=;
 b=Fxt+zInalDNbGclpx7plAOM+xAa3DfjhdakEMiQyYkdNgqaFiBiSKTARTSF3WGK0uItO
 ZiP/FBep97VzYcjKlFE4wJ0ewpWkDHTxhl0XlZfcVlHb2uvTyrli0dMl+K5X2ScgG8O/
 C6Ovf2a0ztmtfPbAQTja+vdtCNWiM/pewqqY7Paz/yEpsLsLuZbJYckuQMGRqL4RiKCr
 0XvaHi3/gHiFD7DfzpCa06oK+Ga7FrHF01NL5TPw4E21qZkiNRNKP/9FtYeDvemBfi1+
 P+NQ4JDL3g+3XB1/pDuC747cVxG6J6kJMTdgCUMkK/gdbk2NXJwqHZDSmQHeVgFyuZmB Og== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38whn7h3t3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Tue, 01 Jun 2021 05:36:22 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1519T73G025088
 for <ltp@lists.linux.it>; Tue, 1 Jun 2021 09:36:20 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 38ud889jty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Tue, 01 Jun 2021 09:36:20 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1519aHJY27590946
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Jun 2021 09:36:17 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B08BA404D;
 Tue,  1 Jun 2021 09:36:17 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E61BA4053;
 Tue,  1 Jun 2021 09:36:17 +0000 (GMT)
Received: from oc8242746057.lan (unknown [9.171.63.112])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Jun 2021 09:36:17 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: ltp@lists.linux.it
Date: Tue,  1 Jun 2021 11:36:13 +0200
Message-Id: <20210601093614.245873-1-egorenar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pidvRXvco_xT0hyot2y-kJ6lsrs1Y6IX
X-Proofpoint-ORIG-GUID: pidvRXvco_xT0hyot2y-kJ6lsrs1Y6IX
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-01_05:2021-05-31,
 2021-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106010064
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] clock_settime03: fix type of time
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

tst_ts_set_sec() accepts a signed long value.
And Unix time is always a signed value.

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
---
 testcases/kernel/syscalls/clock_settime/clock_settime03.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/clock_settime/clock_settime03.c b/testcases/kernel/syscalls/clock_settime/clock_settime03.c
index c25277d92..f196a257c 100644
--- a/testcases/kernel/syscalls/clock_settime/clock_settime03.c
+++ b/testcases/kernel/syscalls/clock_settime/clock_settime03.c
@@ -45,7 +45,7 @@ static void setup(void)
 static void run(void)
 {
 	struct time64_variants *tv = &variants[tst_variant];
-	unsigned long long time = 0x7FFFFFFE; /* Time just before y2038 */
+	long long time = 0x7FFFFFFE; /* Time just before y2038 */
 	struct sigevent ev = {
 		.sigev_notify = SIGEV_SIGNAL,
 		.sigev_signo = SIGABRT,
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
