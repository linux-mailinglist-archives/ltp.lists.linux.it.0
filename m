Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF235B1B998
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Aug 2025 19:47:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 918DE3C6878
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Aug 2025 19:47:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8554E3C6911
 for <ltp@lists.linux.it>; Tue,  5 Aug 2025 19:45:10 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0EB561000967
 for <ltp@lists.linux.it>; Tue,  5 Aug 2025 19:45:09 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D7DC92120D;
 Tue,  5 Aug 2025 17:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1754415884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MuiA835ekybN4JCSknagdBRblz0Jga9yloA/lzFEeNU=;
 b=nM+AB8Un/O9IwnF9qzZ2R+DNMoohP3Eotu96WUmFHbGQQzJLN43sc+FCqKcxYgmdwui03i
 CHi8iHl4PjFhhK/2FbwS4oERcncDOvP9hrX3WgHivhFBuygqE1r8Ji0zXMOJkyxQ27IB7J
 WaEO6k5oFnDqR0JYsaM54BvoDTqrfSc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1754415884;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MuiA835ekybN4JCSknagdBRblz0Jga9yloA/lzFEeNU=;
 b=tqEvNOFs08aer53XrXudcWBXHnVFkkZGlCagAr56LGY9ajNNIY3WqIs31+6wT8CRXC1IJo
 gJvSwJm199q1PPBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1754415884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MuiA835ekybN4JCSknagdBRblz0Jga9yloA/lzFEeNU=;
 b=nM+AB8Un/O9IwnF9qzZ2R+DNMoohP3Eotu96WUmFHbGQQzJLN43sc+FCqKcxYgmdwui03i
 CHi8iHl4PjFhhK/2FbwS4oERcncDOvP9hrX3WgHivhFBuygqE1r8Ji0zXMOJkyxQ27IB7J
 WaEO6k5oFnDqR0JYsaM54BvoDTqrfSc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1754415884;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MuiA835ekybN4JCSknagdBRblz0Jga9yloA/lzFEeNU=;
 b=tqEvNOFs08aer53XrXudcWBXHnVFkkZGlCagAr56LGY9ajNNIY3WqIs31+6wT8CRXC1IJo
 gJvSwJm199q1PPBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A545813AA8;
 Tue,  5 Aug 2025 17:44:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gN+TJQxDkmhaFQAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Tue, 05 Aug 2025 17:44:44 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Tue, 05 Aug 2025 19:44:46 +0200
MIME-Version: 1.0
Message-Id: <20250805-file_setattr_getattr-v5-7-2bc4d18e0033@suse.com>
References: <20250805-file_setattr_getattr-v5-0-2bc4d18e0033@suse.com>
In-Reply-To: <20250805-file_setattr_getattr-v5-0-2bc4d18e0033@suse.com>
To: ltp@lists.linux.it
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754415882; l=2920;
 i=andrea.cervesato@suse.com; s=20240812; h=from:subject:message-id;
 bh=9uxkPN/XjDRmtImjczWYWDIvnEjVdLznTdvtp4oy2Wc=;
 b=lXPeopYZCsQUfl5B/Wqc+O/3/1Kz+tC7nv0f8hGFyFCXSYP1rHu5FZY3fHdG9v+4lRu5xLCI9
 SIABFJXzOY4Bu8HoJp5O96y3Ifl6XxXFZNKM9Ix7L8dtfNRuE1Dn/eN
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=RG/nLJ5snb1tLKGwSORQXBJ5XA4juT0WF2Pc/lq9meo=
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.998]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCPT_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.com:mid,
 suse.com:email]
X-Spam-Level: 
X-Spam-Score: -4.30
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v5 7/7] Add file_attr04 test
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

Verify that `file_getattr` and `file_setattr` are correctly raising
an error when the wrong file descriptors types are passed to them.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 runtest/syscalls                                  |  1 +
 testcases/kernel/syscalls/file_attr/.gitignore    |  1 +
 testcases/kernel/syscalls/file_attr/file_attr04.c | 62 +++++++++++++++++++++++
 3 files changed, 64 insertions(+)

diff --git a/runtest/syscalls b/runtest/syscalls
index c33987328d3d6ec96660260aaee4f9ca8c4f0aee..c9b46b8efe3217150ee0740e982ea5a133b3aa46 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -249,6 +249,7 @@ fsetxattr02 fsetxattr02
 file_attr01 file_attr01
 file_attr02 file_attr02
 file_attr03 file_attr03
+file_attr04 file_attr04
 
 #posix_fadvise test cases
 posix_fadvise01                      posix_fadvise01
diff --git a/testcases/kernel/syscalls/file_attr/.gitignore b/testcases/kernel/syscalls/file_attr/.gitignore
index b79a340b733f7407dc135c5c3b0a9cd0e003e6c9..3fcb9004dd301ef4ee8cc1067c6a3763acb8d299 100644
--- a/testcases/kernel/syscalls/file_attr/.gitignore
+++ b/testcases/kernel/syscalls/file_attr/.gitignore
@@ -1,3 +1,4 @@
 file_attr01
 file_attr02
 file_attr03
+file_attr04
diff --git a/testcases/kernel/syscalls/file_attr/file_attr04.c b/testcases/kernel/syscalls/file_attr/file_attr04.c
new file mode 100644
index 0000000000000000000000000000000000000000..364fad08e339e713d590b166136dc1c506daac0d
--- /dev/null
+++ b/testcases/kernel/syscalls/file_attr/file_attr04.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2025 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * Verify that `file_getattr` and `file_setattr` are correctly raising an error
+ * when the wrong file descriptors types are passed to them.
+ */
+
+#include "tst_test.h"
+#include "lapi/fs.h"
+
+#define FILENAME "ltp_file"
+
+static struct file_attr *attr;
+
+static void test_invalid_fd(struct tst_fd *fd)
+{
+	if (fd->type == TST_FD_DIR || fd->type == TST_FD_OPEN_TREE) {
+		tst_res(TCONF, "Skipping DIR fd");
+		return;
+	}
+
+	memset(attr, 0, sizeof(*attr));
+
+	if (tst_variant) {
+		TST_EXP_FAIL(file_getattr(
+			fd->fd, FILENAME,
+			attr, FILE_ATTR_SIZE_LATEST,
+			0), ENOTDIR);
+	} else {
+		TST_EXP_FAIL(file_setattr(
+			fd->fd, FILENAME,
+			attr, FILE_ATTR_SIZE_LATEST,
+			0), ENOTDIR);
+	}
+}
+
+static void run(void)
+{
+	TST_FD_FOREACH(fd) {
+		tst_res(TINFO, "%s -> ...", tst_fd_desc(&fd));
+		test_invalid_fd(&fd);
+	}
+}
+
+static void setup(void)
+{
+	SAFE_TOUCH(FILENAME, 0640, NULL);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.test_variants = 2,
+	.needs_tmpdir = 1,
+	.bufs = (struct tst_buffers []) {
+		{&attr, .size = sizeof(struct file_attr)},
+		{}
+	}
+};

-- 
2.50.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
