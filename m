Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6N8QE/k+g2kPkQMAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Feb 2026 13:43:37 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EF075E5F21
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Feb 2026 13:43:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 528D73CE0A3
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Feb 2026 13:43:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0F8C73CDE88
 for <ltp@lists.linux.it>; Wed,  4 Feb 2026 13:43:33 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 60E2E140045F
 for <ltp@lists.linux.it>; Wed,  4 Feb 2026 13:43:31 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 72C6D5BD06;
 Wed,  4 Feb 2026 12:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770209011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=fuzVQAJwMdtmsY21d9LDsp3IEZx5prmPDHHGOZXRIQw=;
 b=fhJwlwe1BSTiVHIKaPBf4SVrnhXX4lAz0Z1jcdevK4TtdOt/oHmsQhZl+u992FEuj6XlwQ
 TJm3n3INIlRIEEhVdjpRz3k3JSNvwzlwfG31+XhdG9HKKOldqbvGw9qB1v/TqsEziMSxbJ
 CJiliU73olZdXnj8bwnVtE+VdTJA11Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770209011;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=fuzVQAJwMdtmsY21d9LDsp3IEZx5prmPDHHGOZXRIQw=;
 b=yyiDa6Z7lzrgcNFHsUmhwMjodwlKqaTiwXDD/jjA/walRAVLHXCUSvxq9wfKohyhc9DV+U
 RF76Fnz3Yq9siyBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770209011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=fuzVQAJwMdtmsY21d9LDsp3IEZx5prmPDHHGOZXRIQw=;
 b=fhJwlwe1BSTiVHIKaPBf4SVrnhXX4lAz0Z1jcdevK4TtdOt/oHmsQhZl+u992FEuj6XlwQ
 TJm3n3INIlRIEEhVdjpRz3k3JSNvwzlwfG31+XhdG9HKKOldqbvGw9qB1v/TqsEziMSxbJ
 CJiliU73olZdXnj8bwnVtE+VdTJA11Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770209011;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=fuzVQAJwMdtmsY21d9LDsp3IEZx5prmPDHHGOZXRIQw=;
 b=yyiDa6Z7lzrgcNFHsUmhwMjodwlKqaTiwXDD/jjA/walRAVLHXCUSvxq9wfKohyhc9DV+U
 RF76Fnz3Yq9siyBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B32DB3EA63;
 Wed,  4 Feb 2026 12:43:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qSJ5KPI+g2mZGwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 04 Feb 2026 12:43:30 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  4 Feb 2026 13:43:23 +0100
Message-ID: <20260204124323.244578-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] openat2: Move includes to lapi, remove _GNU_SOURCE
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sourceware.org:url,suse.cz:mid,suse.cz:email]
X-Rspamd-Queue-Id: EF075E5F21
X-Rspamd-Action: no action

Improve 767b3e519e. struct open_how is also used in lapi/openat2.h,
which is used by all openat2*.c tests.  Therefore move <fcntl.h> to the
lapi header (and use lapi/fcntl.h instead).

Also remove _GNU_SOURCE which should not be needed.

While at it, move include "config.h" to the top.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi Li,

my points from the original patchset why not use _GNU_SOURCE:

glibc test tst-openat2.c [1] which includes <fcntl.h>, uses struct
open_how and test openat2() does not define it. Neither openat2() nor
struct open_how [2] are guarded by #ifdef __USE_GNU.

O_DIRECTORY is guarded by #ifdef __USE_XOPEN2K8 but this should be safe as we
compile with -std=gnu99.

Kind regards,
Petr

[1] https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/tst-openat2.c
[2] https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/bits/openat2.h

 include/lapi/openat2.h                        | 4 ++--
 testcases/kernel/syscalls/openat2/openat201.c | 3 ---
 testcases/kernel/syscalls/openat2/openat202.c | 3 ---
 testcases/kernel/syscalls/openat2/openat203.c | 3 ---
 4 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/include/lapi/openat2.h b/include/lapi/openat2.h
index 03327bdb77..b7e7eadb94 100644
--- a/include/lapi/openat2.h
+++ b/include/lapi/openat2.h
@@ -7,12 +7,12 @@
 #ifndef LAPI_OPENAT2_H__
 #define LAPI_OPENAT2_H__
 
+#include "config.h"
 #include <sys/syscall.h>
 #include <linux/types.h>
 
 #include "lapi/syscalls.h"
-
-#include "config.h"
+#include "lapi/fcntl.h"
 
 #ifndef HAVE_OPENAT2
 /*
diff --git a/testcases/kernel/syscalls/openat2/openat201.c b/testcases/kernel/syscalls/openat2/openat201.c
index f4c80bde7b..7cee58930f 100644
--- a/testcases/kernel/syscalls/openat2/openat201.c
+++ b/testcases/kernel/syscalls/openat2/openat201.c
@@ -7,9 +7,6 @@
  * Basic :manpage:`openat2(2)` test.
  */
 
-#define _GNU_SOURCE
-#include <fcntl.h>
-
 #include "tst_test.h"
 #include "lapi/openat2.h"
 
diff --git a/testcases/kernel/syscalls/openat2/openat202.c b/testcases/kernel/syscalls/openat2/openat202.c
index 7fa047da67..d0e8fe3b6e 100644
--- a/testcases/kernel/syscalls/openat2/openat202.c
+++ b/testcases/kernel/syscalls/openat2/openat202.c
@@ -7,9 +7,6 @@
  * :manpage:`openat2(2)` tests with various resolve flags.
  */
 
-#define _GNU_SOURCE
-#include <fcntl.h>
-
 #include "tst_test.h"
 #include "lapi/openat2.h"
 
diff --git a/testcases/kernel/syscalls/openat2/openat203.c b/testcases/kernel/syscalls/openat2/openat203.c
index 904194334b..9695faa337 100644
--- a/testcases/kernel/syscalls/openat2/openat203.c
+++ b/testcases/kernel/syscalls/openat2/openat203.c
@@ -7,9 +7,6 @@
  * Basic :manpage:`openat2(2)` test to check various failures.
  */
 
-#define _GNU_SOURCE
-#include <fcntl.h>
-
 #include "tst_test.h"
 #include "lapi/openat2.h"
 
-- 
2.51.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
