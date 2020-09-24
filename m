Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 47770276A82
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Sep 2020 09:19:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 168453C59EC
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Sep 2020 09:19:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id B7BBC3C4D59
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 09:18:34 +0200 (CEST)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4E147200C2B
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 09:18:28 +0200 (CEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08O79i9m122119
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 07:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=QwE4Fs7ndzrUBbi/iZTbdSuoEehxJfgkigCzlUKQ6lA=;
 b=I15UcO+yQs6icbMqMRjrSeLE3xsSVT1yWQN5AfvxjuZhfwLmbp1jInUadeM2CT0ZAcIm
 RenfOqmFH2yxLIJFsDibwSNykhA1lAPGmlOM1gddD903MLFxqppEX18wAmv1w16jKoLO
 +hDamksG7Lb3K3yvAbkX1a035KJtrZQIrE5Uu9EUm827tm/mj4Wkz58cQ6Ta+qcgQtfa
 cBws4f0ndIBPzwZCt0av8SQfiiPMJTkn2894hGvQWs3z0z7DmJR4pPjB8m373al1ACdU
 j87f/wfpMnLYd96pyNoey7CM9kXYWmYpIMyHRSpUw+atxEwK6VU4V2AX3/irhNrr5uWh /Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 33q5rgmt50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 07:18:25 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08O7ASj4084011
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 07:18:24 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 33nurvtt0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 07:18:24 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08O7IN54008474
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 07:18:23 GMT
Received: from gyrotron.uk.oracle.com (/10.175.183.175)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 24 Sep 2020 00:18:23 -0700
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: ltp@lists.linux.it
Date: Thu, 24 Sep 2020 10:17:39 +0300
Message-Id: <20200924071740.6963-4-alexey.kodanev@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200924071740.6963-1-alexey.kodanev@oracle.com>
References: <20200924071740.6963-1-alexey.kodanev@oracle.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 suspectscore=1
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240054
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 impostorscore=0
 clxscore=1015 suspectscore=1 phishscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240054
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 4/5] network/netstress: replace rand with rand_r() in
 the client thread
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

Store seed per client thread in order to get reproducible results.

Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
---
 configure.ac                            |  1 +
 testcases/network/netstress/netstress.c | 33 ++++++++++++++++---------
 2 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/configure.ac b/configure.ac
index 142bfe26e..03e4e09c9 100644
--- a/configure.ac
+++ b/configure.ac
@@ -108,6 +108,7 @@ AC_CHECK_FUNCS_ONCE([ \
     profil \
     pwritev \
     pwritev2 \
+    rand_r \
     readlinkat \
     recvmmsg \
     renameat \
diff --git a/testcases/network/netstress/netstress.c b/testcases/network/netstress/netstress.c
index c5da4d464..e79e64220 100644
--- a/testcases/network/netstress/netstress.c
+++ b/testcases/network/netstress/netstress.c
@@ -31,6 +31,13 @@
 #include "tst_test.h"
 #include "tst_safe_net.h"
 
+#if !defined(HAVE_RAND_R)
+static int rand_r(LTP_ATTRIBUTE_UNUSED unsigned int *seed)
+{
+    return rand();
+}
+#endif
+
 static const int max_msg_len = (1 << 16) - 1;
 static const int min_msg_len = 5;
 
@@ -62,6 +69,7 @@ static const int end_byte	= 0x0a;
 static int init_cln_msg_len	= 32;
 static int init_srv_msg_len	= 128;
 static int max_rand_msg_len;
+static int init_seed;
 
 /*
  * The number of requests from client after
@@ -344,10 +352,11 @@ union net_size_field {
 	uint16_t value;
 };
 
-static void make_client_request(char client_msg[], int *cln_len, int *srv_len)
+static void make_client_request(char client_msg[], int *cln_len, int *srv_len,
+				unsigned int *seed)
 {
 	if (max_rand_msg_len)
-		*cln_len = *srv_len = min_msg_len + rand() % max_rand_msg_len;
+		*cln_len = *srv_len = min_msg_len + rand_r(seed) % max_rand_msg_len;
 
 	memset(client_msg, client_byte, *cln_len);
 	client_msg[0] = start_byte;
@@ -362,7 +371,7 @@ static void make_client_request(char client_msg[], int *cln_len, int *srv_len)
 	client_msg[*cln_len - 1] = end_byte;
 }
 
-void *client_fn(LTP_ATTRIBUTE_UNUSED void *arg)
+void *client_fn(void *id)
 {
 	int cln_len = init_cln_msg_len,
 	    srv_len = init_srv_msg_len;
@@ -371,13 +380,14 @@ void *client_fn(LTP_ATTRIBUTE_UNUSED void *arg)
 	char client_msg[max_msg_len];
 	int i = 0;
 	intptr_t err = 0;
+	unsigned int seed = init_seed ^ (intptr_t)id;
 
 	inf.raddr_len = sizeof(inf.raddr);
 	inf.etime_cnt = 0;
 	inf.timeout = wait_timeout;
 	inf.pmtu_err_cnt = 0;
 
-	make_client_request(client_msg, &cln_len, &srv_len);
+	make_client_request(client_msg, &cln_len, &srv_len, &seed);
 
 	/* connect & send requests */
 	inf.fd = client_connect_send(client_msg, cln_len);
@@ -407,7 +417,7 @@ void *client_fn(LTP_ATTRIBUTE_UNUSED void *arg)
 		}
 
 		if (max_rand_msg_len)
-			make_client_request(client_msg, &cln_len, &srv_len);
+			make_client_request(client_msg, &cln_len, &srv_len, &seed);
 
 		SAFE_SEND(1, inf.fd, client_msg, cln_len, send_flags);
 
@@ -468,9 +478,9 @@ static void client_init(void)
 	family = remote_addrinfo->ai_family;
 
 	clock_gettime(CLOCK_MONOTONIC_RAW, &tv_client_start);
-	int i;
+	intptr_t i;
 	for (i = 0; i < clients_num; ++i)
-		SAFE_PTHREAD_CREATE(&thread_ids[i], 0, client_fn, NULL);
+		SAFE_PTHREAD_CREATE(&thread_ids[i], 0, client_fn, (void *)i);
 }
 
 static void client_run(void)
@@ -496,7 +506,7 @@ static void client_run(void)
 	int msg_len = min_msg_len;
 
 	max_rand_msg_len = 0;
-	make_client_request(client_msg, &msg_len, &msg_len);
+	make_client_request(client_msg, &msg_len, &msg_len, NULL);
 	/* ask server to terminate */
 	client_msg[0] = start_fin_byte;
 	int cfd = client_connect_send(client_msg, msg_len);
@@ -861,10 +871,9 @@ static void setup(void)
 
 	if (max_rand_msg_len) {
 		max_rand_msg_len -= min_msg_len;
-		unsigned int seed = max_rand_msg_len ^ client_max_requests;
-
-		srand(seed);
-		tst_res(TINFO, "srand() seed 0x%x", seed);
+		init_seed = max_rand_msg_len ^ client_max_requests;
+		srand(init_seed); /* in case rand_r() is missing */
+		tst_res(TINFO, "rand start seed 0x%x", init_seed);
 	}
 
 	/* if client_num is not set, use num of processors */
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
