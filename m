Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CA7BF5A9C
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Oct 2025 11:58:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6D57D3CF021
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Oct 2025 11:58:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6AD433CEF9D
 for <ltp@lists.linux.it>; Tue, 21 Oct 2025 11:58:45 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B903D600833
 for <ltp@lists.linux.it>; Tue, 21 Oct 2025 11:58:44 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1C4631F461;
 Tue, 21 Oct 2025 09:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1761040719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=E/wdp5Hh2qxdCrU/kNuzanwP3QNrww1rhYJQTwpfqqI=;
 b=uFdz7R01RiJ8gVdkHhrT9UCIazLe5d73XK73HoHRc7wcvAFzSDbXFMzMy2oetsd6QqSbHx
 /+ZWG35extzpwZDIQJxDHW0XSVHI9k3FT0qaPZztACqKU7FQAxsw51GwMgVRZmPZfHUfB3
 lcXzk4shHAzg0Qq4E7Q/62DO0f54FjQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1761040719;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=E/wdp5Hh2qxdCrU/kNuzanwP3QNrww1rhYJQTwpfqqI=;
 b=FLEwe23LNJ6tjY7CSmCUZMyN+/Zu3XXisTAhPYm2rGU08UvD6VPAibKzG+SIzAtZuh71YB
 Iqv+oJC1YT10qDDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1761040715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=E/wdp5Hh2qxdCrU/kNuzanwP3QNrww1rhYJQTwpfqqI=;
 b=p4MvBp/JUrpvysdvbLPTeVkFx7ONVASQ+pdziKEF8eA8s6xUGN3kHaBltCoslP83tEiKdd
 GGUvVusD35rjl1AmIkkOptf90uKQiFtFybDHMohfZ20+AEJjEokWt6Rz+iWWWMLIrMVoaI
 J87P+zNh41BLF/imxU+yjOEOafqKx3M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1761040715;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=E/wdp5Hh2qxdCrU/kNuzanwP3QNrww1rhYJQTwpfqqI=;
 b=02A0qpEdUpzR1x/DrvyJLPDlKtUeubz/ILq1+PLiFPUizkkQLawSTlvxOLvqgnKTL/IuV7
 GmkwVVSXYujm56AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0E79F139B1;
 Tue, 21 Oct 2025 09:58:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KAAnA0tZ92i8ZQAAD6G6ig
 (envelope-from <jack@suse.cz>); Tue, 21 Oct 2025 09:58:35 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id B9F9DA0990; Tue, 21 Oct 2025 11:58:30 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 21 Oct 2025 11:58:28 +0200
Message-ID: <20251021095828.28779-1-jack@suse.cz>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_COUNT_THREE(0.00)[3]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_TLS_LAST(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[gmail.com,suse.cz];
 RCPT_COUNT_THREE(0.00)[4]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:mid,suse.cz:email];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] name_to_handle_at: Add test cases for AT_HANDLE_FID
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
Cc: Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Add a few testcases verifying AT_HANDLE_FID flag.

Reviewed-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: Jan Kara <jack@suse.cz>
---
 include/lapi/fcntl.h                          |  4 +
 .../name_to_handle_at/name_to_handle_at03.c   | 88 +++++++++++++++++++
 2 files changed, 92 insertions(+)
 create mode 100644 testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at03.c

Changes since v1:
* Added kernel commit fixing the issue
* Fixed up test description

diff --git a/include/lapi/fcntl.h b/include/lapi/fcntl.h
index 7c050248892e..55a5e8b40432 100644
--- a/include/lapi/fcntl.h
+++ b/include/lapi/fcntl.h
@@ -98,6 +98,10 @@
 # define AT_HANDLE_FID		AT_REMOVEDIR
 #endif
 
+#ifndef AT_HANDLE_CONNECTABLE
+# define AT_HANDLE_CONNECTABLE	0x002
+#endif
+
 #ifndef AT_SYMLINK_FOLLOW
 # define AT_SYMLINK_FOLLOW	0x400
 #endif
diff --git a/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at03.c b/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at03.c
new file mode 100644
index 000000000000..d1f53c39d1df
--- /dev/null
+++ b/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at03.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*\
+ * name_to_handle_at() tests for AT_HANDLE_FID handles.
+ */
+
+#define _GNU_SOURCE
+#include <sys/stat.h>
+#include "lapi/name_to_handle_at.h"
+
+#define TEST_FILE "test_file"
+
+static int fd_atcwd = AT_FDCWD;
+static struct file_handle *fhp;
+
+static struct tcase {
+	const char *name;
+	int *dfd;
+	const char *pathname;
+	int name_flags;
+	int exp_errno;
+} tcases[] = {
+	{"test-file", &fd_atcwd, TEST_FILE, AT_HANDLE_FID, 0},
+	{"unexportable-file", &fd_atcwd, "/proc/filesystems", AT_HANDLE_FID, 0},
+	{"test-file-connectable", &fd_atcwd, TEST_FILE, AT_HANDLE_FID | AT_HANDLE_CONNECTABLE, EINVAL},
+};
+
+static bool handle_type_supported(unsigned int flag, const char *name)
+{
+	/*
+	 * For kernels which don't support the flag, name_to_handle_at()
+	 * returns EINVAL, otherwise we should get back EBADF because dirfd is
+	 * invalid.
+	 */
+	if (name_to_handle_at(-1, ".", NULL, NULL, flag) && errno == EINVAL) {
+		tst_brk(TCONF, "%s not supported by the kernel.", name);
+		return false;
+	}
+	return true;
+}
+
+#define REQUIRE_HANDLE_TYPE_SUPPORT(flag) handle_type_supported(flag, #flag)
+
+static void setup(void)
+{
+	SAFE_TOUCH(TEST_FILE, 0600, NULL);
+	fhp = malloc(MAX_HANDLE_SZ);
+	if (!fhp)
+		tst_brk(TBROK, "malloc failed");
+
+	REQUIRE_HANDLE_TYPE_SUPPORT(AT_HANDLE_FID);
+	REQUIRE_HANDLE_TYPE_SUPPORT(AT_HANDLE_CONNECTABLE);
+}
+
+static void run(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+	int mount_id;
+
+	fhp->handle_bytes = MAX_HANDLE_SZ;
+	TEST(name_to_handle_at(*tc->dfd, tc->pathname, fhp, &mount_id,
+			       tc->name_flags));
+	if (!tc->exp_errno) {
+		if (TST_RET)
+			tst_res(TFAIL | TTERRNO, "%s: name_to_handle_at() failed", tc->name);
+		else
+			tst_res(TPASS, "%s: name_to_handle_at() passed", tc->name);
+		return;
+	}
+
+	if (TST_RET != -1)
+		tst_res(TFAIL, "%s: name_to_handle_at() unexpectedly succeeded", tc->name);
+	else if (TST_ERR != tc->exp_errno)
+		tst_res(TFAIL | TTERRNO, "%s: name_to_handle_at() should fail with errno %s",
+			tc->name, tst_strerrno(tc->exp_errno));
+	else
+		tst_res(TPASS, "%s: name_to_handle_at() failed as expected", tc->name);
+}
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = run,
+	.setup = setup,
+	.needs_tmpdir = 1,
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "48b77733d0db"},
+		{}
+	},
+};
-- 
2.51.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
