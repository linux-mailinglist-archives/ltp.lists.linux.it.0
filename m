Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E099A72E87
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Mar 2025 12:09:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F37CE3C9E46
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Mar 2025 12:09:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5B6063C9E46
 for <ltp@lists.linux.it>; Thu, 27 Mar 2025 12:08:16 +0100 (CET)
Authentication-Results: in-2.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=andrea.cervesato@suse.de; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B01BB600658
 for <ltp@lists.linux.it>; Thu, 27 Mar 2025 12:08:15 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1044621192;
 Thu, 27 Mar 2025 11:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743073681; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lh6GOs+9+0G93acsMEW8EuqsOMGd2RmMbzBBLLx5TxA=;
 b=bfZ5W/LvSQGB5FnwbmjI8JR9IGagES5BSNVfKbm7IIxRX6PUFQ0lZ+IaE4EFQ7oO/a3lW/
 f1icaWNTEVaPBEOoAeauo5AlJ7L2aLERlg5e8LIjWHHKR/Xox7endiTlZwxB/lF2IvlU+7
 fPMl7ctdkAjzu7hSOlgSILi47J3oka8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743073681;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lh6GOs+9+0G93acsMEW8EuqsOMGd2RmMbzBBLLx5TxA=;
 b=oSmAr6PpU/WodaQQb1h7JLkv99shemTZFUMARTfkO+FIvMJ1HJo3gtsENBOxLQhVMjICiP
 /EPeq9Kh1nUH2MBw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="bfZ5W/Lv";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=oSmAr6Pp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743073681; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lh6GOs+9+0G93acsMEW8EuqsOMGd2RmMbzBBLLx5TxA=;
 b=bfZ5W/LvSQGB5FnwbmjI8JR9IGagES5BSNVfKbm7IIxRX6PUFQ0lZ+IaE4EFQ7oO/a3lW/
 f1icaWNTEVaPBEOoAeauo5AlJ7L2aLERlg5e8LIjWHHKR/Xox7endiTlZwxB/lF2IvlU+7
 fPMl7ctdkAjzu7hSOlgSILi47J3oka8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743073681;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lh6GOs+9+0G93acsMEW8EuqsOMGd2RmMbzBBLLx5TxA=;
 b=oSmAr6PpU/WodaQQb1h7JLkv99shemTZFUMARTfkO+FIvMJ1HJo3gtsENBOxLQhVMjICiP
 /EPeq9Kh1nUH2MBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E972F1376E;
 Thu, 27 Mar 2025 11:08:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KJ5XN5Ax5WfnIQAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Thu, 27 Mar 2025 11:08:00 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Thu, 27 Mar 2025 12:08:01 +0100
MIME-Version: 1.0
Message-Id: <20250327-landlock_unix_socket-v1-4-584653f66d9c@suse.com>
References: <20250327-landlock_unix_socket-v1-0-584653f66d9c@suse.com>
In-Reply-To: <20250327-landlock_unix_socket-v1-0-584653f66d9c@suse.com>
To: ltp@lists.linux.it
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743073680; l=3708;
 i=andrea.cervesato@suse.com; s=20240812; h=from:subject:message-id;
 bh=n9jJvwiGxoHFl8cbtyRqHJtjculPgmO0+1BVgOinolQ=;
 b=CitDcKGlIekicwzs7+5nFi499AkejGgEkHzii1GD9NSV8nKzo33b8/HBTZB86OUVzECo3gULm
 KAevU5QpggzCkoYfTaCi5+62FNttG4HB3g4frkW/js0WsQ6fCc6bjBy
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=RG/nLJ5snb1tLKGwSORQXBJ5XA4juT0WF2Pc/lq9meo=
X-Rspamd-Queue-Id: 1044621192
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.com:email,suse.com:mid];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 4/4] landlock: add landlock10 test
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

Verify that landlock's LANDLOCK_SCOPE_SIGNAL rule rejects any
signal coming from a process on a different domain, but accept
signals from processes in the same domain.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 testcases/kernel/syscalls/landlock/.gitignore   |   1 +
 testcases/kernel/syscalls/landlock/landlock10.c | 110 ++++++++++++++++++++++++
 2 files changed, 111 insertions(+)

