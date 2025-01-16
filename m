Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC61A1393E
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jan 2025 12:38:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D7473C7C36
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jan 2025 12:38:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CDC193C7BD6
 for <ltp@lists.linux.it>; Thu, 16 Jan 2025 12:36:06 +0100 (CET)
Authentication-Results: in-5.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.223.131; helo=smtp-out2.suse.de;
 envelope-from=andrea.cervesato@suse.de; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4EC746182D6
 for <ltp@lists.linux.it>; Thu, 16 Jan 2025 12:36:06 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DF3A01F79E
 for <ltp@lists.linux.it>; Thu, 16 Jan 2025 11:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737027365; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F+fdXa+1DaPGRHkGI4dHlMdKh9/3Ar7KbOKHWp1CU9o=;
 b=OzS2WceONxJgFvm9P4zZMZjU1afOpt4KqbNn369KQnI9trfuBcMCqEqv+WcsCNG3nGkQQ0
 E+Dhc+WKfkQE48TWBw/xcFlwY9uwOUA+A/ptIUyaT8z4MuG0ZC5GaQiXuw1Pc6RxycC1Jc
 FO7wQXdA0ibzSbd7ra6Ph1XQAV0VTlo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737027365;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F+fdXa+1DaPGRHkGI4dHlMdKh9/3Ar7KbOKHWp1CU9o=;
 b=16QXk8B+kMSjMQnFMd4pjOG2f8i41UfmgTj6rgTRxMhfxtEhApXX8WiC7VaJB3BrvIFptS
 2/J+CYYXdMHdJhDw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OzS2WceO;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=16QXk8B+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737027365; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F+fdXa+1DaPGRHkGI4dHlMdKh9/3Ar7KbOKHWp1CU9o=;
 b=OzS2WceONxJgFvm9P4zZMZjU1afOpt4KqbNn369KQnI9trfuBcMCqEqv+WcsCNG3nGkQQ0
 E+Dhc+WKfkQE48TWBw/xcFlwY9uwOUA+A/ptIUyaT8z4MuG0ZC5GaQiXuw1Pc6RxycC1Jc
 FO7wQXdA0ibzSbd7ra6Ph1XQAV0VTlo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737027365;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F+fdXa+1DaPGRHkGI4dHlMdKh9/3Ar7KbOKHWp1CU9o=;
 b=16QXk8B+kMSjMQnFMd4pjOG2f8i41UfmgTj6rgTRxMhfxtEhApXX8WiC7VaJB3BrvIFptS
 2/J+CYYXdMHdJhDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BAE8113332
 for <ltp@lists.linux.it>; Thu, 16 Jan 2025 11:36:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4EdoKSXviGdrOgAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>)
 for <ltp@lists.linux.it>; Thu, 16 Jan 2025 11:36:05 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Thu, 16 Jan 2025 12:36:11 +0100
MIME-Version: 1.0
Message-Id: <20250116-fix_setsid_tests-v4-12-910f062a7235@suse.com>
References: <20250116-fix_setsid_tests-v4-0-910f062a7235@suse.com>
In-Reply-To: <20250116-fix_setsid_tests-v4-0-910f062a7235@suse.com>
To: ltp@lists.linux.it
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737027362; l=2733;
 i=andrea.cervesato@suse.com; s=20240812; h=from:subject:message-id;
 bh=nYuUiNsABRxYc2hTZLxEZkOtCvPRUaP0Q+PB174jM0M=;
 b=f9bc9jGiwmfK78Ee8E1N6+/J7+y49HYTM2tDkd4EDV0e+epTmZvW5BdbjDq5uHpQDeoH9z0Qr
 FDuZg2NfA99CXNp1jiQGpM5xdBjOt4B9oYYZBQZf5gx6/tZRyPMFSjW
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=RG/nLJ5snb1tLKGwSORQXBJ5XA4juT0WF2Pc/lq9meo=
X-Rspamd-Queue-Id: DF3A01F79E
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_ONE(0.00)[1];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.com:email,suse.com:mid];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 TO_DN_NONE(0.00)[];
 PREVIOUSLY_DELIVERED(0.00)[ltp@lists.linux.it];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v4 12/12] Add pty09 test
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

Verify that slave pseudo-terminal can be opened multiple times
in parallel.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 runtest/pty                     |  1 +
 testcases/kernel/pty/.gitignore |  1 +
 testcases/kernel/pty/pty09.c    | 74 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 76 insertions(+)

diff --git a/runtest/pty b/runtest/pty
index 365a46ee9730aa36b22dbbdbfba82ac0d491ac94..4b1abe7a602a14456877f3bc42f2275a3be0f8f0 100644
--- a/runtest/pty
+++ b/runtest/pty
@@ -7,6 +7,7 @@ pty05 pty05
 pty06 pty06
 pty07 pty07
 pty08 pty08
+pty09 pty09
 ptem01 ptem01
 ptem02 ptem02
 ptem03 ptem03
diff --git a/testcases/kernel/pty/.gitignore b/testcases/kernel/pty/.gitignore
index 7d8d4dceda84f2e2695a8bee39abfe894288b8b6..2d0c8bb6ff7d6883abfc7838e257b9be50244b69 100644
--- a/testcases/kernel/pty/.gitignore
+++ b/testcases/kernel/pty/.gitignore
@@ -13,3 +13,4 @@
 /pty06
 /pty07
 /pty08
+/pty09
diff --git a/testcases/kernel/pty/pty09.c b/testcases/kernel/pty/pty09.c
new file mode 100644
index 0000000000000000000000000000000000000000..1e477869b0d5be3958a0a4bff24f96220753d513
--- /dev/null
+++ b/testcases/kernel/pty/pty09.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) International Business Machines  Corp., 2002
+ * Copyright (C) 2024 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Verify that slave pseudo-terminal can be opened multiple times in parallel.
+ */
+
+#define _GNU_SOURCE
+
+#include "common.h"
+
+static int masterfd = -1;
+
+static unsigned int count_avail_pid(void)
+{
+	DIR *dir;
+	struct dirent *ent;
+	struct rlimit limit;
+	unsigned int count = 0;
+	unsigned int max_pid_num;
+
+	SAFE_GETRLIMIT(RLIMIT_NOFILE, &limit);
+
+	dir = SAFE_OPENDIR("/proc/self/fd");
+	while ((ent = SAFE_READDIR(dir)))
+		count++;
+
+	SAFE_CLOSEDIR(dir);
+
+	max_pid_num = limit.rlim_cur - count;
+
+	tst_res(TINFO, "Available number of pids: %u", max_pid_num);
+
+	return max_pid_num;
+}
+
+static void run(void)
+{
+	unsigned int max_pid_num;
+
+	max_pid_num = count_avail_pid();
+
+	int slavefd[max_pid_num];
+
+	for (uint32_t i = 0; i < max_pid_num; i++)
+		slavefd[i] = open_slave(masterfd);
+
+	tst_res(TPASS, "pty has been opened %d times", max_pid_num);
+
+	for (uint32_t i = 0; i < max_pid_num; i++)
+		SAFE_CLOSE(slavefd[i]);
+}
+
+static void setup(void)
+{
+	masterfd = open_master();
+}
+
+static void cleanup(void)
+{
+	if (masterfd != -1)
+		SAFE_CLOSE(masterfd);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+};

-- 
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
