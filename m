Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 501A43B71CC
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 14:11:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B77B23C6CFA
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 14:11:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EE8CD3C0F90
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 14:10:57 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8A6B21A00E7F
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 14:10:57 +0200 (CEST)
Received: from mail-ej1-f70.google.com ([209.85.218.70])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lyCZt-0006lH-0B
 for ltp@lists.linux.it; Tue, 29 Jun 2021 12:10:57 +0000
Received: by mail-ej1-f70.google.com with SMTP id
 ho42-20020a1709070eaab02904a77ea3380eso5629157ejc.4
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 05:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d9qhKPd8OKON9S7Pt7H7PbGx5dpQ/BTd41TQLNh9iSA=;
 b=Y+ofzynFrZtoEiWQPvQENuYCT8jOs0hwWl0RLqpFaxjhquuNQ+xYqtB1ZInJPernp1
 yQmtzlxcEW08Zkdu0kHWTMML9tCHvgHHM1KDUYH56ltl+04M+xm3T5LpnK6Qc/3vgrki
 yUImr8uvI9zjw+8+E4xRmM+h3IYP1b4RCSYzQty3HE40wEDSwa2Fz7PaOQOaUZlc5Udf
 69mxA+XfwoM6Hxo2yKwnFSAxfDKXGT15OoBTQDWyOyKiqbAi3AqC0iwUFqgccRT6yW18
 2vQAVsHnjqkSJEVh9J3Q2bb5B7YAb4vWfNL2hprmgEUAPeWILVSt9bXb5suza7ZtxzJb
 xOFA==
X-Gm-Message-State: AOAM5328ktyG3qPHMeRDy/eAYRtYH4r/WvjIzzkSidP0OFcn8WbI7/45
 XVw+8sWvbIxsNUlwHriKH/9J3+K/LduA/HE/G5G2OsmUoBwOCRCOz+K83BGVgQx8lxN0FoARl86
 3nAz+2EedwQrc9SqV3oZ9S9LH0gt3
X-Received: by 2002:a05:6402:1d55:: with SMTP id
 dz21mr38885152edb.338.1624968656288; 
 Tue, 29 Jun 2021 05:10:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGiPIHEehM3vLiXcWHmVK5xtFMyIKzD5Q8SeWmMl+OKBl6E7+HcQ2V8AMT9OYUI53aUIJG0A==
X-Received: by 2002:a05:6402:1d55:: with SMTP id
 dz21mr38885130edb.338.1624968656082; 
 Tue, 29 Jun 2021 05:10:56 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id n4sm8084256eja.121.2021.06.29.05.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 05:10:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Tue, 29 Jun 2021 14:10:45 +0200
Message-Id: <20210629121047.100391-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210629121047.100391-1-krzysztof.kozlowski@canonical.com>
References: <20210629121047.100391-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v4 2/4] tst_pid.c: fix fork failure on small memory
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

Running syscalls/msgstress04 on a system with less than ~4 GB of RAM fails:

    Fork failure in the first child of child group 4396
    Fork failure in the second child of child group 4413
    msgstress04    1  TFAIL  :  msgstress04.c:222: Child exit status = 1

The reason is cgroups pid limit set by systemd user.slice.  The limit is
set for login session, also for root user.  For example on 2 GB RAM
machine it is set as:
    /sys/fs/cgroup/pids/user.slice/user-0.slice/pids.max:5207

Read the maximum number of pids and adjust the test limit.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 include/tst_pid.h |  4 ++-
 lib/tst_pid.c     | 70 ++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 72 insertions(+), 2 deletions(-)

diff --git a/include/tst_pid.h b/include/tst_pid.h
index 6c42f73a57e7..8d999a655f1a 100644
--- a/include/tst_pid.h
+++ b/include/tst_pid.h
@@ -14,7 +14,9 @@ pid_t tst_get_unused_pid_(void (*cleanup_fn)(void));
 
 /*
  * Returns number of free pids by subtraction of the number of pids
- * currently used ('ps -eT') from max_pids
+ * currently used ('ps -eT') from maximum number of processes.
+ * The limit of processes come from kernel pid_max and cgroup session limits
+ * (e.g. configured by systemd user.slice).
  */
 int tst_get_free_pids_(void (*cleanup_fn)(void));
 