diff --git a/testcases/kernel/syscalls/landlock/.gitignore b/testcases/kernel/syscalls/landlock/.gitignore
index cda8d871e051ec88abba4634a2bcda4b10470d9f..8c88803df4580605da800c414ada62994b35d268 100644
--- a/testcases/kernel/syscalls/landlock/.gitignore
+++ b/testcases/kernel/syscalls/landlock/.gitignore
@@ -8,3 +8,4 @@ landlock06
 landlock07
 landlock08
 landlock09
+landlock10
diff --git a/testcases/kernel/syscalls/landlock/landlock10.c b/testcases/kernel/syscalls/landlock/landlock10.c
new file mode 100644
index 0000000000000000000000000000000000000000..572c3dfe35810e2da301aae4b9807bcc55682f91
--- /dev/null
+++ b/testcases/kernel/syscalls/landlock/landlock10.c
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2025 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * Verify that landlock's LANDLOCK_SCOPE_SIGNAL rule rejects any signal coming
+ * from a process on a different domain, but accept signals from processes in
+ * the same domain.
+ */
+
+#include "tst_test.h"
+#include "landlock_common.h"
+
+static struct tst_landlock_ruleset_attr_abi6 *ruleset_attr;
+
+enum {
+	DOMAIN_PAUSED = 0,
+	DOMAIN_KILLER,
+	DOMAIN_BOTH,
+	DOMAIN_LENGTH,
+};
+
+static void scoped_sandbox(const char *from)
+{
+	tst_res(TINFO, "Enforcing rule LANDLOCK_SCOPE_SIGNAL for %s process", from);
+
+	ruleset_attr->scoped = LANDLOCK_SCOPE_SIGNAL;
+	apply_landlock_scoped_layer(ruleset_attr, sizeof(*ruleset_attr));
+}
+
+static void run(void)
+{
+	/* isolate test inside a process so we won't stack too many
+	 * layers (-E2BIG) when there are multiple test's iterations
+	 */
+	if (SAFE_FORK())
+		return;
+
+	if (tst_variant == DOMAIN_BOTH)
+		scoped_sandbox("paused and killer");
+
+	pid_t paused_pid;
+	pid_t killer_pid;
+
+	paused_pid = SAFE_FORK();
+	if (!paused_pid) {
+		if (tst_variant == DOMAIN_PAUSED)
+			scoped_sandbox("paused");
+
+		TST_CHECKPOINT_WAKE(0);
+		pause();
+		exit(0);
+	}
+
+	TST_CHECKPOINT_WAIT(0);
+	TST_PROCESS_STATE_WAIT(paused_pid, 'S', 10000);
+
+	killer_pid = SAFE_FORK();
+	if (!killer_pid) {
+		if (tst_variant == DOMAIN_KILLER)
+			scoped_sandbox("killer");
+
+		TST_CHECKPOINT_WAKE(0);
+
+		if (tst_variant == DOMAIN_KILLER)
+			TST_EXP_FAIL(kill(paused_pid, SIGKILL), EPERM);
+		else
+			TST_EXP_PASS(kill(paused_pid, SIGKILL));
+
+		exit(0);
+	}
+
+	TST_CHECKPOINT_WAIT(0);
+	SAFE_WAITPID(killer_pid, NULL, 0);
+
+	if (kill(paused_pid, SIGKILL) == -1) {
+		if (errno != ESRCH)
+			tst_brk(TBROK | TERRNO, "kill(%u, SIGKILL) error", paused_pid);
+	}
+
+	SAFE_WAITPID(paused_pid, NULL, 0);
+}
+
+static void setup(void)
+{
+	int abi;
+
+	abi = verify_landlock_is_enabled();
+	if (abi < 6)
+		tst_brk(TCONF, "LANDLOCK_SCOPE_SIGNAL is unsupported on ABI < 6");
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.needs_root = 1,
+	.forks_child = 1,
+	.needs_tmpdir = 1,
+	.needs_checkpoints = 1,
+	.test_variants = DOMAIN_LENGTH,
+	.bufs = (struct tst_buffers []) {
+		{&ruleset_attr, .size = sizeof(struct tst_landlock_ruleset_attr_abi6)},
+		{},
+	},
+	.caps = (struct tst_cap []) {
+		TST_CAP(TST_CAP_REQ, CAP_SYS_ADMIN),
+		{}
+	},
+};

-- 
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
