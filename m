Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A70AC4CFD
	for <lists+linux-ltp@lfdr.de>; Tue, 27 May 2025 13:16:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 739B93C5372
	for <lists+linux-ltp@lfdr.de>; Tue, 27 May 2025 13:16:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2B5613C01E9
 for <ltp@lists.linux.it>; Tue, 27 May 2025 13:16:29 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 00B476883F2
 for <ltp@lists.linux.it>; Tue, 27 May 2025 13:16:28 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 96C1521AA8;
 Tue, 27 May 2025 11:16:27 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 881371388B;
 Tue, 27 May 2025 11:16:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id zd46IAufNWhUfQAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Tue, 27 May 2025 11:16:27 +0000
Date: Tue, 27 May 2025 13:16:55 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <aDWfJ97gIGTRpMQI@yuki.lan>
References: <20250526143429.22997-1-chrubis@suse.cz>
 <20250526155132.GA151544@pevik>
 <CAEemH2eyj5k5tUAQyo+b-JXKF5-GcLzQA5SXbP7xpqU1xU73NQ@mail.gmail.com>
 <20250527093436.GC173684@pevik>
 <CAEemH2cCL9LpBRMnfJtShmdtwKTHLMC2hQeC_sFKyh4KWwUt0Q@mail.gmail.com>
 <20250527110043.GA186218@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250527110043.GA186218@pevik>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Queue-Id: 96C1521AA8
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=7.0 tests=DMARC_MISSING,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v4] lib: LTP_SINGLE_FS_TYPE and
 LTP_FORCE_SINGLE_FS_TYPE
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > That's right, just confirmed with Cyril, so far we need to do nothing
> > unless tst_get_supported_fs_types() is abused somewhere.
> 
> Abusing the function should be prevented if Cyril adds before merge 'static'
> keyword to the function (as I suggested earlier).

That's a different function and that is going to be static in the final
patch.

This is the function that is called from tst_test.c and I guess that we
can remove it from the tst_fs.h in order to make sure nobody tries to
misuse it. That would look like:

diff --git a/include/tst_fs.h b/include/tst_fs.h
index 19c240e07..ceae78e7e 100644
--- a/include/tst_fs.h
+++ b/include/tst_fs.h
@@ -203,13 +203,6 @@ enum tst_fs_impl {
  */
 enum tst_fs_impl tst_fs_is_supported(const char *fs_type);

-/*
- * Returns NULL-terminated array of kernel-supported filesystems.
- *
- * @skiplist A NULL terminated array of filesystems to skip.
- */
-const char **tst_get_supported_fs_types(const char *const *skiplist);
-
 /*
  * Returns 1 if filesystem is in skiplist 0 otherwise.
  *
diff --git a/lib/tst_internal.h b/lib/tst_internal.h
new file mode 100644
index 000000000..a0ae733f6
--- /dev/null
+++ b/lib/tst_internal.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2015-2025 Cyril Hrubis <chrubis@suse.cz>
+ * Copyright (c) Linux Test Project, 2017-2025
+ */
+
+#ifndef TST_INTERNAL_H__
+#define TST_INTERNAL_H__
+
+/*
+ * Returns NULL-terminated array of kernel-supported filesystems.
+ *
+ * @skiplist A NULL terminated array of filesystems to skip.
+ */
+const char **tst_get_supported_fs_types(const char *const *skiplist);
+
+#endif /* TST_INTERNAL_H__ */
diff --git a/lib/tst_supported_fs_types.c b/lib/tst_supported_fs_types.c
index 46165ebc6..cc5522a08 100644
--- a/lib/tst_supported_fs_types.c
+++ b/lib/tst_supported_fs_types.c
@@ -14,6 +14,7 @@
 #define TST_NO_DEFAULT_MAIN
 #include "tst_test.h"
 #include "tst_fs.h"
+#include "tst_internal.h"

 /*
  * NOTE: new filesystem should be also added to
diff --git a/lib/tst_test.c b/lib/tst_test.c
index 45fc28498..f62cc195a 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -38,6 +38,7 @@
 #include "old_device.h"
 #include "old_tmpdir.h"
 #include "ltp-version.h"
+#include "tst_internal.h"

 /*
  * Hack to get TCID defined in newlib tests


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
