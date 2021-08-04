Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCB33DFE24
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 11:39:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 00F1F3C800B
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 11:39:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0D3693C7FEB
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 11:39:28 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8320F6007A0
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 11:39:27 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id CECBA221DD;
 Wed,  4 Aug 2021 09:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1628069966; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+scE0bXcTtfEfsi03YEWx1vpp+S84rbMTZ820vTZqGE=;
 b=ryOaAtn78eAKG5SqsskjEe8IvEGOXwQvOfbewANGoSYW7bd3cEEPZOcqLv2ViUibmES/AA
 gvJO54oebL/VvSPasgh+lYtOdleijMJYiZYBgd9g2tOgRIWi4Qtkjk7FWt6kHaVgO1Gr3E
 xLmgfSVW82Y0+QgFAPyhWHHvZN9ar58=
Received: from localhost.de (unknown [10.163.30.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id A6D58A3B84;
 Wed,  4 Aug 2021 09:39:26 +0000 (UTC)
To: ltp@lists.linux.it
Date: Wed,  4 Aug 2021 12:39:18 +0300
Message-Id: <20210804093918.1087-1-bogdan.lezhepekov@suse.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3] shmget02: check if CONFIG_HUGETLBFS enabled in
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
 
+static int hugetlbfs_supported(void)
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
+	if (!hugetlbfs_supported()) {
+
+		tst_res(TINFO, "SHM_HUGETLB not supported by kernel");
+
+		for (int i = 0; i < ARRAY_SIZE(tcases); i++) {
+			if (tcases[i].flags & SHM_HUGETLB)
+				tcases[i].exp_err = EINVAL;
+		}
+	}
 }
 
 static void cleanup(void)
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
