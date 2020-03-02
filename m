Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5BF175C90
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2020 15:08:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1D8FA3C6809
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2020 15:08:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 56E183C67F0
 for <ltp@lists.linux.it>; Mon,  2 Mar 2020 15:08:16 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2EDF2600066
 for <ltp@lists.linux.it>; Mon,  2 Mar 2020 15:08:15 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 801F6B2F1
 for <ltp@lists.linux.it>; Mon,  2 Mar 2020 14:08:15 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  2 Mar 2020 15:08:15 +0100
Message-Id: <20200302140815.21440-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] Add test for CVE 2018-1000204
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
Patch resolves GH issue #334.

 runtest/cve                                  |   1 +
 testcases/kernel/syscalls/ioctl/ioctl_sg01.c | 133 +++++++++++++++++++
 2 files changed, 134 insertions(+)
 create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_sg01.c

diff --git a/runtest/cve b/runtest/cve
index 57cf66075..e522b8096 100644
--- a/runtest/cve
+++ b/runtest/cve
@@ -39,4 +39,5 @@ cve-2017-18075 pcrypt_aead01
 cve-2017-1000380 snd_timer01
 cve-2018-5803 sctp_big_chunk
 cve-2018-1000001 realpath01
+cve-2018-1000204 ioctl_sg01
 cve-2018-19854 crypto_user01
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_sg01.c b/testcases/kernel/syscalls/ioctl/ioctl_sg01.c
new file mode 100644
index 000000000..c3947afbc
--- /dev/null
+++ b/testcases/kernel/syscalls/ioctl/ioctl_sg01.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 SUSE LLC <mdoucha@suse.cz>
+ */
+
+/*
+ * CVE-2018-1000204
+ *
+ * Test ioctl(SG_IO) and check that kernel doesn't leak data. Requires
+ * a read-accessible SCSI-compatible device (e.g. SATA disk). Running mem01
+ * test program before this one may increase the chance of successfully
+ * reproducing the bug.
+ *
+ * Leak fixed in:
+ *
+ *  commit a45b599ad808c3c982fdcdc12b0b8611c2f92824
+ *  Author: Alexander Potapenko <glider@google.com>
+ *  Date:   Fri May 18 16:23:18 2018 +0200
+ *
+ *  scsi: sg: allocate with __GFP_ZERO in sg_build_indirect()
+ */
+
+#include <sys/types.h>
+#include <dirent.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <ctype.h>
+#include <scsi/sg.h>
+#include <sys/ioctl.h>
+#include "tst_test.h"
+
+#define BUF_SIZE 128 * 4096
+#define CMD_SIZE 6
+
+static int devfd = -1;
+static char buffer[BUF_SIZE];
+static unsigned char command[CMD_SIZE];
+static struct sg_io_hdr query;
+
+/* TODO: split this off to a separate SCSI library? */
+static const char *find_generic_scsi_device(int access_flags)
+{
+	DIR *devdir;
+	struct dirent *ent;
+	char *filename;
+	size_t path_len;
+	int tmpfd;
+	static char devpath[PATH_MAX];
+
+	errno = 0;
+	strcpy(devpath, "/dev/");
+	devdir = opendir(devpath);
+	path_len = strlen(devpath);
+	filename = devpath + path_len;
+
+	if (!devdir) {
+		return NULL;
+	}
+
+	while ((ent = SAFE_READDIR(devdir))) {
+		/* The bug is most likely reproducible only on /dev/sg* */
+		if (strncmp(ent->d_name, "sg", 2) || !isdigit(ent->d_name[2]))
+			continue;
+
+		strncpy(filename, ent->d_name, PATH_MAX - path_len - 1);
+		/* access() makes incorrect assumptions about block devices */
+		tmpfd = open(devpath, access_flags);
+
+		if (tmpfd >= 0) {
+			SAFE_CLOSE(tmpfd);
+			SAFE_CLOSEDIR(devdir);
+			return devpath;
+		}
+	}
+
+	SAFE_CLOSEDIR(devdir);
+	return NULL;
+}
+
+static void setup(void)
+{
+	const char *devpath = find_generic_scsi_device(O_RDONLY);
+
+	if (!devpath)
+		tst_brk(TCONF, "Could not find any usable SCSI device");
+
+	tst_res(TINFO, "Found SCSI device %s", devpath);
+	devfd = SAFE_OPEN(devpath, O_RDONLY);
+	query.interface_id = 'S';
+	query.dxfer_direction = SG_DXFER_FROM_DEV;
+	query.cmd_len = CMD_SIZE;
+	query.dxfer_len = BUF_SIZE;
+	query.dxferp = buffer;
+	query.cmdp = command;
+}
+
+static void cleanup(void)
+{
+	if (devfd >= 0)
+		SAFE_CLOSE(devfd);
+}
+
+static void run(void)
+{
+	size_t i;
+
+	memset(buffer, 0, BUF_SIZE);
+	TEST(ioctl(devfd, SG_IO, &query));
+
+	if (TST_RET != 0 && TST_RET != -1)
+		tst_brk(TBROK | TTERRNO, "Invalid ioctl() return value");
+
+	/* Check the output buffer even if ioctl() failed, just in case. */
+	for (i = 0; i < BUF_SIZE; i++) {
+		if (buffer[i]) {
+			tst_res(TFAIL, "Kernel memory leaked");
+			return;
+		}
+	}
+
+	tst_res(TPASS, "Output buffer is empty, no data leaked");
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "e093c4be760e"},
+		{"CVE", "2018-1000204"},
+		{}
+	}
+};
-- 
2.25.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
