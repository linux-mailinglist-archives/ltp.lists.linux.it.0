Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0E539708E
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:49:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D7A93C5828
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:49:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B12463C5A31
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:49:02 +0200 (CEST)
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 76DEC600354
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:49:00 +0200 (CEST)
Received: by mail-lj1-x243.google.com with SMTP id p20so18357586ljj.8
 for <ltp@lists.linux.it>; Tue, 01 Jun 2021 02:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pw0MwsJXruVXKES5+YYTxDEsvQrLdknZdt5nVnQlwSU=;
 b=FHaWuZAzl5/7QoRaazjNx7zxYu7dKyb7I2cr/xeN+qKZlhFzrXOvVP7nWQjTq51x/F
 chBKDut1jr3cVpjFfMUueev+p1Mm65gYvK5g5VnE7S0s4qyzxn0kvZooHC96i6j6dusm
 eo/ZlHFovUJN0EwuxPXBJzwACrjM/3R2h3LD755j/nmf73Y1IeEAQ74h4qwdpTwGIPeM
 j/YMmXAzhpy3WmCRWcLZCp4YoM5iE4dmZg89jx7BpuAsIUbvBEzOgsTkJqbaA1s1yfN3
 kq2Gg2PlKk4q/DJ6hOlZD0A8B4/BtzAur2ElAhtIkHNJMs13Ue1yYAW/4FJfWE1r5zlF
 2WhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pw0MwsJXruVXKES5+YYTxDEsvQrLdknZdt5nVnQlwSU=;
 b=jV81YWgWYJ0spnQG8MjpPSw1HSQF1PE18y7F0YGGY9/HYBPw81QHII7xnFKg9IK6vA
 n/G7RpISw1mYglWAt3gMMWjjR2wXb9HLfEQUeZKwNoU9lxX9OX+HLyyB+khYjRvH/Nyt
 vZpTFpC4t1VOHAxYc2R8s8ch+PLM9/CoKJzH+bL311pe6d6DDBJbidpZyLTZtmO7UouC
 7nCEeV7CUKajm616o2R5ZAUKEVcqqygoNn8N4A2FLXNpdcaXczK1loHLnd6i32TWzpb6
 MbshnzFyslzy/yNwDX5AGx+h0NuMUivi+yJcTvFY2TyiTzrul7XRkVDdRZZb3AzBn9AE
 vo0Q==
X-Gm-Message-State: AOAM531d5dWoABg9QbXZDFR9ZmQoEjz56QWgM/y018HiloxNl+gPQ2c1
 6aPmBFk0KIPkcZBKZhJBkksxXwngfBf/X9s=
X-Google-Smtp-Source: ABdhPJzgisdE0II/Hl1wbCuPE74Rywe9b3KGfNKEVI4LeNFEu+SLEFuXgzHVP9NqRWmtDFb13hj5sQ==
X-Received: by 2002:a2e:9098:: with SMTP id l24mr2129128ljg.383.1622540939119; 
 Tue, 01 Jun 2021 02:48:59 -0700 (PDT)
Received: from localhost.localdomain ([95.161.221.177])
 by smtp.gmail.com with ESMTPSA id w16sm1635065lfn.183.2021.06.01.02.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 02:48:58 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Tue,  1 Jun 2021 12:48:07 +0300
Message-Id: <20210601094807.77790-1-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3] network/lib6/getaddrinfo01: rewrite with the new
 API + use static hostnames
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

The test is now independent of various machine settings
regarding the test host name as it adds predefined names
and aliases to /etc/hosts file and restores it to its
original state after completing the test.

This should fix the following failures:
* when gethostname() returns an alias name that doesn't
  match canonical name;
* No AAAA record for the returned name from gethostname().

Addresses and names added to /etc/hosts are more or less
unique, so that there are no conflicts with the existing
configuration.

Also most of the duplicate code is now gone.

Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
---

v3: Check access to /etc/hosts file. Also, add host_file_changed flag
    to avoid a warning on cleanup (after TCONF).

 testcases/network/lib6/getaddrinfo_01.c | 1153 +++++------------------
 1 file changed, 249 insertions(+), 904 deletions(-)

diff --git a/testcases/network/lib6/getaddrinfo_01.c b/testcases/network/lib6/getaddrinfo_01.c
index db252a998..8c76f5d02 100644
--- a/testcases/network/lib6/getaddrinfo_01.c
+++ b/testcases/network/lib6/getaddrinfo_01.c
@@ -1,979 +1,324 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
+ * Copyright (c) 2021, BELLSOFT. All rights reserved.
  * Copyright (c) 2015 Fujitsu Ltd.
  * Copyright (c) International Business Machines  Corp., 2001
  *
- * This program is free software: you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation, either version 3 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
+ * Author: David L Stevens
+ */
+
+/*\
+ * [Description]
  *
- * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * Basic getaddrinfo() tests.
  *
- * Author: David L Stevens
+ * The test adds LTP specific addresses and names to /etc/hosts to avoid
+ * DNS, hostname setup issues and conflicts with existing configuration.
  */
 
 #include <unistd.h>
 #include <errno.h>
+#include <stdlib.h>
 
 #include <sys/socket.h>
 #include <netdb.h>
 #include <arpa/inet.h>
 #include <sys/param.h>
 
-#include "test.h"
+#include "tst_safe_stdio.h"
+#include "tst_test.h"
+#include "tst_safe_net.h"
 
 #ifndef AI_V4MAPPED
-#define AI_V4MAPPED    0x0008	/* IPv4 mapped addresses are acceptable.  */
+# define AI_V4MAPPED    0x0008	/* IPv4 mapped addresses are acceptable.  */
 #endif
 
-static void setup(void);
-static void gaiv4(void);
-static void gaiv6(void);
+static const char *const host_file = "/etc/hosts";
+static const char *hostname;
+static const char *shortname;
+static sa_family_t family;
+static int host_file_changed;
 
