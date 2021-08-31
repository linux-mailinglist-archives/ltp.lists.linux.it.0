Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 395303FC4A1
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 11:10:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DBA3D3C2A8C
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 11:10:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 619D03C2A0B
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 11:10:19 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D00B21A00162
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 11:10:18 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 494232200C;
 Tue, 31 Aug 2021 09:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1630401018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jrcar/bR5Kxl1HxCeLU/dAGjaOyGWJfhcKqdwDo75Kk=;
 b=c00mR2/MIRehf3wb3GU4r0Fvyr9P5823F9Rq4n/26dgknIApYClw+gK5jl15cDT8N1DTz9
 Lc390I7OjwH1o5uVj5yaQD/AG0VTYALbuz+SZQEZjblLIPynBOR0VZbiggHbOPhv9mwDU/
 cYQ9alPP7/oxYwWqm+RLOSWIL1edwNg=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 0C6DAA3B98;
 Tue, 31 Aug 2021 09:10:18 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 31 Aug 2021 10:10:03 +0100
Message-Id: <20210831091005.25361-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210831091005.25361-1-rpalethorpe@suse.com>
References: <YSz36VZ18+N4YsM/@yuki>
 <20210831091005.25361-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/4] bpf: Print full verification log
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The log never falls within the 1024 byte limit imposed by format
string buffer. So print it separately with dprintf.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/kernel/syscalls/bpf/bpf_common.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/bpf/bpf_common.c b/testcases/kernel/syscalls/bpf/bpf_common.c
index ba0829a75..aac235cac 100644
--- a/testcases/kernel/syscalls/bpf/bpf_common.c
+++ b/testcases/kernel/syscalls/bpf/bpf_common.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2019-2020 Linux Test Project
  */
 
+#include <stdio.h>
+
 #define TST_NO_DEFAULT_MAIN
 #include "tst_test.h"
 #include "bpf_common.h"
@@ -118,8 +120,10 @@ int bpf_load_prog(union bpf_attr *const attr, const char *const log)
 	if (ret != -1)
 		tst_brk(TBROK, "Invalid bpf() return value: %d", ret);
 
-	if (log[0] != 0)
-		tst_brk(TBROK | TERRNO, "Failed verification: %s", log);
+	if (log[0] != 0) {
+		tst_printf("%s\n", log);
+		tst_brk(TBROK | TERRNO, "Failed verification");
+	}
 
 	tst_brk(TBROK | TERRNO, "Failed to load program");
 	return ret;
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
