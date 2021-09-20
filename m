Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D384113DA
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Sep 2021 13:58:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 105293C8736
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Sep 2021 13:58:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B16303C17C6
 for <ltp@lists.linux.it>; Mon, 20 Sep 2021 13:58:22 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BB3E01A00119
 for <ltp@lists.linux.it>; Mon, 20 Sep 2021 13:58:21 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 57DFE9F93D;
 Mon, 20 Sep 2021 11:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1632139100; bh=qSPwQPkZixp7E/em7X8sjYv7ODzcoiBVWqAV83xOSWg=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=PUP2pKLd2SGPKb31vVtNxRiZlBCVetOAoGo+//qomVTiioU8aSfD71HTaSdiGlyzn
 lE/vJeDj6Ylk5dl2dGJL6GvIGvGtDPjLorgsmxxstCcL7qnAZn/0ywrfEWQUUCwsZq
 0OqtC5mZeHyljzV0+jg0EKBMYjI13x02WcYcwh5s=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	chrubis@suse.cz,
	krzysztof.kozlowski@canonical.com
Date: Mon, 20 Sep 2021 13:58:14 +0200
Message-Id: <20210920115814.296041-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] tst_pid: Fix read_session_pids_limit if pids.max is
 max
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

The pids cgroup controller knob pids.max is allowed to be set to max.
This lead to a failure, when SAFE_FILE_SCANF with "%d" was used.

If pids.max=max, we can assume unlimited pids
=> read /proc/sys/kernel/pid_max

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---

@Cyril: This should propably be merged before the release,
because it breaks some tests (e.g. msgstress03 and msgstress04)

 lib/tst_pid.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/lib/tst_pid.c b/lib/tst_pid.c
index 897a1b96a..55a316429 100644
--- a/lib/tst_pid.c
+++ b/lib/tst_pid.c
@@ -28,6 +28,7 @@
 #include "test.h"
 #include "tst_pid.h"
 #include "old_safe_file_ops.h"
+#include "tst_safe_macros.h"
 
 #define PID_MAX_PATH "/proc/sys/kernel/pid_max"
 #define CGROUPS_V1_SLICE_FMT "/sys/fs/cgroup/pids/user.slice/user-%d.slice/pids.max"
@@ -69,6 +70,7 @@ static int read_session_pids_limit(const char *path_fmt, int uid,
 				   void (*cleanup_fn) (void))
 {
 	int max_pids, ret;
+	char max_pid_value[100];
 	char path[PATH_MAX];
 
 	ret = snprintf(path, sizeof(path), path_fmt, uid);
@@ -80,8 +82,14 @@ static int read_session_pids_limit(const char *path_fmt, int uid,
 		return -1;
 	}
 
-	SAFE_FILE_SCANF(cleanup_fn, path, "%d", &max_pids);
-	tst_resm(TINFO, "Found limit of processes %d (from %s)", max_pids, path);
+	SAFE_FILE_SCANF(cleanup_fn, path, "%s", max_pid_value);
+	if (strcmp(max_pid_value, "max") == 0) {
+		SAFE_FILE_SCANF(cleanup_fn, PID_MAX_PATH, "%d", &max_pids);
+		tst_resm(TINFO, "Found limit of processes %d (from %s=max)", max_pids, path);
+	} else {
+		max_pids = SAFE_STRTOL(max_pid_value, 0, INT_MAX);
+		tst_resm(TINFO, "Found limit of processes %d (from %s)", max_pids, path);
+	}	
 
 	return max_pids;
 }
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
