Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CC690B63F
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2024 18:23:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 61F5F3D0D5F
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2024 18:23:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9A7773CB74E
 for <ltp@lists.linux.it>; Mon, 17 Jun 2024 18:23:06 +0200 (CEST)
Authentication-Results: in-5.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=jack@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CED23600CE9
 for <ltp@lists.linux.it>; Mon, 17 Jun 2024 18:23:05 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 56A9838429;
 Mon, 17 Jun 2024 16:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1718641384; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1anhizFEnvyM/S85aKmx5I6FDHIEr1cY/Q+pEqXx8Bo=;
 b=1RJioJ/J7YsgfAZx9t+wg8UFkA3PqYXaqhV07puw7bkSGxpYUsbYeyaWHA0wJcRG0lCs1g
 8xCTIjjYuA0sYDAjguY/mRCtD6MyuRkw+ZwZpy4lw/o0/DlK/nYNJ3QN8ENu74fP+NFjJ1
 8x1bBfNCR3kg+GSsA+um2FWKf+8nHJk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1718641384;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1anhizFEnvyM/S85aKmx5I6FDHIEr1cY/Q+pEqXx8Bo=;
 b=Dyq75lOMIeXfejQX0teG93F89TH2ZhnpyBXwT2WJ3cwbhEUMQLRbWfxDwN2IhGOFa/v9OF
 7VI31rK9t6EA3QBA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b="1RJioJ/J";
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=Dyq75lOM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1718641384; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1anhizFEnvyM/S85aKmx5I6FDHIEr1cY/Q+pEqXx8Bo=;
 b=1RJioJ/J7YsgfAZx9t+wg8UFkA3PqYXaqhV07puw7bkSGxpYUsbYeyaWHA0wJcRG0lCs1g
 8xCTIjjYuA0sYDAjguY/mRCtD6MyuRkw+ZwZpy4lw/o0/DlK/nYNJ3QN8ENu74fP+NFjJ1
 8x1bBfNCR3kg+GSsA+um2FWKf+8nHJk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1718641384;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1anhizFEnvyM/S85aKmx5I6FDHIEr1cY/Q+pEqXx8Bo=;
 b=Dyq75lOMIeXfejQX0teG93F89TH2ZhnpyBXwT2WJ3cwbhEUMQLRbWfxDwN2IhGOFa/v9OF
 7VI31rK9t6EA3QBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4753E13AC0;
 Mon, 17 Jun 2024 16:23:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KgtoEehicGaqfAAAD6G6ig
 (envelope-from <jack@suse.cz>); Mon, 17 Jun 2024 16:23:04 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id E4509A088B; Mon, 17 Jun 2024 18:23:03 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: Christian Brauner <brauner@kernel.org>
Date: Mon, 17 Jun 2024 18:23:01 +0200
Message-Id: <20240617162303.1596-2-jack@suse.cz>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240617161828.6718-1-jack@suse.cz>
References: <20240617161828.6718-1-jack@suse.cz>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4588; i=jack@suse.cz;
 h=from:subject; bh=GxaNhBeRx5idz+8KjyGD8k7UN3frer7HIzF6ygSJENc=;
 b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBmcGLl+xkvGqyWDDbo2jaWDcPMgSI4sb1VM8pKQw30
 hRt4G/yJATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCZnBi5QAKCRCcnaoHP2RA2blTCA
 CULkkAkvozmszKYw1LzcnRzTR4OuCIlByiyGcE+mQBtp6L86ZvjE2QjoR9AGlWZxHFmegw9jzJ0tuB
 S9vfvYQWart7nojoVFP6UZXb4WT4qNxBP1H2+ItqHQJ5vYyGCBeRPb2K+VSstHhwpQKtYdkDa+zjz1
 aNNVNJnkrHqUK6eLyJ98Y+Jgbp9TnRWgaKC8+I493cRed4u4oq5i/nmDWzZK7JxpuTws4JZuDnUtbP
 a4iM9RAyyByNQ8jowBNsL841qwuyQfNl/0JmMYqU8/5TB9mW3GEwCONdf7yWFNacf25wluuBlpAM9G
 GmBIu8mMHs1gOOHzo9AjAA3Oq0nw0T
X-Developer-Key: i=jack@suse.cz; a=openpgp;
 fpr=93C6099A142276A28BBE35D815BC833443038D8C
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[9]; RCVD_COUNT_THREE(0.00)[3];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,arm.com,suse.de,ZenIV.linux.org.uk,lists.linux.it,suse.cz];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_TLS_LAST(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 56A9838429
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 2/2] vfs: generate FS_CREATE before FS_OPEN when
 ->atomic_open used.
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
Cc: linux-nfs@vger.kernel.org, Jan Kara <jack@suse.cz>,
 NeilBrown <neilb@suse.de>, linux-fsdevel@vger.kernel.org, ltp@lists.linux.it,
 Al Viro <viro@ZenIV.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: NeilBrown <neilb@suse.de>

