Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9B8AD1E04
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Jun 2025 14:45:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7D2343CACD2
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Jun 2025 14:45:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9D4D03CA503
 for <ltp@lists.linux.it>; Mon,  9 Jun 2025 14:45:21 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id DB1151A008A3
 for <ltp@lists.linux.it>; Mon,  9 Jun 2025 14:45:19 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 91EF72118E;
 Mon,  9 Jun 2025 12:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1749473118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ppD6qVBY+W2hPszZHLjEEHycRJQ/Q5VRCoLKbC0RYJU=;
 b=Ftgs0KWGK5qERkmM7XFB+oi1JoRtoZp6fQgxntxLvQbTA3SQZ9xllTxW0UioHn4DJjxHXQ
 QgbaoYaA7IBonu36ZgIByFqdQQkEVNtahKzsUpTNCiRtIgXZvHOr0YQREoqtvx6xDqjKMH
 GpErcoUBspKOaYxdWDFh0F+IOtwXwok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1749473118;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ppD6qVBY+W2hPszZHLjEEHycRJQ/Q5VRCoLKbC0RYJU=;
 b=6D8Ln7Z74QSNrEayXnh/1vfWd/Pc0LiCrjhZmwlT9VKpRW25+P0buieGPzj7dy5N8OOnKt
 t9M7BBiWidBWsECw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1749473118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ppD6qVBY+W2hPszZHLjEEHycRJQ/Q5VRCoLKbC0RYJU=;
 b=Ftgs0KWGK5qERkmM7XFB+oi1JoRtoZp6fQgxntxLvQbTA3SQZ9xllTxW0UioHn4DJjxHXQ
 QgbaoYaA7IBonu36ZgIByFqdQQkEVNtahKzsUpTNCiRtIgXZvHOr0YQREoqtvx6xDqjKMH
 GpErcoUBspKOaYxdWDFh0F+IOtwXwok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1749473118;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ppD6qVBY+W2hPszZHLjEEHycRJQ/Q5VRCoLKbC0RYJU=;
 b=6D8Ln7Z74QSNrEayXnh/1vfWd/Pc0LiCrjhZmwlT9VKpRW25+P0buieGPzj7dy5N8OOnKt
 t9M7BBiWidBWsECw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6DB0013AAD;
 Mon,  9 Jun 2025 12:45:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YKnXGV7XRmiQUgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Mon, 09 Jun 2025 12:45:18 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  9 Jun 2025 14:45:05 +0200
Message-ID: <20250609124506.1454420-5-pvorel@suse.cz>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609124506.1454420-1-pvorel@suse.cz>
References: <20250609124506.1454420-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:email,imap1.dmz-prg2.suse.org:helo];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v3 4/4] shell: Add shell_loader_setup_cleanup.sh test
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

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
The same as in v2.

 testcases/lib/run_tests.sh                    |  1 +
 .../lib/tests/shell_loader_setup_cleanup.sh   | 31 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100755 testcases/lib/tests/shell_loader_setup_cleanup.sh

diff --git a/testcases/lib/run_tests.sh b/testcases/lib/run_tests.sh
index 128cee3377..5c309bbeb5 100755
--- a/testcases/lib/run_tests.sh
+++ b/testcases/lib/run_tests.sh
@@ -10,6 +10,7 @@ shell_loader_kconfigs.sh
 shell_loader_supported_archs.sh
 shell_loader_tcnt.sh
 shell_loader_cleanup.sh
+shell_loader_setup_cleanup.sh
 shell_test01
 shell_test02
 shell_test03
diff --git a/testcases/lib/tests/shell_loader_setup_cleanup.sh b/testcases/lib/tests/shell_loader_setup_cleanup.sh
new file mode 100755
index 0000000000..8184278313
--- /dev/null
+++ b/testcases/lib/tests/shell_loader_setup_cleanup.sh
@@ -0,0 +1,31 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2025 Petr Vorel <pvorel@suse.cz>
+#
+# ---
+# env
+# {
+# }
+# ---
+
+TST_SETUP=setup
+TST_CLEANUP=cleanup
+
+. tst_loader.sh
+
+setup()
+{
+	tst_res TINFO "setup executed"
+}
+
+cleanup()
+{
+	tst_res TINFO "Cleanup executed"
+}
+
+tst_test()
+{
+	tst_res TPASS "Test is executed"
+}
+
+. tst_run.sh
-- 
2.49.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
