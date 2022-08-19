Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 746DE59A7B0
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Aug 2022 23:32:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 96C9D3CA2BD
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Aug 2022 23:32:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 51D113C88EB
 for <ltp@lists.linux.it>; Fri, 19 Aug 2022 23:31:59 +0200 (CEST)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D1ADC1A00099
 for <ltp@lists.linux.it>; Fri, 19 Aug 2022 23:31:58 +0200 (CEST)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-3360c0f0583so95765227b3.2
 for <ltp@lists.linux.it>; Fri, 19 Aug 2022 14:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:mime-version:message-id:date:from:to:cc;
 bh=qIVVOqLKP+4STWaNOKzfOvhUaS89cnCskFF5wp8EmDY=;
 b=pnFNJ7pxqKJm1V24glJE3OON2uBfQnevU2pOG5Uiv3zeI5Trr7AtuLeLDaOYzt9YWR
 pNhj+I2XTpvxO15sy8wX3fNr7XDaxyrOk6nLHiTD2r+dtITmpBR85dcHrKYtDo1HZhdY
 2dm+qEva7aCa4EXIuXIh2sU30al8fZK/TQ5ZPhvK0N+BANj83/gwAR+JwsyLNr4Eb4/I
 bezT+bvaqz7jTew7G+4U+BT6sHUtIXUC46KeM7alV6RqXmZ2zTEAdqQKG+mpGoh393Ed
 domV+bEvWXwvCAHIuAHmBRcxuCiuOzwPd+WUpmG8KuvyZO+m0O84CC2gHLXXSg+j0tU4
 gnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
 :from:to:cc;
 bh=qIVVOqLKP+4STWaNOKzfOvhUaS89cnCskFF5wp8EmDY=;
 b=t1iSgQ7+fjSuUOZ482O2EKwsUPRptNd2lkS9kO1RjA5xCB/juhMZwkQJKocUlj9Og1
 y221+sIIlyXhPbyN7XLuJqRCpyAPY5+LSLoRVhg/KOsQKxLNA8uHYLBmsrbltqmsE+QJ
 z+jjfijQ/9Af6pORzw6RKJpxo2DEmGPVuvq1tyLGR8AzeMM3ckDXfvbXUhHe4RlIxnT8
 9ClYMJT4COd1rISCNXorqP8zRXwRhEmeNX3pOacToZSTaL+OPKPuH+y/jmXEcOJmqc4W
 kGucIV8C+r5TmEs3+qF7XrQhykzmjAuVACz0jG3fG3xkNvh9Y3KIUC1jalDcUmEHyNG8
 Ltow==
X-Gm-Message-State: ACgBeo2T4rlgNX5BuRVhMIu5V2O2kGGhKVk/pGND/ib8FkQb10dPgb6Y
 PG+uLaMKaEwyxYPteFk78OyKDlkiubySJGqwKZaKEr22EpIYZ+cu+Vcth5zx2eUN6WpdxCP55pQ
 3Z2I8BvmRndi3vVJLHG3BzAtMYz46/j7FcyVL+Ib1+1V5yXp3il/QZuaZ
X-Google-Smtp-Source: AA6agR5l4D/U4zHlJ6UBlNOXsFmOxa8j75qz7N0jUHD4HvtDbHohxLvfX6iRjNk/FqsKSJFJpjAy3Qa9yvc=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:4be])
 (user=edliaw job=sendgmr) by 2002:a25:cf4b:0:b0:68e:fea1:9fdc with
 SMTP id
 f72-20020a25cf4b000000b0068efea19fdcmr9548354ybg.643.1660944717464; Fri, 19
 Aug 2022 14:31:57 -0700 (PDT)
Date: Fri, 19 Aug 2022 21:31:48 +0000
Message-Id: <20220819213148.1995580-1-edliaw@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.609.g9ff673ca1a-goog
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscalls/signal06: loop being clobbered by syscall
 on clang
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

Indicate to the compiler that the syscall will modify registers rcx
and r11 to prevent loop from getting clobbered.

Signed-off-by: Edward Liaw <edliaw@google.com>

---
When I combined the asm instruction into one line, it threw an error
that the "Asm-specifier for input or output variable conflicts with asm
clobber list" for rax.  I omitted it for now, but I'm not sure if that
is correct.

Also, is it ok to change the subject line like I did?
---
 testcases/kernel/syscalls/signal/signal06.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/signal/signal06.c b/testcases/kernel/syscalls/signal/signal06.c
index 64f886ee3..fba380610 100644
--- a/testcases/kernel/syscalls/signal/signal06.c
+++ b/testcases/kernel/syscalls/signal/signal06.c
@@ -72,8 +72,7 @@ void test(void)
 	while (D == VALUE && loop < LOOPS) {
 		/* sys_tkill(pid, SIGHUP); asm to avoid save/reload
 		 * fp regs around c call */
-		asm ("" : : "a"(__NR_tkill), "D"(pid), "S"(SIGHUP));
-		asm ("syscall" : : : "ax");
+		asm volatile ("syscall" : : "a"(__NR_tkill), "D"(pid), "S"(SIGHUP) : "rcx", "r11");
 
 		loop++;
 	}
-- 
2.37.2.609.g9ff673ca1a-goog


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
