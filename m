Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A671411555
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Sep 2021 15:14:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3E2C33C8745
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Sep 2021 15:14:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4EC973C19F3
 for <ltp@lists.linux.it>; Mon, 20 Sep 2021 15:14:23 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9984D1400F89
 for <ltp@lists.linux.it>; Mon, 20 Sep 2021 15:14:22 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id D11AB22067;
 Mon, 20 Sep 2021 13:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1632143661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tgdRXD7Ahh3IyXeQpPS/nLIxAClTe9Yh/eVzdy2Tke0=;
 b=bcI07B5oIEjE9BtwYE3FlwDcNAKOmBLl3NFSeTCAZjDRUW/uW/9m3w6V8TuKy8T4wj6qEu
 VzSNCGGEbAE5JVmqofv3ALXJ346CQtA+UEP/8iSkaQEbjftQJwlDheeXJ/4tmy6Dcz3R76
 MSRPFFfgnYscZUR7BDJ0tahfU0yR1FI=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 8AD46A3B98;
 Mon, 20 Sep 2021 13:14:21 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 20 Sep 2021 14:14:12 +0100
Message-Id: <20210920131412.26186-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] io_pgetevents02: Pass the union member of tst_ts
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Currently we pass the whole tst_ts struct. The kernel expects the
union part of this struct.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
---

Note that because bad_addr is (void *) the whole ternary expression
becomes (void *). The tc->timeout is then also implicitly cast to
void.

 testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c
index af71e17fe..d763e150f 100644
--- a/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c
+++ b/testcases/kernel/syscalls/io_pgetevents/io_pgetevents02.c
@@ -93,11 +93,8 @@ static void run(unsigned int n)
 {
 	struct time64_variants *tv = &variants[tst_variant];
 	struct tcase *tc = &tcases[n];
-	struct timespec *to;
-	sigset_t *sigmask;
-
-	sigmask = tc->sigmask ? tc->sigmask : bad_addr;
-	to = tc->timeout ? tc->timeout : bad_addr;
+	void *const to = tc->timeout ? tst_ts_get(tc->timeout) : bad_addr;
+	sigset_t *const sigmask = tc->sigmask ? tc->sigmask : bad_addr;
 
 	TEST(tv->io_pgetevents(*tc->ctx, tc->min_nr, tc->max_nr, tc->events, to,
 			       sigmask));
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
