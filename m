Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAC0AF9198
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jul 2025 13:30:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EC7CA3C9E87
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jul 2025 13:30:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F20D53C9D1D
 for <ltp@lists.linux.it>; Fri,  4 Jul 2025 13:30:47 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2D693600D1E
 for <ltp@lists.linux.it>; Fri,  4 Jul 2025 13:30:46 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D71061F74D;
 Fri,  4 Jul 2025 11:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751628645; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fFtUuqpII28/KFU49bhlgcrAqNg3nOYKmBkVxcZ4S/g=;
 b=zDrMwZOmvtNQ4HEiEUwPASMlA4KfENVCQWzN2YAxKIZCd2QFoySwhST1HRgbpko2FKr010
 VBG8dj8GiSyAtD7tXIR2dM2qqw/Bvy8ZaDL+sjLHPvTGfLJ9MEFn1hx7cozAHuccRs+4dX
 NOTjgO3NhpzzpB5WvwB+O2YeECcbDKU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751628645;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fFtUuqpII28/KFU49bhlgcrAqNg3nOYKmBkVxcZ4S/g=;
 b=o98vLuAmQJN4HMs1B9Jio4CKygpJvs9kxYLX8dDbREYjDRAmuEFawUpbXuOJ7DFartVWxe
 kzGeKQCc/bfEZ9DQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751628645; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fFtUuqpII28/KFU49bhlgcrAqNg3nOYKmBkVxcZ4S/g=;
 b=zDrMwZOmvtNQ4HEiEUwPASMlA4KfENVCQWzN2YAxKIZCd2QFoySwhST1HRgbpko2FKr010
 VBG8dj8GiSyAtD7tXIR2dM2qqw/Bvy8ZaDL+sjLHPvTGfLJ9MEFn1hx7cozAHuccRs+4dX
 NOTjgO3NhpzzpB5WvwB+O2YeECcbDKU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751628645;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fFtUuqpII28/KFU49bhlgcrAqNg3nOYKmBkVxcZ4S/g=;
 b=o98vLuAmQJN4HMs1B9Jio4CKygpJvs9kxYLX8dDbREYjDRAmuEFawUpbXuOJ7DFartVWxe
 kzGeKQCc/bfEZ9DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E507813757;
 Fri,  4 Jul 2025 11:30:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kDBXLmS7Z2iTRQAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Fri, 04 Jul 2025 11:30:44 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Fri, 04 Jul 2025 13:30:40 +0200
MIME-Version: 1.0
Message-Id: <20250704-ioctl_pidfd_suite-v2-2-88a6466d9f62@suse.com>
References: <20250704-ioctl_pidfd_suite-v2-0-88a6466d9f62@suse.com>
In-Reply-To: <20250704-ioctl_pidfd_suite-v2-0-88a6466d9f62@suse.com>
To: ltp@lists.linux.it
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751628642; l=1972;
 i=andrea.cervesato@suse.com; s=20240812; h=from:subject:message-id;
 bh=kffUFJvtq3bcniX8SA72VImzGo3js005VkVYwk6FiEU=;
 b=OkM6kisiEhxryDhS0RkXr+XVU44b/GbWUpxct/ORRde4hjkvLA/3Q7fwt0O+UCTBOkNijvRv/
 rfrrgoEOL8YDWCY3O3bmV2VMcFch2ZEx+SdrDhhwcqFjuucybAO6g6n
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=RG/nLJ5snb1tLKGwSORQXBJ5XA4juT0WF2Pc/lq9meo=
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCPT_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid, suse.com:email,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Score: -4.30
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 2/8] Fallback PIDFD_GET_INFO related definitions
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
 configure.ac         |  2 ++
 include/lapi/pidfd.h | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/configure.ac b/configure.ac
index 69c5be7362a0e9f2fdaf3e6bd01f92f6f4880108..7132c00df97870e234fd5b8c9fcaf1beb263cf06 100644
--- a/configure.ac
+++ b/configure.ac
@@ -259,6 +259,8 @@ AC_CHECK_TYPES([struct cachestat],,,[#include <sys/mman.h>])
 AC_CHECK_TYPES([struct mnt_id_req],,,[#include <sys/mount.h>])
 AC_CHECK_TYPES([struct statmount],,,[#include <sys/mount.h>])
 
+AC_CHECK_TYPES([struct pidfd_info],,,[#include <uapi/linux/pidfd.h>])
+
 # Tools knobs
 
 # Bash
diff --git a/include/lapi/pidfd.h b/include/lapi/pidfd.h
index 9ca8e5aa23626646ebb2f18880abd5e52298bfc6..55a44d5840c01bda7b31237c5c0d54ebba8155c5 100644
--- a/include/lapi/pidfd.h
+++ b/include/lapi/pidfd.h
@@ -8,16 +8,53 @@
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
 #define PIDFD_NONBLOCK O_NONBLOCK
 #endif
 
+#ifndef PIDFS_IOCTL_MAGIC
+#define PIDFS_IOCTL_MAGIC	0xFF
+#endif
+
+#ifndef PIDFD_GET_INFO
+#define PIDFD_GET_INFO		_IOWR(PIDFS_IOCTL_MAGIC, 11, struct pidfd_info)
+#endif
+
+#ifndef PIDFD_INFO_EXIT
+#define PIDFD_INFO_EXIT		(1UL << 3)
+#endif
+
 static inline void pidfd_send_signal_supported(void)
 {
 	/* allow the tests to fail early */

-- 
2.50.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
