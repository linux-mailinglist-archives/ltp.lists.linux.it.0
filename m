Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D86BA6725B
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Mar 2025 12:16:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D12F43CABFD
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Mar 2025 12:16:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 026B73CABE7
 for <ltp@lists.linux.it>; Tue, 18 Mar 2025 12:14:18 +0100 (CET)
Authentication-Results: in-6.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=andrea.cervesato@suse.de; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 881921400191
 for <ltp@lists.linux.it>; Tue, 18 Mar 2025 12:14:17 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0697E21B06;
 Tue, 18 Mar 2025 11:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742296443; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LxFq9qIEFFE2MmLggpQ/Ji6DKeZbHCG5hHiT4E/M5Lw=;
 b=kWaYexiIEquGzzvAb2E+ijufWIFV9AjN/NYryhM/jx87grl32sY+CiiSnuLSCobi/kJLDJ
 vlLiPCdqN34YvUJpd6n47kA2k9csDdHr6//fZZtfHa0UQUjdMal+1+qtUw9tjGO7TBChj8
 S198l3rcnCMZ1+rwPPVC6gYp82Gt1pA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742296443;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LxFq9qIEFFE2MmLggpQ/Ji6DKeZbHCG5hHiT4E/M5Lw=;
 b=e0KFU30+RytnIPxagtkgzuUnlqDXgbYIVhgBd9a5eHmZSAca8JKfoqVvnQ4CSM8oBlpHLW
 b8GayoxqWm9jqjCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742296443; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LxFq9qIEFFE2MmLggpQ/Ji6DKeZbHCG5hHiT4E/M5Lw=;
 b=kWaYexiIEquGzzvAb2E+ijufWIFV9AjN/NYryhM/jx87grl32sY+CiiSnuLSCobi/kJLDJ
 vlLiPCdqN34YvUJpd6n47kA2k9csDdHr6//fZZtfHa0UQUjdMal+1+qtUw9tjGO7TBChj8
 S198l3rcnCMZ1+rwPPVC6gYp82Gt1pA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742296443;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LxFq9qIEFFE2MmLggpQ/Ji6DKeZbHCG5hHiT4E/M5Lw=;
 b=e0KFU30+RytnIPxagtkgzuUnlqDXgbYIVhgBd9a5eHmZSAca8JKfoqVvnQ4CSM8oBlpHLW
 b8GayoxqWm9jqjCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5EC2D13A43;
 Tue, 18 Mar 2025 11:14:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CPOOEXpV2WdGRgAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Tue, 18 Mar 2025 11:14:02 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Tue, 18 Mar 2025 12:13:56 +0100
MIME-Version: 1.0
Message-Id: <20250318-mmap_suite_refactoring-v5-4-1b087988f1c9@suse.com>
References: <20250318-mmap_suite_refactoring-v5-0-1b087988f1c9@suse.com>
In-Reply-To: <20250318-mmap_suite_refactoring-v5-0-1b087988f1c9@suse.com>
To: ltp@lists.linux.it
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742296439; l=3274;
 i=andrea.cervesato@suse.com; s=20240812; h=from:subject:message-id;
 bh=Y45F4IvCJvyIoEaDd1cBOJ8x5yHXvyBo8b/cKqCV4rg=;
 b=Z3PKzoNu+hzTifL4J6Enkl1H3NCxraMtgUp9sNnTlz9tk1fWJySJflcDr/Rh/oszwBvmVsCY+
 PKg2FmjeXxKAl/OXbstJqGPItYJeFkyOhXBK4BBUK6QqRA6NEIzROcw
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=RG/nLJ5snb1tLKGwSORQXBJ5XA4juT0WF2Pc/lq9meo=
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.cz:email,
 suse.com:email, suse.com:mid]
X-Spam-Score: -4.30
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v5 4/8] Cleanup mmap17 test
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
 testcases/kernel/syscalls/mmap/mmap17.c | 53 +++++++++++++--------------------
 1 file changed, 20 insertions(+), 33 deletions(-)

