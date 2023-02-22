Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC4669EC56
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Feb 2023 02:23:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D47323CBCC6
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Feb 2023 02:23:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D163A3CBC76
 for <ltp@lists.linux.it>; Wed, 22 Feb 2023 02:23:42 +0100 (CET)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E192720032E
 for <ltp@lists.linux.it>; Wed, 22 Feb 2023 02:23:41 +0100 (CET)
Received: by mail-pl1-x64a.google.com with SMTP id
 p14-20020a170902e74e00b0019ad833d8a4so2890891plf.15
 for <ltp@lists.linux.it>; Tue, 21 Feb 2023 17:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=BFJBWZfUrc7kCMGTVTYRzzXQYgGUepeWQh/AqXUnsB0=;
 b=ZIF2BwVrfLgSdamWff9I3K3cheuMgL085qm5mHrINW/yxzLCxgLTzdrdeNussBPqYf
 BTRj4PsWdK36p37t+vRi2WaLRkhthX1d+aZeJGtn5lZsnQaCZPM9XI7uwCTTON3J/rqo
 WYOKeDq0p0DBp52Geh7QNYOx066aIzzcdDRQtjlqQMjSjUSM6/FuwkkL/sDYa7komAVw
 N1jxvrtCYOoqREtvRE+NJbPJX9acEhwEB1ic9x70UWdcdhhNKoAMkm15PyHB7xf7qHtJ
 V3pwd4E/exM025XTFdy+RUl5FBIVP30ZMyEQp6QU0Gurpbvte8rLmBy0ofFv0aWfU7Dv
 eing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BFJBWZfUrc7kCMGTVTYRzzXQYgGUepeWQh/AqXUnsB0=;
 b=NHpN8X/hq41oWgVyy2TCp6DiS/iMTrdzqRfbALy9vUoweDv02vhLr4PdO6G1WQlQCw
 w64XPj2j2GCFjStu/v9hP1ErCHkIfvi1hbQRBtGl1+5NKi2smekj8wMQZOrFrvPT4/1M
 K0T09oDWsNFv+GTwCuWyRg8QlobqQqX3thKSu93ryalndSiQ3yZWZVz10fZJnKoL5Yai
 hP9EX5nbCDv1l34xOp1X7QcfNF01VOH/7LpA3vvNnWk8LYmgQGvqQQ2cUPXwDdotr7PC
 AxiY/VV00aloRX3y3plB847oNIy2xe65AR0gagtMQhKOqcFn6gZ2RzpTJbKcQB8U4M5s
 6WPQ==
X-Gm-Message-State: AO0yUKUh1ISv7lsICdx3+O5DBNx59LhUvWFXZNUCKhHZNyjOmyEwuXpl
 CIMW69szA8YnLwLFdnZT/OF+zeppWDPcxrtctRC2e8lVcVC/nBS5yRhNHVNbkz2Rr0kHp/KTDn/
 0FKbnltmGrApmi8ICIyzIhgFOGLKHbFS8KUDZxdprKpDI4btedGkso7Xq
X-Google-Smtp-Source: AK7set/nyYMsfBglYU58MM9DwNyAyVefyPUnY7ahsIMjiaYG6OlZCGoYZAPtFXScuUr8z6u2NxzBW57IXNE=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:90b:4d0a:b0:233:af79:71ac with SMTP id
 mw10-20020a17090b4d0a00b00233af7971acmr715451pjb.125.1677029020109; Tue, 21
 Feb 2023 17:23:40 -0800 (PST)
Date: Wed, 22 Feb 2023 01:23:37 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Message-ID: <20230222012337.1572476-1-edliaw@google.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscall01: use 32bit syscalls if available
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
From: Edward Liaw via ltp <ltp@lists.linux.it>
Reply-To: Edward Liaw <edliaw@google.com>
Cc: kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

With CONFIG_UID16 disabled and this test compiled as 32bit, it will fail
to find the 16bit syscalls for getuid and getgid. Instead, use the 32bit
calls if they exist to match the behavior of glibc.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 testcases/kernel/syscalls/syscall/syscall01.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/testcases/kernel/syscalls/syscall/syscall01.c b/testcases/kernel/syscalls/syscall/syscall01.c
index 167e6ee86..76e793221 100644
--- a/testcases/kernel/syscalls/syscall/syscall01.c
+++ b/testcases/kernel/syscalls/syscall/syscall01.c
@@ -37,7 +37,11 @@ static void verify_getuid(void)
 	uid_t u1, u2;
 
 	u1 = getuid();
+#ifdef SYS_getuid32
+	u2 = syscall(SYS_getuid32);
+#else
 	u2 = syscall(SYS_getuid);
+#endif
 
 	if (u1 == u2) {
 		tst_res(TPASS, "getuid() == syscall(SYS_getuid)");
@@ -52,7 +56,11 @@ static void verify_getgid(void)
 	gid_t g1, g2;
 
 	g1 = getgid();
+#ifdef SYS_getgid32
+	g2 = syscall(SYS_getgid32);
+#else
 	g2 = syscall(SYS_getgid);
+#endif
 
 	if (g1 == g2) {
 		tst_res(TPASS, "getgid() == syscall(SYS_getgid)");
-- 
2.39.2.637.g21b0678d19-goog


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
