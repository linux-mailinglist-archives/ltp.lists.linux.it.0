Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB4216B9B8
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 07:27:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6153A3C261A
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 07:27:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 3FFBD3C0428
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 07:27:07 +0100 (CET)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5B6B1600FF6
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 07:27:06 +0100 (CET)
Received: by mail-pj1-x1043.google.com with SMTP id m7so706574pjs.0
 for <ltp@lists.linux.it>; Mon, 24 Feb 2020 22:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TAoBkOxUmCWgYDeZ5FxyGtBRycjCo3OGFq7lUDf1MRc=;
 b=hIhYs5SeSO9w3kGp6r0nM2ISIBC1Ur0Jr40CwsbYlCo6OoFzCBvGd/O7eve4rsWY2r
 9qK5rY9ggPOGs4ka72ShjsZuWQ7kBVwVd14IiZNpvZ3UogHIjkv9rpTarMD5iE5ObpkP
 BfIxvB3isdIy9Yz/NSHWpOdKruMMZUYpvJ/x+rvKCX/fRtUWvI55KmBTXyXV6kd5/Vqh
 +u5HK6mSEXKk0Cac4CFe6NAMptdxxn+tXmA5OBktbC75ZcGj43UBdu4Spzk6Re3Evpia
 JzmEqTk6PBjCk3i8WyRLcflWz2lyX7jIBISOGbESMJBABHoFe7+AjGk5v8Pk0Kt9C9Sp
 lBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TAoBkOxUmCWgYDeZ5FxyGtBRycjCo3OGFq7lUDf1MRc=;
 b=FIAxqsWFwmAsxiBOgUWPM55uvgmw0UDjDP1OCw711+fVawsafoh2nXNAOux10Qdx8x
 9F2/emscUdDr4ncNxxGKFJZJEgtiXJ/jzQat3RWNEbD63cCj/Bss3YLXeXLUBor7k/GP
 6XV6P5QHK582Nfv3s13vmySCjbVIPONlYav9Ggktc4gPKDfjAuFep6D52VdUT6TS1BmP
 orXrYQRLt8MNkX65zRlemOt8Xhob0eL3OVEQrK7qpmzJBqmm+1NQDWCc4Bg4bksTZD/F
 rpdK8sgkq1JuOBpTHJxa1wFoSH/QujtZSCF3B8LMDHvb0XSo6vb2ehWe43meIjvZlxVn
 NoQA==
X-Gm-Message-State: APjAAAUkmI0iDpeXilMagcQ1cdM6eva7Vm3mNMc8Mp8zh5domCGFs0ev
 4p1pOBsXfgw4UuBJ3vK8bchDZtxHOZg=
X-Google-Smtp-Source: APXvYqyTB+bJ8IyARO1tmw+Ix7JkUILIT8IynN2XJ8VyZYLetKPp3W+kH/p06IOxpeTZUNUawUBGEQ==
X-Received: by 2002:a17:902:8e84:: with SMTP id
 bg4mr51962426plb.11.1582612024162; 
 Mon, 24 Feb 2020 22:27:04 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id u12sm14908649pfm.165.2020.02.24.22.27.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Feb 2020 22:27:03 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 25 Feb 2020 11:56:54 +0530
Message-Id: <54a3d6fcef8cfed89a1e4f0b56717f56aa502293.1582611994.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/pidfd_open: Continue with rest of the tests
 on failure
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

With tst_brk(), the tests end immediately while what we want to do here
is to test rest of the failure tests. Use tst_res() to report result and
continue with rest of the failure tests.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../kernel/syscalls/pidfd_open/pidfd_open02.c    | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c b/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
index d73b5326b3b1..533270da3dbd 100644
--- a/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
+++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
@@ -35,17 +35,15 @@ static void run(unsigned int n)
 
 	if (TST_RET != -1) {
 		SAFE_CLOSE(TST_RET);
-		tst_brk(TFAIL, "%s: pidfd_open succeeded unexpectedly (index: %d)",
+		tst_res(TFAIL, "%s: pidfd_open succeeded unexpectedly (index: %d)",
 			tc->name, n);
-	}
-
-	if (tc->exp_errno != TST_ERR) {
-		tst_brk(TFAIL | TTERRNO, "%s: pidfd_open() should fail with %s",
+	} else if (tc->exp_errno != TST_ERR) {
+		tst_res(TFAIL | TTERRNO, "%s: pidfd_open() should fail with %s",
 			tc->name, tst_strerrno(tc->exp_errno));
-	}
-
-	tst_res(TPASS | TTERRNO, "%s: pidfd_open() failed as expected",
-		tc->name);
+	 } else {
+		 tst_res(TPASS | TTERRNO, "%s: pidfd_open() failed as expected",
+			 tc->name);
+	 }
 }
 
 static struct tst_test test = {
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