diff --git a/testcases/kernel/syscalls/mmap/mmap17.c b/testcases/kernel/syscalls/mmap/mmap17.c
index 39703fbd397d33fe549b1c9a52db62f763e146dd..1d10676379a102750ab7dbb73dd3ccd398112129 100644
--- a/testcases/kernel/syscalls/mmap/mmap17.c
+++ b/testcases/kernel/syscalls/mmap/mmap17.c
@@ -1,78 +1,65 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) Zilogic Systems Pvt. Ltd., 2020
- * Email: code@zilogic.com
+ *	Email: code@zilogic.com
+ * Copyright (C) 2025 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
  */
 
-/*
- * Test mmap with MAP_FIXED_NOREPLACE flag
- *
- * We are testing the MAP_FIXED_NOREPLACE flag of mmap() syscall. To check
+/*\
+ * Verify MAP_FIXED_NOREPLACE flag for the mmap() syscall and check
  * if an attempt to mmap at an exisiting mapping fails with EEXIST.
- * The code allocates a free address by passing NULL to first mmap call
- * Then tries to mmap with the same address using MAP_FIXED_NOREPLACE flag
- * and the mapping fails as expected.
  */
 
-#include <stdio.h>
-#include <fcntl.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <unistd.h>
-#include <errno.h>
-#include <string.h>
-#include <stdlib.h>
-#include "lapi/mmap.h"
 #include "tst_test.h"
 
 static int fd_file1;
 static int fd_file2;
 static void *mapped_address;
-static const char str[] = "Writing to mapped file";
+static const char msg[] = "Writing to mapped file";
+static int msg_len;
 
 #define FNAME1 "file1_to_mmap"
 #define FNAME2 "file2_to_mmap"
 
 static void setup(void)
 {
+	msg_len = strlen(msg);
+
 	fd_file1 = SAFE_OPEN(FNAME1, O_CREAT | O_RDWR, 0600);
 	fd_file2 = SAFE_OPEN(FNAME2, O_CREAT | O_RDWR, 0600);
+
+	SAFE_WRITE(SAFE_WRITE_ALL, fd_file1, msg, msg_len);
+	SAFE_WRITE(SAFE_WRITE_ALL, fd_file2, msg, msg_len);
+
+	mapped_address = SAFE_MMAP(NULL, msg_len,
+		PROT_WRITE, MAP_PRIVATE, fd_file1, 0);
 }
 
 static void cleanup(void)
 {
-	int str_len;
-
-	str_len = strlen(str);
-
 	if (fd_file2 > 0)
 		SAFE_CLOSE(fd_file2);
 	if (fd_file1 > 0)
 		SAFE_CLOSE(fd_file1);
 	if (mapped_address)
-		SAFE_MUNMAP(mapped_address, str_len);
+		SAFE_MUNMAP(mapped_address, msg_len);
 }
 
 static void test_mmap(void)
 {
-	int str_len;
 	void *address;
 
-	str_len = strlen(str);
-
-	SAFE_WRITE(SAFE_WRITE_ALL, fd_file1, str, str_len);
-	mapped_address = SAFE_MMAP(NULL, str_len, PROT_WRITE,
-				   MAP_PRIVATE, fd_file1, 0);
-
-	SAFE_WRITE(SAFE_WRITE_ALL, fd_file2, str, str_len);
-
-	address = mmap(mapped_address, str_len, PROT_WRITE,
+	address = mmap(mapped_address, msg_len, PROT_WRITE,
 		  MAP_PRIVATE | MAP_FIXED_NOREPLACE, fd_file2, 0);
+
 	if (address == MAP_FAILED && errno == EEXIST)
 		tst_res(TPASS, "mmap set errno to EEXIST as expected");
 	else
 		tst_res(TFAIL | TERRNO, "mmap failed, with unexpected error "
 			"code, expected EEXIST");
+
+	if (address != MAP_FAILED)
+		SAFE_MUNMAP(address, msg_len);
 }
 
 static struct tst_test test = {

-- 
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
