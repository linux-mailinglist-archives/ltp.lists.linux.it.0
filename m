Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F087109D72
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 13:03:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3D47C3C23EE
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 13:03:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 9BDCC3C226C
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 13:02:43 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D4738600F8C
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 13:02:42 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1DFC1B461
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 12:02:42 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 26 Nov 2019 13:02:40 +0100
Message-Id: <20191126120241.5460-3-mdoucha@suse.cz>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191126120241.5460-1-mdoucha@suse.cz>
References: <20191126120241.5460-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] Port test_1_to_1_initmsg_connect (SCTP) to new API
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 .../func_tests/test_1_to_1_initmsg_connect.c  | 109 +++++++-----------
 1 file changed, 42 insertions(+), 67 deletions(-)

diff --git a/utils/sctp/func_tests/test_1_to_1_initmsg_connect.c b/utils/sctp/func_tests/test_1_to_1_initmsg_connect.c
index 8efb4f59c..d85474ad6 100644
--- a/utils/sctp/func_tests/test_1_to_1_initmsg_connect.c
+++ b/utils/sctp/func_tests/test_1_to_1_initmsg_connect.c
@@ -1,38 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /* SCTP kernel Implementation
  * Copyright (c) 2003 Hewlett-Packard Development Company, L.P
  * (C) Copyright IBM Corp. 2004
  *
  * When init timeout is set to zero, a connect () crashed the system. This case
  * tests the fix for the same.
- *
- * The SCTP implementation is free software;
- * you can redistribute it and/or modify it under the terms of
- * the GNU General Public License as published by
- * the Free Software Foundation; either version 2, or (at your option)
- * any later version.
- *
- * The SCTP implementation is distributed in the hope that it
- * will be useful, but WITHOUT ANY WARRANTY; without even the implied
- *                 ************************
- * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- * See the GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with GNU CC; see the file COPYING.  If not, write to
- * the Free Software Foundation, 59 Temple Place - Suite 330,
- * Boston, MA 02111-1307, USA.
- *
- * Please send any bug reports or fixes you make to the
- * email address(es):
- *    lksctp developers <lksctp-developers@lists.sourceforge.net>
- *
- * Or submit a bug report through the following website:
- *    http://www.sf.net/projects/lksctp
- *
- *
- * Any bugs reported given to us we will try to fix... any fixes shared will
- * be incorporated into the next SCTP release.
- *
  */
 #include <stdio.h>
 #include <unistd.h>
@@ -43,38 +15,32 @@
 #include <sys/socket.h>
 #include <netinet/in.h>         /* for sockaddr_in */
 #include <arpa/inet.h>
-#include <errno.h>
 #include <netinet/sctp.h>
-#include <sys/uio.h>
-#include <sctputil.h> 
+#include "tst_test.h"
+#include "tst_net.h"
+
+#ifdef PROT_SOCK
+#define SCTP_TESTPORT_1 PROT_SOCK
+#else
+#define SCTP_TESTPORT_1 1024
+#endif
 
-char *TCID = __FILE__;
-int TST_TOTAL = 1;
-int TST_CNT = 0;
+#define SCTP_IP_LOOPBACK  htonl(0x7f000001)
 
