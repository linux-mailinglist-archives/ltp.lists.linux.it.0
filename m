Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E223B6DE99A
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Apr 2023 04:44:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 73E2F3CC8C8
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Apr 2023 04:44:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9BCA63CC91C
 for <ltp@lists.linux.it>; Wed, 12 Apr 2023 04:43:57 +0200 (CEST)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A2C5910005CF
 for <ltp@lists.linux.it>; Wed, 12 Apr 2023 04:43:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1681267435; i=@fujitsu.com;
 bh=kLSHxyLyikFeZbNV6r1eNsr2tvrnO3Cet8sVHk3I6WM=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=QOp9a4u5DG1yLQR2oYlF0FjEvLlJMENlFKHvaIxqTswvXAYXI/2ukrVnfRmQw4o5q
 02ElxL2V6BmqT8qr8X6CadNDjXYM6N7p23L80C4s4QDJWRBcUSDcMuwrF79Qj2DYXU
 gPe/SeUTGVg9b+la1pe2vyTkWtLCQWuv8Ca0ndkdH3WzkN7+Z+Hl8syBmQ5Y56JrCn
 1bQcC91Jw/hXk0J2U86bayvnaRE6STkIeyMaBedtLoHTUqxl7pn9CWUd0uh+eSGUIf
 XmNupeKE+zcyQmBog9PO7g6mKfNU8OfibUyPc/Kky//IG543qNQ0B2xpMO6dSS9RYG
 UvP993qxgA7cw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORqPtKyiz
 F4Pg/ZYsV33cwOjB67Pu9jjWAMYo1My8pvyKBNWPB1JCCCWkVres3sjQwrgjpYuTiEBI4yyjx
 q7ODHcI5wCTx++V/FghnL6PElc//2boYOTnYBDQlnnUuYAaxRQQkJDoa3rKD2MwC6hLLJ/1iA
 rGFBRwk1r45yQhiswioSkw/3wVWwyvgKXG/7x8riC0hoCAx5eF7sDmcAl4Sv1efAbOFgGomLV
 jMCFEvKHFy5hMWiPkSEgdfvGCG6FWSaGu9AjWnQqJx+iEmCFtN4uq5TcwTGAVnIWmfhaR9ASP
 TKkbT4tSistQiXSO9pKLM9IyS3MTMHL3EKt1EvdRS3fLU4hKgTGJ5sV5qcbFecWVuck6KXl5q
 ySZGYOimFKv272Bc2/tX7xCjJAeTkihv0SzTFCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvKslz
 FKEBItS01Mr0jJzgHEEk5bg4FES4f0lBJTmLS5IzC3OTIdInWI05thy+8BeZo5N+7oOMAux5O
 XnpUqJ876VBCoVACnNKM2DGwSL70uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHnvgkzhycw
 rgdv3CugUJqBTTlqYgJxSkoiQkmpgiiyyFVGaGiHnltV2cdPtK+xxq3P8CxVerHi7fu+k3zkq
 nFc+lRavs5oWGybw4rNAq5n3iVOR13cs+iZlOuFTG9Ovras3XAiUDp/+b+O9yoyJW1e/rjySs
 XFWzdGqB05/7tU/lOB9NGexR064RVTEFsGQSWurVGZv3W7k9XXVr8d3w2Pbt9WkhB5sXZR+PY
 t32j+RGV+twq0/2H/z8jkmovim4/dCC7n466lMpVpi2fFrTPiWTZdbLD573fIQ7wcmR+PupN8
 t7s89XDgrJ8tl/vuTOb93rd8z9eiNWM41xSp9b68euM1o+z7e8Lbd3qSXOSub1s+uWj5to0PM
 1pdnrs3NirYw+Nz4I98gNlW54LMSS3FGoqEWc1FxIgBli3C7agMAAA==
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-3.tower-571.messagelabs.com!1681267434!15993!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14677 invoked from network); 12 Apr 2023 02:43:54 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
 by server-3.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Apr 2023 02:43:54 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
 by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 496DF1001AB
 for <ltp@lists.linux.it>; Wed, 12 Apr 2023 03:43:54 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 3CA701001A0
 for <ltp@lists.linux.it>; Wed, 12 Apr 2023 03:43:54 +0100 (BST)
