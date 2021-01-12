Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 145C12F2BFF
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 10:58:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BF8DF3C5DD0
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 10:58:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 0C2293C26DE
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 10:58:00 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B3FFD14010E7
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 10:58:00 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2E6C0AC8F
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 09:58:00 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 12 Jan 2021 10:57:58 +0100
Message-Id: <20210112095759.11910-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112095759.11910-1-mdoucha@suse.cz>
References: <20210112095759.11910-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v6 2/3] Add tst_secureboot_enabled() helper function
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

Also check for SecureBoot status in tst_lockdown_enabled() if the lockdown
sysfile is not available/readable and the kernel is configured to enable
lockdown automatically under SecureBoot.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1:
- check whether machine is in EFI mode first

Changes since v2:
- move tst_secureboot_enabled() code to a separate header file
- move EFIVAR_CFLAGS and EFIVAR_LIBS out of global CFLAGS and LDLIBS

Changes since v3:
- rewritten using direct read from /sys/ (without libefivar)

Changes since v5:
- fixed #includes

 include/tst_lockdown.h |  1 +
 lib/tst_lockdown.c     | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/include/tst_lockdown.h b/include/tst_lockdown.h
index 78eaeccea..172a7daf5 100644
--- a/include/tst_lockdown.h
+++ b/include/tst_lockdown.h
@@ -5,6 +5,7 @@
 
 #define PATH_LOCKDOWN	"/sys/kernel/security/lockdown"
 
+int tst_secureboot_enabled(void);
 int tst_lockdown_enabled(void);
 
 #endif /* TST_LOCKDOWN_H */
diff --git a/lib/tst_lockdown.c b/lib/tst_lockdown.c
index e7c19813c..cda7d7abd 100644
--- a/lib/tst_lockdown.c
+++ b/lib/tst_lockdown.c
@@ -10,6 +10,36 @@
 #include "tst_safe_macros.h"
 #include "tst_safe_stdio.h"
 #include "tst_lockdown.h"
+#include "tst_private.h"
+
+#define EFIVAR_SECUREBOOT "/sys/firmware/efi/efivars/SecureBoot-8be4df61-93ca-11d2-aa0d-00e098032b8c"
+
+int tst_secureboot_enabled(void)
+{
+	int fd;
+	char data[5];
+
+	if (access(EFIVAR_SECUREBOOT, F_OK)) {
+		tst_res(TINFO, "Efivar FS not available");
+		return -1;
+	}
+
+	fd = open(EFIVAR_SECUREBOOT, O_RDONLY);
+
+	if (fd == -1) {
+		tst_res(TINFO | TERRNO,
+			"Cannot open SecureBoot Efivar sysfile");
+		return -1;
+	} else if (fd < 0) {
+		tst_brk(TBROK | TERRNO, "Invalid open() return value %d", fd);
+		return -1;
+	}
+
+	SAFE_READ(1, fd, data, 5);
+	SAFE_CLOSE(fd);
+	tst_res(TINFO, "SecureBoot: %s", data[4] ? "on" : "off");
+	return data[4];
+}
 
 int tst_lockdown_enabled(void)
 {
@@ -17,6 +47,14 @@ int tst_lockdown_enabled(void)
 	FILE *file;
 
 	if (access(PATH_LOCKDOWN, F_OK) != 0) {
+		char flag;
+
+		flag = tst_kconfig_get("CONFIG_EFI_SECURE_BOOT_LOCK_DOWN");
+
+		/* SecureBoot enabled could mean integrity lockdown */
+		if (flag == 'y' && tst_secureboot_enabled() > 0)
+			return 1;
+
 		tst_res(TINFO, "Unable to determine system lockdown state");
 		return 0;
 	}
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