When a file is opened and created with open(..., O_CREAT) we get
both the CREATE and OPEN fsnotify events and would expect them in that
order.   For most filesystems we get them in that order because
open_last_lookups() calls fsnofify_create() and then do_open() (from
path_openat()) calls vfs_open()->do_dentry_open() which calls
fsnotify_open().

However when ->atomic_open is used, the
   do_dentry_open() -> fsnotify_open()
call happens from finish_open() which is called from the ->atomic_open
handler in lookup_open() which is called *before* open_last_lookups()
calls fsnotify_create.  So we get the "open" notification before
"create" - which is backwards.  ltp testcase inotify02 tests this and
reports the inconsistency.

This patch lifts the fsnotify_open() call out of do_dentry_open() and
places it higher up the call stack.  There are three callers of
do_dentry_open().

For vfs_open() and kernel_file_open() the fsnotify_open() is placed
directly in that caller so there should be no behavioural change.

For finish_open() there are two cases:
 - finish_open is used in ->atomic_open handlers.  For these we add a
   call to fsnotify_open() at open_last_lookups() if FMODE_OPENED is
   set - which means do_dentry_open() has been called.
 - finish_open is used in ->tmpfile() handlers.  For these a similar
   call to fsnotify_open() is added to vfs_tmpfile()

With this patch NFSv3 is restored to its previous behaviour (before
->atomic_open support was added) of generating CREATE notifications
before OPEN, and NFSv4 now has that same correct ordering that is has
not had before.  I haven't tested other filesystems.

Fixes: 7c6c5249f061 ("NFS: add atomic_open for NFSv3 to handle O_TRUNC correctly.")
Reported-by: James Clark <james.clark@arm.com>
Closes: https://lore.kernel.org/all/01c3bf2e-eb1f-4b7f-a54f-d2a05dd3d8c8@arm.com
Signed-off-by: NeilBrown <neilb@suse.de>
Link: https://lore.kernel.org/r/171817619547.14261.975798725161704336@noble.neil.brown.name
Fixes: 7b8c9d7bb457 ("fsnotify: move fsnotify_open() hook into do_dentry_open()")
Tested-by: James Clark <james.clark@arm.com>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/namei.c | 10 ++++++++--
 fs/open.c  | 22 +++++++++++++++-------
 2 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index 37fb0a8aa09a..1e05a0f3f04d 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -3572,8 +3572,12 @@ static const char *open_last_lookups(struct nameidata *nd,
 	else
 		inode_lock_shared(dir->d_inode);
 	dentry = lookup_open(nd, file, op, got_write);
-	if (!IS_ERR(dentry) && (file->f_mode & FMODE_CREATED))
-		fsnotify_create(dir->d_inode, dentry);
+	if (!IS_ERR(dentry)) {
+		if (file->f_mode & FMODE_CREATED)
+			fsnotify_create(dir->d_inode, dentry);
+		if (file->f_mode & FMODE_OPENED)
+			fsnotify_open(file);
+	}
 	if (open_flag & O_CREAT)
 		inode_unlock(dir->d_inode);
 	else
@@ -3700,6 +3704,8 @@ int vfs_tmpfile(struct mnt_idmap *idmap,
 	mode = vfs_prepare_mode(idmap, dir, mode, mode, mode);
 	error = dir->i_op->tmpfile(idmap, dir, file, mode);
 	dput(child);
+	if (file->f_mode & FMODE_OPENED)
+		fsnotify_open(file);
 	if (error)
 		return error;
 	/* Don't check for other permissions, the inode was just created */
diff --git a/fs/open.c b/fs/open.c
index 89cafb572061..f1607729acb9 100644
--- a/fs/open.c
+++ b/fs/open.c
@@ -1004,11 +1004,6 @@ static int do_dentry_open(struct file *f,
 		}
 	}
 
-	/*
-	 * Once we return a file with FMODE_OPENED, __fput() will call
-	 * fsnotify_close(), so we need fsnotify_open() here for symmetry.
-	 */
-	fsnotify_open(f);
 	return 0;
 
 cleanup_all:
@@ -1085,8 +1080,19 @@ EXPORT_SYMBOL(file_path);
  */
 int vfs_open(const struct path *path, struct file *file)
 {
+	int ret;
+
 	file->f_path = *path;
-	return do_dentry_open(file, NULL);
+	ret = do_dentry_open(file, NULL);
+	if (!ret) {
+		/*
+		 * Once we return a file with FMODE_OPENED, __fput() will call
+		 * fsnotify_close(), so we need fsnotify_open() here for
+		 * symmetry.
+		 */
+		fsnotify_open(file);
+	}
+	return ret;
 }
 
 struct file *dentry_open(const struct path *path, int flags,
@@ -1177,8 +1183,10 @@ struct file *kernel_file_open(const struct path *path, int flags,
 	error = do_dentry_open(f, NULL);
 	if (error) {
 		fput(f);
-		f = ERR_PTR(error);
+		return ERR_PTR(error);
 	}
+
+	fsnotify_open(f);
 	return f;
 }
 EXPORT_SYMBOL_GPL(kernel_file_open);
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
