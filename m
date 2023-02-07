Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1893868D6F3
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Feb 2023 13:40:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B5563CC229
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Feb 2023 13:40:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 828693CB14D
 for <ltp@lists.linux.it>; Tue,  7 Feb 2023 13:40:26 +0100 (CET)
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3DA601000A14
 for <ltp@lists.linux.it>; Tue,  7 Feb 2023 13:40:22 +0100 (CET)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 317CeGkE006519
 for <ltp@lists.linux.it>; Tue, 7 Feb 2023 20:40:16 +0800 (+08)
 (envelope-from ycliang@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Tue, 7 Feb 2023
 20:40:14 +0800
From: Leo Yu-Chi Liang <ycliang@andestech.com>
To: <ycliang@andestech.com>, <ltp@lists.linux.it>
Date: Tue, 7 Feb 2023 20:40:08 +0800
Message-ID: <20230207124008.1788759-1-ycliang@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.173]
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 317CeGkE006519
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.4 required=7.0 tests=PDS_RDNS_DYNAMIC_FP,
 RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] tst_pids.c: fix fork failure on small memory
 systems
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

Running syscalls/msgstress03 on a system with less than ~1 GB of RAM fails:

	msgstress03    1  TFAIL  :  msgstress03.c:163:  Fork failed (may be OK if under stress)

The reason is that besides /proc/sys/kernel/pid_max, /proc/sys/kernel/threads-max
is another factor determining how many processes a system could create.

Use the smaller number between pid_max and threads-max as the nprocs.

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 lib/tst_pid.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/tst_pid.c b/lib/tst_pid.c
index 21cadef2a..3fb3f39ad 100644
--- a/lib/tst_pid.c
+++ b/lib/tst_pid.c
@@ -31,6 +31,7 @@
 #include "tst_safe_macros.h"
 
 #define PID_MAX_PATH "/proc/sys/kernel/pid_max"
+#define THREADS_MAX_PATH "/proc/sys/kernel/threads-max"
 #define CGROUPS_V1_SLICE_FMT "/sys/fs/cgroup/pids/user.slice/user-%d.slice/pids.max"
 #define CGROUPS_V2_SLICE_FMT "/sys/fs/cgroup/user.slice/user-%d.slice/pids.max"
 /* Leave some available processes for the OS */
@@ -113,7 +114,7 @@ static int get_session_pids_limit(void (*cleanup_fn) (void))
 int tst_get_free_pids_(void (*cleanup_fn) (void))
 {
 	FILE *f;
-	int rc, used_pids, max_pids, max_session_pids;
+	int rc, used_pids, max_pids, max_session_pids, max_threads;
 
 	f = popen("ps -eT | wc -l", "r");
 	if (!f) {
@@ -129,6 +130,8 @@ int tst_get_free_pids_(void (*cleanup_fn) (void))
 	}
 
 	SAFE_FILE_SCANF(cleanup_fn, PID_MAX_PATH, "%d", &max_pids);
+	SAFE_FILE_SCANF(cleanup_fn, THREADS_MAX_PATH, "%d", &max_threads);
+	max_pids = (max_pids < max_threads) ? max_pids : max_threads;
 
 	max_session_pids = get_session_pids_limit(cleanup_fn);
 	if ((max_session_pids > 0) && (max_session_pids < max_pids))
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
