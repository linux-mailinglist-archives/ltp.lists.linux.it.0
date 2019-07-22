Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12743709FE
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jul 2019 21:44:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C50933C1C8A
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jul 2019 21:44:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 420523C0300
 for <ltp@lists.linux.it>; Mon, 22 Jul 2019 21:44:51 +0200 (CEST)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 765031400325
 for <ltp@lists.linux.it>; Mon, 22 Jul 2019 21:44:50 +0200 (CEST)
Received: by mail-pl1-x64a.google.com with SMTP id g18so20429800plj.19
 for <ltp@lists.linux.it>; Mon, 22 Jul 2019 12:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=A12thcn3+MwojQkJzSZb/BYD3KaxmIN2mdvT4/zzP4E=;
 b=FHNM4QuZzm7WL0kVyl/3oYT/tRJV/IxuhKAjTCgeqTfySm95f+WtF1lZkFb4g+hGrf
 hTAb4MwXLz41CtUq/R8qbFfo0vP0SaDlQuWOmDEgcsePJd0f/hoQ8U86B3t/R37Mr8Gr
 VA6cc/YqhctMzzlKjFpemfxZ/GEtDHb5/g0uoFYx5HPCgK8dS1IXs5Xyv08tdelNboxx
 6DbiHSv0SM7xVJLinAPYcurK3SbD/vVVG+EsyU6QMi3r8hXeOdIId3DFNiPGXNnId7DN
 CWqeetprrRkLI+f1dIzgAnmqEW/EOqjmBKp1UTT5hWeMLhdamBnhbn/1sJv6qCM2yJZW
 WPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=A12thcn3+MwojQkJzSZb/BYD3KaxmIN2mdvT4/zzP4E=;
 b=k7k7sn3sAkVQR1VIPb/I1ytp9ZvvVJM6fqq3AKw9cLy7+ucmX1AV23xwyLn/ff9jqk
 gljZiOrkPP2qdETMEN6tIPdqLUvepRSTcrpGxLpssjQ1B85I7ftiQETalw32gpXeXOgS
 kui0T0GoIuMz0newbwo4S+qu8hULqd7hM9HdUFtfVPQVlZOjUIKs7vR1Z4Vc+33VEzzF
 T6QxLdPwmvYCql5bJVS/DVJGNg2ThfhlNUwUnYDrS/mKl7fdiEEafoaL+s7RBgWFz+MF
 X9QSxNhXoXvE2H5UuACMpA1rLb2dNlrHpMXTZdZ6mScijMs4gpQJI+mI/EOFRk+ta+U6
 yosw==
X-Gm-Message-State: APjAAAUOjJ7TljBZPt5Jo/q5H3Ju6au0FovuYAbdYO+NjKo5kurmVk7J
 1ysm/Gh6wKSPUheFtSX2fnyNjvok8E2djpcjequ3T3eGapmuTpXCBYtcjP3EfdmSsOpsYyckNX5
 IjtgU3Nn0aFd8s3bBipPhzyxQC3hyuMG62C3ibo8s1YO55VfAZdIAoCVsIwY=
X-Google-Smtp-Source: APXvYqzKk+GQYvQUMZCPNRlDjX/7qynDuoqapIZIaOODvSkjP4mIWzoA3uKT8ucqL3MEXjjym18dGThzXqVr
X-Received: by 2002:a63:6fcf:: with SMTP id
 k198mr72153594pgc.276.1563824688068; 
 Mon, 22 Jul 2019 12:44:48 -0700 (PDT)
Date: Mon, 22 Jul 2019 12:44:39 -0700
Message-Id: <20190722194439.161904-1-smuckle@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.657.g960e92d24f-goog
From: Steve Muckle <smuckle@google.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/statx01: loosen the stx_blocks check
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
Cc: kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

A filesystem may preallocate blocks (ext4 does this), so even though the
contents of the file may fit into a single block, statx may report more
than one block. Loosen the test to accommodate this.

Signed-off-by: Steve Muckle <smuckle@google.com>
---
 testcases/kernel/syscalls/statx/statx01.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/statx/statx01.c b/testcases/kernel/syscalls/statx/statx01.c
index 23ea99b4a..5e705dc7d 100644
--- a/testcases/kernel/syscalls/statx/statx01.c
+++ b/testcases/kernel/syscalls/statx/statx01.c
@@ -92,7 +92,7 @@ static void test_normal_file(void)
 			buff.stx_mode, MODE);
 
 
-	if (buff.stx_blocks <= buff.stx_blksize/512)
+	if (buff.stx_blocks <= 128)
 		tst_res(TPASS, "stx_blocks(%"PRIu64") is valid",
 			buff.stx_blocks);
 	else
-- 
2.22.0.657.g960e92d24f-goog


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
