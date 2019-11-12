Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A915F93BD
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 16:12:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 132333C26DF
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 16:12:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id BE1893C2209
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 16:11:59 +0100 (CET)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id F1B271000A2B
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 16:11:58 +0100 (CET)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xACF4H6N081248
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 15:11:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2019-08-05;
 bh=3Jp0rE6aCZPWE3pj/h20xt0Ny8lS+u/xeOANN3EFaaU=;
 b=DLww3BM6hF1fnbf4hVmDebfUn4KzHFOaQMQHkDEyZqibb/oeen2btz01t2KUg7bB8kuc
 egu98kA5Z6jz/QJQPgfbH6AXvfPVCoJsK6zv8oXzw9wupp+aumHWHfFfz6Jc6Vf6t3Za
 wj+LKSDBWhU4OM7prJREMtinCWKnnRnJe0iYlS1A5yp4kPJi7VMG6Wv0AW7oA+PJsTL4
 qOumebLDUQuFwZC2O4fn6BFzcZdJFeJ7eAXcBWPidF/OyCK45xE/SFiOYdwiFbZfem0A
 6lq8QtQXszKKQj8TN+kUqpWUndYikO+1q6EgY6otW/md8HLGNxpaRGfCVtJny+r5xsFO fA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2w5mvtnfkp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 15:11:56 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xACF4Pw8180515
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 15:11:56 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2w7khkf5a5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 15:11:55 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xACFBrjH018921
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 15:11:55 GMT
Received: from gyrotron.nl.oracle.com (/10.175.42.219)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 12 Nov 2019 07:11:53 -0800
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: ltp@lists.linux.it
Date: Tue, 12 Nov 2019 18:11:31 +0300
Message-Id: <20191112151131.5740-2-alexey.kodanev@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191112151131.5740-1-alexey.kodanev@oracle.com>
References: <20191112151131.5740-1-alexey.kodanev@oracle.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9438
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911120133
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9438
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911120133
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] network/netstress: set default options value
 after arg parsing
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

It fixes misleading warnings about multiple options being set:

$ netstress -H 127.0.0.1
tst_test.c:500: WARN: Option -H passed multiple times
tst_test.c:1217: INFO: Timeout per run is 0h 05m 00s
...

But for the result path 'rpath', don't create a file if the option
is not set.

Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
---
 testcases/network/netstress/netstress.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/testcases/network/netstress/netstress.c b/testcases/network/netstress/netstress.c
index a5cc9a532..76d2fdb04 100644
--- a/testcases/network/netstress/netstress.c
+++ b/testcases/network/netstress/netstress.c
@@ -70,7 +70,7 @@ static int server_max_requests	= 3;
 static int client_max_requests	= 10;
 static int clients_num;
 static char *tcp_port;
-static char *server_addr	= "localhost";
+static char *server_addr;
 static char *source_addr;
 static char *server_bg;
 static int busy_poll		= -1;
@@ -101,7 +101,7 @@ static int sfd;
 static int wait_timeout = 60000;
 
 /* in the end test will save time result in this file */
-static char *rpath = "tfo_result";
+static char *rpath;
 static char *port_path = "netstress_port";
 static char *log_path = "netstress.log";
 
@@ -517,7 +517,8 @@ static void client_run(void)
 		SAFE_CLOSE(cfd);
 	}
 	/* the script tcp_fastopen_run.sh will remove it */
-	SAFE_FILE_PRINTF(rpath, "%ld", clnt_time);
+	if (rpath)
+		SAFE_FILE_PRINTF(rpath, "%ld", clnt_time);
 
 	tst_res(TPASS, "test completed");
 }
@@ -867,6 +868,9 @@ static void setup(void)
 	if (tst_parse_int(Aarg, &max_rand_msg_len, 10, max_msg_len))
 		tst_brk(TBROK, "Invalid max random payload size '%s'", Aarg);
 
+	if (!server_addr)
+		server_addr = "localhost";
+
 	if (max_rand_msg_len) {
 		max_rand_msg_len -= min_msg_len;
 		unsigned int seed = max_rand_msg_len ^ client_max_requests;
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