Received: from localhost.localdomain (10.167.215.131) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 12 Apr 2023 03:43:52 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 12 Apr 2023 10:43:29 +0800
Message-ID: <1681267409-24122-2-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681267409-24122-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <1681267409-24122-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.215.131]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] network/lib6/asapi_02: Convert into new api
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

Also make use of SAFE_RECV/SAFE_SENDTO macro and add
detail description for this case.

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 testcases/network/lib6/asapi_02.c | 326 +++++++++++++++---------------
 1 file changed, 159 insertions(+), 167 deletions(-)

diff --git a/testcases/network/lib6/asapi_02.c b/testcases/network/lib6/asapi_02.c
index 3b4405197..bbc8b9a73 100644
--- a/testcases/network/lib6/asapi_02.c
+++ b/testcases/network/lib6/asapi_02.c
@@ -1,102 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (c) 2015 Fujitsu Ltd.
+ * Copyright (c) 2022 FUJITSU LIMITED. All rights reserved.
  * Copyright (c) International Business Machines  Corp., 2001
  *
- * This program is free software: you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation, either version 3 of the License, or
- * (at your option) any later version.
+ * Author: David L Stevens
+ */
+
+/*\
+ * [Description]
  *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
+ * It is a basic test for ICMP6_FILTER.
  *
- * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * For ICMP6_FILTER usage, refer to the following url
+ * https://man.openbsd.org/icmp6
  *
- * Author: David L Stevens
+ * Because of the extra functionality of ICMPv6 in comparison to ICMPv4, a
+ * larger number of messages may be potentially received on an ICMPv6 socket.
+ * Input filters may therefore be used to restrict input to a subset of the
+ * incoming ICMPv6 messages so only interesting messages are returned by the
+ * recv(2) family of calls to an application.
+
+ * The icmp6_filter structure may be used to refine the input message set
+ * according to the ICMPv6 type. By default, all messages types are allowed
+ * on newly created raw ICMPv6 sockets. The following macros may be used to
+ * refine the input set:
+ *
+ * Macros used to manipulate filter value
+ *
+ * void ICMP6_FILTER_SETPASSALL(struct icmp6_filter *filterp);
+ * Allow all incoming messages. filterp is modified to allow all message types.
+ *
+ * void ICMP6_FILTER_SETBLOCKALL(struct icmp6_filter *filterp);
+ * Ignore all incoming messages. filterp is modified to ignore all message types.
+ *
+ * void ICMP6_FILTER_SETPASS(int, struct icmp6_filter *filterp);
+ * Allow ICMPv6 messages with the given type. filterp is modified to allow such
+ * messages.
+ *
+ * void ICMP6_FILTER_SETBLOCK(int, struct icmp6_filter *filterp);
+ * Ignore ICMPv6 messages with the given type. filterp is modified to ignore
+ * such messages.
+ *
+ * int ICMP6_FILTER_WILLPASS(int, const struct icmp6_filter *filterp);
+ * Determine if the given filter will allow an ICMPv6 message of the given type.
+ *
+ * int ICMP6_FILTER_WILLBLOCK(int, const struct icmp6_filter *);
+ * Determine if the given filter will ignore an ICMPv6 message of the given type.
+ *
+ * The getsockopt(2) and setsockopt(2) calls may be used to obtain and install
+ * the filter on ICMPv6 sockets at option level IPPROTO_ICMPV6 and name ICMP6_FILTER
+ * with a pointer to the icmp6_filter structure as the option value.
  */
 
 #include <stdio.h>
 #include <unistd.h>
