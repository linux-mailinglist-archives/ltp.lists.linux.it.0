Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D960B1B996
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Aug 2025 19:46:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2CB383C0707
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Aug 2025 19:46:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1A89D3C6994
 for <ltp@lists.linux.it>; Tue,  5 Aug 2025 19:45:03 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9EE57140096B
 for <ltp@lists.linux.it>; Tue,  5 Aug 2025 19:45:02 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D9BB22126A;
 Tue,  5 Aug 2025 17:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1754415883; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EYWSqQAR/Ik4OatlHIF1saEjUiutO75nVQNSdEGtEqg=;
 b=H++Rgr84xt4j8hefXcmOFBX/ROGU0LdXRF0hpbOt98oknnZVTEviQzFEDBo3PT1i/iZXuo
 yUcPNoJYKOXnlAAxSCwWXMJd/75rXo36ydmeSZ771K9LXrezfywL/Rb8+01syDNTy7E8ss
 ft4qLffMYsdbgdIa/0DcghrpUZ28XNM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1754415883;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EYWSqQAR/Ik4OatlHIF1saEjUiutO75nVQNSdEGtEqg=;
 b=MO12uXcrhqrnT26RcrhPXXEeFxXyhMc6QEbrAOzSzvxXZhJQ0dWDp1E1ZlZJMUSKMWSVDU
 AszzQwtzuJAmJGCw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=H++Rgr84;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MO12uXcr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1754415883; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EYWSqQAR/Ik4OatlHIF1saEjUiutO75nVQNSdEGtEqg=;
 b=H++Rgr84xt4j8hefXcmOFBX/ROGU0LdXRF0hpbOt98oknnZVTEviQzFEDBo3PT1i/iZXuo
 yUcPNoJYKOXnlAAxSCwWXMJd/75rXo36ydmeSZ771K9LXrezfywL/Rb8+01syDNTy7E8ss
 ft4qLffMYsdbgdIa/0DcghrpUZ28XNM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1754415883;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EYWSqQAR/Ik4OatlHIF1saEjUiutO75nVQNSdEGtEqg=;
 b=MO12uXcrhqrnT26RcrhPXXEeFxXyhMc6QEbrAOzSzvxXZhJQ0dWDp1E1ZlZJMUSKMWSVDU
 AszzQwtzuJAmJGCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B23E513AA8;
 Tue,  5 Aug 2025 17:44:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iOzLKAtDkmhaFQAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Tue, 05 Aug 2025 17:44:43 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Tue, 05 Aug 2025 19:44:42 +0200
MIME-Version: 1.0
Message-Id: <20250805-file_setattr_getattr-v5-3-2bc4d18e0033@suse.com>
References: <20250805-file_setattr_getattr-v5-0-2bc4d18e0033@suse.com>
In-Reply-To: <20250805-file_setattr_getattr-v5-0-2bc4d18e0033@suse.com>
To: ltp@lists.linux.it
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754415882; l=2860;
 i=andrea.cervesato@suse.com; s=20240812; h=from:subject:message-id;
 bh=ZgInZTLOEsronct/5hT8hF/IfiaOubNMK4tb+0JSXBY=;
 b=Qy1qqu+XD2awN6BcR/fVLkuq++I4e2kxH+e68NnZCB8EcCu4lyR1KJWAicOFZ+LisZA7iKhm/
 Ns3HlGTLG07BHxbxXBFXPsmGiWD8e3fR3vnBbV0OGnbzrDKrnRtfcLW
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=RG/nLJ5snb1tLKGwSORQXBJ5XA4juT0WF2Pc/lq9meo=
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_TWO(0.00)[2]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Queue-Id: D9BB22126A
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v5 3/7] fs: add file_setattr/file_getattr fallback
 definitions
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

From: Andrea Cervesato <andrea.cervesato@suse.com>

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 configure.ac      |  1 +
 include/lapi/fs.h | 44 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/configure.ac b/configure.ac
index 8b506e43f8c8549f6dc9cbc4154db2be95851e59..9657adfcf5fc26d704f36e159f7e3abb7de86900 100644
--- a/configure.ac
+++ b/configure.ac
@@ -264,6 +264,7 @@ AC_CHECK_TYPES([struct mnt_id_req],,,[#include <sys/mount.h>])
 AC_CHECK_TYPES([struct statmount],,,[#include <sys/mount.h>])
 
 AC_CHECK_TYPES([struct pidfd_info],,,[#include <sys/pidfd.h>])
+AC_CHECK_TYPES([struct file_attr],,,[#include <linux/fs.h>])
 
 AC_CHECK_TYPES([struct fsxattr],,,[#include <linux/fs.h>])
 
diff --git a/include/lapi/fs.h b/include/lapi/fs.h
index 44f299149abd9415c243b2052b93f1524442beb7..66eb0abfb675b6209ad4f9d47c1217fc9b1742e2 100644
--- a/include/lapi/fs.h
+++ b/include/lapi/fs.h
@@ -14,10 +14,13 @@
 # include <linux/fs.h>
 #endif
 
+#include <stddef.h>
 #include <stdint.h>
 #include <sys/user.h>
 #include <limits.h>
+#include "tst_test.h"
 #include "lapi/abisize.h"
+#include "lapi/syscalls.h"
 
 #ifndef HAVE_STRUCT_FSXATTR
 struct fsxattr {
@@ -66,6 +69,18 @@ struct fsxattr {
 # define FS_VERITY_FL	   0x00100000 /* Verity protected inode */
 #endif
 
+#ifndef FS_XFLAG_APPEND
+# define FS_XFLAG_APPEND	0x00000010	/* all writes append */
+#endif
+
+#ifndef FS_XFLAG_EXTSIZE
+# define FS_XFLAG_EXTSIZE	0x00000800	/* extent size allocator hint */
+#endif
+
+#ifndef FS_XFLAG_COWEXTSIZE
+# define FS_XFLAG_COWEXTSIZE	0x00010000	/* CoW extent size allocator hint */
+#endif
+
 /*
  * Helper function to get MAX_LFS_FILESIZE.
  * Missing PAGE_SHIFT on some libc prevents defining MAX_LFS_FILESIZE.
@@ -88,4 +103,33 @@ static inline long long tst_max_lfs_filesize(void)
 #endif
 }
 
+#ifndef HAVE_STRUCT_FILE_ATTR
+struct file_attr {
+	uint64_t fa_xflags;	/* xflags field value (get/set) */
+	uint32_t fa_extsize;	/* extsize field value (get/set)*/
+	uint32_t fa_nextents;	/* nextents field value (get)   */
+	uint32_t fa_projid;	/* project identifier (get/set) */
+	uint32_t fa_cowextsize;	/* CoW extsize field value (get/set) */
+};
+#endif
+
+#define FILE_ATTR_SIZE_VER0 24
+#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER0
+
+static inline int file_getattr(int dfd, const char *filename,
+			    struct file_attr *ufattr, size_t usize,
+			    unsigned int at_flags)
+{
+	return tst_syscall(__NR_file_getattr, dfd, filename, ufattr, usize,
+		    at_flags);
+}
+
+static inline int file_setattr(int dfd, const char *filename,
+			    struct file_attr *ufattr, size_t usize,
+			    unsigned int at_flags)
+{
+	return tst_syscall(__NR_file_setattr, dfd, filename, ufattr, usize,
+		    at_flags);
+}
+
 #endif /* LAPI_FS_H__ */

-- 
2.50.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
