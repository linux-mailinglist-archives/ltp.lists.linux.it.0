Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F946AFB98F
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jul 2025 19:06:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 35D8D3CA0CD
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jul 2025 19:06:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C54F33C03F4
 for <ltp@lists.linux.it>; Mon,  7 Jul 2025 19:05:55 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 280B91400F8A
 for <ltp@lists.linux.it>; Mon,  7 Jul 2025 19:05:54 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1A13A2115F;
 Mon,  7 Jul 2025 17:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751907952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aSua8VrVLrCM/t3x2G9jKVl6/DDBWQCwPlFeMwvY/eE=;
 b=m4LfzqDebB8JyRECJ+F6quN/92Tq9CD+Iiuatc09zLUWBtxiTkhKafI5obFGsO0rriqniO
 qcIIbJ8wJqV2TSWPMRITHJcquknOqXhEpV3H5lt7kXMh54nAV0u46U9HnBEj6uUJUyo9IS
 4WAJ/CIi19fWoWe8VLjOTRE87Jon7wA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751907952;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aSua8VrVLrCM/t3x2G9jKVl6/DDBWQCwPlFeMwvY/eE=;
 b=gYlSW+mIAnhwBC8X7B1f7/+QrPpQvZ2LD6zQk1gvodiS0U/qdiROPe1imHmBu+Pm5dDJol
 zLkV+3jTd0sTliCw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=m4LfzqDe;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gYlSW+mI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751907952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aSua8VrVLrCM/t3x2G9jKVl6/DDBWQCwPlFeMwvY/eE=;
 b=m4LfzqDebB8JyRECJ+F6quN/92Tq9CD+Iiuatc09zLUWBtxiTkhKafI5obFGsO0rriqniO
 qcIIbJ8wJqV2TSWPMRITHJcquknOqXhEpV3H5lt7kXMh54nAV0u46U9HnBEj6uUJUyo9IS
 4WAJ/CIi19fWoWe8VLjOTRE87Jon7wA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751907952;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aSua8VrVLrCM/t3x2G9jKVl6/DDBWQCwPlFeMwvY/eE=;
 b=gYlSW+mIAnhwBC8X7B1f7/+QrPpQvZ2LD6zQk1gvodiS0U/qdiROPe1imHmBu+Pm5dDJol
 zLkV+3jTd0sTliCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AAB6913A5E;
 Mon,  7 Jul 2025 17:05:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yEM0JG3+a2g/YgAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Mon, 07 Jul 2025 17:05:49 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Mon, 07 Jul 2025 19:05:43 +0200
MIME-Version: 1.0
Message-Id: <20250707-ioctl_pidfd_suite-v3-2-22ba4d15ee02@suse.com>
References: <20250707-ioctl_pidfd_suite-v3-0-22ba4d15ee02@suse.com>
In-Reply-To: <20250707-ioctl_pidfd_suite-v3-0-22ba4d15ee02@suse.com>
To: ltp@lists.linux.it
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751907947; l=2025;
 i=andrea.cervesato@suse.com; s=20240812; h=from:subject:message-id;
 bh=8X4IjG3Sta5CBvx7zRYdPpYXydCso34ONbfikUw7R6c=;
 b=1S1e4SUyjcGct4yPKLeYE3UqUyvpTrnT+y6zRUBa3TpRPKe8t2DMYdEM3R12ndD5bVYOGluxG
 HgWtK0U3yrrAuFa/BJBWlDIPI9USNhG9FOT3F2JsDEudyz8dfOcIK+D
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=RG/nLJ5snb1tLKGwSORQXBJ5XA4juT0WF2Pc/lq9meo=
X-Spam-Level: 
X-Rspamd-Queue-Id: 1A13A2115F
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_DN_SOME(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,configure.ac:url,suse.com:email,suse.com:mid];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 URIBL_BLOCKED(0.00)[suse.cz:email,configure.ac:url,suse.com:email,suse.com:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -4.51
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v3 2/8] Fallback PIDFD_GET_INFO related definitions
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

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 configure.ac         |  2 ++
 include/lapi/pidfd.h | 39 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index 69c5be7362a0e9f2fdaf3e6bd01f92f6f4880108..c830b40cbbb248e6f58040d9353e0da87b288732 100644
--- a/configure.ac
+++ b/configure.ac
@@ -259,6 +259,8 @@ AC_CHECK_TYPES([struct cachestat],,,[#include <sys/mman.h>])
 AC_CHECK_TYPES([struct mnt_id_req],,,[#include <sys/mount.h>])
 AC_CHECK_TYPES([struct statmount],,,[#include <sys/mount.h>])
 
+AC_CHECK_TYPES([struct pidfd_info],,,[#include <linux/pidfd.h>])
+
 # Tools knobs
 
 # Bash
diff --git a/include/lapi/pidfd.h b/include/lapi/pidfd.h
index 9ca8e5aa23626646ebb2f18880abd5e52298bfc6..a3205032cf7d702fd8a014456933f8495f5984e2 100644
--- a/include/lapi/pidfd.h
+++ b/include/lapi/pidfd.h
@@ -8,14 +8,51 @@
 #define LAPI_PIDFD_H__
 
 #include <fcntl.h>
+#include <stdint.h>
+#include <sys/ioctl.h>
+
 #ifdef HAVE_SYS_PIDFD_H
 # include <sys/pidfd.h>
 #endif
+
 #include "config.h"
 #include "lapi/syscalls.h"
 
+#ifndef HAVE_STRUCT_PIDFD_INFO
+struct pidfd_info {
+	uint64_t mask;
+	uint64_t cgroupid;
+	uint32_t pid;
+	uint32_t tgid;
+	uint32_t ppid;
+	uint32_t ruid;
+	uint32_t rgid;
+	uint32_t euid;
+	uint32_t egid;
+	uint32_t suid;
+	uint32_t sgid;
+	uint32_t fsuid;
+	uint32_t fsgid;
+	int32_t exit_code;
+	uint32_t coredump_mask;
+	uint32_t __spare1;
+};
+#endif
+
 #ifndef PIDFD_NONBLOCK
-#define PIDFD_NONBLOCK O_NONBLOCK
+# define PIDFD_NONBLOCK O_NONBLOCK
+#endif
+
+#ifndef PIDFS_IOCTL_MAGIC
+# define PIDFS_IOCTL_MAGIC	0xFF
+#endif
+
+#ifndef PIDFD_GET_INFO
+# define PIDFD_GET_INFO		_IOWR(PIDFS_IOCTL_MAGIC, 11, struct pidfd_info)
+#endif
+
+#ifndef PIDFD_INFO_EXIT
+# define PIDFD_INFO_EXIT	(1UL << 3)
 #endif
 
 static inline void pidfd_send_signal_supported(void)

-- 
2.50.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
