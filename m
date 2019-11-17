Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C626FFA37
	for <lists+linux-ltp@lfdr.de>; Sun, 17 Nov 2019 15:26:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7843D3C2260
	for <lists+linux-ltp@lfdr.de>; Sun, 17 Nov 2019 15:26:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 38F883C1C9A
 for <ltp@lists.linux.it>; Sun, 17 Nov 2019 15:26:54 +0100 (CET)
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 665D71A016D8
 for <ltp@lists.linux.it>; Sun, 17 Nov 2019 15:26:53 +0100 (CET)
Received: by mail-wr1-x441.google.com with SMTP id w9so16444314wrr.0
 for <ltp@lists.linux.it>; Sun, 17 Nov 2019 06:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WgHq1K0d86qaBydjoVSI40IbA+on+NmJUJ9194ADAz0=;
 b=DEn8t2+hjh3/Qd8kRLKgkQ4rLaZwx+MfYByDAKoxLFG9i6kD2iXxufZD+5r/ZaIama
 iXTimO7PAqdiODIAsLBiUuXTtmqeOJjsiUFj/YijaNSx3/FCrTnl7RDgOG93oGTZXv+c
 Mol5wtWxC/syfm+cqmrTd9kr4z6pAdSm8dsUBk1gUcROHz2URieVvT/HcRt7xUiTmpi/
 obW8mr8gK8BS8Z6609mzSX2diWno2q0owQg0SgeKDopXADym+jOaiAhSKvPA5w2PA04y
 iNuZfT6Fi6/96lTyWkvLqhLNL6ReGe2WC5p8bHMog7/wc7xFOEBoG2Oypb9e9hQo3kDp
 ArNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WgHq1K0d86qaBydjoVSI40IbA+on+NmJUJ9194ADAz0=;
 b=MdGKFtaXkKgEjwoSpc9/laKVE5ZBEA8RLuYarV0yKTFw8gL5PIhjJNIaHx7g05EZP2
 7qE/cA0r/HIddZz5knjTCE4XvBxMIkpYnnAAXq2irbvtceuoYqn1j/Kwvcpatx7uHf41
 SVCOqfKjDZY7ijT2Nd161iLOjQzrd6ZTWlbjYMlB1VdaithQap5dFoZwj/XiAB/9IYf3
 RrmgHOGPZkXQho9huvx0JcFFRH4nNNu7hALZ4h488sDFXLToHVNUEj6AZIPMtgGWZ9bj
 TstAdNwK+IDtsq2T61P1ugYkIXYIC35IDUaanRaBUoXkg4YPTjzsJaAFt7VtpqtBhiwQ
 ZPVg==
X-Gm-Message-State: APjAAAVJZwkqX/SMIqqXdZYjWzWzbtnFtpEcNEPj9OahGe8u1twDyV6E
 DHwmUdS57AjGcJQBa4vPizKEMQkA
X-Google-Smtp-Source: APXvYqxqy9YYkjRf+2z4AHyHiVaPXJIYDnPU0jusx554dfV1Nz5VerjoCjvwVia/mBhSlDLbFpgtsA==
X-Received: by 2002:adf:ef51:: with SMTP id c17mr11677846wrp.266.1574000812457; 
 Sun, 17 Nov 2019 06:26:52 -0800 (PST)
Received: from localhost.localdomain ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id o1sm19467892wrs.50.2019.11.17.06.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2019 06:26:51 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Sun, 17 Nov 2019 15:26:42 +0100
Message-Id: <20191117142643.26210-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [COMMITTED][PATCH 1/2] Replace bzero() with memset()
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

bzero() is deprecated.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 lib/tlibio.c                                    |  2 +-
 testcases/kernel/fs/read_all/read_all.c         |  3 ++-
 .../kernel/hotplug/memory_hotplug/memtoy.c      |  2 +-
 .../kernel/syscalls/epoll_ctl/epoll_ctl01.c     |  4 ++--
 .../kernel/syscalls/epoll_wait/epoll_wait01.c   |  3 +--
 .../tirpc_simple_rpc_call/tirpc_rpc_call.c      |  1 +
 .../tirpc_rpc_call_performance.c                |  1 +
 .../tirpc_rpc_call_stress.c                     |  1 +
 .../rpc-tirpc/tests_pack/rpc_svc_2/rpc_svc_2.c  |  1 +
 .../tests_pack/tirpc_svc_11/tirpc_svc_11.c      |  1 +
 .../tests_pack/tirpc_svc_3/tirpc_svc_3.c        |  1 +
 .../tests_pack/tirpc_svc_4/tirpc_svc_4.c        |  1 +
 .../tests_pack/tirpc_svc_5/tirpc_svc_5.c        |  1 +
 .../tests_pack/tirpc_svc_6/tirpc_svc_6.c        |  1 +
 .../tests_pack/tirpc_svc_7/tirpc_svc_7.c        |  1 +
 .../tests_pack/tirpc_svc_8/tirpc_svc_8.c        |  1 +
 .../tests_pack/tirpc_svc_9/tirpc_svc_9.c        |  1 +
 utils/sctp/func_tests/test_getname.c            | 17 ++++++++---------
 18 files changed, 27 insertions(+), 16 deletions(-)

