Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E306D8AE825
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Apr 2024 15:28:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 336943CFFBC
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Apr 2024 15:28:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5AC8C3CFF49
 for <ltp@lists.linux.it>; Tue, 23 Apr 2024 15:28:30 +0200 (CEST)
Authentication-Results: in-4.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id EDC671000AEA
 for <ltp@lists.linux.it>; Tue, 23 Apr 2024 15:28:28 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CDB1D37FE8;
 Tue, 23 Apr 2024 13:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1713878908; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uG9O2KQgeQT/AG9Cl0BsDyiGDd6dwlHgXym3MDlg7pk=;
 b=Cdp+tuu3KEi71PXQKBLTZQEvYWq+anLAqJeIrX46mrk8DkyQkmZ0lbBNWpQ7JotvgUlmOg
 kcUyEDAm3DKcWVOR8kG0Lp/lb/8AN1+zdf/+BtpoKB7aV2MofMqyRAHUlfISPsfbO2F9DK
 nZLmg5mFjsxbdidVbQaUnkaNww1MSSI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1713878908;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uG9O2KQgeQT/AG9Cl0BsDyiGDd6dwlHgXym3MDlg7pk=;
 b=x7QZPhA6moZzCp4mbd56qk2+SP9UCagF+iHZ7ehrumM8eovPeKGDzqtF87I0zAC1JxgYwu
 kNQsgdzoq3RyXWBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1713878906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uG9O2KQgeQT/AG9Cl0BsDyiGDd6dwlHgXym3MDlg7pk=;
 b=CIuhwrGa4XkPHvrA5gGuZSwxBZKuaNGQv57MhVX1N9NPZGSfb7eAjroXW+UQwFDW1eyKya
 Fd1aqXdVIt/smLc/1s2iTnQpx8UrdQPWVIwBFHV3kV4+uK3keK5dgTHMIDb0go3TGre+v7
 wR17nX6sGF1SPCxqQ8U3Ost+Dzvz0oA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1713878906;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uG9O2KQgeQT/AG9Cl0BsDyiGDd6dwlHgXym3MDlg7pk=;
 b=mFVNde6jbU+5OJr1EqBapmCKlpy9djeU5xqYxFlXncoNshyygrKhL5PjGDbJlYTQngUwKZ
 aWjVNbY6vlrrA7Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AFB2C1399F;
 Tue, 23 Apr 2024 13:28:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wOJQKnq3J2YTZgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Tue, 23 Apr 2024 13:28:26 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 23 Apr 2024 15:28:22 +0200
Message-ID: <20240423132823.194179-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423132823.194179-1-pvorel@suse.cz>
References: <20240423132823.194179-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; RCPT_COUNT_SEVEN(0.00)[8];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 1/2] lapi/fs: Include lapi/fcntl.h + define _GNU_SOURCE
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

This fixes build error on musl (alpine):

In file included from unlink09.c:18:
../../../../include/lapi/fs.h:58:15: error: unknown type name 'loff_t'
   58 | static inline loff_t tst_max_lfs_filesize(void)

loff_t is defined in <fcntl.h> (but guarded _GNU_SOURCE), but just for
safety include lapi/fcntl.h in case lapi/fs.h is included in test which
needs fallback definitions from lapi/fs.h.

Because we require _GNU_SOURCE definition for code in lapi/fs.h, that's
why there is the definition in both unlink09.c (the actual fix) and
lapi/fs.h for visibility of the problem.

Fixes: 2cf78f47a ("unlink: Add error tests for EPERM and EROFS")
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
#define _GNU_SOURCE pain again. Would you solve it differently?

 include/lapi/fs.h                           | 5 ++++-
 testcases/kernel/syscalls/unlink/unlink09.c | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/lapi/fs.h b/include/lapi/fs.h
index c19ee821d..4680f0090 100644
--- a/include/lapi/fs.h
+++ b/include/lapi/fs.h
@@ -9,15 +9,18 @@
 #ifndef LAPI_FS_H__
 #define LAPI_FS_H__
 
+#define _GNU_SOURCE /* loff_t in <fcntl.h> */
+
 #include "config.h"
+
 #ifndef HAVE_MOUNT_SETATTR
 # ifdef HAVE_LINUX_FS_H
 #  include <linux/fs.h>
 # endif
 #endif
 
-#include <sys/user.h>
 #include <limits.h>
+#include "lapi/fcntl.h"
 #include "lapi/abisize.h"
 
 #ifndef FS_IOC_GETFLAGS
diff --git a/testcases/kernel/syscalls/unlink/unlink09.c b/testcases/kernel/syscalls/unlink/unlink09.c
index cc4b4a07e..7e3fffe5c 100644
--- a/testcases/kernel/syscalls/unlink/unlink09.c
+++ b/testcases/kernel/syscalls/unlink/unlink09.c
@@ -13,6 +13,8 @@
  * - EROFS when target file is on a read-only filesystem.
  */
 
+#define _GNU_SOURCE /* loff_t in <fcntl.h> */
+
 #include <sys/ioctl.h>
 #include "tst_test.h"
 #include "lapi/fs.h"
-- 
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
