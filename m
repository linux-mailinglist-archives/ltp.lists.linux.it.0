Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E477FD612
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Nov 2023 12:55:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A772D3CD957
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Nov 2023 12:55:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 199D73CD94C
 for <ltp@lists.linux.it>; Wed, 29 Nov 2023 12:54:46 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 407891A0088E
 for <ltp@lists.linux.it>; Wed, 29 Nov 2023 12:54:45 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 17C4421AB1;
 Wed, 29 Nov 2023 11:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1701258885; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KQCPYC0DLty35Ef/jM3mJcQkhBlNhHZmeanm7/EehH0=;
 b=l3OEzzJV0CAzbkGMg2XUtIN4VbZ2ZruT0Z1N+CRsiheF3CL6HvY/tOFXgv4boMYsTPU0q1
 tMG94HGtIo7Lg6C300qh2E9GAjdHcsznkcrrLCTToygQhY7fXpbh/s9NgFqTiKUTr+s8GI
 klUVisvi4fpVefmaB1DHm7chwlcdTsI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1701258885;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KQCPYC0DLty35Ef/jM3mJcQkhBlNhHZmeanm7/EehH0=;
 b=gfrbi9HWW5E3nyEriCHLevF3GIJ31N6V2ailZZVuW4e3kQ3Qg40Zn8qjEDsxNhH+VyxIAn
 uvO3V7S02F3v0vCA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 0630F13B48;
 Wed, 29 Nov 2023 11:54:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 1eF9AYUmZ2VVfwAAn2gu4w
 (envelope-from <jack@suse.cz>); Wed, 29 Nov 2023 11:54:45 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id A69FFA07E5; Wed, 29 Nov 2023 12:54:40 +0100 (CET)
From: Jan Kara <jack@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 29 Nov 2023 12:54:31 +0100
Message-Id: <20231129115440.19100-3-jack@suse.cz>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231129114617.12660-1-jack@suse.cz>
References: <20231129114617.12660-1-jack@suse.cz>
MIME-Version: 1.0
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; REPLY(-4.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 RCVD_COUNT_THREE(0.00)[3]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; FREEMAIL_CC(0.00)[gmail.com,suse.cz];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: -3.30
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 3/6] fanotify: Switch event and mark tests to
 *_on_fs() variant
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

Switch event availability and mark type availability tests to be
performed on the filesystem actually used for testing instead of on the
current directory. This is more reliable as not all filesystems support
the same set of features.

Signed-off-by: Jan Kara <jack@suse.cz>
---
 testcases/kernel/syscalls/fanotify/fanotify.h   |  2 +-
 testcases/kernel/syscalls/fanotify/fanotify01.c |  2 +-
 testcases/kernel/syscalls/fanotify/fanotify03.c |  7 ++++---
 testcases/kernel/syscalls/fanotify/fanotify09.c |  3 ++-
 testcases/kernel/syscalls/fanotify/fanotify10.c | 13 ++++++++-----
 testcases/kernel/syscalls/fanotify/fanotify11.c |  2 +-
 testcases/kernel/syscalls/fanotify/fanotify12.c |  5 ++---
 testcases/kernel/syscalls/fanotify/fanotify13.c |  3 ++-
 testcases/kernel/syscalls/fanotify/fanotify14.c |  3 ++-
 testcases/kernel/syscalls/fanotify/fanotify16.c |  3 ++-
 10 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
index f28da1a5ee55..31afc29c8cb6 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify.h
+++ b/testcases/kernel/syscalls/fanotify/fanotify.h
@@ -352,7 +352,7 @@ static inline int fanotify_handle_supported_by_kernel(int flag)
 	if (init_flags)							\
 		REQUIRE_FANOTIFY_INIT_FLAGS_SUPPORTED_ON_FS(init_flags, fname); \
 	fanotify_flags_err_msg(#mask, __FILE__, __LINE__, tst_brk_, \
-		fanotify_events_supported_by_kernel(mask, init_flags, mark_type)); \
+		fanotify_flags_supported_on_fs(init_flags, mark_type, mask, fname)); \
 } while (0)
 
 static inline struct fanotify_event_info_header *get_event_info(
diff --git a/testcases/kernel/syscalls/fanotify/fanotify01.c b/testcases/kernel/syscalls/fanotify/fanotify01.c
index 3538335c9ab0..5ce1dc76ac8c 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify01.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify01.c
@@ -341,7 +341,7 @@ static void setup(void)
 	SAFE_FILE_PRINTF(fname, "1");
 
 	fan_report_fid_unsupported = fanotify_init_flags_supported_on_fs(FAN_REPORT_FID, fname);
-	filesystem_mark_unsupported = fanotify_mark_supported_by_kernel(FAN_MARK_FILESYSTEM);
+	filesystem_mark_unsupported = fanotify_mark_supported_on_fs(FAN_MARK_FILESYSTEM, fname);
 }
 
 static void cleanup(void)
