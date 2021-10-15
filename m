Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3B842EC72
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Oct 2021 10:35:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BDB1C3C14F2
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Oct 2021 10:35:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 36E7B3C1423
 for <ltp@lists.linux.it>; Fri, 15 Oct 2021 10:35:17 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3E0F910000E1
 for <ltp@lists.linux.it>; Fri, 15 Oct 2021 10:35:15 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7FEAF1F770;
 Fri, 15 Oct 2021 08:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1634286915; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pH//08JVIEQaPdznocqxN2zrs2A4CrwmWar8aPZ0uG8=;
 b=EhQ1d2xgQbM2/3Ulu89mOHX0TDT1NPIxSe5b5npG4BDKvVRzzEzjtEmnMF6ycOkGIk+h76
 Rnl39eA/Zne21xzECjaTxd0RRM8KaWv8sZV+kvg3EpE9u7enanuKYYScqvL8KeHTNF4Pwp
 JFDKctHTnhtUDN/UFObaX9AHAy0nMVs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1634286915;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pH//08JVIEQaPdznocqxN2zrs2A4CrwmWar8aPZ0uG8=;
 b=Cw5ZKiJd876gw6LjSqZOCnuWNunToQfK9Dy2a2LYVgOuHDD/2dwoFh34qbogF4LvSU4ZSc
 undnkmHuWilWypDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4E64E13B87;
 Fri, 15 Oct 2021 08:35:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id U4sZEUM9aWHjFAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 15 Oct 2021 08:35:15 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 15 Oct 2021 10:35:09 +0200
Message-Id: <20211015083509.4449-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/1] creat09: Run on all_filesystems
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

To make sure bug on XFS is detected on systems which use it.

Due setgid is test problematic on Microsoft filesystems:

creat09.c:81: TBROK: ntfs: Setgid bit not set
creat09.c:76: TBROK: chown(exfat,65533,4) failed: EPERM (1)
creat09.c:76: TBROK: chown(vfat,65533,4) failed: EPERM (1)

thus they're disabled.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
changes v2->v3:
* add missing dir separator /
* remove unused SAFE_CHDIR() (reported by Martin, was needed due missing /)
* remove unused <stdio.h> (reported by Martin)

 testcases/kernel/syscalls/creat/creat09.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/creat/creat09.c b/testcases/kernel/syscalls/creat/creat09.c
index 681b80c7d..1cf6d3db0 100644
--- a/testcases/kernel/syscalls/creat/creat09.c
+++ b/testcases/kernel/syscalls/creat/creat09.c
@@ -39,7 +39,8 @@
 #define MODE_RWX        0777
 #define MODE_SGID       (S_ISGID|0777)
 
-#define WORKDIR		"testdir"
+#define MNTPOINT	"mntpoint"
+#define WORKDIR		MNTPOINT "/testdir"
 #define CREAT_FILE	WORKDIR "/creat.tmp"
 #define OPEN_FILE	WORKDIR "/open.tmp"
 
@@ -119,6 +120,15 @@ static struct tst_test test = {
 	.cleanup = cleanup,
 	.needs_root = 1,
 	.needs_tmpdir = 1,
+	.all_filesystems = 1,
+	.mount_device = 1,
+	.mntpoint = MNTPOINT,
+	.skip_filesystems = (const char*[]) {
+		"exfat",
+		"ntfs",
+		"vfat",
+		NULL
+	},
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "0fa3ecd87848"},
 		{"CVE", "2018-13405"},
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
