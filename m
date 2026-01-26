Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNlnHK8od2lzcwEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jan 2026 09:41:19 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1130A858E1
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jan 2026 09:41:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B43EF3C2E08
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jan 2026 09:41:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C1AF43C01E9
 for <ltp@lists.linux.it>; Mon, 26 Jan 2026 09:41:08 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A52756008F3
 for <ltp@lists.linux.it>; Mon, 26 Jan 2026 09:41:07 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 596245BCD7;
 Mon, 26 Jan 2026 08:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769416866; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RCxX2cr9fIvJ0nIyw6Eq0w4jVKBT6mfSXbXQXj/0WrI=;
 b=aQ69eF1fEs7e7mDoRvBlOG6dpqp7flfQeCQaD1RvgugcvYNgmkeDQrWJETYxpn5TnyLFl4
 iEdN2WgPoAHf9xoBXwwnBh3Us1cu31JZgtd6nPBnpIz6sJFKBSRGblGrXklGen15eR5e2K
 FcBSX3XDtk76YiyRi1oSTVSOAiNoZhU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769416866;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RCxX2cr9fIvJ0nIyw6Eq0w4jVKBT6mfSXbXQXj/0WrI=;
 b=J2mtHgMsn56TaAS1lSsuE9HwVbzXkDX6JLwExN5AuMQaXPQpbr3cred03MZ4SmlZxxBpG2
 PMVQidYtFlE0+GDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769416866; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RCxX2cr9fIvJ0nIyw6Eq0w4jVKBT6mfSXbXQXj/0WrI=;
 b=aQ69eF1fEs7e7mDoRvBlOG6dpqp7flfQeCQaD1RvgugcvYNgmkeDQrWJETYxpn5TnyLFl4
 iEdN2WgPoAHf9xoBXwwnBh3Us1cu31JZgtd6nPBnpIz6sJFKBSRGblGrXklGen15eR5e2K
 FcBSX3XDtk76YiyRi1oSTVSOAiNoZhU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769416866;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RCxX2cr9fIvJ0nIyw6Eq0w4jVKBT6mfSXbXQXj/0WrI=;
 b=J2mtHgMsn56TaAS1lSsuE9HwVbzXkDX6JLwExN5AuMQaXPQpbr3cred03MZ4SmlZxxBpG2
 PMVQidYtFlE0+GDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3309E139F0;
 Mon, 26 Jan 2026 08:41:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id D8teCqIod2lMKQAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Mon, 26 Jan 2026 08:41:06 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Mon, 26 Jan 2026 09:41:06 +0100
MIME-Version: 1.0
Message-Id: <20260126-fix_dio_sparse_slow-v2-1-5dbe1622f5c1@suse.com>
X-B4-Tracking: v=1; b=H4sIAKEod2kC/32NUQ6CMBBEr0L225q2WhC/vIchDbKLbKKUdLVqC
 He3cgA/32TmzQxCkUngWMwQKbFwGDPYTQHd0I5XUoyZwWpbamN3que3Rw5epjYKebmFl6qtq92
 hKius9pCXU6RcW63nJvPA8gjxs54k80v/+5JRRpXugho7jc72J3kKbbtwh2ZZli/TKTB+tQAAA
 A==
X-Change-ID: 20260123-fix_dio_sparse_slow-925958767d74
To: Linux Test Project <ltp@lists.linux.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769416866; l=2943;
 i=andrea.cervesato@suse.com; s=20251210; h=from:subject:message-id;
 bh=oy2BGyGYUxYqbyg1ogjPwMjzReUeWWJblCp1TwimxJs=;
 b=0Kcs3qOsbMUqDKSLIvP6X/ezf9IhgsDknCdp5LYuq2uS/Ad8Tnt8ImiHwto2IJrqcE4TwfgKV
 o/Dl76V8QleCisN6yDZEqSX8UIw2mBG3AS2/xXdAt1NdSvQPNicndVO
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=zKY+6GCauOiuHNZ//d8PQ/UL4jFCTKbXrzXAOQSLevI=
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2] io: fix really slow dio_sparse on certain systems
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
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[suse.de : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.955];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns,suse.com:mid,suse.com:email,linux.it:url];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrea.cervesato@suse.de,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DKIM_TRACE(0.00)[suse.de:-]
X-Rspamd-Queue-Id: 1130A858E1
X-Rspamd-Action: no action