-char *TCID = "getaddrinfo_01";
-int TST_TOTAL = 22;
-
-int main(int argc, char *argv[])
+static void verify_res(struct addrinfo *res, int sock_type, in_port_t servnum,
+		       int (*test_cb)(struct addrinfo *))
 {
-	int lc;
-
-	tst_parse_opts(argc, argv, NULL, NULL);
+	sa_family_t sin_family = 0;
+	in_port_t sin_port = 0;
+	struct addrinfo *p = res;
+	int got_tcp = 0;
+	int got_udp = 0;
+	int ret = 0;
+
+	size_t exp_addrlen = (family == AF_INET) ? sizeof(struct sockaddr_in) :
+			     sizeof(struct sockaddr_in6);
+
+	for (; p; p = p->ai_next) {
+		ret |= p->ai_family != family;
+		ret |= p->ai_addrlen != exp_addrlen;
+		ret |= p->ai_addr == 0;
+		got_tcp |= p->ai_socktype == SOCK_STREAM;
+		got_udp |= p->ai_socktype == SOCK_DGRAM;
+
+		if (p->ai_addr) {
+
+			if (test_cb)
+				ret |= test_cb(p);
+
+			if (p->ai_family == AF_INET) {
+				struct sockaddr_in *psin;
+
+				psin = (struct sockaddr_in *)p->ai_addr;
+				sin_family = psin->sin_family;
+				sin_port = psin->sin_port;
+			} else {
+				struct sockaddr_in6 *psin6;
+
+				psin6 = (struct sockaddr_in6 *)p->ai_addr;
+				sin_family = psin6->sin6_family;
+				sin_port = psin6->sin6_port;
+			}
 
-	setup();
+			ret |= sin_family != family;
+			ret |= sin_port != htons(servnum);
+		}
 
-	for (lc = 0; TEST_LOOPING(lc); ++lc) {
-		tst_count = 0;
+		if (ret)
+			break;
+	}
 
-		gaiv4();
-		gaiv6();
+	if (!sock_type && (!got_tcp || !got_udp)) {
+		tst_brk(TFAIL, "socktype 0,%d TCP %d UDP %d",
+			htons(sin_port), got_tcp, got_udp);
 	}
 
-	tst_exit();
+	if (ret) {
+		tst_brk(TFAIL, "family %d alen %d sin family %d port %d",
+			p->ai_family, p->ai_addrlen, sin_family,
+			htons(sin_port));
+	}
 }
 
-static void setup(void)
+static void print_test_family(const char *name)
 {
-	TEST_PAUSE;
+	tst_res(TINFO, "test %s: %s", (family == AF_INET) ? "IPv4" : "IPv6",
+		name);
 }
 
-/* getaddrinfo tests (v4) */
-static void gaiv4(void)
+static void check_addrinfo(int safe, const char *name, const char *host,
+			   in_port_t servnum, const char *service,
+			   int flags, int type, int proto,
+			   int (*test_cb)(struct addrinfo *))
 {
-	struct addrinfo *aires, hints, *pai;
-	char hostname[MAXHOSTNAMELEN + 1];
-	char shortname[MAXHOSTNAMELEN + 1];
-	char service[NI_MAXSERV + 1];
-	int servnum;
-	char *p;
-
-	if (gethostname(hostname, sizeof(hostname)) < 0)
-		tst_brkm(TBROK | TERRNO, NULL, "gethostname failed");
-	strncpy(shortname, hostname, MAXHOSTNAMELEN);
-	shortname[MAXHOSTNAMELEN] = '\0';
-	p = strchr(shortname, '.');
-	if (p)
-		*p = '\0';
-
-	/* test 1, IPv4 basic lookup */
+	struct addrinfo *res = NULL;
+	struct addrinfo hints;
+
+	print_test_family(name);
+
 	memset(&hints, 0, sizeof(hints));
-	hints.ai_family = AF_INET;
-	TEST(getaddrinfo(hostname, 0, &hints, &aires));
-	if (!TEST_RETURN) {
-		struct sockaddr_in *psin = 0;
-		int err = 0;
-
-		for (pai = aires; pai; pai = pai->ai_next) {
-			err |= pai->ai_family != AF_INET;
-			err |= pai->ai_addrlen != sizeof(struct sockaddr_in);
-			err |= pai->ai_addr == 0;
-			psin = (struct sockaddr_in *)pai->ai_addr;
-			if (pai->ai_addr) {
-				err |= psin->sin_family != AF_INET;
-				err |= psin->sin_port != 0;
-			}
-			if (err)
-				break;
-		}
-		if (err) {
-			tst_resm(TFAIL, "getaddrinfo IPv4 basic lookup: "
-				 "fam %d alen %d addr 0x%p addr/fam %d "
-				 "addr/port %d H[%d]",
-				 pai->ai_family, pai->ai_addrlen, psin,
-				 psin ? psin->sin_family : 0,
-				 psin ? psin->sin_port : 0,
-				 psin ? htons(psin->sin_port) : 0);
-			freeaddrinfo(aires);
-			return;
-		}
-		tst_resm(TPASS, "getaddrinfo IPv4 basic lookup");
-		freeaddrinfo(aires);
-	} else {
-		tst_resm(TFAIL, "getaddrinfo IPv4 basic "
-			 "lookup (\"%s\") returns %ld (\"%s\")", hostname,
-			 TEST_RETURN, gai_strerror(TEST_RETURN));
-		return;
+	hints.ai_family = family;
+	hints.ai_flags = flags;
+	hints.ai_socktype = type;
+	hints.ai_protocol = proto;
+
+	if (safe)
+		SAFE_GETADDRINFO(host, service, &hints, &res);
+	else
+		TEST(getaddrinfo(host, service, &hints, &res));
+
+	if (res) {
+		verify_res(res, type, servnum, test_cb);
+		freeaddrinfo(res);
+		tst_res(TPASS, "%s", name);
 	}
+}
+
+static void check_addrinfo_name(const char *name)
+{
+	struct addrinfo *p, *res;
+	struct addrinfo hints;
+
+	print_test_family(name);
 
-	/* test 2, IPv4 canonical name */
 	memset(&hints, 0, sizeof(hints));
-	hints.ai_family = AF_INET;
+	hints.ai_family = family;
 	hints.ai_flags = AI_CANONNAME;
-	TEST(getaddrinfo(shortname, 0, &hints, &aires));
-	if (!TEST_RETURN) {
-		for (pai = aires; pai; pai = pai->ai_next)
-			if (pai->ai_canonname)
-				break;
-		if (!pai) {
-			tst_resm(TFAIL, "getaddrinfo IPv4 canonical name: no "
-				 "entries with canonical name set");
-			freeaddrinfo(aires);
-			return;
-		} else if (strcasecmp(hostname, pai->ai_canonname)) {
-			tst_resm(TFAIL, "getaddrinfo IPv4 canonical name "
-				 "(\"%s\") doesn't match hostname (\"%s\")",
-				 pai->ai_canonname, hostname);
-			freeaddrinfo(aires);
-			return;
-		}
-		tst_resm(TPASS, "getaddrinfo IPv4 canonical name");
-		freeaddrinfo(aires);
-	} else {
-		tst_resm(TFAIL, "getaddrinfo IPv4 "
-			 "canonical name (\"%s\") returns %ld (\"%s\")",
-			 shortname, TEST_RETURN, gai_strerror(TEST_RETURN));
-		return;
-	}
 
-	/* test 3, IPv4 host+service name */
-	memset(&hints, 0, sizeof(hints));
-	/*
-	 * These are hard-coded for echo/7 to avoid using getservbyname(),
-	 * since it isn't thread-safe and these tests may be re-used
-	 * multithreaded. Sigh.
-	 */
-	strcpy(service, "echo");
-	servnum = 7;
-	hints.ai_family = AF_INET;
-	TEST(getaddrinfo(hostname, service, &hints, &aires));
-	if (!TEST_RETURN) {
-		struct sockaddr_in *psin = 0;
-		int err = 0;
-
-		for (pai = aires; pai; pai = pai->ai_next) {
-			err |= pai->ai_family != AF_INET;
-			err |= pai->ai_addrlen != sizeof(struct sockaddr_in);
-			err |= pai->ai_addr == 0;
-			psin = (struct sockaddr_in *)pai->ai_addr;
-			if (pai->ai_addr) {
-				err |= psin->sin_family != AF_INET;
-				err |= psin->sin_port != htons(servnum);
-			}
-			if (err)
-				break;
-		}
-		if (err) {
-			tst_resm(TFAIL, "getaddrinfo IPv4 host+service: "
-				 "fam %d alen %d addr 0x%p addr/fam %d "
-				 "addr/port %d H[%d]",
-				 pai->ai_family, pai->ai_addrlen, psin,
-				 psin ? psin->sin_family : 0,
-				 psin ? psin->sin_port : 0,
-				 psin ? htons(psin->sin_port) : 0);
-			freeaddrinfo(aires);
-			return;
-		}
-		tst_resm(TPASS, "getaddrinfo IPv4 host+service");
-		freeaddrinfo(aires);
-	} else {
-		tst_resm(TFAIL, "getaddrinfo IPv4 host+"
-			 "service returns %ld (\"%s\")", TEST_RETURN,
-			 gai_strerror(TEST_RETURN));
-		return;
-	}
+	SAFE_GETADDRINFO(shortname, 0, &hints, &res);
 
-	/* test 4, IPv4 hostname+service, AI_PASSIVE */
-	memset(&hints, 0, sizeof(hints));
-	hints.ai_family = AF_INET;
-	hints.ai_flags = AI_PASSIVE;
-	hints.ai_socktype = SOCK_STREAM;
-	strcpy(service, "9462");
-	servnum = htons(9462);
-	TEST(getaddrinfo(hostname, service, &hints, &aires));
-	if (!TEST_RETURN) {
-		struct sockaddr_in *psin = 0;
-		int err = 0;
-
-		for (pai = aires; pai; pai = pai->ai_next) {
-			err |= pai->ai_family != AF_INET;
-			err |= pai->ai_addrlen != sizeof(struct sockaddr_in);
-			err |= pai->ai_addr == 0;
-			psin = (struct sockaddr_in *)pai->ai_addr;
-			if (pai->ai_addr) {
-				/* AI_PASSIVE is ignored if hostname is
-				 * non-null; address must be set
-				 */
-				err |= psin->sin_addr.s_addr == 0;
-				err |= psin->sin_family != AF_INET;
-				err |= psin->sin_port != servnum;
-			}
-			if (err)
-				break;
-		}
-		if (err) {
-			tst_resm(TFAIL, "getaddrinfo IPv4 host+service, PASSIVE"
-				 ": fam %d alen %d addr 0x%p addr/fam %d "
-				 "addr/port %d H[%d]",
-				 pai->ai_family, pai->ai_addrlen, psin,
-				 psin ? psin->sin_family : 0,
-				 psin ? psin->sin_port : 0,
-				 psin ? htons(psin->sin_port) : 0);
-			freeaddrinfo(aires);
-			return;
-		}
-		tst_resm(TPASS, "getaddrinfo IPv4 host+service PASSIVE");
-		freeaddrinfo(aires);
-	} else {
-		tst_resm(TFAIL, "getaddrinfo IPv4 host+"
-			 "service, PASSIVE (\"%s\", \"%s\") returns %ld (\"%s\")",
-			 hostname, service, TEST_RETURN,
-			 gai_strerror(TEST_RETURN));
-		return;
+	for (p = res; p; p = p->ai_next) {
+		if (p->ai_canonname)
+			break;
 	}
+	if (!p)
+		tst_brk(TFAIL, "%s: no entries with canonical name set", name);
+	else if (strcasecmp(hostname, p->ai_canonname))
+		tst_brk(TFAIL, "%s: ai_canonname '%s' doesn't match hostname '%s'",
+			name, p->ai_canonname, hostname);
+
+	tst_res(TPASS, "%s: ai_canonname '%s'", name, p->ai_canonname);
+	freeaddrinfo(res);
+}
 
-	/* test 5, IPv4 host+service w/ AI_NUMERICHOST */
-	memset(&hints, 0, sizeof(hints));
-	strcpy(service, "echo");
-	servnum = 7;
-	hints.ai_family = AF_INET;
-	hints.ai_flags = AI_NUMERICHOST;
-	TEST(getaddrinfo(hostname, service, &hints, &aires));
-	if (TEST_RETURN != EAI_NONAME) {
-		tst_resm(TFAIL, "getaddrinfo IPv4 AI_NUMERICHOST w/ hostname: "
-			 "returns %ld expected %d (EAI_NONAME)",
-			 TEST_RETURN, EAI_NONAME);
-		if (!TEST_RETURN)
-			freeaddrinfo(aires);
-		return;
+static void check_addrinfo_badflags(const char *name)
+{
+	if (TST_RET == EAI_BADFLAGS) {
+		tst_res(TPASS, "%s returns %ld '%s'", name,
+			TST_RET, gai_strerror(TST_RET));
+	} else if (TST_RET) {
+		tst_brk(TFAIL, "%s returns %ld '%s'", name,
+			TST_RET, gai_strerror(TST_RET));
 	}
-	tst_resm(TPASS, "getaddrinfo IPv4 AI_NUMERICHOST w/ hostname");
-	if (!TEST_RETURN)
-		freeaddrinfo(aires);
+}
 
-	/* test 6, IPv4 0+service, AI_PASSIVE */
-	memset(&hints, 0, sizeof(hints));
-	hints.ai_family = AF_INET;
-	hints.ai_flags = AI_PASSIVE;
-	hints.ai_socktype = SOCK_STREAM;
-	strcpy(service, "9462");
-	servnum = htons(9462);
-	TEST(getaddrinfo(0, service, &hints, &aires));
-	if (!TEST_RETURN) {
-		struct sockaddr_in *psin = 0;
-		int err = 0;
-
-		for (pai = aires; pai; pai = pai->ai_next) {
-			err |= pai->ai_family != AF_INET;
-			err |= pai->ai_addrlen != sizeof(struct sockaddr_in);
-			err |= pai->ai_addr == 0;
-			psin = (struct sockaddr_in *)pai->ai_addr;
-			if (pai->ai_addr) {
-
-				/* AI_PASSIVE means addr must be INADDR_ANY */
-				err |= psin->sin_addr.s_addr != 0;
-				err |= psin->sin_family != AF_INET;
-				err |= psin->sin_port != servnum;
-			}
-			if (err)
-				break;
-		}
-		if (err) {
-			tst_resm(TFAIL, "getaddrinfo IPv4 0+service, PASSIVE:"
-				 " fam %d alen %d addr 0x%p addr/fam %d "
-				 "addr/port %d H[%d]",
-				 pai->ai_family, pai->ai_addrlen, psin,
-				 psin ? psin->sin_family : 0,
-				 psin ? psin->sin_port : 0,
-				 psin ? htons(psin->sin_port) : 0);
-			freeaddrinfo(aires);
-			return;
-		}
-		tst_resm(TPASS, "getaddrinfo IPv4 0+service, PASSIVE");
-		freeaddrinfo(aires);
-	} else {
-		if (TEST_RETURN == EAI_BADFLAGS) {
-			tst_resm(TPASS, "getaddrinfo IPv4 0+service,"
-				" PASSIVE (\"\", \"%s\") returns %ld (\"%s\")",
-				service, TEST_RETURN,
-				gai_strerror(TEST_RETURN));
-		} else {
-			tst_resm(TFAIL, "getaddrinfo IPv4 0+service,"
-				" PASSIVE (\"\", \"%s\") returns %ld (\"%s\")",
-				service, TEST_RETURN,
-				gai_strerror(TEST_RETURN));
-			return;
-		}
-	}
+static int test_loopback(struct addrinfo *p)
+{
+	/* hostname not set; addr should be loopback */
+	if (family == AF_INET) {
+		struct sockaddr_in *psin = (struct sockaddr_in *)p->ai_addr;
 
-	/* test 7, IPv4 0+service */
-	memset(&hints, 0, sizeof(hints));
-	hints.ai_family = AF_INET;
-	hints.ai_socktype = SOCK_STREAM;
-	strcpy(service, "9462");
-	servnum = htons(9462);
-	TEST(getaddrinfo(0, service, &hints, &aires));
-	if (!TEST_RETURN) {
-		struct sockaddr_in *psin = 0;
-		int err = 0;
-
-		for (pai = aires; pai; pai = pai->ai_next) {
-			err |= pai->ai_family != AF_INET;
-			err |= pai->ai_addrlen != sizeof(struct sockaddr_in);
-			err |= pai->ai_addr == 0;
-			psin = (struct sockaddr_in *)pai->ai_addr;
-			if (pai->ai_addr) {
-				/* hostname not set; addr should be loopback */
-				err |= psin->sin_addr.s_addr !=
-				    htonl(INADDR_LOOPBACK);
-				err |= psin->sin_family != AF_INET;
-				err |= psin->sin_port != servnum;
-			}
-			if (err)
-				break;
-		}
-		if (err) {
-			tst_resm(TFAIL, "getaddrinfo IPv4 0+service: "
-				 "fam %d alen %d addr 0x%p addr/fam %d "
-				 "addr/port %d H[%d]",
-				 pai->ai_family, pai->ai_addrlen, psin,
-				 psin ? psin->sin_family : 0,
-				 psin ? psin->sin_port : 0,
-				 psin ? htons(psin->sin_port) : 0);
-			freeaddrinfo(aires);
-			return;
-		}
-		tst_resm(TPASS, "getaddrinfo IPv4 0+service");
-		freeaddrinfo(aires);
+		return psin->sin_addr.s_addr != htonl(INADDR_LOOPBACK);
 	} else {
-		if (TEST_RETURN == EAI_BADFLAGS) {
-			tst_resm(TPASS, "getaddrinfo IPv4 "
-				"0+service (\"\", \"%s\") returns %ld (\"%s\")",
-				service, TEST_RETURN,
-				gai_strerror(TEST_RETURN));
-		} else {
-			tst_resm(TFAIL, "getaddrinfo IPv4 "
-				"0+service (\"\", \"%s\") returns %ld (\"%s\")",
-				service, TEST_RETURN,
-				gai_strerror(TEST_RETURN));
-			return;
-		}
-	}
+		struct sockaddr_in6 *psin6 = (struct sockaddr_in6 *)p->ai_addr;
 
-	/* test 8, IPv4 host+service, AI_NUMERICSERV */
-#ifndef AI_NUMERICSERV
-	tst_resm(TCONF, "getaddrinfo IPv4 host+service, AI_NUMERICSERV: flag "
-		 "not implemented");
-#else
-	memset(&hints, 0, sizeof(hints));
-	strcpy(service, "echo");
-	servnum = 7;
-	hints.ai_family = AF_INET;
-	hints.ai_flags = AI_NUMERICSERV;
-	TEST(getaddrinfo(hostname, service, &hints, &aires));
-	if (TEST_RETURN != EAI_NONAME) {
-		tst_resm(TFAIL,
-			 "getaddrinfo IPv4 host+service, AI_NUMERICSERV: "
-			 "returns %ld (\"%s\") expected %d (EAI_NONAME)",
-			 TEST_RETURN, gai_strerror(TEST_RETURN), EAI_NONAME);
-		if (!TEST_RETURN)
-			freeaddrinfo(aires);
-		return;
+		return memcmp(&psin6->sin6_addr, &in6addr_loopback,
+		       sizeof(struct in6_addr)) != 0;
 	}
-	tst_resm(TPASS, "getaddrinfo IPv4 host+service, AI_NUMERICSERV");
-	if (!TEST_RETURN)
-		freeaddrinfo(aires);
-#endif /* AI_NUMERICSERV */
+}
 
-	/* test 9, IPv4 SOCK_STREAM/IPPROTO_UDP hints */
-	memset(&hints, 0, sizeof(hints));
-	hints.ai_family = AF_INET;
-	hints.ai_socktype = SOCK_STREAM;
-	hints.ai_protocol = IPPROTO_UDP;
-	strcpy(service, "9462");
-	servnum = htons(9462);
-	TEST(getaddrinfo(0, service, &hints, &aires));
-	if (!TEST_RETURN) {
-		tst_resm(TFAIL, "getaddrinfo IPv4 SOCK_STREAM/IPPROTO_UDP "
-			 "hints");
-		freeaddrinfo(aires);
-		return;
-	}
-	tst_resm(TPASS, "getaddrinfo IPv4 SOCK_STREAM/IPPROTO_UDP hints");
+static int test_passive(struct addrinfo *p)
+{
+	if (family == AF_INET) {
+		struct sockaddr_in *psin = (struct sockaddr_in *)p->ai_addr;
 
-	/* test 10, IPv4 socktype 0, 513 */
-	memset(&hints, 0, sizeof(hints));
-	hints.ai_family = AF_INET;
-	hints.ai_socktype = 0;
-	strcpy(service, "513");
-	servnum = htons(513);
-	TEST(getaddrinfo(0, service, &hints, &aires));
-	if (!TEST_RETURN) {
-		struct sockaddr_in *psin = 0;
-		int got_tcp, got_udp;
-		int err = 0;
-
-		got_tcp = got_udp = 0;
-		for (pai = aires; pai; pai = pai->ai_next) {
-			err |= pai->ai_family != AF_INET;
-			err |= pai->ai_addrlen != sizeof(struct sockaddr_in);
-			err |= pai->ai_addr == 0;
-			got_tcp |= pai->ai_socktype == SOCK_STREAM;
-			got_udp |= pai->ai_socktype == SOCK_DGRAM;
-			psin = (struct sockaddr_in *)pai->ai_addr;
-			if (pai->ai_addr) {
-				/* hostname not set; addr should be loopback */
-				err |= psin->sin_addr.s_addr !=
-				    htonl(INADDR_LOOPBACK);
-				err |= psin->sin_family != AF_INET;
-				err |= psin->sin_port != servnum;
-			}
-			if (err)
-				break;
-		}
-		if (err) {
-			tst_resm(TFAIL, "getaddrinfo IPv4 socktype 0,513: "
-				 "fam %d alen %d addr 0x%p addr/fam %d "
-				 "addr/port %d H[%d]",
-				 pai->ai_family, pai->ai_addrlen, psin,
-				 psin ? psin->sin_family : 0,
-				 psin ? psin->sin_port : 0,
-				 psin ? htons(psin->sin_port) : 0);
-			freeaddrinfo(aires);
-			return;
-		} else if (got_tcp && got_udp) {
-			tst_resm(TPASS, "getaddrinfo IPv4 socktype 0,513");
-			freeaddrinfo(aires);
-		} else {
-			tst_resm(TFAIL, "getaddrinfo IPv4 socktype 0,513 TCP %d"
-				 " UDP %d", got_tcp, got_udp);
-			freeaddrinfo(aires);
-			return;
-		}
+		return psin->sin_addr.s_addr == 0;
 	} else {
-		if (TEST_RETURN == EAI_BADFLAGS) {
-			tst_resm(TPASS, "getaddrinfo IPv4 socktype 0,513"
-				" (\"\", \"%s\") returns %ld (\"%s\")", service,
-				TEST_RETURN, gai_strerror(TEST_RETURN));
-		} else {
-			tst_resm(TFAIL, "getaddrinfo IPv4 socktype 0,513"
-				" (\"\", \"%s\") returns %ld (\"%s\")", service,
-				TEST_RETURN, gai_strerror(TEST_RETURN));
-			return;
-		}
-	}
+		struct sockaddr_in6 *psin6 = (struct sockaddr_in6 *)p->ai_addr;
 
-	/* test 11, IPv4 AI_V4MAPPED */
-	/* AI_V4MAPPED should be ignored because family != AF_INET6 */
-	memset(&hints, 0, sizeof(hints));
-	hints.ai_family = AF_INET;
-	hints.ai_flags = AI_V4MAPPED;
-	TEST(getaddrinfo(hostname, 0, &hints, &aires));
-	if (!TEST_RETURN) {
-		struct sockaddr_in *psin = 0;
-		int err = 0;
-
-		for (pai = aires; pai; pai = pai->ai_next) {
-			err |= pai->ai_family != AF_INET;
-			err |= pai->ai_addrlen != sizeof(struct sockaddr_in);
-			err |= pai->ai_addr == 0;
-			psin = (struct sockaddr_in *)pai->ai_addr;
-			if (pai->ai_addr) {
-				err |= psin->sin_family != AF_INET;
-				err |= psin->sin_port != 0;
-			}
-			if (err)
-				break;
-		}
-		if (err) {
-			tst_resm(TFAIL, "getaddrinfo IPv4 AI_V4MAPPED: "
-				 "fam %d alen %d addr 0x%p addr/fam %d "
-				 "addr/port %d H[%d]",
-				 pai->ai_family, pai->ai_addrlen, psin,
-				 psin ? psin->sin_family : 0,
-				 psin ? psin->sin_port : 0,
-				 psin ? htons(psin->sin_port) : 0);
-			freeaddrinfo(aires);
-			return;
-		}
-		tst_resm(TPASS, "getaddrinfo IPv4 AI_V4MAPPED");
-		freeaddrinfo(aires);
-	} else {
-		tst_resm(TFAIL, "getaddrinfo IPv4 "
-			 "AI_V4MAPPED (\"%s\") returns %ld (\"%s\")", hostname,
-			 TEST_RETURN, gai_strerror(TEST_RETURN));
-		return;
+		return memcmp(&psin6->sin6_addr, &in6addr_any,
+			      sizeof(struct in6_addr)) == 0;
 	}
 }
 
-/* getaddrinfo tests (v6) */
-static void gaiv6(void)
+static int test_passive_no_host(struct addrinfo *p)
 {
-	struct addrinfo *aires, hints, *pai;
-	char hostname[MAXHOSTNAMELEN + 1];
-	char shortname[MAXHOSTNAMELEN + 1];
-	char service[NI_MAXSERV + 1];
-	int servnum;
-	char *p;
-
-	if (gethostname(hostname, sizeof(hostname)) < 0)
-		tst_brkm(TBROK, NULL, "gethostname failed - %s",
-			 strerror(errno));
-	strncpy(shortname, hostname, MAXHOSTNAMELEN);
-	shortname[MAXHOSTNAMELEN] = '\0';
-	p = strchr(shortname, '.');
-	if (p)
-		*p = '\0';
-
-	/* test 12, IPv6 basic lookup */
-	memset(&hints, 0, sizeof(hints));
-	hints.ai_family = AF_INET6;
-	TEST(getaddrinfo(hostname, 0, &hints, &aires));
-	if (!TEST_RETURN) {
-		struct sockaddr_in6 *psin6 = 0;
-		int err = 0;
-
-		for (pai = aires; pai; pai = pai->ai_next) {
-			err |= pai->ai_family != AF_INET6;
-			err |= pai->ai_addrlen != sizeof(struct sockaddr_in6);
-			err |= pai->ai_addr == 0;
-			psin6 = (struct sockaddr_in6 *)pai->ai_addr;
-			if (pai->ai_addr) {
-				err |= psin6->sin6_family != AF_INET6;
-				err |= psin6->sin6_port != 0;
-			}
-			if (err)
-				break;
-		}
-		if (err) {
-			tst_resm(TFAIL, "getaddrinfo IPv6 basic lookup: "
-				 "fam %d alen %d addr 0x%p addr/fam %d "
-				 "addr/port %d H[%d]",
-				 pai->ai_family, pai->ai_addrlen, psin6,
-				 psin6 ? psin6->sin6_family : 0,
-				 psin6 ? psin6->sin6_port : 0,
-				 psin6 ? htons(psin6->sin6_port) : 0);
-			freeaddrinfo(aires);
-			return;
-		}
-		tst_resm(TPASS, "getaddrinfo IPv6 basic lookup");
-		freeaddrinfo(aires);
-	} else {
-		tst_resm(TFAIL, "getaddrinfo IPv6 basic "
-			 "lookup (\"%s\") returns %ld (\"%s\")", hostname,
-			 TEST_RETURN, gai_strerror(TEST_RETURN));
-		return;
-	}
+	if (family == AF_INET) {
+		struct sockaddr_in *psin = (struct sockaddr_in *)p->ai_addr;
 
-	/* test 13, IPv6 canonical name */
-	memset(&hints, 0, sizeof(hints));
-	hints.ai_family = AF_INET6;
-	hints.ai_flags = AI_CANONNAME;
-	TEST(getaddrinfo(shortname, 0, &hints, &aires));
-	if (!TEST_RETURN) {
-		for (pai = aires; pai; pai = pai->ai_next)
-			if (pai->ai_canonname)
-				break;
-		if (!pai) {
-			tst_resm(TFAIL, "getaddrinfo IPv6 canonical name: no "
-				 "entries with canonical name set");
-			freeaddrinfo(aires);
-			return;
-		} else if (strcasecmp(hostname, pai->ai_canonname)) {
-			tst_resm(TFAIL, "getaddrinfo IPv6 canonical name "
-				 "(\"%s\") doesn't match hostname (\"%s\")",
-				 pai->ai_canonname, hostname);
-			freeaddrinfo(aires);
-			return;
-		}
-		tst_resm(TPASS, "getaddrinfo IPv6 canonical name");
-		freeaddrinfo(aires);
+		return psin->sin_addr.s_addr != 0;
 	} else {
-		tst_resm(TFAIL, "getaddrinfo IPv6 "
-			 "canonical name (\"%s\") returns %ld (\"%s\")",
-			 shortname, TEST_RETURN, gai_strerror(TEST_RETURN));
-		return;
+		struct sockaddr_in6 *psin6 = (struct sockaddr_in6 *)p->ai_addr;
+
+		return memcmp(&psin6->sin6_addr, &in6addr_any,
+			      sizeof(struct in6_addr));
 	}
+}
+
+static void gaiv(void)
+{
+	check_addrinfo(1, "basic lookup", hostname, 0, NULL, 0, 0, 0, NULL);
+	check_addrinfo_name("canonical name");
 
-	/* test 14, IPv6 host+service name */
-	memset(&hints, 0, sizeof(hints));
 	/*
 	 * These are hard-coded for echo/7 to avoid using getservbyname(),
 	 * since it isn't thread-safe and these tests may be re-used
 	 * multithreaded. Sigh.
 	 */
-	strcpy(service, "echo");
-	servnum = 7;
-	hints.ai_family = AF_INET6;
-	TEST(getaddrinfo(hostname, service, &hints, &aires));
-	if (!TEST_RETURN) {
-		struct sockaddr_in6 *psin6 = 0;
-		int err = 0;
-
-		for (pai = aires; pai; pai = pai->ai_next) {
-			err |= pai->ai_family != AF_INET6;
-			err |= pai->ai_addrlen != sizeof(struct sockaddr_in6);
-			err |= pai->ai_addr == 0;
-			psin6 = (struct sockaddr_in6 *)pai->ai_addr;
-			if (pai->ai_addr) {
-				err |= psin6->sin6_family != AF_INET6;
-				err |= psin6->sin6_port != htons(servnum);
-			}
-			if (err)
-				break;
-		}
-		if (err) {
-			tst_resm(TFAIL, "getaddrinfo IPv6 host+service: "
-				 "fam %d alen %d addr 0x%p addr/fam %d "
-				 "addr/port %d H[%d]",
-				 pai->ai_family, pai->ai_addrlen, psin6,
-				 psin6 ? psin6->sin6_family : 0,
-				 psin6 ? psin6->sin6_port : 0,
-				 psin6 ? htons(psin6->sin6_port) : 0);
-			freeaddrinfo(aires);
-			return;
-		}
-		tst_resm(TPASS, "getaddrinfo IPv6 host+service");
-		freeaddrinfo(aires);
-	} else {
-		tst_resm(TFAIL, "getaddrinfo IPv6 host+"
-			 "service returns %ld (\"%s\")", TEST_RETURN,
-			 gai_strerror(TEST_RETURN));
-		return;
-	}
+	check_addrinfo(1, "host+service", hostname, 7, "echo", 0, 0, 0, NULL);
+
+	check_addrinfo(1, "host+service, AI_PASSIVE", hostname, 9462, "9462",
+		       AI_PASSIVE, SOCK_STREAM, 0, test_passive);
+
+	check_addrinfo(0, "host+service, AI_NUMERICHOST", hostname, 7, "echo",
+		       AI_NUMERICHOST, SOCK_STREAM, 0, NULL);
+	if (TST_RET != EAI_NONAME)
+		tst_brk(TFAIL, "AI_NUMERICHOST: ret %ld exp %d (EAI_NONAME)",
+			TST_RET, EAI_NONAME);
+	tst_res(TPASS, "AI_NUMERICHOST: expected %ld (EAI_NONAME)", TST_RET);
+
+	check_addrinfo(1, "0+service, AI_PASSIVE", NULL, 9462, "9462",
+		       AI_PASSIVE, SOCK_STREAM, 0, test_passive_no_host);
+
+	check_addrinfo(0, "0+service", NULL, 9462, "9462",
+		       0, SOCK_STREAM, 0, test_loopback);
+	check_addrinfo_badflags("0+service ('', '9462')");
+
+#ifdef AI_NUMERICSERV
+	check_addrinfo(0, "host+service, AI_NUMERICSERV", hostname, 7, "echo",
+		       AI_NUMERICSERV, 0, 0, NULL);
+	if (TST_RET != EAI_NONAME)
+		tst_brk(TFAIL, "AI_NUMERICSERV: returns %ld '%s', expected %d (EAI_NONAME)",
+			TST_RET, gai_strerror(TST_RET), EAI_NONAME);
+	tst_res(TPASS, "AI_NUMERICSERV: returns %ld (EAI_NONAME)", TST_RET);
+#else
+	tst_res(TCONF, "AI_NUMERICSERV: flag not implemented");
+#endif
 
-	/* test 15, IPv6 hostname+service, AI_PASSIVE */
-	memset(&hints, 0, sizeof(hints));
-	hints.ai_family = AF_INET6;
-	hints.ai_flags = AI_PASSIVE;
-	hints.ai_socktype = SOCK_STREAM;
-	strcpy(service, "9462");
-	servnum = htons(9462);
-	TEST(getaddrinfo(hostname, service, &hints, &aires));
-	if (!TEST_RETURN) {
-		struct sockaddr_in6 *psin6 = 0;
-		int err = 0;
-
-		for (pai = aires; pai; pai = pai->ai_next) {
-			err |= pai->ai_family != AF_INET6;
-			err |= pai->ai_addrlen != sizeof(struct sockaddr_in6);
-			err |= pai->ai_addr == 0;
-			psin6 = (struct sockaddr_in6 *)pai->ai_addr;
-			if (pai->ai_addr) {
-				/* AI_PASSIVE is ignored if hostname is
-				 * non-null; address must be set
-				 */
-				err |= memcmp(&psin6->sin6_addr, &in6addr_any,
-					      sizeof(struct in6_addr)) == 0;
-				err |= psin6->sin6_family != AF_INET6;
-				err |= psin6->sin6_port != servnum;
-			}
-			if (err)
-				break;
-		}
-		if (err) {
-			tst_resm(TFAIL, "getaddrinfo IPv6 host+service, PASSIVE"
-				 ": fam %d alen %d addr 0x%p addr/fam %d "
-				 "addr/port %d H[%d]",
-				 pai->ai_family, pai->ai_addrlen, psin6,
-				 psin6 ? psin6->sin6_family : 0,
-				 psin6 ? psin6->sin6_port : 0,
-				 psin6 ? htons(psin6->sin6_port) : 0);
-			freeaddrinfo(aires);
-			return;
-		}
-		tst_resm(TPASS, "getaddrinfo IPv6 host+service PASSIVE");
-		freeaddrinfo(aires);
-	} else {
-		tst_resm(TFAIL, "getaddrinfo IPv6 host+"
-			 "service, PASSIVE (\"%s\", \"%s\") returns %ld (\"%s\")",
-			 hostname, service, TEST_RETURN,
-			 gai_strerror(TEST_RETURN));
-		return;
-	}
+	check_addrinfo(0, "SOCK_STREAM/IPPROTO_UDP", NULL, 0, NULL, 0,
+		       SOCK_STREAM, IPPROTO_UDP, NULL);
+	if (!TST_RET)
+		tst_brk(TFAIL, "SOCK_STREAM/IPPROTO_UDP: unexpected pass");
+	tst_res(TPASS, "SOCK_STREAM/IPPROTO_UDP: failed as expected");
 
-	/* test 16, IPv6 host+service w/ AI_NUMERICHOST */
-	memset(&hints, 0, sizeof(hints));
-	strcpy(service, "echo");
-	servnum = 7;
-	hints.ai_family = AF_INET6;
-	hints.ai_flags = AI_NUMERICHOST;
-	TEST(getaddrinfo(hostname, service, &hints, &aires));
-	if (TEST_RETURN != EAI_NONAME) {
-		tst_resm(TFAIL, "getaddrinfo IPv6 AI_NUMERICHOST w/ hostname: "
-			 "returns %ld expected %d (EAI_NONAME)",
-			 TEST_RETURN, EAI_NONAME);
-		if (!TEST_RETURN)
-			freeaddrinfo(aires);
-		return;
-	}
-	tst_resm(TPASS, "getaddrinfo IPv6 AI_NUMERICHOST w/ hostname");
-	if (!TEST_RETURN)
-		freeaddrinfo(aires);
+	check_addrinfo(0, "socktype 0,513", NULL, 513, "513", 0, 0, 0, NULL);
+	check_addrinfo_badflags("socktype 0,513");
 
-	/* test 17, IPv6 0+service, AI_PASSIVE */
-	memset(&hints, 0, sizeof(hints));
-	hints.ai_family = AF_INET6;
-	hints.ai_flags = AI_PASSIVE;
-	hints.ai_socktype = SOCK_STREAM;
-	strcpy(service, "9462");
-	servnum = htons(9462);
-	TEST(getaddrinfo(0, service, &hints, &aires));
-	if (!TEST_RETURN) {
-		struct sockaddr_in6 *psin6 = 0;
-		int err = 0;
-
-		for (pai = aires; pai; pai = pai->ai_next) {
-			err |= pai->ai_family != AF_INET6;
-			err |= pai->ai_addrlen != sizeof(struct sockaddr_in6);
-			err |= pai->ai_addr == 0;
-			psin6 = (struct sockaddr_in6 *)pai->ai_addr;
-			if (pai->ai_addr) {
-
-				/* AI_PASSIVE means addr must be INADDR_ANY */
-				err |= memcmp(&psin6->sin6_addr, &in6addr_any,
-					      sizeof(struct in6_addr)) != 0;
-				err |= psin6->sin6_family != AF_INET6;
-				err |= psin6->sin6_port != servnum;
-			}
-			if (err)
-				break;
-		}
-		if (err) {
-			tst_resm(TFAIL, "getaddrinfo IPv6 0+service, PASSIVE:"
-				 " fam %d alen %d addr 0x%p addr/fam %d "
-				 "addr/port %d H[%d]",
-				 pai->ai_family, pai->ai_addrlen, psin6,
-				 psin6 ? psin6->sin6_family : 0,
-				 psin6 ? psin6->sin6_port : 0,
-				 psin6 ? htons(psin6->sin6_port) : 0);
-			freeaddrinfo(aires);
-			return;
-		}
-		tst_resm(TPASS, "getaddrinfo IPv6 0+service, PASSIVE");
-		freeaddrinfo(aires);
-	} else {
-		if (TEST_RETURN == EAI_BADFLAGS) {
-			tst_resm(TPASS, "getaddrinfo IPv6 0+service, PASSIVE"
-				" (\"\", \"%s\") returns %ld (\"%s\")", service,
-				TEST_RETURN, gai_strerror(TEST_RETURN));
-		} else {
-			tst_resm(TFAIL, "getaddrinfo IPv6 0+service, PASSIVE"
-				" (\"\", \"%s\") returns %ld (\"%s\")", service,
-				TEST_RETURN, gai_strerror(TEST_RETURN));
-			return;
-		}
-	}
+	check_addrinfo(1, "AI_V4MAPPED", NULL, 513, "513",
+		       AI_V4MAPPED, 0, 0, NULL);
+}
 
-	/* test 18, IPv6 0+service */
-	memset(&hints, 0, sizeof(hints));
-	hints.ai_family = AF_INET6;
-	hints.ai_socktype = SOCK_STREAM;
-	strcpy(service, "9462");
-	servnum = htons(9462);
-	TEST(getaddrinfo(0, service, &hints, &aires));
-	if (!TEST_RETURN) {
-		struct sockaddr_in6 *psin6 = 0;
-		int err = 0;
-
-		for (pai = aires; pai; pai = pai->ai_next) {
-			err |= pai->ai_family != AF_INET6;
-			err |= pai->ai_addrlen != sizeof(struct sockaddr_in6);
-			err |= pai->ai_addr == 0;
-			psin6 = (struct sockaddr_in6 *)pai->ai_addr;
-			if (pai->ai_addr) {
-				/* hostname not set; addr should be loopback */
-				err |= memcmp(&psin6->sin6_addr,
-					      &in6addr_loopback,
-					      sizeof(struct in6_addr)) != 0;
-				err |= psin6->sin6_family != AF_INET6;
-				err |= psin6->sin6_port != servnum;
-			}
-			if (err)
-				break;
-		}
-		if (err) {
-			tst_resm(TFAIL, "getaddrinfo IPv6 0+service: "
-				 "fam %d alen %d addr 0x%p addr/fam %d "
-				 "addr/port %d H[%d]",
-				 pai->ai_family, pai->ai_addrlen, psin6,
-				 psin6 ? psin6->sin6_family : 0,
-				 psin6 ? psin6->sin6_port : 0,
-				 psin6 ? htons(psin6->sin6_port) : 0);
-			freeaddrinfo(aires);
-			return;
-		}
-		tst_resm(TPASS, "getaddrinfo IPv6 0+service");
-		freeaddrinfo(aires);
-	} else {
-		if (TEST_RETURN == EAI_BADFLAGS) {
-			tst_resm(TPASS, "getaddrinfo IPv6 0+service"
-				" (\"\", \"%s\") returns %ld (\"%s\")", service,
-				TEST_RETURN, gai_strerror(TEST_RETURN));
-		} else {
-			tst_resm(TFAIL, "getaddrinfo IPv6 0+service"
-				" (\"\", \"%s\") returns %ld (\"%s\")", service,
-				TEST_RETURN, gai_strerror(TEST_RETURN));
-			return;
-		}
-	}
+static struct tcase {
+	sa_family_t family;
+	const char *const addr;
+	const char *const name;
+	const char *const alias;
+} tcases[] = {
+	{ AF_INET, "127.0.127.1", "getaddrinfo01.ltp", "getaddrinfo01-ipv4" },
+	{ AF_INET6, "::127", "getaddrinfo01.ipv6.ltp", "getaddrinfo01-ipv6" }
+};
 
-	/* test 19, IPv6 host+service, AI_NUMERICSERV */
-#ifndef AI_NUMERICSERV
-	tst_resm(TCONF, "getaddrinfo IPv6 host+service, AI_NUMERICSERV: flag "
-		 "not implemented");
-#else
-	memset(&hints, 0, sizeof(hints));
-	strcpy(service, "echo");
-	servnum = 7;
-	hints.ai_family = AF_INET6;
-	hints.ai_flags = AI_NUMERICSERV;
-	TEST(getaddrinfo(hostname, service, &hints, &aires));
-	if (TEST_RETURN != EAI_NONAME) {
-		tst_resm(TFAIL,
-			 "getaddrinfo IPv6 host+service, AI_NUMERICSERV: "
-			 "returns %ld (\"%s\") expected %d (EAI_NONAME)",
-			 TEST_RETURN, gai_strerror(TEST_RETURN), EAI_NONAME);
-		if (!TEST_RETURN)
-			freeaddrinfo(aires);
-		return;
-	}
-	tst_resm(TPASS, "getaddrinfo IPv6 host+service, AI_NUMERICSERV");
-	if (!TEST_RETURN)
-		freeaddrinfo(aires);
-#endif /* AI_NUMERICSERV */
+static void setup(void)
+{
+	unsigned int i;
+	int fd;
 
-	/* test 20, IPv6 SOCK_STREAM/IPPROTO_UDP hints */
-	memset(&hints, 0, sizeof(hints));
-	hints.ai_family = AF_INET6;
-	hints.ai_socktype = SOCK_STREAM;
-	hints.ai_protocol = IPPROTO_UDP;
-	strcpy(service, "9462");
-	servnum = htons(9462);
-	TEST(getaddrinfo(0, service, &hints, &aires));
-	if (!TEST_RETURN) {
-		tst_resm(TFAIL, "getaddrinfo IPv6 SOCK_STREAM/IPPROTO_UDP "
-			 "hints");
-		freeaddrinfo(aires);
-		return;
-	}
-	tst_resm(TPASS, "getaddrinfo IPv6 SOCK_STREAM/IPPROTO_UDP hints");
+	if (access(host_file, W_OK))
+		tst_brk(TCONF | TERRNO, "%s file not available", host_file);
 
-	/* test 21, IPv6 socktype 0, 513 */
-	memset(&hints, 0, sizeof(hints));
-	hints.ai_family = AF_INET6;
-	hints.ai_socktype = 0;
-	strcpy(service, "513");
-	servnum = htons(513);
-	TEST(getaddrinfo(0, service, &hints, &aires));
-	if (!TEST_RETURN) {
-		struct sockaddr_in6 *psin6 = 0;
-		int got_tcp, got_udp;
-		int err = 0;
-
-		got_tcp = got_udp = 0;
-		for (pai = aires; pai; pai = pai->ai_next) {
-			err |= pai->ai_family != AF_INET6;
-			err |= pai->ai_addrlen != sizeof(struct sockaddr_in6);
-			err |= pai->ai_addr == 0;
-			got_tcp |= pai->ai_socktype == SOCK_STREAM;
-			got_udp |= pai->ai_socktype == SOCK_DGRAM;
-			psin6 = (struct sockaddr_in6 *)pai->ai_addr;
-			if (pai->ai_addr) {
-				/* hostname not set; addr should be loopback */
-				err |= memcmp(&psin6->sin6_addr,
-					      &in6addr_loopback,
-					      sizeof(struct in6_addr)) != 0;
-				err |= psin6->sin6_family != AF_INET6;
-				err |= psin6->sin6_port != servnum;
-			}
-			if (err)
-				break;
-		}
-		if (err) {
-			tst_resm(TFAIL, "getaddrinfo IPv6 socktype 0,513: "
-				 "fam %d alen %d addr 0x%p addr/fam %d "
-				 "addr/port %d H[%d]",
-				 pai->ai_family, pai->ai_addrlen, psin6,
-				 psin6 ? psin6->sin6_family : 0,
-				 psin6 ? psin6->sin6_port : 0,
-				 psin6 ? htons(psin6->sin6_port) : 0);
-			freeaddrinfo(aires);
-			return;
-		} else if (got_tcp && got_udp) {
-			tst_resm(TPASS, "getaddrinfo IPv6 socktype 0,513");
-			freeaddrinfo(aires);
-		} else {
-			tst_resm(TFAIL, "getaddrinfo IPv6 socktype 0,513 TCP %d"
-				 " UDP %d", got_tcp, got_udp);
-			freeaddrinfo(aires);
-			return;
-		}
-	} else {
-		if (TEST_RETURN == EAI_BADFLAGS) {
-			tst_resm(TPASS, "getaddrinfo IPv6 socktype 0,513"
-				" (\"\", \"%s\") returns %ld (\"%s\")", service,
-				TEST_RETURN, gai_strerror(TEST_RETURN));
-		} else {
-			tst_resm(TFAIL, "getaddrinfo IPv6 socktype 0,513"
-				" (\"\", \"%s\") returns %ld (\"%s\")", service,
-				TEST_RETURN, gai_strerror(TEST_RETURN));
-			return;
-		}
-	}
+	SAFE_CP(host_file, "hosts");
 
-	/* test 22, IPv6 AI_V4MAPPED */
-	memset(&hints, 0, sizeof(hints));
-	hints.ai_family = AF_INET6;
-	hints.ai_flags = AI_V4MAPPED;
-	TEST(getaddrinfo(hostname, 0, &hints, &aires));
-	if (!TEST_RETURN) {
-		struct sockaddr_in6 *psin6 = 0;
-		int err = 0;
-
-		for (pai = aires; pai; pai = pai->ai_next) {
-			err |= pai->ai_family != AF_INET6;
-			err |= pai->ai_addrlen != sizeof(struct sockaddr_in6);
-			err |= pai->ai_addr == 0;
-			psin6 = (struct sockaddr_in6 *)pai->ai_addr;
-			if (pai->ai_addr) {
-				err |= psin6->sin6_family != AF_INET6;
-				err |= psin6->sin6_port != 0;
-			}
-			if (err)
-				break;
-		}
-		if (err) {
-			tst_resm(TFAIL, "getaddrinfo IPv6 AI_V4MAPPED: "
-				 "fam %d alen %d addr 0x%p addr/fam %d "
-				 "addr/port %d H[%d]",
-				 pai->ai_family, pai->ai_addrlen, psin6,
-				 psin6 ? psin6->sin6_family : 0,
-				 psin6 ? psin6->sin6_port : 0,
-				 psin6 ? htons(psin6->sin6_port) : 0);
-			freeaddrinfo(aires);
-			return;
-		}
-		tst_resm(TPASS, "getaddrinfo IPv6 AI_V4MAPPED");
-		freeaddrinfo(aires);
-	} else {
-		tst_resm(TFAIL, "getaddrinfo IPv6 "
-			 "AI_V4MAPPED (\"%s\") returns %ld (\"%s\")", hostname,
-			 TEST_RETURN, gai_strerror(TEST_RETURN));
-		return;
+	host_file_changed = 1;
+	fd = SAFE_OPEN(host_file, O_WRONLY|O_APPEND);
+
+	for (i = 0; i < ARRAY_SIZE(tcases); ++i) {
+		char *entry;
+
+		SAFE_ASPRINTF(&entry, "%s %s %s\n",
+			      tcases[i].addr, tcases[i].name, tcases[i].alias);
+		SAFE_WRITE(0, fd, entry, strlen(entry));
+		free(entry);
 	}
+	SAFE_CLOSE(fd);
+}
+
+static void cleanup(void)
+{
+	if (host_file_changed)
+		SAFE_CP("hosts", host_file);
 }
+
+static void do_test(unsigned int i)
+{
+	family = tcases[i].family;
+	hostname = tcases[i].name;
+	shortname = tcases[i].alias;
+	gaiv();
+}
+
+static struct tst_test test = {
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+	.setup = setup,
+	.cleanup = cleanup,
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = do_test,
+};
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
