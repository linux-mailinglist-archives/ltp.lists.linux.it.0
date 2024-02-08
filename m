Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F397F84D799
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Feb 2024 02:33:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1707356005; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=XpwRD+vEY+6CZ5usHYae23qBjIrtiEDRLReYcZonULE=;
 b=JhrdsuOWO6Bcz3fH1qDRnS4FQRxrvi2TX7HjUXOUlatEX+m5mIy4Mayw/qkmSgrt4FSP6
 OW7JssW1PCjrwevTK0jvkypYRhTHV29k6YBdAYA2GCqbRuWl1J92L9FLA602V/as9DZk2Zo
 IBDEFZm5RNcXss84QDjdjOmjqrjvqMY=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AAFFD3C008C
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Feb 2024 02:33:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 31F9F3CDED4
 for <ltp@lists.linux.it>; Thu,  8 Feb 2024 02:32:52 +0100 (CET)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8FAA7207241
 for <ltp@lists.linux.it>; Thu,  8 Feb 2024 02:32:51 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d066b532f0so19775081fa.1
 for <ltp@lists.linux.it>; Wed, 07 Feb 2024 17:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1707355970; x=1707960770; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e0/mcabtedNA38OO5RRa83KGWg7O6hfFSk3n0wWGypE=;
 b=SLk+TsR1Tcaliy9SW/N4lWh0yr2EETT8lRWRxUzyCmOJD1IwydC127ODdUBbkXYLFj
 CuGoC8jijrkBW5y03cqHDE+dzZBrRsD1/sMx2FHi9hz2R0Sh+ZF5EdSJFBIx6xlUU4BX
 JQ+neWfR2RCHCE0Zsax9YBJNE5H6upc2uQXIQm97osIseDjpN/NU6ITtvfwg+nIE2CYu
 PYt+ZSOFTN3NlSSOSHD0IUpIljJ+Z5yD4Giun0t+FxXZ0Vi31ROXo1t6zcoSpwsTmFZf
 3GG2myikh1urxI/bjdv8lfo+ZCEIQ1pfgEGtDUGAkH7aqoIJAEcSVhnazILvRhF/aYPZ
 yp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707355970; x=1707960770;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e0/mcabtedNA38OO5RRa83KGWg7O6hfFSk3n0wWGypE=;
 b=EM7Gc2nEoKS3adQuFmARPrpYGWuiibyVv45STR3hHuFapZRaOuLXY17qNG8zuk/sJx
 MyHRqHwKwyoaWVmG8RlIGjN9+tcv/lJWUVyED/L5g8EnXmK43wt8Jy9lbI6CV0n68B8k
 J76xjwqW6PPxymmJ/SqNCFNlXZ3mbFucFtz7S28zDWK9b1CJM6X1hwYqL62IkQdJeGP6
 3ZSSnSFGNxl2zUrmbH02YZxT53YNlpUu40sOt9aecxyNh5cdosGIHn9DZoMuf5j072nu
 0emfFjYSvY2TwT+yXr1zRMYuFxV8VZWeZp5aAecYx2+pQ+qoxy4nlgknBepzu42InkwG
 cbyQ==
X-Gm-Message-State: AOJu0YxotD6zkvSOfiuTP6BilK9Jt31QkZdZ0pWurc+l81lg13tt2AGg
 nCjh9OGmSgo7oulkTMCAqyuvHcMejyWtpfi7lGNIGlauoB3knqYP+nBhwIrtqb0nOix0y9y/bE8
 =
X-Google-Smtp-Source: AGHT+IGiF47L5hK3EMuc29/mqEeYI966oWvB2hZD1LRPRgRh0PFrz6ctlbkJAWTl672Yld1RKlQAHA==
X-Received: by 2002:a05:651c:c90:b0:2d0:ca46:46be with SMTP id
 bz16-20020a05651c0c9000b002d0ca4646bemr4042341ljb.20.1707355970708; 
 Wed, 07 Feb 2024 17:32:50 -0800 (PST)
Received: from localhost ([223.72.87.18]) by smtp.gmail.com with ESMTPSA id
 y29-20020a056a00181d00b006dfb8105235sm2346561pfa.112.2024.02.07.17.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 17:32:50 -0800 (PST)
To: ltp@lists.linux.it
Date: Wed,  7 Feb 2024 20:32:23 -0500
Message-Id: <20240208013224.859-3-wegao@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240208013224.859-1-wegao@suse.com>
References: <20240117125227.24700-1-wegao@suse.com>
 <20240208013224.859-1-wegao@suse.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v4 2/3] shmat02.c: Use TST_EXP_FAIL_PTR_VOID
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
 testcases/kernel/syscalls/ipc/shmat/shmat02.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/shmat/shmat02.c b/testcases/kernel/syscalls/ipc/shmat/shmat02.c
index 53cb6f542..3ad1fd08e 100644
--- a/testcases/kernel/syscalls/ipc/shmat/shmat02.c
+++ b/testcases/kernel/syscalls/ipc/shmat/shmat02.c
@@ -44,20 +44,7 @@ static struct test_case_t {
 
 static void verify_shmat(struct test_case_t *tc)
 {
-	void *addr;
-
-	addr = shmat(*tc->shmid, *tc->shmaddr, 0);
-	if (addr != (void *)-1) {
-		tst_res(TFAIL, "shmat() succeeded unexpectedly");
-		return;
-	}
-
-	if (errno == tc->exp_err) {
-		tst_res(TPASS | TERRNO, "shmat() failed as expected");
-	} else {
-		tst_res(TFAIL | TERRNO, "shmat() failed unexpectedly, expected: %s",
-			tst_strerrno(tc->exp_err));
-	}
+	TST_EXP_FAIL_PTR_VOID(shmat(*tc->shmid, *tc->shmaddr, 0), tc->exp_err);
 }
 
 static void do_shmat(unsigned int n)
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