From: Andrea Cervesato <andrea.cervesato@suse.com>

The reason why dio_sparse is happening to be slow on certain systems is
that, if data buffering is slow, we run more buffered read() for one
single dio write(). This slows down the whole test, because for each
read() we always need to move data from kernel space to user space.

Create a READ_BUFFER_SIZE variable inside the common.h header and use
it to define the write buffer size.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
Changes in v2:
- fix write option default value in the documentation
- Link to v1: https://lore.kernel.org/r/20260123-fix_dio_sparse_slow-v1-1-65bd0dc0d52f@suse.com
---
 testcases/kernel/io/ltp-aiodio/common.h     | 6 ++++--
 testcases/kernel/io/ltp-aiodio/dio_sparse.c | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/io/ltp-aiodio/common.h b/testcases/kernel/io/ltp-aiodio/common.h
index 9a2d2716661651adf40c635ac516cc70068c9393..d3f05a3c1e75cd4baa629cbce1872729a0d641c6 100644
--- a/testcases/kernel/io/ltp-aiodio/common.h
+++ b/testcases/kernel/io/ltp-aiodio/common.h
@@ -9,6 +9,8 @@
 #include <stdlib.h>
 #include "tst_test.h"
 
+#define READ_BUFFER_SIZE 4096
+
 static inline char *check_zero(char *buf, int size)
 {
 	char *p;
@@ -57,7 +59,7 @@ static inline void io_append(const char *path, char pattern, int flags, size_t b
 
 static inline void io_read(const char *filename, int filesize, volatile int *run_child)
 {
-	char buff[4096];
+	char buff[READ_BUFFER_SIZE];
 	int fd;
 	int i;
 	int r;
@@ -102,7 +104,7 @@ exit:
 
 static inline void io_read_eof(const char *filename, volatile int *run_child)
 {
-	char buff[4096];
+	char buff[READ_BUFFER_SIZE];
 	int fd;
 	int r;
 
diff --git a/testcases/kernel/io/ltp-aiodio/dio_sparse.c b/testcases/kernel/io/ltp-aiodio/dio_sparse.c
index c87e5ab1aca7c8910f76ee87f86b561f548d4cdf..4edf286420831cef5f4280e620651554182aaa52 100644
--- a/testcases/kernel/io/ltp-aiodio/dio_sparse.c
+++ b/testcases/kernel/io/ltp-aiodio/dio_sparse.c
@@ -32,7 +32,7 @@ static char *str_filesize;
 static char *str_offset;
 
 static int numchildren = 16;
-static long long writesize = 1024;
+static long long writesize = READ_BUFFER_SIZE;
 static long long filesize = 100 * 1024 * 1024;
 static long long offset = 0;
 static long long alignment;
@@ -124,7 +124,7 @@ static struct tst_test test = {
 	.forks_child = 1,
 	.options = (struct tst_option[]) {
 		{"n:", &str_numchildren, "Number of threads (default 16)"},
-		{"w:", &str_writesize, "Size of writing blocks (default 1K)"},
+		{"w:", &str_writesize, "Size of writing blocks (default 4K)"},
 		{"s:", &str_filesize, "Size of file (default 100M)"},
 		{"o:", &str_offset, "File offset (default 0)"},
 		{}

---
base-commit: c47ab95d5fe077133e598ac7762387450a87cb2b
change-id: 20260123-fix_dio_sparse_slow-925958767d74

Best regards,
-- 
Andrea Cervesato <andrea.cervesato@suse.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
