Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1680AA1823B
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jan 2025 17:46:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CC1E23C2CAE
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jan 2025 17:46:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4B0B03C2998
 for <ltp@lists.linux.it>; Tue, 21 Jan 2025 17:44:31 +0100 (CET)
Authentication-Results: in-6.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=mdoucha@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C02FB1434441
 for <ltp@lists.linux.it>; Tue, 21 Jan 2025 17:44:30 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 70B5B21195
 for <ltp@lists.linux.it>; Tue, 21 Jan 2025 16:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1737477869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U/vmi+8xFomS4B5+8pW1wP5yD9pSqCn7oWUBlBDr19Q=;
 b=LD3rz0ONuliQ9X5rWpeDYMvRT2z2gsl1rBeBf/fPwSeC6B8c4zprXasJSO4/IEE+oIrxnm
 zoCj6ggM6q9exiWJ9uhl1G+bNHd7ijNq8NcrqRCcQY2fg4Fqe/0+a7sPdWHslHAP7HQWnJ
 sgDF1cqChuX/wBwVllDLT8weUOkfW8g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1737477869;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U/vmi+8xFomS4B5+8pW1wP5yD9pSqCn7oWUBlBDr19Q=;
 b=irzOqRHWcdEv+pF+jT08ALxz0jG+r7YhSawV46b9pmtmtBTPdPtJKcuqJv81+UpuSO7h1G
 00YTP2G9xyWky9Cg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1737477869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U/vmi+8xFomS4B5+8pW1wP5yD9pSqCn7oWUBlBDr19Q=;
 b=LD3rz0ONuliQ9X5rWpeDYMvRT2z2gsl1rBeBf/fPwSeC6B8c4zprXasJSO4/IEE+oIrxnm
 zoCj6ggM6q9exiWJ9uhl1G+bNHd7ijNq8NcrqRCcQY2fg4Fqe/0+a7sPdWHslHAP7HQWnJ
 sgDF1cqChuX/wBwVllDLT8weUOkfW8g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1737477869;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U/vmi+8xFomS4B5+8pW1wP5yD9pSqCn7oWUBlBDr19Q=;
 b=irzOqRHWcdEv+pF+jT08ALxz0jG+r7YhSawV46b9pmtmtBTPdPtJKcuqJv81+UpuSO7h1G
 00YTP2G9xyWky9Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 69889139CB
 for <ltp@lists.linux.it>; Tue, 21 Jan 2025 16:44:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GEGXGe3Oj2erPQAAD6G6ig
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Tue, 21 Jan 2025 16:44:29 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 21 Jan 2025 17:44:23 +0100
Message-ID: <20250121164426.27977-10-mdoucha@suse.cz>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250121164426.27977-1-mdoucha@suse.cz>
References: <20250121164426.27977-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_ONE(0.00)[1];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TO_DN_NONE(0.00)[];
 PREVIOUSLY_DELIVERED(0.00)[ltp@lists.linux.it];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 09/10] kvm_pagefault01: Use library functions to
 reload KVM modules
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/kernel/kvm/kvm_pagefault01.c | 59 +++-----------------------
 1 file changed, 5 insertions(+), 54 deletions(-)

diff --git a/testcases/kernel/kvm/kvm_pagefault01.c b/testcases/kernel/kvm/kvm_pagefault01.c
index 16b3137c0..db526cb7e 100644
--- a/testcases/kernel/kvm/kvm_pagefault01.c
+++ b/testcases/kernel/kvm/kvm_pagefault01.c
@@ -136,70 +136,21 @@ TST_TEST_TCONF("Test supported only on x86_64");
 
 #else /* COMPILE_PAYLOAD */
 
-#include <ctype.h>
-#include <stdio.h>
-#include <unistd.h>
 #include "tst_module.h"
 
 #define TDP_MMU_SYSFILE "/sys/module/kvm/parameters/tdp_mmu"
 #define TDP_AMD_SYSFILE "/sys/module/kvm_amd/parameters/npt"
 #define TDP_INTEL_SYSFILE "/sys/module/kvm_intel/parameters/ept"
 
-#define BUF_SIZE 64
-
-static int read_bool_sys_param(const char *filename)
-{
-	char buf[BUF_SIZE];
-	int i, fd, ret;
-
-	fd = open(filename, O_RDONLY);
-
-	if (fd < 0)
-		return -1;
-
-	ret = read(fd, buf, BUF_SIZE - 1);
-	SAFE_CLOSE(fd);
-
-	if (ret < 1)
-		return -1;
-
-	buf[ret] = '\0';
-
-	for (i = 0; buf[i] && !isspace(buf[i]); i++)
-		;
-
-	buf[i] = '\0';
-
-	if (isdigit(buf[0])) {
-		tst_parse_int(buf, &ret, INT_MIN, INT_MAX);
-		return ret;
-	}
-
-	if (!strcasecmp(buf, "N"))
-		return 0;
-
-	/* Assume that any other value than 0 or N means the param is enabled */
-	return 1;
-}
-
-static void reload_module(const char *module, char *arg)
-{
-	const char *const argv[] = {"modprobe", module, arg, NULL};
-
-	tst_res(TINFO, "Reloading module %s with parameter %s", module, arg);
-	tst_module_unload(module);
-	tst_cmd(argv, NULL, NULL, 0);
-}
-
 static void disable_tdp(void)
 {
-	if (read_bool_sys_param(TDP_AMD_SYSFILE) > 0)
-		reload_module("kvm_amd", "npt=0");
+	if (tst_read_bool_sys_param(TDP_AMD_SYSFILE) > 0)
+		tst_module_reload("kvm_amd", (char *const[]){"npt=0", NULL});
 
-	if (read_bool_sys_param(TDP_INTEL_SYSFILE) > 0)
-		reload_module("kvm_intel", "ept=0");
+	if (tst_read_bool_sys_param(TDP_INTEL_SYSFILE) > 0)
+		tst_module_reload("kvm_intel", (char *const[]){"ept=0", NULL});
 
-	if (read_bool_sys_param(TDP_MMU_SYSFILE) > 0)
+	if (tst_read_bool_sys_param(TDP_MMU_SYSFILE) > 0)
 		tst_res(TINFO, "WARNING: tdp_mmu is enabled, beware of false negatives");
 }
 
-- 
2.47.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
