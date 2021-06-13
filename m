Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECE03A59BE
	for <lists+linux-ltp@lfdr.de>; Sun, 13 Jun 2021 19:16:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 12EC93C4D41
	for <lists+linux-ltp@lfdr.de>; Sun, 13 Jun 2021 19:16:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1191B3C2F2C
 for <ltp@lists.linux.it>; Sun, 13 Jun 2021 19:16:56 +0200 (CEST)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4876A1400330
 for <ltp@lists.linux.it>; Sun, 13 Jun 2021 19:16:56 +0200 (CEST)
Received: by mail-io1-xd36.google.com with SMTP id d9so37129805ioo.2
 for <ltp@lists.linux.it>; Sun, 13 Jun 2021 10:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/jLE6EtHaHx36bhFaCf/UiIjkG+DMuHQ2C6B/R77BtQ=;
 b=pskUs6NPkmag8A7JzFmNL5qTwGqkZ7kdWfE0GVqi1PXSRih1FS3SHJSI5BjwsTEywn
 WHXOh86y8FzgU2hFptIp21KqLfePazPvpQiev/8z1GWp3emsMr1eXQZT1L0GLjkEZWdl
 oqWBJF6dUSB3Zb3D5VbH5Ajm4vORetXsxna9HNfKQoSimTutsR5oZ3YmZ5si3nlNcGvt
 rGpQtEXi1dpYXwyXIWzCb5pcIEu28oGY0T8uxRoWYYWI0FAQKgOZJi3n/AgmZX/7JspO
 /h9C+aLAY1wXlAXrSGoutbh/Hif/ikxnXbJeoBaQKTtc/XvjJqVCf/nsUiZJrh2xogfA
 WNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/jLE6EtHaHx36bhFaCf/UiIjkG+DMuHQ2C6B/R77BtQ=;
 b=YkJ3seJMQuXYcPmDRQrhOoCOsJpLvhUVKw5s0uilKAa2NYTWH2pt9sHZsD87p+5Avp
 BuCD/fTOOdQVEj3JCuK0DCPCpen9ahgBbJrIYptMVfaJ6yVonnej0F+Fe/VGjZOLwEo2
 pYcR9YFg2Y1yvQ2EV1WhsceaykDXozGWMy2pHF62ctFjDFsUNSTKjNRDrwi4hMcylcMc
 91MwDKXiw11eKkHMcXkmEAz7KTpzFKgSyhKPDmjHxbWnPl0z32mBK3ehBkuEFiFwmd5B
 67CNzXnTeP1jv/v5tozceGDEz5avq3nZNnAw/7MyWy0fDMoSScA/rAvAdpJo2ldJSG4R
 xVZw==
X-Gm-Message-State: AOAM531S7fWlRkBCbS6WHxMC4anjJopeU32pQ8/1tZaTwYMuktxAjl0t
 QwkC53jDd3gVR6+/QZ/9oSo=
X-Google-Smtp-Source: ABdhPJy9ME1UItH3YuHXYTxvLuPE0Bq1LscWD8p88863Omd+Sd9qbF+w56sH/cbMIZFpmG8Osk8Rrg==
X-Received: by 2002:a6b:f81a:: with SMTP id o26mr3252675ioh.56.1623604615127; 
 Sun, 13 Jun 2021 10:16:55 -0700 (PDT)
Received: from vinay-Latitude-3400.wrs.com ([220.158.157.78])
 by smtp.gmail.com with ESMTPSA id j18sm6768985ioo.3.2021.06.13.10.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 10:16:54 -0700 (PDT)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: chrubis@suse.cz,
	ltp@lists.linux.it
Date: Sun, 13 Jun 2021 22:46:42 +0530
Message-Id: <20210613171642.7773-1-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <YMNqQE218QqnPiZY@yuki>
References: <YMNqQE218QqnPiZY@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.6 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v3] getrusage02: Skipped EFAULT tests for libc variant.
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
Cc: umesh.kalappa0@gmail.com, metan@ucw.cz, rwmacleod@gmail.com,
 vinay.kumar@blackfigtech.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Tested EFAULT cases only for "__NR_getrusage" syscall.

Tests for bad addresses in LTP cases trigger segment
fault in libc on a 32bit system.

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 .../kernel/syscalls/getrusage/getrusage02.c   | 42 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/getrusage/getrusage02.c b/testcases/kernel/syscalls/getrusage/getrusage02.c
index 9fc5d7dbb..2dff1a444 100644
--- a/testcases/kernel/syscalls/getrusage/getrusage02.c
+++ b/testcases/kernel/syscalls/getrusage/getrusage02.c
@@ -19,9 +19,20 @@
 #include <sched.h>
 #include <sys/resource.h>
 #include "tst_test.h"
+#include "lapi/syscalls.h"
 
 static struct rusage usage;
 
+static int libc_getrusage(int who, void *usage)
+{
+	return getrusage(who, usage);
+}
+
+static int sys_getrusage(int who, void *usage)
+{
+	return tst_syscall(__NR_getrusage, who, usage);
+}
+
 struct test_cases_t {
 	int who;
 	struct rusage *usage;
@@ -33,13 +44,42 @@ struct test_cases_t {
 	RUSAGE_SELF, (struct rusage *)-1, EFAULT}
 };
 
+static struct test_variants
+{
+	int (*getrusage)(int who, void *usage);
+	char *desc;
+} variants[] = {
+{ .getrusage = libc_getrusage, .desc = "libc getrusage()"},
+
+#if (__NR_getrusage != __LTP__NR_INVALID_SYSCALL)
+{ .getrusage = sys_getrusage,  .desc = "__NR_getrusage syscall"},
+#endif
+};
+
 static void verify_getrusage(unsigned int i)
 {
-	TST_EXP_FAIL(getrusage(test_cases[i].who, test_cases[i].usage),
+	struct test_variants *tv = &variants[tst_variant];
+
+	if (test_cases[i].exp_errno == EFAULT &&
+		tv->getrusage == libc_getrusage) {
+		tst_res(TCONF, "EFAULT is skipped for libc variant");
+		return;
+	}
+
+	TST_EXP_FAIL(tv->getrusage(test_cases[i].who, test_cases[i].usage),
 		test_cases[i].exp_errno, "getrusage failed as expected");
 }
 
+static void setup(void)
+{
+	struct test_variants *tv = &variants[tst_variant];
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+}
+
 static struct tst_test test = {
 	.test = verify_getrusage,
+	.setup = setup,
 	.tcnt = ARRAY_SIZE(test_cases),
+	.test_variants = ARRAY_SIZE(variants),
 };
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