-#include <errno.h>
-
 #include <sys/wait.h>
 #include <sys/socket.h>
-
 #include <netinet/in.h>
 #include <netinet/ip6.h>
 #include <netinet/icmp6.h>
+#include "tst_test.h"
 
-#include "test.h"
-#include "safe_macros.h"
-
-char *TCID = "asapi_02";
-
-static void setup(void);
+static int sall = -1, sf = -1;
 
-static void icmp6_ft(void);
-
-int main(int argc, char *argv[])
-{
-	int lc;
-
-	tst_parse_opts(argc, argv, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); ++lc)
-		icmp6_ft();
-
-	tst_exit();
-}
-
-static void setup(void)
-{
-	TEST_PAUSE;
-	tst_require_root();
-}
-
-enum tt {
-	T_WILLPASS,
-	T_WILLBLOCK,
+enum filter_macro {
 	T_SETPASS,
 	T_SETBLOCK,
 	T_SETPASSALL,
-	T_SETBLOCKALL
+	T_SETBLOCKALL,
+	T_WILLBLOCK,
+	T_WILLPASS
 };
 
-static struct ftent {
-	char *ft_tname;			/* test name, for logging */
-	unsigned char ft_sndtype;	/* send type field */
-	unsigned char ft_flttype;	/* filter type field */
-	enum tt ft_test;		/* what macro to test */
-	int ft_expected;		/* packet should pass? */
-} ftab[] = {
-	{"ICMP6_FILTER_SETPASS s 20 f 20", 20, 20, T_SETPASS, 1},
-	{"ICMP6_FILTER_SETPASS s 20 f 21", 20, 21, T_SETPASS, 0},
-	{"ICMP6_FILTER_SETBLOCK s 20 f 20", 20, 20, T_SETBLOCK, 0},
-	{"ICMP6_FILTER_SETBLOCK s 20 f 21", 20, 21, T_SETBLOCK, 1},
-	{"ICMP6_FILTER_PASSALL s 20", 20, 0, T_SETPASSALL, 1},
-	{"ICMP6_FILTER_PASSALL s 20", 21, 0, T_SETPASSALL, 1},
-	{"ICMP6_FILTER_BLOCKALL s 20", 20, 0, T_SETBLOCKALL, 0},
-	{"ICMP6_FILTER_BLOCKALL s 20", 21, 0, T_SETBLOCKALL, 0},
-	{"ICMP6_FILTER_WILLBLOCK s 20 f 21", 20, 21, T_WILLBLOCK, 0},
-	{"ICMP6_FILTER_WILLBLOCK s 20 f 20", 20, 20, T_WILLBLOCK, 1},
-	{"ICMP6_FILTER_WILLPASS s 20 f 21", 20, 21, T_WILLPASS, 0},
-	{"ICMP6_FILTER_WILLPASS s 22 f 22", 22, 22, T_WILLPASS, 1},
+static struct tcase {
+	char *tname;
+	unsigned char send_type;
+	unsigned char filter_type;
+	enum filter_macro test_macro;
+	int pass_packet;
+} tcases[] = {
+	{"ICMP6_FILTER_SETPASS send type 20 filter type 20", 20, 20, T_SETPASS, 1},
+	{"ICMP6_FILTER_SETPASS send type 20 filter type 21", 20, 21, T_SETPASS, 0},
+	{"ICMP6_FILTER_SETBLOCK send type 20 filter type 20", 20, 20, T_SETBLOCK, 0},
+	{"ICMP6_FILTER_SETBLOCK send type 20 filter type 21", 20, 21, T_SETBLOCK, 1},
+	{"ICMP6_FILTER_PASSALL send type 20", 20, 0, T_SETPASSALL, 1},
+	{"ICMP6_FILTER_PASSALL send type 20", 21, 0, T_SETPASSALL, 1},
+	{"ICMP6_FILTER_BLOCKALL send type 20", 20, 0, T_SETBLOCKALL, 0},
+	{"ICMP6_FILTER_BLOCKALL send type 20", 21, 0, T_SETBLOCKALL, 0},
+	{"ICMP6_FILTER_WILLBLOCK send type 20 filter type 21", 20, 21, T_WILLBLOCK, 0},
+	{"ICMP6_FILTER_WILLBLOCK send type 20 filter type 20", 20, 20, T_WILLBLOCK, 1},
+	{"ICMP6_FILTER_WILLPASS send type 20 filter type 21", 20, 21, T_WILLPASS, 0},
+	{"ICMP6_FILTER_WILLPASS send type 22 filter type 22", 22, 22, T_WILLPASS, 1},
 };
 
-#define FTCOUNT	ARRAY_SIZE(ftab)
-
-static int ic6_send1(char *tname, unsigned char type)
+static void ic6_send(unsigned char type)
 {
 	struct sockaddr_in6 sin6;
 	struct icmp6_hdr ic6;
 	int s;
 
-	s = SAFE_SOCKET(NULL, AF_INET6, SOCK_RAW, IPPROTO_ICMPV6);
+	s = SAFE_SOCKET(AF_INET6, SOCK_RAW, IPPROTO_ICMPV6);
 
 	memset(&ic6, 0, sizeof(ic6));
 	ic6.icmp6_type = type;
@@ -105,22 +108,15 @@ static int ic6_send1(char *tname, unsigned char type)
 	memset(&sin6, 0, sizeof(sin6));
 	sin6.sin6_family = AF_INET6;
 	sin6.sin6_addr = in6addr_loopback;
-	if (sendto(s, &ic6, sizeof(ic6), 0, (struct sockaddr *)&sin6,
-		   sizeof(sin6)) == -1) {
-		tst_resm(TBROK | TERRNO, "%s: sendto failed", tname);
-		return 1;
-	}
-	return 0;
+	SAFE_SENDTO(0, s, &ic6, sizeof(ic6), 0, (struct sockaddr *)&sin6, sizeof(sin6));
 }
 
-static int ic6_recv1(char *tname, int sall, int sf)
+static int ic6_recv(void)
 {
 	fd_set readfds, readfds_saved;
 	struct timeval tv;
-	int maxfd, nfds;
-	int gotall, gotone;
-	int cc;
-	static unsigned char rbuf[2048];
+	int maxfd, nfds, gotall, gotone;
+	unsigned char rbuf[2048];
 
 	tv.tv_sec = 0;
 	tv.tv_usec = 250000;
@@ -133,125 +129,121 @@ static int ic6_recv1(char *tname, int sall, int sf)
 	memcpy(&readfds, &readfds_saved, sizeof(readfds));
 
 	gotall = gotone = 0;
-	/*
-	 * Note: this relies on linux-specific behavior (select
-	 * updating tv with time elapsed)
-	 */
+
 	while (!gotall || !gotone) {
 		struct icmp6_hdr *pic6 = (struct icmp6_hdr *)rbuf;
 
 		nfds = select(maxfd + 1, &readfds, 0, 0, &tv);
 		if (nfds == 0)
-			break;	/* timed out */
+			break;
 		if (nfds < 0) {
 			if (errno == EINTR)
 				continue;
-			tst_resm(TBROK | TERRNO, "%s: select failed", tname);
+			tst_brk(TBROK | TERRNO, "select failed");
 		}
 		if (FD_ISSET(sall, &readfds)) {
-			cc = recv(sall, rbuf, sizeof(rbuf), 0);
-			if (cc < 0) {
-				tst_resm(TBROK | TERRNO,
-					 "%s: recv(sall, ..) failed", tname);
-				return -1;
-			}
-			/* if packet check succeeds... */
+			SAFE_RECV(0, sall, rbuf, sizeof(rbuf), 0);
 			if (htonl(pic6->icmp6_data32[0]) == (uint32_t)getpid())
 				gotall = 1;
 		}
 		if (FD_ISSET(sf, &readfds)) {
-			cc = recv(sf, rbuf, sizeof(rbuf), 0);
-			if (cc < 0) {
-				tst_resm(TBROK | TERRNO,
-					 "%s: recv(sf, ..) failed", tname);
-				return -1;
-			}
-			/* if packet check succeeds... */
+			SAFE_RECV(0, sf, rbuf, sizeof(rbuf), 0);
 			if (htonl(pic6->icmp6_data32[0]) == (uint32_t)getpid())
 				gotone = 1;
 		}
 		memcpy(&readfds, &readfds_saved, sizeof(readfds));
 	}
 	if (!gotall) {
-		tst_resm(TBROK, "%s: recv all timed out", tname);
+		tst_res(TFAIL, "recv all time out");
 		return -1;
 	}
+
 	if (gotone)
 		return 1;
+
 	return 0;
 }
 
-/* functional tests */
-static void icmp6_ft(void)
+static void verify_icmp6_filter(unsigned int n)
 {
+	struct tcase *tc = &tcases[n];
 	struct icmp6_filter i6f;
-	int sall, sf;
-	unsigned int i;
-
-	sall = SAFE_SOCKET(NULL, PF_INET6, SOCK_RAW, IPPROTO_ICMPV6);
-
-	ICMP6_FILTER_SETPASSALL(&i6f);
-	if (setsockopt(sall, IPPROTO_ICMPV6, ICMP6_FILTER, &i6f,
-		       sizeof(i6f)) < 0) {
-		tst_resm(TBROK | TERRNO,
-			 "setsockopt pass all ICMP6_FILTER failed");
+	int rc;
+
+	tst_res(TINFO, "Testing %s", tc->tname);
+	switch (tc->test_macro) {
+	case T_SETPASS:
+		ICMP6_FILTER_SETBLOCKALL(&i6f);
+		ICMP6_FILTER_SETPASS(tc->filter_type, &i6f);
+		break;
+	case T_SETPASSALL:
+		ICMP6_FILTER_SETPASSALL(&i6f);
+		break;
+	case T_SETBLOCK:
+		ICMP6_FILTER_SETPASSALL(&i6f);
+		ICMP6_FILTER_SETBLOCK(tc->filter_type, &i6f);
+		break;
+	case T_SETBLOCKALL:
+		ICMP6_FILTER_SETBLOCKALL(&i6f);
+		break;
+	case T_WILLBLOCK:
+		ICMP6_FILTER_SETPASSALL(&i6f);
+		ICMP6_FILTER_SETBLOCK(tc->filter_type, &i6f);
+		rc = ICMP6_FILTER_WILLBLOCK(tc->send_type, &i6f);
+		goto check_will_rc;
+	case T_WILLPASS:
+		ICMP6_FILTER_SETBLOCKALL(&i6f);
+		ICMP6_FILTER_SETPASS(tc->filter_type, &i6f);
+		rc = ICMP6_FILTER_WILLPASS(tc->send_type, &i6f);
+		goto check_will_rc;
+	default:
+		tst_brk(TBROK, "unknown test type %d", tc->filter_type);
+		break;
 	}
+	SAFE_SETSOCKOPT(sf, IPPROTO_ICMPV6, ICMP6_FILTER, &i6f, sizeof(i6f));
+	ic6_send(tc->send_type);
+	rc = ic6_recv();
+	if (rc < 0)
+		return;
+	if (rc != tc->pass_packet) {
+		tst_res(TFAIL, "%s packet type %d unexpectedly",
+				rc ? "pass" : "block", tc->send_type);
+	} else {
+		tst_res(TPASS, "%s packet type %d as expected",
+				tc->pass_packet ? "pass" : "block", tc->send_type);
+	}
+	return;
 
-	sf = SAFE_SOCKET(NULL, PF_INET6, SOCK_RAW, IPPROTO_ICMPV6);
-
-	int rv;
+check_will_rc:
+	if (rc != tc->pass_packet)
+		tst_res(TFAIL, "rc %d != expected %d", rc, tc->pass_packet);
+	else
+		tst_res(TPASS, "expected rc %d", rc);
+}
 
-	for (i = 0; i < FTCOUNT; ++i) {
+static void setup(void)
+{
+	struct icmp6_filter i6f;
 
-		rv = -1;
+	sall = SAFE_SOCKET(PF_INET6, SOCK_RAW, IPPROTO_ICMPV6);
+	ICMP6_FILTER_SETPASSALL(&i6f);
+	SAFE_SETSOCKOPT(sall, IPPROTO_ICMPV6, ICMP6_FILTER, &i6f, sizeof(i6f));
 
-		switch (ftab[i].ft_test) {
-		case T_SETPASS:
-			ICMP6_FILTER_SETBLOCKALL(&i6f);
-			ICMP6_FILTER_SETPASS(ftab[i].ft_flttype, &i6f);
-			break;
-		case T_SETPASSALL:
-			ICMP6_FILTER_SETPASSALL(&i6f);
-			break;
-		case T_SETBLOCK:
-			ICMP6_FILTER_SETPASSALL(&i6f);
-			ICMP6_FILTER_SETBLOCK(ftab[i].ft_flttype, &i6f);
-			break;
-		case T_SETBLOCKALL:
-			ICMP6_FILTER_SETBLOCKALL(&i6f);
-			break;
-		case T_WILLBLOCK:
-			ICMP6_FILTER_SETPASSALL(&i6f);
-			ICMP6_FILTER_SETBLOCK(ftab[i].ft_flttype, &i6f);
-			rv = ICMP6_FILTER_WILLBLOCK(ftab[i].ft_sndtype, &i6f);
-			break;
-		case T_WILLPASS:
-			ICMP6_FILTER_SETBLOCKALL(&i6f);
-			ICMP6_FILTER_SETPASS(ftab[i].ft_flttype, &i6f);
-			rv = ICMP6_FILTER_WILLPASS(ftab[i].ft_sndtype, &i6f);
-			break;
-		default:
-			tst_resm(TBROK, "%s: unknown test type %d",
-				 ftab[i].ft_tname, ftab[i].ft_test);
-			continue;
-		}
-		if (ftab[i].ft_test != T_WILLBLOCK &&
-		    ftab[i].ft_test != T_WILLPASS) {
-			if (setsockopt(sf, IPPROTO_ICMPV6, ICMP6_FILTER, &i6f,
-				       sizeof(i6f)) < 0) {
-				tst_resm(TFAIL | TERRNO,
-					 "setsockopt ICMP6_FILTER");
-				continue;
-			}
-			if (ic6_send1(ftab[i].ft_tname, ftab[i].ft_sndtype))
-				continue;
-			rv = ic6_recv1(ftab[i].ft_tname, sall, sf);
-		}
+	sf = SAFE_SOCKET(PF_INET6, SOCK_RAW, IPPROTO_ICMPV6);
+}
 
-		if (rv != ftab[i].ft_expected)
-			tst_resm(TFAIL, "%s: rv %d != expected %d",
-				 ftab[i].ft_tname, rv, ftab[i].ft_expected);
-		else
-			tst_resm(TPASS, "%s", ftab[i].ft_tname);
-	}
+static void cleanup(void)
+{
+	if (sall > -1)
+		SAFE_CLOSE(sall);
+	if (sf > -1)
+		SAFE_CLOSE(sf);
 }
+
+static struct tst_test test = {
+	.needs_root = 1,
+	.setup = setup,
+	.cleanup = cleanup,
+	.test = verify_icmp6_filter,
+	.tcnt = ARRAY_SIZE(tcases)
+};
-- 
2.39.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
