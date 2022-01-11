Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FD748AB7D
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jan 2022 11:34:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 539713C93DC
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jan 2022 11:34:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 343203C93B7
 for <ltp@lists.linux.it>; Tue, 11 Jan 2022 11:34:56 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 58AC11A014F8
 for <ltp@lists.linux.it>; Tue, 11 Jan 2022 11:34:54 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9477B1F3B6
 for <ltp@lists.linux.it>; Tue, 11 Jan 2022 10:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1641897293; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZP2YcFIpYPnIDBKJd0z2qopo2aCroGJ4NhDGqg1WRN4=;
 b=16oX3WFXvZNeifCwd/o1lh8vLIYkjBqYUBw/A8u1hU7g4tUZxBUa3OmQ7xvW5NkSesM16m
 Ex/KzlJTwjksQqWrKe+TX0X3cEf2mnpc72GRS7pQLAjZ64N1qXBem65BbSRsgfuNfSnqq9
 n1s9lWG5YlykUr68bf2KfB+m5zDEjM4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1641897293;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZP2YcFIpYPnIDBKJd0z2qopo2aCroGJ4NhDGqg1WRN4=;
 b=9XLfYY2yK90SDYfFHHWd2MecTB5Ikrtw7MBt2zlIofChvxGTEas9o32BE72ZhA1uWxTdDm
 yMc4PfKqTjJqSLAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8150E13638
 for <ltp@lists.linux.it>; Tue, 11 Jan 2022 10:34:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +xZPHk1d3WEjYQAAMHmgww
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Tue, 11 Jan 2022 10:34:53 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 11 Jan 2022 11:36:28 +0100
Message-Id: <20220111103628.9055-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] chdir01: Fix on more restrictive umask
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

Fixes the test on more restrictive umask, this was found on FIPS but
it's not limited to the FIPS system at all. All that is needed to
reproduce the problem is to set umask to 077 before the test is
executed.

The troublemaker here is the FAT filesystem since there are no access
bits defined in FAT disk format and they are emulated completely by the
kernel. This means that all files on FAT filesytem have access bits
generated by the kernel accordingly to system umask at the time the
filesystem was mounted. This means that in order to be able to access
the files on FAT we have to set the umask(0) before we mount the
filesystem.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/chdir/chdir01.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/chdir/chdir01.c b/testcases/kernel/syscalls/chdir/chdir01.c
index aa25adf6a..c7902376d 100644
--- a/testcases/kernel/syscalls/chdir/chdir01.c
+++ b/testcases/kernel/syscalls/chdir/chdir01.c
@@ -50,16 +50,18 @@ static void setup(void)
 	int fd;
 	struct stat statbuf;
 
+	umask(0);
+
+	SAFE_MOUNT(tst_device->dev, MNTPOINT, tst_device->fs_type, 0, NULL);
+
 	cwd = SAFE_GETCWD(NULL, 0);
 	workdir = SAFE_MALLOC(strlen(cwd) + strlen(MNTPOINT) + 2);
 	sprintf(workdir, "%s/%s", cwd, MNTPOINT);
 	free(cwd);
 	SAFE_CHDIR(workdir);
 
-	mode_t sys_umask = umask(0);
 	SAFE_MKDIR(DIR_NAME, 0755);
 	SAFE_MKDIR(BLOCKED_NAME, 0644);
-	umask(sys_umask);
 
 	/* FAT and NTFS override file and directory permissions */
 	SAFE_STAT(BLOCKED_NAME, &statbuf);
@@ -132,12 +134,14 @@ static void run(unsigned int n)
 
 static void cleanup(void)
 {
+	SAFE_CHDIR("..");
+	tst_umount(workdir);
 	free(workdir);
 }
 
 static struct tst_test test = {
 	.needs_root = 1,
-	.mount_device = 1,
+	.format_device = 1,
 	.mntpoint = MNTPOINT,
 	.all_filesystems = 1,
 	.test = run,
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
