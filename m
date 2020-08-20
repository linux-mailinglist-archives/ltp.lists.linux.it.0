Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A6924ACBA
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 03:52:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DD4FD3C5842
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 03:52:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 577963C2FBD
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 03:52:22 +0200 (CEST)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id F07D520027D
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 03:52:21 +0200 (CEST)
Received: by mail-pg1-x542.google.com with SMTP id x6so380282pgx.12
 for <ltp@lists.linux.it>; Wed, 19 Aug 2020 18:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=69vfUi3k/mIq67a1Z+iXDQCBeg8m4wbqp/eqw/xLnvk=;
 b=S3DN5H0ZRE+NSxD811aI3SIfo4dXJxzYv1fJIQ2TuoRQVn1/njAHh8Qpx9Z4NbtqDN
 Gkepd7knclOc9xkZawgU+j2x6pGFrtrzwEfLQvH0l7x/mWVUPjDqFuiYgGOAlsM8QGf6
 huC5Qhf08Z73Z4gyRhehO5Gk7OmUyFMIsKnlBh+X4FxGAqyPjRKxq0MJR6Ih5r4f0bij
 54z3Ewgqqyka6lA80pjLE6ny7mqkBCSg69ETzV05+o9f0NkwNBlTzR9rzgILqRTKPqXQ
 TT0YsoZxQVJf4sw8TI1lPWwdza++Q1ABYuiZCHhrZfULj2xWYIJIeHN+knktOp5RUhRj
 rCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=69vfUi3k/mIq67a1Z+iXDQCBeg8m4wbqp/eqw/xLnvk=;
 b=eR3bXwMA+XWTLwbr2fbp0b7j81Q3+vm/3/H/7pw/MVPZ/ZpDpHYqjwR9QcNQIST61Y
 rfTfSvJX141JRFe9IlL7qzgzNFO4yBqatnBBuTWRdbvrdCMi7KOaMQ2MI4/QfWRWELp2
 jePI9/ZRI1xZ5PYUTVxMSxWrPRsa7rG2i0+3ud5WngjAWHf5jZ3lexRrzq5htoaaV+db
 9tNdfwg90EJcYTf18g5K0rcIR3eDpxjPsCykJ2TNAPJwJfy5Zv9mIJFBRVE7jJ3Si8WG
 MgDYuF/+/KVatu3YISX3Cud2apmG30NYWq6zyt4SRI6gw1wQZzD59a4vU+GNrHBYTi1e
 SOnQ==
X-Gm-Message-State: AOAM533ea9jm3tmA4XbQNYyL66Fd+NU/fY+rT634BYfaAkWkwjamaCT7
 JvR2pNBp14rDu6am+EI8/fKTaljimdmw7g==
X-Google-Smtp-Source: ABdhPJyUAPEPmItk9KRbwWHXatPC1zL2vF8befTluUPOmlqtdeWciKLnPVACPfUWbT3O2/x76DUO4w==
X-Received: by 2002:a63:af01:: with SMTP id w1mr872225pge.23.1597888339130;
 Wed, 19 Aug 2020 18:52:19 -0700 (PDT)
Received: from localhost ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id n1sm574893pfu.2.2020.08.19.18.52.17
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 18:52:18 -0700 (PDT)
Date: Thu, 20 Aug 2020 09:52:11 +0800
From: Murphy Zhou <jencce.kernel@gmail.com>
To: ltp@lists.linux.it
Message-ID: <20200820015211.u7xdye5ggbe34fsp@xzhoux.usersys.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] setxattr03: TCONF if failed to set immutable flag
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

Instead of TBROK, probably the underlying filesystem not support this flag.

Signed-off-by: Murphy Zhou <jencce.kernel@gmail.com>
---
 testcases/kernel/syscalls/setxattr/setxattr03.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/setxattr/setxattr03.c b/testcases/kernel/syscalls/setxattr/setxattr03.c
index 58ee0f880..b2de3bc79 100644
--- a/testcases/kernel/syscalls/setxattr/setxattr03.c
+++ b/testcases/kernel/syscalls/setxattr/setxattr03.c
@@ -138,8 +138,8 @@ static void setup(void)
 	/* Create test files and set file immutable or append-only */
 	immu_fd = SAFE_CREAT(IMMU_FILE, 0644);
 	if (set_immutable_on(immu_fd))
-		tst_brk(TBROK | TERRNO, "Set %s immutable failed",
-			 IMMU_FILE);
+		tst_brk(TCONF | TERRNO, "Set %s immutable failed, "
+			 " maybe it's unsupported", IMMU_FILE);
 
 	append_fd = SAFE_CREAT(APPEND_FILE, 0644);
 	if (set_append_on(append_fd))
-- 
2.20.1

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
