Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D542F4CC156
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Mar 2022 16:31:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 608963CA36A
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Mar 2022 16:31:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1506B3CA325
 for <ltp@lists.linux.it>; Thu,  3 Mar 2022 16:31:33 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4AAEB600D6E
 for <ltp@lists.linux.it>; Thu,  3 Mar 2022 16:31:32 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 818F921997;
 Thu,  3 Mar 2022 15:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1646321492; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Olysg4LLh+JPxOZRThS2pArG7cxqrlGwDHfhTKd4L0=;
 b=qhykwcbcSghRlRS3YqFh4RLFuq1wBzks3Ygcro1A5dmxqDZO6h1EGQqSecbbYRSs3UVCXm
 Wu/OrF9ViQL9IFLtrpsDq3sgwWRtqgKfcS6CdlcCSQ1YtR0RREBIdfeoVbfIMSOy0lY3iV
 pPKa8QKGnzwxtSwFdCbGT/dKwqDcJQc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1646321492;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Olysg4LLh+JPxOZRThS2pArG7cxqrlGwDHfhTKd4L0=;
 b=4HnNIJXhsHQn+qm4j+SOcbtolLNy0E8EkVXUaU5yZnYaRxCiBA3tq0wOKkyCcUK123Foi4
 u+0INuuYqftUrfAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6AF6813C23;
 Thu,  3 Mar 2022 15:31:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2DMXGVTfIGJtFwAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Thu, 03 Mar 2022 15:31:32 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: Yang Xu <xuyang2018.jy@fujitsu.com>,
	ltp@lists.linux.it
Date: Thu,  3 Mar 2022 16:31:30 +0100
Message-Id: <20220303153131.3372-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303153131.3372-1-mdoucha@suse.cz>
References: <20220303153131.3372-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] quotactl06: Code style fixes
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
 .../kernel/syscalls/quotactl/quotactl06.c     | 49 +++++++++++--------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/testcases/kernel/syscalls/quotactl/quotactl06.c b/testcases/kernel/syscalls/quotactl/quotactl06.c
index ca81a742f..8e9a17393 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl06.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl06.c
@@ -12,22 +12,23 @@
  *
  * - EACCES when cmd is Q_QUOTAON and addr existed but not a regular file
  * - ENOENT when the file specified by special or addr does not exist
- * - EBUSY when cmd is Q_QUOTAON and another Q_QUOTAON had already been performed
+ * - EBUSY when cmd is Q_QUOTAON and another Q_QUOTAON had already been
+ *   performed
  * - EFAULT when addr or special is invalid
  * - EINVAL when cmd or type is invalid
  * - ENOTBLK when special is not a block device
- * - ESRCH when no disk quota is found for the indicated user and quotas have not been
- *   turned on for this fs
+ * - ESRCH when no disk quota is found for the indicated user and quotas have
+ *   not been turned on for this fs
  * - ESRCH when cmd is Q_QUOTAON, but the quota format was not found
- * - ESRCH when cmd is Q_GETNEXTQUOTA, but there is no ID greater than or equal to id that
- *   has an active quota
- * - ERANGE when cmd is Q_SETQUOTA, but the specified limits are out of the range allowed
- *   by the quota format
- * - EPERM when the caller lacked the required privilege (CAP_SYS_ADMIN) for the specified
- *   operation
+ * - ESRCH when cmd is Q_GETNEXTQUOTA, but there is no ID greater than or
+ *   equal to id that has an active quota
+ * - ERANGE when cmd is Q_SETQUOTA, but the specified limits are out of the
+ *   range allowed by the quota format
+ * - EPERM when the caller lacked the required privilege (CAP_SYS_ADMIN) for
+ *   the specified operation
  *
- * For ERANGE error, the vfsv0 and vfsv1 format's maximum quota limit setting have been
- * fixed since the following kernel patch:
+ * For ERANGE error, the vfsv0 and vfsv1 format's maximum quota limit setting
+ * have been fixed since the following kernel patch:
  *
  *  commit 7e08da50cf706151f324349f9235ebd311226997
  *  Author: Jan Kara <jack@suse.cz>
@@ -135,10 +136,13 @@ static void verify_quotactl(unsigned int n)
 	}
 
 	if (tc->on_flag) {
-		TST_EXP_PASS_SILENT(quotactl(QCMD(Q_QUOTAON, USRQUOTA), tst_device->dev,
-					fmt_id, usrpath), "quotactl with Q_QUOTAON");
+		TST_EXP_PASS_SILENT(quotactl(QCMD(Q_QUOTAON, USRQUOTA),
+			tst_device->dev, fmt_id, usrpath),
+			"quotactl with Q_QUOTAON");
+
 		if (!TST_PASS)
 			return;
+
 		quota_on = 1;
 	}
 
@@ -147,16 +151,19 @@ static void verify_quotactl(unsigned int n)
 		drop_flag = 1;
 	}
 
-	if (tc->exp_err == ENOTBLK)
+	if (tc->exp_err == ENOTBLK) {
 		TST_EXP_FAIL(quotactl(tc->cmd, "/dev/null", *tc->id, tc->addr),
 			ENOTBLK, "quotactl()");
-	else
-		TST_EXP_FAIL(quotactl(tc->cmd, tst_device->dev, *tc->id, tc->addr),
-			tc->exp_err, "quotactl()");
+	} else {
+		TST_EXP_FAIL(quotactl(tc->cmd, tst_device->dev, *tc->id,
+			tc->addr), tc->exp_err, "quotactl()");
+	}
 
 	if (quota_on) {
-		TST_EXP_PASS_SILENT(quotactl(QCMD(Q_QUOTAOFF, USRQUOTA), tst_device->dev,
-					fmt_id, usrpath), "quotactl with Q_QUOTAOFF");
+		TST_EXP_PASS_SILENT(quotactl(QCMD(Q_QUOTAOFF, USRQUOTA),
+			tst_device->dev, fmt_id, usrpath),
+			"quotactl with Q_QUOTAOFF");
+
 		if (!TST_PASS)
 			return;
 	}
@@ -169,7 +176,9 @@ static void setup(void)
 {
 	unsigned int i;
 	const struct quotactl_fmt_variant *var = &fmt_variants[tst_variant];
-	const char *const cmd[] = {"quotacheck", "-ugF", var->fmt_name, MNTPOINT, NULL};
+	const char *const cmd[] = {
+		"quotacheck", "-ugF", var->fmt_name, MNTPOINT, NULL
+	};
 
 	tst_res(TINFO, "quotactl() with %s format", var->fmt_name);
 	SAFE_CMD(cmd, NULL, NULL);
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
