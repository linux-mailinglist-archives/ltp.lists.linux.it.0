Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C84358B18BE
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Apr 2024 04:04:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1714010690; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=FlVwGnO1iE3Hy/Q/8g6mRwzSxGZaX4grK8XGLg1gN9g=;
 b=GlXdLzk1PnZsPdZSqAOi+zacNnMlyelySvy1Eru5cBKpG7QK7baEoGKTXUcYehQ9uZIXJ
 clLwntrcsRYyCXQ9F0SwfJN2ED08MDuG9MB39904ZqrwzA+QYqg0/CL0tfqNbRbfTKi2m80
 ZJbfAUg96zxZZRpIaPxM7uQb6RMXN7E=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 84E703D0090
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Apr 2024 04:04:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6F5133D0095
 for <ltp@lists.linux.it>; Thu, 25 Apr 2024 04:03:47 +0200 (CEST)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E43C61A00CA1
 for <ltp@lists.linux.it>; Thu, 25 Apr 2024 04:03:46 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41af670185fso3977075e9.0
 for <ltp@lists.linux.it>; Wed, 24 Apr 2024 19:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1714010626; x=1714615426; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hthddeXdDX4HlLtL2gO6Ql5wzxDqoyVRkLEcC4crn/E=;
 b=IMkWZWTUsWU7+uID+nBYdtdbpeYCAvG2Ibbh6DRT8ZZYWoQQiTzxkLZ4F4ipcDl6C3
 iUGAM8dj8diQToiE0OivWAVHbowOEeaOeYypua+7A//+pqdAslV6Vfz5rZ5xo/NdOipz
 IfqFNaPm2fp7LtUyiU1W+9pKMkp00NyevjHDRbpexRDgi7+Q+Nqpbuqf8ncB17TmwnBG
 LLmMYZmDgiGM3injPD+G/qHO3Y4zJ8l/eIJY3nFr5oUTJ6DXvfPrFeercWQxMG+0hYP4
 M/YAmNoiJZ0cs0g52jAPZf1rJI4hUXpRBBlMJ8tUCxw90R3GxgQb2U1u0y61v5SflDIn
 ALFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714010626; x=1714615426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hthddeXdDX4HlLtL2gO6Ql5wzxDqoyVRkLEcC4crn/E=;
 b=fkyh6qGKBAyfhmQZzI+BM/AboaQL7CZysH1uBwTCkzMZWgSHJ8KRXo5DxkgmD45oOt
 8kC840tQIug29ckgEcMa7JIW9iycpGlqjnn1x0Iuo3IZXW1uH+/aKlyZaTuZaZ6sRpAQ
 ft7B5NQPn5L5DVsM9FyQ/+QgZ3cXQLt+9pvDOIvFf0WaGhRCTWIc7WL7qHXNK8W5OeeE
 0/rl6WCvM65PP6R5DNOHmYQhpTruBmeUo8IUin6ZXDwlKn25BYP1HjuimIsTRUjaWKs8
 JkOxQlSenN0iujaU9Sp6QsF8SGB70IZzTbLjo+BHBystEcx2emn69H9vIXBV2eOSki5w
 hwJg==
X-Gm-Message-State: AOJu0YxBl7SmNF67/wfkZPgoEua5kE/fclPERNwmpFJJG26pF9UGrP7a
 bjmdwHMlGY+PNFP12eXETSVtftFBWNGCEPS8vsjDaLZTvDcPrHquV9VV4aDIYV+4gUIY+4LbeKU
 =
X-Google-Smtp-Source: AGHT+IFq+6zzTtn5CZA8P/XMroG9sGPfZEUfzv8jwMV6ixHzO8ExyhnofhhEU7rjl0QKJahFH0ENzQ==
X-Received: by 2002:a05:6000:d10:b0:345:edfd:9529 with SMTP id
 dt16-20020a0560000d1000b00345edfd9529mr2894384wrb.29.1714010625948; 
 Wed, 24 Apr 2024 19:03:45 -0700 (PDT)
Received: from localhost ([2a07:de40:b240:0:dc1a:df90:dc1a:df90])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a5d49ca000000b0034bfc32a4f6sm743948wrs.48.2024.04.24.19.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 19:03:45 -0700 (PDT)
To: ltp@lists.linux.it
Date: Wed, 24 Apr 2024 22:03:08 -0400
Message-Id: <20240425020308.25367-4-wegao@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240425020308.25367-1-wegao@suse.com>
References: <20240415025100.2103-1-wegao@suse.com>
 <20240425020308.25367-1-wegao@suse.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 3/3] sbrk02.c: Use TST_EXP_FAIL_PTR_VOID
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Wei Gao <wegao@suse.com>
---
 testcases/kernel/syscalls/sbrk/sbrk02.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/testcases/kernel/syscalls/sbrk/sbrk02.c b/testcases/kernel/syscalls/sbrk/sbrk02.c
index dc344577e..08cbdf367 100644
--- a/testcases/kernel/syscalls/sbrk/sbrk02.c
+++ b/testcases/kernel/syscalls/sbrk/sbrk02.c
@@ -19,21 +19,8 @@ static long increment = INC;
 
 static void run(void)
 {
-	TESTPTR(sbrk(increment));
-
-	if (TST_RET_PTR != (void *)-1) {
-		tst_res(TFAIL, "sbrk(%ld) unexpectedly passed and returned %p, "
-						"expected (void *)-1 with errno=%d",
-						increment, TST_RET_PTR, ENOMEM);
-		return;
-	}
-
-	if (TST_ERR == ENOMEM)
-		tst_res(TPASS | TTERRNO, "sbrk(%ld) failed as expected", increment);
-	else
-		tst_res(TFAIL | TTERRNO, "sbrk(%ld) failed but unexpected errno, "
-								"expected errno=%d - %s",
-								increment, ENOMEM, strerror(ENOMEM));
+	TST_EXP_FAIL_PTR_VOID(sbrk(increment), ENOMEM,
+		"sbrk(%ld) returned %p", increment, TST_RET_PTR);
 }
 
 static void setup(void)
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
