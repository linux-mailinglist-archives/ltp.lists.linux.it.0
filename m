Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 764B1109D73
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 13:03:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0F6B93C2367
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 13:03:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id CCA883C23EE
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 13:02:43 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C7062600F15
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 13:02:42 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 297D7B46F
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 12:02:42 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 26 Nov 2019 13:02:41 +0100
Message-Id: <20191126120241.5460-4-mdoucha@suse.cz>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191126120241.5460-1-mdoucha@suse.cz>
References: <20191126120241.5460-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] Split SCTP initmsg test into two test cases
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

The original test allocates 65535 output streams which may fail on older
kernels due to lack of memory. Split the test into two test cases:
- allocate 10 output streams and accept no errors (functional test)
- allocate 65535 output streams and accept ENOMEM (stress test)

Also clean up some unnecessary code and check that the test message is
transferred correctly.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 .../func_tests/test_1_to_1_initmsg_connect.c  | 56 ++++++++++++-------
 1 file changed, 36 insertions(+), 20 deletions(-)

diff --git a/utils/sctp/func_tests/test_1_to_1_initmsg_connect.c b/utils/sctp/func_tests/test_1_to_1_initmsg_connect.c
index d85474ad6..a98e0c003 100644
--- a/utils/sctp/func_tests/test_1_to_1_initmsg_connect.c
+++ b/utils/sctp/func_tests/test_1_to_1_initmsg_connect.c
@@ -27,50 +27,64 @@
 
 #define SCTP_IP_LOOPBACK  htonl(0x7f000001)
 
-static void test_sctp(void)
+static const struct test_case {
+	__u16 streams;
+	int accept_err;
+} testcase_list[] = {
+	{10, 0},
+	{65535, ENOMEM}
+};
+
+static void test_sctp(unsigned int n)
 {
-	int sk1, sk2, sk3, pf_class, msglen;
+	int sk1, sk2, sk3, msglen;
 	socklen_t len;
 	struct sockaddr_in lstn_addr, acpt_addr;
-	struct sockaddr_in conn_addr;
 	char *buffer_rcv;
 	struct sctp_initmsg sinmsg;
 	const char *message = "Hello World!\n";
+	const struct test_case *tc = testcase_list + n;
 
-	pf_class = PF_INET;
-
-	sk1 = SAFE_SOCKET(pf_class, SOCK_STREAM, IPPROTO_SCTP);
-	sk3 = SAFE_SOCKET(pf_class, SOCK_STREAM, IPPROTO_SCTP);
+	tst_res(TINFO, "Running test with %u streams", tc->streams);
 
-        conn_addr.sin_family = AF_INET;
-        conn_addr.sin_addr.s_addr = SCTP_IP_LOOPBACK;
-        conn_addr.sin_port = htons(SCTP_TESTPORT_1);
+	sk1 = SAFE_SOCKET(PF_INET, SOCK_STREAM, IPPROTO_SCTP);
+	sk3 = SAFE_SOCKET(PF_INET, SOCK_STREAM, IPPROTO_SCTP);
 
-        lstn_addr.sin_family = AF_INET;
-        lstn_addr.sin_addr.s_addr = SCTP_IP_LOOPBACK;
-        lstn_addr.sin_port = htons(SCTP_TESTPORT_1);
+	lstn_addr.sin_family = AF_INET;
+	lstn_addr.sin_addr.s_addr = SCTP_IP_LOOPBACK;
+	lstn_addr.sin_port = htons(SCTP_TESTPORT_1);
 
 	SAFE_BIND(sk3, (struct sockaddr *) &lstn_addr, sizeof(lstn_addr));
 
 	len = sizeof(struct sctp_initmsg);
-	sinmsg.sinit_num_ostreams = 65535;
+	sinmsg.sinit_num_ostreams = tc->streams;
 	sinmsg.sinit_max_instreams = 10;
 	sinmsg.sinit_max_attempts = 1;
 	sinmsg.sinit_max_init_timeo = 0;
 	SAFE_SETSOCKOPT(sk1, SOL_SCTP, SCTP_INITMSG, &sinmsg, len);
 	sinmsg.sinit_num_ostreams = 10;
-	sinmsg.sinit_max_instreams = 65535;
+	sinmsg.sinit_max_instreams = tc->streams;
 	SAFE_SETSOCKOPT(sk3, SOL_SCTP, SCTP_INITMSG, &sinmsg, len);
 
 	SAFE_LISTEN(sk3, 1);
 
 	len = sizeof(struct sockaddr_in);
-	SAFE_CONNECT(sk1, (struct sockaddr *) &conn_addr, len);
+	TEST(connect(sk1, (struct sockaddr *) &lstn_addr, len));
+
+	if (TST_RET == -1 && tc->accept_err && TST_ERR == tc->accept_err) {
+		tst_res(TPASS, "connect() failed in an acceptable way");
+		SAFE_CLOSE(sk1);
+		SAFE_CLOSE(sk3);
+		return;
+	} else if (TST_RET < 0) {
+		tst_brk(TBROK | TTERRNO, "connect() failed");
+	}
+
 	sk2 = SAFE_ACCEPT(sk3, (struct sockaddr *) &acpt_addr, &len);
 
 	msglen = strlen(message) + 1;
-	TEST(sctp_sendmsg(sk1, message, msglen, (struct sockaddr *)&conn_addr,
-		len, 0, 0, 65534, 0, 0));
+	TEST(sctp_sendmsg(sk1, message, msglen, (struct sockaddr *)&lstn_addr,
+		len, 0, 0, tc->streams - 1, 0, 0));
 
 	if (TST_RET != msglen) {
 		tst_brk(TBROK | TTERRNO, "sctp_sendmsg() failed");
@@ -79,17 +93,19 @@ static void test_sctp(void)
 	buffer_rcv = malloc(msglen);
 	TEST(recv(sk2, buffer_rcv, msglen, MSG_NOSIGNAL));
 
-	if (TST_RET != msglen) {
+	if (TST_RET != msglen || strncmp(buffer_rcv, message, msglen)) {
 		tst_res(TFAIL | TTERRNO, "recv() failed");
 	} else {
 		tst_res(TPASS, "connect() with init timeout set to 0 - SUCCESS");
 	}
 
+	free(buffer_rcv);
 	SAFE_CLOSE(sk1);
 	SAFE_CLOSE(sk2);
 	SAFE_CLOSE(sk3);
 }
 
 static struct tst_test test = {
-	.test_all = test_sctp,
+	.test = test_sctp,
+	.tcnt = ARRAY_SIZE(testcase_list),
 };
-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