diff --git a/lib/tst_pid.c b/lib/tst_pid.c
index 9568cc9e91d2..c408172675a7 100644
--- a/lib/tst_pid.c
+++ b/lib/tst_pid.c
@@ -18,14 +18,20 @@
  *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  */
 
+#include <errno.h>
 #include <fcntl.h>
 #include <limits.h>
+#include <stdio.h>
+#include <stdlib.h>
 #include <sys/types.h>
+#include <unistd.h>
 #include "test.h"
 #include "tst_pid.h"
 #include "old_safe_file_ops.h"
 
 #define PID_MAX_PATH "/proc/sys/kernel/pid_max"
+#define CGROUPS_V1_SLICE_FMT "/sys/fs/cgroup/pids/user.slice/user-%d.slice/pids.max"
+#define CGROUPS_V2_SLICE_FMT "/sys/fs/cgroup/user.slice/user-%d.slice/pids.max"
 
 pid_t tst_get_unused_pid_(void (*cleanup_fn) (void))
 {
@@ -36,10 +42,68 @@ pid_t tst_get_unused_pid_(void (*cleanup_fn) (void))
 	return pid;
 }
 
+/*
+ * Get the effective session UID - either one invoking current test via sudo
+ * or the real UID.
+ */
+static unsigned int get_session_uid(void)
+{
+	const char *sudo_uid;
+
+	sudo_uid = getenv("SUDO_UID");
+	if (sudo_uid) {
+		unsigned int real_uid;
+		int ret;
+
+		ret = sscanf(sudo_uid, "%u", &real_uid);
+		if (ret == 1)
+			return real_uid;
+	}
+
+	return getuid();
+}
+
+static int read_session_pids_limit(const char *path_fmt, int uid,
+				   void (*cleanup_fn) (void))
+{
+	int max_pids, ret;
+	char path[PATH_MAX];
+
+	ret = snprintf(path, sizeof(path), path_fmt, uid);
+	if (ret < 0 || (size_t)ret >= sizeof(path))
+		return -1;
+
+	if (access(path, R_OK) != 0) {
+		tst_resm(TINFO, "Cannot read session user limits from '%s'", path);
+		return -1;
+	}
+
+	SAFE_FILE_SCANF(cleanup_fn, path, "%d", &max_pids);
+	tst_resm(TINFO, "Found limit of processes %d (from %s)", max_pids, path);
+
+	return max_pids;
+}
+
+static int get_session_pids_limit(void (*cleanup_fn) (void))
+{
+	int max_pids, uid;
+
+	uid = get_session_uid();
+	max_pids = read_session_pids_limit(CGROUPS_V2_SLICE_FMT, uid, cleanup_fn);
+	if (max_pids < 0)
+		max_pids = read_session_pids_limit(CGROUPS_V1_SLICE_FMT, uid,
+						   cleanup_fn);
+
+	if (max_pids < 0)
+		return -1;
+
+	return max_pids;
+}
+
 int tst_get_free_pids_(void (*cleanup_fn) (void))
 {
 	FILE *f;
-	int rc, used_pids, max_pids;
+	int rc, used_pids, max_pids, max_session_pids;
 
 	f = popen("ps -eT | wc -l", "r");
 	if (!f) {
@@ -57,6 +121,10 @@ int tst_get_free_pids_(void (*cleanup_fn) (void))
 
 	SAFE_FILE_SCANF(cleanup_fn, PID_MAX_PATH, "%d", &max_pids);
 
+	max_session_pids = get_session_pids_limit(cleanup_fn);
+	if ((max_session_pids > 0) && (max_session_pids < max_pids))
+		max_pids = max_session_pids;
+
 	/* max_pids contains the maximum PID + 1,
 	 * used_pids contains used PIDs + 1,
 	 * so this additional '1' is eliminated by the substraction */
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
