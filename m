Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F23459340
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Nov 2021 17:42:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1AFB13C8D4A
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Nov 2021 17:42:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3F3C33C8D0C
 for <ltp@lists.linux.it>; Mon, 22 Nov 2021 17:41:59 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 984A6600A3E
 for <ltp@lists.linux.it>; Mon, 22 Nov 2021 17:41:58 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CB67E1FD49;
 Mon, 22 Nov 2021 16:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1637599317; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=1woxrA4xZsptnquer4Gd0ugpmny7b62MqMTzjlRKhrs=;
 b=D9QD+7iDWjdfAk65X8/3PTFr/OHdtPtlpvfV0tZR9xcTgh5lTUluNMBjucbRbgSRWhk2jf
 LQlsZMlWX2aUb3Gic2XA8WnBuShvspt99dFN3fw720k+GmZ2QRafuLH8UU40R5iGDqWWID
 GpvqB2B5Bwz3k4qqdyQfae5L0wiZSY8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1637599317;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=1woxrA4xZsptnquer4Gd0ugpmny7b62MqMTzjlRKhrs=;
 b=3FteXPHki4q4uD48zVbf3yuog6NKkm53zGV0HFAWyCo8kWIA1sH+rV7nGrGQPr7IQr/KEY
 tQq0zRK/ob9G4pBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AAB2413B44;
 Mon, 22 Nov 2021 16:41:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pZdDKFXIm2GHNwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 22 Nov 2021 16:41:57 +0000
Date: Mon, 22 Nov 2021 17:43:03 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: linux-kernel@vger.kernel.org
Message-ID: <YZvIlz7J6vOEY+Xu@yuki>
MIME-Version: 1.0
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] uapi: Make __{u,s}64 match {u,}int64_t in userspace
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
Cc: linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
 libc-alpha@sourceware.org, arnd@arndb.de, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This changes the __u64 and __s64 in userspace on 64bit platforms from
long long (unsigned) int to just long (unsigned) int in order to match
the uint64_t and int64_t size in userspace.

This allows us to use the kernel structure definitions in userspace. For
example we can use PRIu64 and PRId64 modifiers in printf() to print
structure members. Morever with this there would be no need to redefine
these structures in libc implementations as it is done now.

Consider for example the newly added statx() syscall. If we use the
header from uapi we will get warnings when attempting to print it's
members as:

	printf("%" PRIu64 "\n", stx.stx_size);

We get:

	warning: format '%lu' expects argument of type 'long unsigned int',
	         but argument 5 has type '__u64' {aka 'long long unsigned int'}

After this patch the types match and no warnings are generated.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 include/uapi/asm-generic/types.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/uapi/asm-generic/types.h b/include/uapi/asm-generic/types.h
index dfaa50d99d8f..ae748a3678a4 100644
--- a/include/uapi/asm-generic/types.h
+++ b/include/uapi/asm-generic/types.h
@@ -1,9 +1,16 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 #ifndef _ASM_GENERIC_TYPES_H
 #define _ASM_GENERIC_TYPES_H
+
+#include <asm/bitsperlong.h>
+
 /*
- * int-ll64 is used everywhere now.
+ * int-ll64 is used everywhere in kernel now.
  */
-#include <asm-generic/int-ll64.h>
+#if __BITS_PER_LONG == 64 && !defined(__KERNEL__)
+# include <asm-generic/int-l64.h>
+#else
+# include <asm-generic/int-ll64.h>
+#endif
 
 #endif /* _ASM_GENERIC_TYPES_H */
-- 
2.32.0


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
