Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B621349B686
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Jan 2022 15:40:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4EF7F3C93B7
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Jan 2022 15:40:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 842B43C14B2
 for <ltp@lists.linux.it>; Tue, 25 Jan 2022 15:40:50 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E8D8B1A00CAC
 for <ltp@lists.linux.it>; Tue, 25 Jan 2022 15:40:49 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8C656218E5;
 Tue, 25 Jan 2022 14:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1643121649; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2xDemJ9CZSGPTPZfN0LVguT+YmCGN1Njf239yDCSMsE=;
 b=sJzbl3mP3iN4J46uljWwHnSFXOyI3Rwdvk/0NGGln6bgl+Qk91N/pb1joaH8H+Wiz+ELOd
 ULXLZquaU7nQvGz2S5NgUzWoB3/7mwfnMLI9meRY4QIPwidkKflH98pc3xQx5kbNpuTwGz
 8hHsHbHXqEOLrdxyId4cbojJ51SPCQo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1643121649;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2xDemJ9CZSGPTPZfN0LVguT+YmCGN1Njf239yDCSMsE=;
 b=8BMMqCNGK3IEztfOyxgfRrmbgXZJVGEpfVrRU4Yxr+Rc+wOChdK6UsKEpGtIWoK3QUn3an
 mnjexwy7J1muOHAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5851013DEB;
 Tue, 25 Jan 2022 14:40:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GKa/E/EL8GGFdAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 25 Jan 2022 14:40:49 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 25 Jan 2022 15:40:41 +0100
Message-Id: <20220125144043.31798-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125144043.31798-1-pvorel@suse.cz>
References: <20220125144043.31798-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/4] lapi: Move SCHED_DEADLINE definition from tests
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

DRY

SCHED_DEADLINE is currently missing on uclibc-ng (v1.0.40).

+ add indent for definitions (formatting).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
New in v2

 include/lapi/sched.h                                | 13 +++++++++----
 .../kernel/syscalls/sched_getattr/sched_getattr01.c |  1 -
 .../kernel/syscalls/sched_setattr/sched_setattr01.c |  1 -
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/include/lapi/sched.h b/include/lapi/sched.h
index 2fc32a38ca..226d3109a0 100644
--- a/include/lapi/sched.h
+++ b/include/lapi/sched.h
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2015 Cui Bixuan <cuibixuan@huawei.com>
+ * Copyright (c) Linux Test Project, 2016-2022
  */
 
 #ifndef LAPI_SCHED_H__
@@ -41,20 +42,24 @@ static inline int sched_getattr(pid_t pid, struct sched_attr *attr,
 	return syscall(__NR_sched_getattr, pid, attr, size, flags);
 }
 
+#ifndef SCHED_DEADLINE
+# define SCHED_DEADLINE	6
+#endif
+
 #ifndef CLONE_VM
-#define CLONE_VM   0x00000100
+# define CLONE_VM   0x00000100
 #endif
 
 #ifndef CLONE_FS
-#define CLONE_FS   0x00000200
+# define CLONE_FS   0x00000200
 #endif
 
 #ifndef CLONE_SYSVSEM
-#define CLONE_SYSVSEM   0x00040000
+# define CLONE_SYSVSEM   0x00040000
 #endif
 
 #ifndef CLONE_IO
-#define CLONE_IO        0x80000000
+# define CLONE_IO        0x80000000
 #endif
 
 #endif /* LAPI_SCHED_H__ */
diff --git a/testcases/kernel/syscalls/sched_getattr/sched_getattr01.c b/testcases/kernel/syscalls/sched_getattr/sched_getattr01.c
index 0ffbce9c8d..c1715d8acf 100644
--- a/testcases/kernel/syscalls/sched_getattr/sched_getattr01.c
+++ b/testcases/kernel/syscalls/sched_getattr/sched_getattr01.c
@@ -30,7 +30,6 @@
 char *TCID = "sched_getattr01";
 int TST_TOTAL = 1;
 
-#define SCHED_DEADLINE	6
 #define RUNTIME_VAL 10000000
 #define PERIOD_VAL 30000000
 #define DEADLINE_VAL 30000000
diff --git a/testcases/kernel/syscalls/sched_setattr/sched_setattr01.c b/testcases/kernel/syscalls/sched_setattr/sched_setattr01.c
index 82156b95cb..d5178e0169 100644
--- a/testcases/kernel/syscalls/sched_setattr/sched_setattr01.c
+++ b/testcases/kernel/syscalls/sched_setattr/sched_setattr01.c
@@ -36,7 +36,6 @@
 
 char *TCID = "sched_setattr01";
 
-#define SCHED_DEADLINE	6
 #define RUNTIME_VAL 10000000
 #define PERIOD_VAL 30000000
 #define DEADLINE_VAL 30000000
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
