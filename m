Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BF53D5CDF
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 17:23:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 12B613C9241
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jul 2021 17:23:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DC5643C6733
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 17:23:17 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 721D81400E4A
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 17:23:17 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C9AB11FEA9
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 15:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627312996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kzfIDsyEYbbByMG2EN14QYObK4uVTYCQhlYCLGVfkAE=;
 b=TZUeJRC1q04TVAtepZF/HjBg1/Ha5h3b8+ZoHW87rbuGjgsTVKhk+YUe70nynbo+eBsaos
 iwXFzzpHWQ+cVr67KpRQy4DUkcp/BZmcpWCf45amTaOrjkiFtnK+D2XSkix2gskcA0AbVV
 vEwrZIPkr++dABrc2AarE5KhQ7BCHnI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627312996;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=kzfIDsyEYbbByMG2EN14QYObK4uVTYCQhlYCLGVfkAE=;
 b=ecX19tIzedncl1CnznqhKk22AlUY1DdIC3HAqMzSjldyAp57GZuqb47NVdCe9TAgnCbw5g
 STpEZer5Y6I63xBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B2E5D13AA2
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 15:23:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Y3kwKmTT/mDwYwAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Mon, 26 Jul 2021 15:23:16 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 26 Jul 2021 17:22:54 +0200
Message-Id: <20210726152255.16868-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] Add tst_hexdump utility
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

tst_hexdump implements conversion between binary and hexadecimal values in both
directions for shell tests.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1: Added tst_hexdump to .gitignore

 testcases/lib/.gitignore    |  1 +
 testcases/lib/Makefile      |  2 +-
 testcases/lib/tst_hexdump.c | 55 +++++++++++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 testcases/lib/tst_hexdump.c

diff --git a/testcases/lib/.gitignore b/testcases/lib/.gitignore
index bc299b6ee..a2e9f1ef0 100644
--- a/testcases/lib/.gitignore
+++ b/testcases/lib/.gitignore
@@ -12,3 +12,4 @@
 /tst_rod
 /tst_sleep
 /tst_supported_fs
+/tst_hexdump
diff --git a/testcases/lib/Makefile b/testcases/lib/Makefile
index 98d9e4613..38813e640 100644
--- a/testcases/lib/Makefile
+++ b/testcases/lib/Makefile
@@ -11,6 +11,6 @@ INSTALL_TARGETS		:= *.sh
 MAKE_TARGETS		:= tst_sleep tst_random tst_checkpoint tst_rod tst_kvcmp\
 			   tst_device tst_net_iface_prefix tst_net_ip_prefix tst_net_vars\
 			   tst_getconf tst_supported_fs tst_check_drivers tst_get_unused_port\
-			   tst_get_median
+			   tst_get_median tst_hexdump
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/lib/tst_hexdump.c b/testcases/lib/tst_hexdump.c
new file mode 100644
index 000000000..f83b8bfbf
--- /dev/null
+++ b/testcases/lib/tst_hexdump.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 SUSE LLC <mdoucha@suse.cz>
+ *
+ * Convert bytes from standard input to hexadecimal representation.
+ *
+ * Parameters:
+ * -d   Convert hexadecimal values from standard input to binary representation
+ *      instead.
+ */
+
+#include <stdio.h>
+#include <unistd.h>
+
+int decode_hex(void)
+{
+	int ret;
+	unsigned int val;
+
+	while ((ret = scanf("%2x", &val)) == 1)
+		putchar(val);
+
+	return ret != EOF || ferror(stdin);
+}
+
+int encode_hex(void)
+{
+	int val;
+
+	for (val = getchar(); val >= 0 && val <= 0xff; val = getchar())
+		printf("%02x", val);
+
+	return val != EOF || ferror(stdin);
+}
+
+int main(int argc, char **argv)
+{
+	int ret, decode = 0;
+
+	while ((ret = getopt(argc, argv, "d"))) {
+		if (ret < 0)
+			break;
+
+		switch (ret) {
+		case 'd':
+			decode = 1;
+			break;
+		}
+	}
+
+	if (decode)
+		return decode_hex();
+	else
+		return encode_hex();
+}
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