-int 
-main (int argc, char **argv)
+static void test_sctp(void)
 {
-	int sk1, sk2, sk3, pf_class;
+	int sk1, sk2, sk3, pf_class, msglen;
 	socklen_t len;
 	struct sockaddr_in lstn_addr, acpt_addr;
 	struct sockaddr_in conn_addr;
-	char * buffer_rcv;
+	char *buffer_rcv;
 	struct sctp_initmsg sinmsg;
-	char *message = "Hello World!\n";
+	const char *message = "Hello World!\n";
 
-	/* Rather than fflush() throughout the code, set stdout to
-	 * be unbuffered.
-	 */
-	setvbuf(stdout, NULL, _IONBF, 0);
-	setvbuf(stderr, NULL, _IONBF, 0);
-
-	/* Opening the socket*/
-	
 	pf_class = PF_INET;
 
-	sk1 = test_socket(pf_class, SOCK_STREAM, IPPROTO_SCTP);
-	sk3 = test_socket(pf_class, SOCK_STREAM, IPPROTO_SCTP);
+	sk1 = SAFE_SOCKET(pf_class, SOCK_STREAM, IPPROTO_SCTP);
+	sk3 = SAFE_SOCKET(pf_class, SOCK_STREAM, IPPROTO_SCTP);
 
         conn_addr.sin_family = AF_INET;
         conn_addr.sin_addr.s_addr = SCTP_IP_LOOPBACK;
@@ -84,37 +50,46 @@ main (int argc, char **argv)
         lstn_addr.sin_addr.s_addr = SCTP_IP_LOOPBACK;
         lstn_addr.sin_port = htons(SCTP_TESTPORT_1);
 
-	test_bind(sk3, (struct sockaddr *) &lstn_addr, sizeof(lstn_addr));
+	SAFE_BIND(sk3, (struct sockaddr *) &lstn_addr, sizeof(lstn_addr));
 
 	len = sizeof(struct sctp_initmsg);
 	sinmsg.sinit_num_ostreams = 65535;
 	sinmsg.sinit_max_instreams = 10;
 	sinmsg.sinit_max_attempts = 1;
 	sinmsg.sinit_max_init_timeo = 0;
-	test_setsockopt(sk1, SCTP_INITMSG, &sinmsg, len);
+	SAFE_SETSOCKOPT(sk1, SOL_SCTP, SCTP_INITMSG, &sinmsg, len);
 	sinmsg.sinit_num_ostreams = 10;
 	sinmsg.sinit_max_instreams = 65535;
-	test_setsockopt(sk3, SCTP_INITMSG, &sinmsg, len);
+	SAFE_SETSOCKOPT(sk3, SOL_SCTP, SCTP_INITMSG, &sinmsg, len);
 
-	test_listen(sk3, 1);
+	SAFE_LISTEN(sk3, 1);
 
 	len = sizeof(struct sockaddr_in);
-	test_connect(sk1, (struct sockaddr *) &conn_addr, len);
+	SAFE_CONNECT(sk1, (struct sockaddr *) &conn_addr, len);
+	sk2 = SAFE_ACCEPT(sk3, (struct sockaddr *) &acpt_addr, &len);
 
-	sk2 = test_accept(sk3, (struct sockaddr *) &acpt_addr, &len);
+	msglen = strlen(message) + 1;
+	TEST(sctp_sendmsg(sk1, message, msglen, (struct sockaddr *)&conn_addr,
+		len, 0, 0, 65534, 0, 0));
 
-	test_sctp_sendmsg(sk1, message, strlen(message) + 1,
-			  (struct sockaddr *)&conn_addr, len,
-			  0, 0, 65534, 0, 0);
+	if (TST_RET != msglen) {
+		tst_brk(TBROK | TTERRNO, "sctp_sendmsg() failed");
+	}
 
-	buffer_rcv = malloc(100);
-	test_recv(sk2, buffer_rcv, (strlen(message) + 1), MSG_NOSIGNAL);
+	buffer_rcv = malloc(msglen);
+	TEST(recv(sk2, buffer_rcv, msglen, MSG_NOSIGNAL));
 
-	tst_resm(TPASS, "connect() with init timeout set to 0 - SUCCESS");
+	if (TST_RET != msglen) {
+		tst_res(TFAIL | TTERRNO, "recv() failed");
+	} else {
+		tst_res(TPASS, "connect() with init timeout set to 0 - SUCCESS");
+	}
 
-	close (sk1);
-	close (sk2);
-	close (sk3);
-	
-        return 0;
+	SAFE_CLOSE(sk1);
+	SAFE_CLOSE(sk2);
+	SAFE_CLOSE(sk3);
 }
+
+static struct tst_test test = {
+	.test_all = test_sctp,
+};
-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
