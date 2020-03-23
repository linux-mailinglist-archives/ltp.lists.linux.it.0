Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AE3190131
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 23:49:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7B2C73C4E48
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 23:49:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 7CADE3C4E37
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 23:49:42 +0100 (CET)
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 581266005DD
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 23:49:42 +0100 (CET)
Received: by mail-wm1-x343.google.com with SMTP id l20so1485384wmi.3
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 15:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AMXJg51Csws44UknJmjDSz/HgOSAo8sDhb85TyMrryY=;
 b=ER+53R0PhhB5aFjQc1dDrv+36z2xSTn+7OLcF4KM+4L1FfJkfokt8VUMNJuwQtLaAH
 XhDSQuDovMLSONgmcYh7UvkVpnBfwyTg9u5qtUsGH48OALojqbXLLvJ7QfeJZu+RF2VZ
 ytNbBoH81Oi7r3qzXIdC9id/22NpC9E6fFDHGT5IrWkp8zqpW01UZXypR0WlplvVGmXG
 GOor1WLR5nFH0ivLjVB89eimbcu95kgl51VFJJ27GxeIFFfvYSaMiwIkO8ssnFLQcikV
 GllUAo+IEye08KHAulLk32hGpiWPEA9CrhhWyDe2AXV9beQNC0PL9LwJby87e4PITRnq
 5viA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AMXJg51Csws44UknJmjDSz/HgOSAo8sDhb85TyMrryY=;
 b=DsrFpumWLmDIVGXP1LcfNqS9rKzykukTBIBXQrKYfMucawufW/Q2w2ODKmRSxGHA1d
 QNS3XdVqF4cz/ezVDIcnAuZ+QQxW2rrYdW+W65qyqlf7cF65gyEcXSz6nmLNjPYI/Ip5
 FuUJdWnHfi5Kg8jtzkvcUf4onDNopN27v2j+4KdnATAZD2mQaeWkUjmgaWPCOb6+lWbD
 HEY8rsqnMTHAqtfu5P7MVyI8aY9TTU73VZLrzPWE8bPY+jfMy+VkFAepKel6UpOHoY8E
 /3uKQaz4x9CflktgTCCsMVqg0DqJK8tdrjZwLG61gf52Q/2C4ccAGJ14ibVWFW4hhhOP
 4sDQ==
X-Gm-Message-State: ANhLgQ3edtd5k3cmGaUMSwe4B0PmS9yFwRn8dDFYG3tmId7nSlXnHD7H
 QvOXwzJhJhE7SGAHZ4evGMDz7z+O
X-Google-Smtp-Source: ADFU+vtzGpqwrnQNawyNIGYCPqXF9l66616SVlKnKBONWN0ZwqtTsyqBeU7hxet53lNaRhSq8cEYWA==
X-Received: by 2002:a1c:2c85:: with SMTP id s127mr1802215wms.18.1585003781440; 
 Mon, 23 Mar 2020 15:49:41 -0700 (PDT)
Received: from localhost.localdomain ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id k15sm2782317wrm.55.2020.03.23.15.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 15:49:40 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Mon, 23 Mar 2020 23:49:31 +0100
Message-Id: <20200323224933.2613658-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] accept4: Use tst_variant
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

to test both raw syscall and libc implementation.

This allows remove glibc specific __GLIBC_PREREQ() macro.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
I guess __NR_socketcall is for x86 and other old architectures,
but we still want to use it, right?

Kind regards,
Petr

 .../kernel/syscalls/accept4/accept4_01.c      | 49 ++++++++++---------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/testcases/kernel/syscalls/accept4/accept4_01.c b/testcases/kernel/syscalls/accept4/accept4_01.c
index 29e18f27d..a596b9b1a 100644
--- a/testcases/kernel/syscalls/accept4/accept4_01.c
+++ b/testcases/kernel/syscalls/accept4/accept4_01.c
@@ -2,9 +2,9 @@
 
 /*
  * Copyright (C) 2008, Linux Foundation,
+ * Copyright (c) 2020 Petr Vorel <petr.vorel@gmail.com>
  * written by Michael Kerrisk <mtk.manpages@gmail.com>
  * Initial Porting to LTP by Subrata <subrata@linux.vnet.ibm.com>
- *
  */
 
 #define _GNU_SOURCE