diff --git a/testcases/kernel/syscalls/fanotify/fanotify03.c b/testcases/kernel/syscalls/fanotify/fanotify03.c
index 0bd61587a9eb..343ba857e1ae 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify03.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify03.c
@@ -322,12 +322,13 @@ static void setup(void)
 {
 	require_fanotify_access_permissions_supported_by_kernel();
 
-	filesystem_mark_unsupported = fanotify_mark_supported_by_kernel(FAN_MARK_FILESYSTEM);
-	exec_events_unsupported = fanotify_events_supported_by_kernel(FAN_OPEN_EXEC_PERM,
-								      FAN_CLASS_CONTENT, 0);
 	sprintf(fname, MOUNT_PATH"/fname_%d", getpid());
 	SAFE_FILE_PRINTF(fname, "1");
 
+	filesystem_mark_unsupported = fanotify_mark_supported_on_fs(FAN_MARK_FILESYSTEM, fname);
+	exec_events_unsupported = fanotify_flags_supported_on_fs(FAN_CLASS_CONTENT,
+					0, FAN_OPEN_EXEC_PERM, fname);
+
 	SAFE_CP(TEST_APP, FILE_EXEC_PATH);
 }
 
diff --git a/testcases/kernel/syscalls/fanotify/fanotify09.c b/testcases/kernel/syscalls/fanotify/fanotify09.c
index 3f2db47093c8..6bb1b9e7036f 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify09.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify09.c
@@ -482,7 +482,8 @@ static void setup(void)
 {
 	fan_report_dfid_unsupported = fanotify_init_flags_supported_on_fs(FAN_REPORT_DFID_NAME,
 									  MOUNT_PATH);
-	ignore_mark_unsupported = fanotify_mark_supported_by_kernel(FAN_MARK_IGNORE_SURV);
+	ignore_mark_unsupported = fanotify_mark_supported_on_fs(FAN_MARK_IGNORE_SURV,
+								MOUNT_PATH);
 
 	SAFE_MKDIR(MOUNT_NAME, 0755);
 	SAFE_MOUNT(MOUNT_PATH, MOUNT_NAME, "none", MS_BIND, NULL);
diff --git a/testcases/kernel/syscalls/fanotify/fanotify10.c b/testcases/kernel/syscalls/fanotify/fanotify10.c
index d0e9194e7a58..f30eba9ecbfb 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify10.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify10.c
@@ -874,11 +874,14 @@ static void setup(void)
 {
 	int i;
 
-	exec_events_unsupported = fanotify_events_supported_by_kernel(FAN_OPEN_EXEC,
-								      FAN_CLASS_CONTENT, 0);
-	filesystem_mark_unsupported = fanotify_mark_supported_by_kernel(FAN_MARK_FILESYSTEM);
-	evictable_mark_unsupported = fanotify_mark_supported_by_kernel(FAN_MARK_EVICTABLE);
-	ignore_mark_unsupported = fanotify_mark_supported_by_kernel(FAN_MARK_IGNORE_SURV);
+	exec_events_unsupported = fanotify_flags_supported_on_fs(FAN_CLASS_CONTENT,
+					0, FAN_OPEN_EXEC, MOUNT_PATH);
+	filesystem_mark_unsupported = fanotify_mark_supported_on_fs(FAN_MARK_FILESYSTEM,
+								    MOUNT_PATH);
+	evictable_mark_unsupported = fanotify_mark_supported_on_fs(FAN_MARK_EVICTABLE,
+								   MOUNT_PATH);
+	ignore_mark_unsupported = fanotify_mark_supported_on_fs(FAN_MARK_IGNORE_SURV,
+								MOUNT_PATH);
 	fan_report_dfid_unsupported = fanotify_init_flags_supported_on_fs(FAN_REPORT_DFID_NAME,
 									  MOUNT_PATH);
 	if (fan_report_dfid_unsupported) {
diff --git a/testcases/kernel/syscalls/fanotify/fanotify11.c b/testcases/kernel/syscalls/fanotify/fanotify11.c
index 03583d84be9b..ce46913b179e 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify11.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify11.c
@@ -94,7 +94,7 @@ static void test01(unsigned int i)
 
 static void setup(void)
 {
-	fan_report_tid_unsupported = fanotify_init_flags_supported_by_kernel(FAN_REPORT_TID);
+	fan_report_tid_unsupported = fanotify_init_flags_supported_on_fs(FAN_REPORT_TID, ".");
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/syscalls/fanotify/fanotify12.c b/testcases/kernel/syscalls/fanotify/fanotify12.c
index 7f8e97b178bc..42ba08800ccf 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify12.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify12.c
@@ -222,11 +222,10 @@ cleanup:
 
 static void do_setup(void)
 {
-	exec_events_unsupported = fanotify_events_supported_by_kernel(FAN_OPEN_EXEC,
-								      FAN_CLASS_NOTIF, 0);
-
 	sprintf(fname, "fname_%d", getpid());
 	SAFE_FILE_PRINTF(fname, "1");
+	exec_events_unsupported = fanotify_flags_supported_on_fs(FAN_CLASS_NOTIF,
+					0, FAN_OPEN_EXEC, fname);
 }
 
 static void do_cleanup(void)
diff --git a/testcases/kernel/syscalls/fanotify/fanotify13.c b/testcases/kernel/syscalls/fanotify/fanotify13.c
index 421a3636f834..fdde3b10d1dd 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify13.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify13.c
@@ -325,7 +325,8 @@ static void do_setup(void)
 	SAFE_MOUNT(mnt, MOUNT_PATH, "none", MS_BIND, NULL);
 	bind_mounted = 1;
 
-	filesystem_mark_unsupported = fanotify_mark_supported_by_kernel(FAN_MARK_FILESYSTEM);
+	filesystem_mark_unsupported = fanotify_mark_supported_on_fs(FAN_MARK_FILESYSTEM,
+								    MOUNT_PATH);
 
 	nofid_fd = SAFE_FANOTIFY_INIT(FAN_CLASS_NOTIF, O_RDONLY);
 
diff --git a/testcases/kernel/syscalls/fanotify/fanotify14.c b/testcases/kernel/syscalls/fanotify/fanotify14.c
index 0bb78918824b..0e24e0335ae3 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify14.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify14.c
@@ -325,7 +325,8 @@ static void do_setup(void)
 	supported_init_flags = fanotify_get_supported_init_flags(all_init_flags,
 		MNTPOINT);
 
-	ignore_mark_unsupported = fanotify_mark_supported_by_kernel(FAN_MARK_IGNORE_SURV);
+	ignore_mark_unsupported = fanotify_mark_supported_on_fs(FAN_MARK_IGNORE_SURV,
+								MNTPOINT);
 
 	/* Create temporary test file to place marks on */
 	SAFE_FILE_PRINTF(FILE1, "0");
diff --git a/testcases/kernel/syscalls/fanotify/fanotify16.c b/testcases/kernel/syscalls/fanotify/fanotify16.c
index d45270a9a06e..dfa4edf0319e 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify16.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify16.c
@@ -766,7 +766,8 @@ static void setup(void)
 	fan_report_target_fid_unsupported =
 		fanotify_init_flags_supported_on_fs(FAN_REPORT_DFID_NAME_TARGET, MOUNT_PATH);
 	rename_events_unsupported =
-		fanotify_events_supported_by_kernel(FAN_RENAME, FAN_REPORT_DFID_NAME, 0);
+		fanotify_flags_supported_on_fs(FAN_REPORT_DFID_NAME, 0,
+					       FAN_RENAME, MOUNT_PATH);
 
 	SAFE_MKDIR(TEMP_DIR, 0755);
 	sprintf(dname1, "%s/%s", MOUNT_PATH, DIR_NAME1);
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
