Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFD53DDD13
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 18:06:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 841913C8AF5
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 18:06:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0D8453C57C1
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 18:06:24 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 65118140020C
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 18:06:23 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 9EEE721E83;
 Mon,  2 Aug 2021 16:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1627920382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=BECYAmzMtSAJRucWigRY2KGyjxPVxFqWHr70t3xDQis=;
 b=OjcZy7aqN53wzRxCoPQWe+f3Cmn3y7GHr6M43OIb2LOtV+mbt8Qvdhm/U85IFPiu67NPf9
 OvtYwdtnqjBzG3T/EOBLu4mWMudC9wrSbtfv8sQyIQWCxvmeynMOrV/0cS+EYUY/2JQZ2t
 Je98/dRkVUUA509hFxXFTmuhbrxjdd8=
Received: from localhost.suse.de (unknown [10.163.30.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 75B12A3BBB;
 Mon,  2 Aug 2021 16:06:22 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon,  2 Aug 2021 19:06:20 +0300
Message-Id: <20210802160620.9544-1-bogdan.lezhepekov@suse.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2] shmget02: check if CONFIG_HUGETLBFS enabled in
 kernel
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
From: Bogdan Lezhepekov via ltp <ltp@lists.linux.it>
Reply-To: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Two tests call shmget with a flag SHM_HUGETLB, trying to
allocate the segment using "huge" pages. The hugetlbpage
support needs to be enabled in kernel (CONFIG_HUGETLBFS),
otherwise shmget returns EINVAL.

Signed-off-by: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
---
 .../kernel/syscalls/ipc/shmget/shmget02.c     | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget02.c b/testcases/kernel/syscalls/ipc/shmget/shmget02.c
index 66a4b94ee..7616178be 100644
--- a/testcases/kernel/syscalls/ipc/shmget/shmget02.c
+++ b/testcases/kernel/syscalls/ipc/shmget/shmget02.c
@@ -32,10 +32,13 @@
 #include <sys/shm.h>
 #include <grp.h>
 #include "tst_safe_sysv_ipc.h"
+#include "tst_kconfig.h"
 #include "tst_test.h"
 #include "libnewipc.h"
 #include "lapi/shm.h"
 
+#define CONFIG_HUGETLBFS "CONFIG_HUGETLBFS"
+
 static int shm_id = -1;
 static key_t shmkey, shmkey1;
 static struct passwd *pw;
@@ -60,6 +63,17 @@ static struct tcase {
 	{&shmkey1, SHM_SIZE, IPC_CREAT | SHM_HUGETLB, 0, 0, ENOMEM}
 };
 
+static int hugetlbfs_supported()
+{
+	struct tst_kconfig_var kconfig = {
+		.id = CONFIG_HUGETLBFS,
+		.id_len = sizeof(CONFIG_HUGETLBFS)-1,
+	};
+
+	tst_kconfig_read(&kconfig, 1);
+	return kconfig.choice == 'y';
+}
+
 static void do_test(unsigned int n)
 {
 	struct tcase *tc = &tcases[n];
@@ -94,6 +108,16 @@ static void setup(void)
 	SAFE_SETRLIMIT(RLIMIT_MEMLOCK, &rl);
 	shm_id = SAFE_SHMGET(shmkey, SHM_SIZE, IPC_CREAT | IPC_EXCL);
 	pw = SAFE_GETPWNAM("nobody");
+	
+	if (! hugetlbfs_supported()) {
+
+		tst_res(TINFO, "SHM_HUGETLB not supported by kernel");
+
+		for (int i = 0; i < ARRAY_SIZE(tcases); i++) {
+				if (tcases[i].flags & SHM_HUGETLB)
+						tcases[i].exp_err = EINVAL;
+		}
+	}
 }
 
 static void cleanup(void)
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