@@ -17,6 +17,7 @@
 #include <stdio.h>
 #include <string.h>
 #include <errno.h>
+#include <linux/net.h>
 
 #include "tst_test.h"
 #include "lapi/fcntl.h"
@@ -31,18 +32,17 @@
 # define SOCK_NONBLOCK   O_NONBLOCK
 #endif
 
-#if defined(SYS_ACCEPT4)	/* the socketcall() number */
-#define USE_SOCKETCALL 1
-#endif
+static const char *variant_desc[] = {
+	"libc accept4()",
+	"__NR_accept4 syscall",
+	"__NR_socketcall SYS_ACCEPT4 syscall"};
 
 static struct sockaddr_in *conn_addr, *accept_addr;
 static int listening_fd;
 
-#if !(__GLIBC_PREREQ(2, 10))
 static int
 accept4_01(int fd, struct sockaddr *sockaddr, socklen_t *addrlen, int flags)
 {
-#if USE_SOCKETCALL
 	long args[6];
 
 	args[0] = fd;
@@ -51,11 +51,7 @@ accept4_01(int fd, struct sockaddr *sockaddr, socklen_t *addrlen, int flags)
 	args[3] = flags;
 
 	return tst_syscall(__NR_socketcall, SYS_ACCEPT4, args);
-#else
-	return tst_syscall(__NR_accept4, fd, sockaddr, addrlen, flags);
-#endif
 }
-#endif
 
 static int create_listening_socket(void)
 {
@@ -80,6 +76,8 @@ static int create_listening_socket(void)
 
 static void setup(void)
 {
+	tst_res(TINFO, "Testing variant: %s", variant_desc[tst_variant]);
+
 	memset(conn_addr, 0, sizeof(*conn_addr));
 	conn_addr->sin_family = AF_INET;
 	conn_addr->sin_addr.s_addr = htonl(INADDR_LOOPBACK);
@@ -106,6 +104,7 @@ static struct test_case {
 static void verify_accept4(unsigned int nr)
 {
 	struct test_case *tcase = &tcases[nr];
+	int flags = tcase->cloexec | tcase->nonblock;
 	int connfd, acceptfd;
 	int fdf, flf, fdf_pass, flf_pass, fd_cloexec, fd_nonblock;
 	socklen_t addrlen;
@@ -114,20 +113,25 @@ static void verify_accept4(unsigned int nr)
 	SAFE_CONNECT(connfd, (struct sockaddr *)conn_addr, sizeof(*conn_addr));
 	addrlen = sizeof(*accept_addr);
 
-#if !(__GLIBC_PREREQ(2, 10))
-	TEST(accept4_01(listening_fd, (struct sockaddr *)accept_addr, &addrlen,
-				tcase->cloexec | tcase->nonblock));
-#else
-	TEST(accept4(listening_fd, (struct sockaddr *)accept_addr, &addrlen,
-				tcase->cloexec | tcase->nonblock));
-#endif
-	if (TST_RET == -1) {
-		if (TST_ERR == ENOSYS)
-			tst_brk(TCONF, "syscall __NR_accept4 not supported");
-		else
-			tst_brk(TBROK | TTERRNO, "accept4 failed");
+	switch (tst_variant) {
+	case 0:
+		TEST(accept4(listening_fd, (struct sockaddr *)accept_addr,
+			     &addrlen, flags));
+	break;
+	case 1:
+		TEST(tst_syscall(__NR_accept4, listening_fd,
+				 (struct sockaddr *)accept_addr,
+				 &addrlen, flags));
+	break;
+	case 2:
+		TEST(accept4_01(listening_fd, (struct sockaddr *)accept_addr,
+				&addrlen, flags));
+	break;
 	}
 
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "accept4 failed");
+
 	acceptfd = TST_RET;
 
 	/* Test to see if O_CLOEXEC is as expected */
@@ -161,6 +165,7 @@ static struct tst_test test = {
 	.tcnt = ARRAY_SIZE(tcases),
 	.setup = setup,
 	.cleanup = cleanup,
+	.test_variants = 3,
 	.test = verify_accept4,
 	.bufs = (struct tst_buffers []) {
 		{&conn_addr, .size = sizeof(*conn_addr)},
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
