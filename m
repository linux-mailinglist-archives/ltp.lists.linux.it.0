Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A7A9ECBEA
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Dec 2024 13:22:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD69E3E88FE
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Dec 2024 13:22:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7A1073E88F9
 for <ltp@lists.linux.it>; Wed, 11 Dec 2024 13:20:29 +0100 (CET)
Authentication-Results: in-7.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=andrea.cervesato@suse.de; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E57E022C66C
 for <ltp@lists.linux.it>; Wed, 11 Dec 2024 13:20:28 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E28AA21167
 for <ltp@lists.linux.it>; Wed, 11 Dec 2024 12:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1733919626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wbv00uj46cDuZN3bxZNd+1UIWWv5gqsQGH3VhLGi5BM=;
 b=jyQbE1a2iLcLLh8lZlPSuu4WnGPaci2ScdBCF0nN8x1mDKmNMG44b7dqWd/t9KpiGGhILo
 f/HRDfz3VcYQtw1nvqCaUcFjwhk34fFYEv4crwTT9mZtYL9bpK1F28sVcN0w0Mkk27RIPC
 vg4iYnrcps9hS/raM0NYKlfYsW8ZjCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1733919626;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wbv00uj46cDuZN3bxZNd+1UIWWv5gqsQGH3VhLGi5BM=;
 b=Q3XHumApvQk3V1eAzDWsnh9eCaPCsYuRYSKLxnvIjagkb2mQLMTynzSiCbrWtNAlIPyBxy
 Tvq/UX88el9aTABQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1733919626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wbv00uj46cDuZN3bxZNd+1UIWWv5gqsQGH3VhLGi5BM=;
 b=jyQbE1a2iLcLLh8lZlPSuu4WnGPaci2ScdBCF0nN8x1mDKmNMG44b7dqWd/t9KpiGGhILo
 f/HRDfz3VcYQtw1nvqCaUcFjwhk34fFYEv4crwTT9mZtYL9bpK1F28sVcN0w0Mkk27RIPC
 vg4iYnrcps9hS/raM0NYKlfYsW8ZjCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1733919626;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wbv00uj46cDuZN3bxZNd+1UIWWv5gqsQGH3VhLGi5BM=;
 b=Q3XHumApvQk3V1eAzDWsnh9eCaPCsYuRYSKLxnvIjagkb2mQLMTynzSiCbrWtNAlIPyBxy
 Tvq/UX88el9aTABQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D558A13AD6
 for <ltp@lists.linux.it>; Wed, 11 Dec 2024 12:20:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wJ7MM4qDWWdNAwAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>)
 for <ltp@lists.linux.it>; Wed, 11 Dec 2024 12:20:26 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Wed, 11 Dec 2024 13:20:29 +0100
MIME-Version: 1.0
Message-Id: <20241211-fix_setsid_tests-v1-6-e103f36c6462@suse.com>
References: <20241211-fix_setsid_tests-v1-0-e103f36c6462@suse.com>
In-Reply-To: <20241211-fix_setsid_tests-v1-0-e103f36c6462@suse.com>
To: ltp@lists.linux.it
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733919626; l=2717;
 i=andrea.cervesato@suse.com; s=20240812; h=from:subject:message-id;
 bh=CB13XYLcRBgnTP3VlgnXhv8rIMjbiaMSedbJExjbazQ=;
 b=h0xm/bpGp2/Mtlp96AgWHe+X2ZcR3fw/LskyGFoniTuYiR1Kme7XEAv2ukAf0PWsRbv/v5yH/
 V5MD/XcPrqWDxUnazyRVujCsdcBuxdJyX4aktON4Y3/bG0WO9DcqRbv
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=RG/nLJ5snb1tLKGwSORQXBJ5XA4juT0WF2Pc/lq9meo=
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; RCPT_COUNT_ONE(0.00)[1];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 PREVIOUSLY_DELIVERED(0.00)[ltp@lists.linux.it];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TO_DN_NONE(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid]
X-Spam-Score: -4.30
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 06/10] Add ptem05 test
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

From: Andrea Cervesato <andrea.cervesato@suse.com>

Verify that it's possible to open a pseudo-terminal via /dev/ptmx, to
obtain a master + slave pair and to open them multiple times.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 runtest/pty                     |  1 +
 testcases/kernel/pty/.gitignore |  1 +
 testcases/kernel/pty/ptem05.c   | 58 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+)

diff --git a/runtest/pty b/runtest/pty
index 63d927eca07aa3dbd312d5c5cc6b6681dbf3627d..deb04c3f5725647a32f457eaed638eb7071ab4db 100644
--- a/runtest/pty
+++ b/runtest/pty
@@ -10,5 +10,6 @@ ptem01 ptem01
 ptem02 ptem02
 ptem03 ptem03
 ptem04 ptem04
+ptem05 ptem05
 hangup01 hangup01
 
diff --git a/testcases/kernel/pty/.gitignore b/testcases/kernel/pty/.gitignore
index c9bb33664f9de55038f4638406841f403f1a86c4..ef5751907cad087f5e33132b52a374b52ee7905a 100644
--- a/testcases/kernel/pty/.gitignore
+++ b/testcases/kernel/pty/.gitignore
@@ -3,6 +3,7 @@
 /ptem02
 /ptem03
 /ptem04
+/ptem05
 /pty01
 /pty02
 /pty03
diff --git a/testcases/kernel/pty/ptem05.c b/testcases/kernel/pty/ptem05.c
new file mode 100644
index 0000000000000000000000000000000000000000..10ffc24e2e22cfd4651362b519f3d494d79f3374
--- /dev/null
+++ b/testcases/kernel/pty/ptem05.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) International Business Machines  Corp., 2002
+ * Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
+ * Copyright (C) 2024 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Verify that it's possible to open a pseudo-terminal via /dev/ptmx, to obtain
+ * a master + slave pair and to open them multiple times.
+ */
+
+#define _GNU_SOURCE
+
+#include "tst_test.h"
+
+#define MASTERCLONE "/dev/ptmx"
+#define NUM_OPENS 10
+
+static void run(void)
+{
+	int masterfd[NUM_OPENS];
+	int slavefd[NUM_OPENS];
+	char *slavename;
+
+	for (int i = 0; i < NUM_OPENS; i++) {
+		masterfd[i] = SAFE_OPEN(MASTERCLONE, O_RDWR);
+
+		slavename = ptsname(masterfd[i]);
+		if (slavename == NULL)
+			tst_res(TFAIL, "Can't get slave device location");
+		else
+			tst_res(TPASS, "pts device location is %s", slavename);
+
+		TST_EXP_PASS(grantpt(masterfd[i]));
+		TST_EXP_PASS(unlockpt(masterfd[i]));
+
+		slavefd[i] = TST_EXP_FD(open(slavename, O_RDWR));
+	}
+
+	for (int i = 0; i < NUM_OPENS; i++) {
+		SAFE_CLOSE(masterfd[i]);
+		SAFE_CLOSE(slavefd[i]);
+	}
+}
+
+static void setup(void)
+{
+	if (access(MASTERCLONE, F_OK))
+		tst_brk(TBROK, "%s device doesn't exist", MASTERCLONE);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+};

-- 
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