diff --git a/lib/tlibio.c b/lib/tlibio.c
index 8b30d591d..cc110d1c9 100644
--- a/lib/tlibio.c
+++ b/lib/tlibio.c
@@ -105,7 +105,7 @@
 #else
 /* for linux or sgi */
 #include <sys/uio.h>		/* readv(2)/writev(2) */
-#include <string.h>		/* bzero */
+#include <string.h>
 #endif
 #if defined(__linux__) || defined(__sun) || defined(__hpux) || defined(_AIX)
 #if !defined(UCLINUX) && !defined(__UCLIBC__)
diff --git a/testcases/kernel/fs/read_all/read_all.c b/testcases/kernel/fs/read_all/read_all.c
index 68fc7d031..47f853223 100644
--- a/testcases/kernel/fs/read_all/read_all.c
+++ b/testcases/kernel/fs/read_all/read_all.c
@@ -31,6 +31,7 @@
 #include <lapi/fnmatch.h>
 #include <stdlib.h>
 #include <stdio.h>
+#include <string.h>
 #include <dirent.h>
 #include <errno.h>
 #include <unistd.h>
@@ -287,7 +288,7 @@ static void spawn_workers(void)
 	int i;
 	struct worker *wa = workers;
 
-	bzero(workers, worker_count * sizeof(*workers));
+	memset(workers, 0, worker_count * sizeof(*workers));
 
 	for (i = 0; i < worker_count; i++) {
 		wa[i].q = queue_init();
diff --git a/testcases/kernel/hotplug/memory_hotplug/memtoy.c b/testcases/kernel/hotplug/memory_hotplug/memtoy.c
index 0707a9c8c..8ac9600de 100644
--- a/testcases/kernel/hotplug/memory_hotplug/memtoy.c
+++ b/testcases/kernel/hotplug/memory_hotplug/memtoy.c
@@ -367,7 +367,7 @@ void touch_memory(bool rw, unsigned long *memp, size_t memlen)
 void init_glctx(glctx_t * gcp)
 {
 
-	bzero(gcp, sizeof(glctx_t));
+	memset(gcp, 0, sizeof(glctx_t));
 
 	gcp->pagesize = (size_t) sysconf(_SC_PAGESIZE);
 
diff --git a/testcases/kernel/syscalls/epoll_ctl/epoll_ctl01.c b/testcases/kernel/syscalls/epoll_ctl/epoll_ctl01.c
index 1f81c3a26..e199ac6ac 100644
--- a/testcases/kernel/syscalls/epoll_ctl/epoll_ctl01.c
+++ b/testcases/kernel/syscalls/epoll_ctl/epoll_ctl01.c
@@ -21,7 +21,7 @@
 
 #include <sys/epoll.h>
 #include <poll.h>
-#include <strings.h>
+#include <string.h>
 #include <errno.h>
 #include "tst_test.h"
 
@@ -88,7 +88,7 @@ static void check_epoll_ctl(int opt, int exp_num)
 
 	while (events) {
 		int events_matched = 0;
-		bzero(res_evs, sizeof(res_evs));
+		memset(res_evs, 0, sizeof(res_evs));
 
 		res = epoll_wait(epfd, res_evs, 2, -1);
 		if (res <= 0) {
diff --git a/testcases/kernel/syscalls/epoll_wait/epoll_wait01.c b/testcases/kernel/syscalls/epoll_wait/epoll_wait01.c
index 9c13e2e5c..ad9126aaf 100644
--- a/testcases/kernel/syscalls/epoll_wait/epoll_wait01.c
+++ b/testcases/kernel/syscalls/epoll_wait/epoll_wait01.c
@@ -14,7 +14,6 @@
 #include <sys/epoll.h>
 #include <poll.h>
 #include <string.h>
-#include <strings.h>
 #include <errno.h>
 
 #include "tst_test.h"
@@ -181,7 +180,7 @@ static void verify_epollio(void)
 	while (events) {
 		int events_matched = 0;
 
-		bzero(ret_evs, sizeof(ret_evs));
+		memset(ret_evs, 0, sizeof(ret_evs));
 		TEST(epoll_wait(epfd, ret_evs, 2, -1));
 
 		if (TST_RET <= 0) {
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call.c
index 257b108cc..1dc533d0c 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call.c
@@ -27,6 +27,7 @@
 
 #include <stdio.h>
 #include <stdlib.h>
+#include <string.h>
 #include <time.h>
 #include <errno.h>
 #include "lapi/rpc.h"
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call_performance.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call_performance.c
index 357d9d18d..1a609751a 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call_performance.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call_performance.c
@@ -27,6 +27,7 @@
 
 #include <stdio.h>
 #include <stdlib.h>
+#include <string.h>
 #include <sys/time.h>
 #include "lapi/rpc.h"
 
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call_stress.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call_stress.c
index 56b5ddb57..264e24c45 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call_stress.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/tirpc/tirpc_simple_rpc_call/tirpc_rpc_call_stress.c
@@ -27,6 +27,7 @@
 
 #include <stdio.h>
 #include <stdlib.h>
+#include <string.h>
 #include <time.h>
 #include <errno.h>
 #include "lapi/rpc.h"
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_svc_2/rpc_svc_2.c b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_svc_2/rpc_svc_2.c
index 877db2af9..a2d18cc43 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_svc_2/rpc_svc_2.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_svc_2/rpc_svc_2.c
@@ -26,6 +26,7 @@
 */
 
 #include <stdio.h>
+#include <string.h>
 #include <rpc/rpc.h>
 #include <utmp.h>
 
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_11/tirpc_svc_11.c b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_11/tirpc_svc_11.c
index a93e831d0..121ae97e8 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_11/tirpc_svc_11.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_11/tirpc_svc_11.c
@@ -26,6 +26,7 @@
 */
 
 #include <stdio.h>
+#include <string.h>
 #include <sys/socket.h>
 #include <errno.h>
 #include <netinet/in.h>
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_3/tirpc_svc_3.c b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_3/tirpc_svc_3.c
index e20b9b4bb..c28f412fc 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_3/tirpc_svc_3.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_3/tirpc_svc_3.c
@@ -26,6 +26,7 @@
 */
 
 #include <stdio.h>
+#include <string.h>
 #include <sys/socket.h>
 #include <errno.h>
 #include "lapi/rpc.h"
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_4/tirpc_svc_4.c b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_4/tirpc_svc_4.c
index 02d745c6a..566b6fcf6 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_4/tirpc_svc_4.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_4/tirpc_svc_4.c
@@ -26,6 +26,7 @@
 */
 
 #include <stdio.h>
+#include <string.h>
 #include <sys/socket.h>
 #include <errno.h>
 #include "lapi/rpc.h"
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_5/tirpc_svc_5.c b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_5/tirpc_svc_5.c
index 36003cb4f..ebf577717 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_5/tirpc_svc_5.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_5/tirpc_svc_5.c
@@ -27,6 +27,7 @@
 */
 
 #include <stdio.h>
+#include <string.h>
 #include <sys/socket.h>
 #include <errno.h>
 #include <netinet/in.h>
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_6/tirpc_svc_6.c b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_6/tirpc_svc_6.c
index 71a475373..1dd421e1c 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_6/tirpc_svc_6.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_6/tirpc_svc_6.c
@@ -26,6 +26,7 @@
 */
 
 #include <stdio.h>
+#include <string.h>
 #include <sys/socket.h>
 #include <errno.h>
 #include <pthread.h>
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_7/tirpc_svc_7.c b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_7/tirpc_svc_7.c
index ea141f4ef..559ef7f97 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_7/tirpc_svc_7.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_7/tirpc_svc_7.c
@@ -26,6 +26,7 @@
 */
 
 #include <stdio.h>
+#include <string.h>
 #include <sys/socket.h>
 #include <errno.h>
 #include <netinet/in.h>
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_8/tirpc_svc_8.c b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_8/tirpc_svc_8.c
index 6c1c37bac..fd516e4dd 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_8/tirpc_svc_8.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_8/tirpc_svc_8.c
@@ -26,6 +26,7 @@
 */
 
 #include <stdio.h>
+#include <string.h>
 #include <pthread.h>
 #include <sys/socket.h>
 #include <errno.h>
diff --git a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_9/tirpc_svc_9.c b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_9/tirpc_svc_9.c
index a000ba265..2fd9b4fc9 100644
--- a/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_9/tirpc_svc_9.c
+++ b/testcases/network/rpc/rpc-tirpc/tests_pack/tirpc_svc_9/tirpc_svc_9.c
@@ -26,6 +26,7 @@
 */
 
 #include <stdio.h>
+#include <string.h>
 #include <pthread.h>
 #include <sys/socket.h>
 #include <errno.h>
diff --git a/utils/sctp/func_tests/test_getname.c b/utils/sctp/func_tests/test_getname.c
index ffc47357c..f7070a34a 100644
--- a/utils/sctp/func_tests/test_getname.c
+++ b/utils/sctp/func_tests/test_getname.c
@@ -41,7 +41,6 @@
 #include <unistd.h>
 #include <stdlib.h>
 #include <string.h>
-#include <strings.h>
 #include <fcntl.h>
 #include <sys/types.h>
 #include <sys/socket.h>
@@ -92,7 +91,7 @@ main(int argc, char *argv[])
         svr_sk = test_socket(pf_class, SOCK_STREAM, IPPROTO_SCTP);
 	test_bind(svr_sk, &svr_loop.sa, sizeof(svr_loop));
 
-	bzero(&svr_local_addr, sizeof(svr_local_addr));
+	memset(&svr_local_addr, 0, sizeof(svr_local_addr));
 	len = sizeof(svr_local_addr);
 	/* Verify that getsockname() on an unconnected socket works fine. */
 	error = getsockname(svr_sk, (struct sockaddr *)&svr_local_addr, &len);
@@ -101,7 +100,7 @@ main(int argc, char *argv[])
 
 	tst_resm(TPASS, "getsockname on an unconnected socket");
 
-	bzero(&svr_peer_addr, sizeof(svr_peer_addr));
+	memset(&svr_peer_addr, 0, sizeof(svr_peer_addr));
 	len = sizeof(svr_peer_addr);
 	/* Verify that getpeername() on an unconnected socket fails. */
 	error = getpeername(svr_sk, (struct sockaddr *)&svr_peer_addr, &len);
@@ -125,7 +124,7 @@ main(int argc, char *argv[])
 #endif
 	test_connect(clt_sk, &svr_loop.sa, sizeof(svr_loop));
 
-	bzero(&clt_local_addr, sizeof(clt_local_addr));
+	memset(&clt_local_addr, 0, sizeof(clt_local_addr));
 	len = sizeof(clt_local_addr);
 	/* Get the client's local address. */
 	error = getsockname(clt_sk, (struct sockaddr *)&clt_local_addr, &len);
@@ -135,7 +134,7 @@ main(int argc, char *argv[])
 
 	tst_resm(TPASS, "getsockname on a connected client socket");
 
-	bzero(&clt_peer_addr, sizeof(clt_peer_addr));
+	memset(&clt_peer_addr, 0, sizeof(clt_peer_addr));
 	len = sizeof(clt_peer_addr);
 	/* Get the client's peer address. */
 	error = getpeername(clt_sk, (struct sockaddr *)&clt_peer_addr, &len);
@@ -149,7 +148,7 @@ main(int argc, char *argv[])
 	len = sizeof(accept_loop);
 	accept_sk = test_accept(svr_sk, &accept_loop.sa, &len); 
 
-	bzero(&svr_local_addr, sizeof(svr_local_addr));
+	memset(&svr_local_addr, 0, sizeof(svr_local_addr));
 	len = sizeof(svr_local_addr);
 	/* Get the server's local address. */
 	error = getsockname(accept_sk, (struct sockaddr *)&svr_local_addr,
@@ -160,7 +159,7 @@ main(int argc, char *argv[])
 
 	tst_resm(TPASS, "getsockname on a connected server socket");
 
-	bzero(&svr_peer_addr, sizeof(svr_peer_addr));
+	memset(&svr_peer_addr, 0, sizeof(svr_peer_addr));
 	len = sizeof(svr_peer_addr);
 	/* Get the server's peer address. */
 	error = getpeername(accept_sk, (struct sockaddr *)&svr_peer_addr,
@@ -200,7 +199,7 @@ main(int argc, char *argv[])
 #endif
 	tst_resm(TPASS, "getsockname/getpeername server/client match");
 
-	bzero(&clt_local_addr, sizeof(clt_local_addr));
+	memset(&clt_local_addr, 0, sizeof(clt_local_addr));
 	len = sizeof(clt_local_addr);
 	/*getsockname():  Bad socket descriptor, EBADF expected error*/
 	error = getsockname(-1, (struct sockaddr *)&clt_local_addr, &len);
@@ -235,7 +234,7 @@ main(int argc, char *argv[])
 
 	tst_resm(TPASS, "getsockname with invalid buffer - EFAULT");
  
-	bzero(&clt_peer_addr, sizeof(clt_peer_addr));
+	memset(&clt_peer_addr, 0, sizeof(clt_peer_addr));
 	len = sizeof(clt_peer_addr);
 	/*getpeername():  Bad socket descriptor, EBADF expected error*/
 	error = getpeername(-1, (struct sockaddr *)&clt_local_addr, &len);
-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
