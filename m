Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCB4A5EF5B
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Mar 2025 10:17:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D47133CA4E5
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Mar 2025 10:17:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 023413CA4D1
 for <ltp@lists.linux.it>; Thu, 13 Mar 2025 10:15:58 +0100 (CET)
Authentication-Results: in-3.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=andrea.cervesato@suse.de; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D74E31A00807
 for <ltp@lists.linux.it>; Thu, 13 Mar 2025 10:15:56 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 721BC21191;
 Thu, 13 Mar 2025 09:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741857350; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j7jtPKl8Q84shSUwa4HFsE7f2BD5l518AIwhs/AK+ks=;
 b=1NFCNaAf0ylTpuNrzRdEAT9M1lSpxzr+eJ7trn9U7RntfpJXhoqqlBSGBOWbGRtIhZOOSd
 erHPsYFu15wLnrXhvYEyn8Ii80x7JlVyP1w2L6PmM6WyK0uYXvioU73iGl3TS/1apwqsHS
 tLD51z4hX/l0slavPG1Log2gpFpL59k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741857350;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j7jtPKl8Q84shSUwa4HFsE7f2BD5l518AIwhs/AK+ks=;
 b=u6/yvEtUrwXaFVuc8kdNuzxgYxDPE5IeC6bcLD2tclDP1+r3qwUhTJ6benDfsGH76srw+b
 PfB1/gUVNeHTc3Dg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1NFCNaAf;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="u6/yvEtU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741857350; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j7jtPKl8Q84shSUwa4HFsE7f2BD5l518AIwhs/AK+ks=;
 b=1NFCNaAf0ylTpuNrzRdEAT9M1lSpxzr+eJ7trn9U7RntfpJXhoqqlBSGBOWbGRtIhZOOSd
 erHPsYFu15wLnrXhvYEyn8Ii80x7JlVyP1w2L6PmM6WyK0uYXvioU73iGl3TS/1apwqsHS
 tLD51z4hX/l0slavPG1Log2gpFpL59k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741857350;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j7jtPKl8Q84shSUwa4HFsE7f2BD5l518AIwhs/AK+ks=;
 b=u6/yvEtUrwXaFVuc8kdNuzxgYxDPE5IeC6bcLD2tclDP1+r3qwUhTJ6benDfsGH76srw+b
 PfB1/gUVNeHTc3Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1D9BD13A5E;
 Thu, 13 Mar 2025 09:15:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EAPcBkai0mczNQAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Thu, 13 Mar 2025 09:15:50 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Thu, 13 Mar 2025 10:15:36 +0100
MIME-Version: 1.0
Message-Id: <20250313-mmap_suite_refactoring-v3-3-eb9172686230@suse.com>
References: <20250313-mmap_suite_refactoring-v3-0-eb9172686230@suse.com>
In-Reply-To: <20250313-mmap_suite_refactoring-v3-0-eb9172686230@suse.com>
To: ltp@lists.linux.it
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741857349; l=1960;
 i=andrea.cervesato@suse.com; s=20240812; h=from:subject:message-id;
 bh=/PjBRxoHFpG8ADG2LQxGMg7sDs6hAQ8M/vTvFkpCzpY=;
 b=Wab9L8kCtoud0Ku1fL2WUoU9Yoe6eCPSdytLuKwfCVCAJs9HYhz3wXoYDWyoJxXuvB4FRMwSP
 cxXCN6S//VjDYHyPNwEWHJXvCei/9nr9oEj+hDuTRD5BHXmOQI7MAbo
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=RG/nLJ5snb1tLKGwSORQXBJ5XA4juT0WF2Pc/lq9meo=
X-Rspamd-Queue-Id: 721BC21191
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCPT_COUNT_THREE(0.00)[3];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v3 3/8] Cleanup mmap12 test
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
 testcases/kernel/syscalls/mmap/mmap12.c | 30 ++++++------------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/testcases/kernel/syscalls/mmap/mmap12.c b/testcases/kernel/syscalls/mmap/mmap12.c
index 995a2bab091a745dd7332fe919c1ea38b25641e3..043218834ca8c5284e6d25c7018faa0d09460f67 100644
--- a/testcases/kernel/syscalls/mmap/mmap12.c
+++ b/testcases/kernel/syscalls/mmap/mmap12.c
@@ -1,31 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2013 FNST, DAN LI <li.dan@cn.fujitsu.com>
+ * Copyright (C) 2025 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
  */
 
-/*
- * Test Description:
- *  Verify MAP_POPULATE works fine.
- *  "For a file mapping, this causes read-ahead on the file.
- *   Later accesses to the mapping will not be blocked by page faults"
- *
- * Expected Result:
- *  mmap() with MAP_POPULATE should succeed returning the address of the
- *  mapped region and this file has been read into RAM, so pages should
- *  be present.
+/*\
+ * Verify that mmap() with MAP_POPULATE succeed returning the address of the
+ * mapped region. The file should be read into RAM, and pages should be present.
  */
-#include <stdio.h>
-#include <stdlib.h>
-#include <sys/types.h>
-#include <errno.h>
-#include <unistd.h>
-#include <fcntl.h>
-#include <string.h>
-#include <signal.h>
-#include <stdint.h>
-#include <sys/stat.h>
-#include <sys/mman.h>
-#include <sys/shm.h>
 
 #include "tst_test.h"
 
@@ -60,9 +42,9 @@ static void page_check(void)
 			tst_res(TCONF | TERRNO,
 				"don't have permission to open dev pagemap");
 			return;
-		} else {
-			tst_brk(TFAIL | TERRNO, "pen dev pagemap failed");
 		}
+
+		tst_brk(TFAIL | TERRNO, "pen dev pagemap failed");
 	}
 
 	offset = SAFE_LSEEK(pm, index, SEEK_SET);

-- 
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
