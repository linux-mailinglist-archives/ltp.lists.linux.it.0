Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 942EF30BFA1
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Feb 2021 14:37:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 61E5B3C7466
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Feb 2021 14:37:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 7A5BA3C745D
 for <ltp@lists.linux.it>; Tue,  2 Feb 2021 14:37:33 +0100 (CET)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3AF551000A57
 for <ltp@lists.linux.it>; Tue,  2 Feb 2021 14:37:33 +0100 (CET)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 112DTfXp032312
 for <ltp@lists.linux.it>; Tue, 2 Feb 2021 13:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=99P/hrz4zUOEfjc9xw2Jm3knt1S7xonNm3++h+VMY1w=;
 b=0DYmwXvENC5AdDoqRe7HODDNJwZYI6ql/34J9x7haJ4kK3iIomSmxs3QQ1957MDKEoQI
 W5qDT25DNKLWEuAox+IazRjA0vNvCyFXE4vV6tmx1dVE/L1bLkDcHkReXgN5yY9Jio8b
 0VJAK8aL/L/mgEBsSdZ1LNJ+m67avIcRz0iOHi+xNAl5a/QRzqEvc/22VNmqWW8wQBcx
 iPB9DxOaVyUu+LfrDSqqePFAiw7CwAtSnFZ5IKaoz8aWzUcPufM1mRf/AwlQPKCpFXKQ
 XsmilcdXwCOM40BRwsUbJ6mZUozQC0tdovZCIGr+O3rA2eO7fusSbg8JR+KyAXgAMg7C DA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 36cvyatyh8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Tue, 02 Feb 2021 13:37:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 112DUw1B109113;
 Tue, 2 Feb 2021 13:35:28 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 36dhby8kae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Feb 2021 13:35:28 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 112DZQPg002657;
 Tue, 2 Feb 2021 13:35:26 GMT
Received: from gyrotron.nl.oracle.com (/10.175.12.115)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 02 Feb 2021 05:35:26 -0800
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: ltp@lists.linux.it
Date: Tue,  2 Feb 2021 16:34:53 +0300
Message-Id: <20210202133454.59224-3-alexey.kodanev@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210202133454.59224-1-alexey.kodanev@oracle.com>
References: <20210202133454.59224-1-alexey.kodanev@oracle.com>
MIME-Version: 1.0
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9882
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 suspectscore=0
 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102020092
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9882
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 impostorscore=0
 mlxscore=0 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102020092
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] lib: add tst_get_median helper binary for use in
 script tests
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

/tst_get_median 10 11 300 8 9 14
output: 10

Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
---
 testcases/lib/.gitignore       |  1 +
 testcases/lib/Makefile         |  3 ++-
 testcases/lib/tst_get_median.c | 37 ++++++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 testcases/lib/tst_get_median.c

diff --git a/testcases/lib/.gitignore b/testcases/lib/.gitignore
index 52f99dc45..bc299b6ee 100644
--- a/testcases/lib/.gitignore
+++ b/testcases/lib/.gitignore
@@ -2,6 +2,7 @@
 /tst_checkpoint
 /tst_device
 /tst_getconf
+/tst_get_median
 /tst_get_unused_port
 /tst_kvcmp
 /tst_net_iface_prefix
diff --git a/testcases/lib/Makefile b/testcases/lib/Makefile
index 4616e24c0..f77da0d56 100644
--- a/testcases/lib/Makefile
+++ b/testcases/lib/Makefile
@@ -28,6 +28,7 @@ INSTALL_TARGETS		:= *.sh
 
 MAKE_TARGETS		:= tst_sleep tst_random tst_checkpoint tst_rod tst_kvcmp\
 			   tst_device tst_net_iface_prefix tst_net_ip_prefix tst_net_vars\
-			   tst_getconf tst_supported_fs tst_check_drivers tst_get_unused_port
+			   tst_getconf tst_supported_fs tst_check_drivers tst_get_unused_port\
+			   tst_get_median
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/lib/tst_get_median.c b/testcases/lib/tst_get_median.c
new file mode 100644
index 000000000..5246f12e0
--- /dev/null
+++ b/testcases/lib/tst_get_median.c
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Copyright (c) 2021 Oracle and/or its affiliates. All Rights Reserved. */
+
+#include <stdio.h>
+#include <stdlib.h>
+
+static int cmp(const void *a, const void *b)
+{
+   return (*(int *)a - *(int *)b);
+}
+
+int main(int argc, const char *argv[])
+{
+	const size_t size = argc - 1;
+
+	if (!size) {
+		fprintf(stderr, "Please provide a numeric list\n");
+		return 1;
+	}
+	if (size == 1) {
+		printf("%d", atoi(argv[1]));
+		return 0;
+	}
+
+	int arr[size];
+	size_t i;
+
+	for (i = 0; i < size; ++i)
+		arr[i] = atoi(argv[i + 1]);
+
+	qsort(arr, size, sizeof(arr[0]), cmp);
+
+	const size_t size2 = size / 2;
+	printf("%d", (size & 1) ? arr[size2] : ((arr[size2 - 1] + arr[size2]) / 2));
+
+	return 0;
+}
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
