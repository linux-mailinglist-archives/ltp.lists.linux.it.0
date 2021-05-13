Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C7B38FE2A
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 11:50:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D6193C2BE0
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 11:50:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3E39D3C4C04
 for <ltp@lists.linux.it>; Thu, 13 May 2021 14:13:12 +0200 (CEST)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E0DEE68FF26
 for <ltp@lists.linux.it>; Thu, 13 May 2021 14:13:11 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id x19so38238829lfa.2
 for <ltp@lists.linux.it>; Thu, 13 May 2021 05:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kLL1CsFuRKDnE1Ez1NpST3aYELZmo0MkO4tWJgWOp2g=;
 b=ZjHHi2yzhjyaaGCFW6h2RyXvK1Z0CXFe8gBy9hoFYIUmgSADSPa8P1COS7EvG6D5hl
 oMMMLhAFuBu6wGGhf3ZG0v+2epGqGiJ/k3TJmzsnl+fLyA4obNv7MD1V4L/wHWPavcGw
 fqhSf1Ci1hK33PqsWsb2LKDJQACBwJfSnl7DE/8nXNAKKl2x+wWmoLaYbXCQa+frDjs7
 KxNBIJ7AR6NqbvVhPybqCdaUac4wyU0oerZrdKyFdPOVmHCVwwBkvfIEPege2RojnVPd
 CW4+DY6tqKG2/KV0sRI/rpaIFWGLi4vVR6PMcR896rpJPFrahARpP+34srZy4j3i7plu
 JZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kLL1CsFuRKDnE1Ez1NpST3aYELZmo0MkO4tWJgWOp2g=;
 b=ipos38EQD0eLTFg4aCWf3WyoPlOnR/OULSrSTEmJDRFOUucWnJ4wZ9WtP9ZnthDycl
 BFRdrbIGEtrrJgRBQjxA4xtbA4l13EcH15gt+zhyYcP33Oy0zxJtDd+0WdqopdUz9awR
 sCh0Ul3uiXlFSRu3B8fnTVt+JbV6uPq71mubbADgNP/fBDg6D4sEVffAsDVq5xZsWqaI
 V48/rYFutmkou3bFYRFXd6t92v1pCCZdlFu7nHM4mZjCq57u/USNMTpSPApGCeSQQxpB
 s5YGGBnRIxBplU6FFXdDBX5NKrGPnBM5C6S+c48PUMC6NT2UY6eWKIQXHZs3TdpxW9Os
 Dycg==
X-Gm-Message-State: AOAM533ZLjB1GwDL/EIYZDUInKQpO0npIDtxDKen0c75GniwZa1S4DzU
 aDAXUokb/lM13uziW/d3uMotoTEUsfYEGw==
X-Google-Smtp-Source: ABdhPJwZTsyuZlm5kAn0m5RZ9ecvdu1dLCq2od0o3ru1cIF8HIh0BWzG+OyVJWt6XMkTsc3gHJuk2Q==
X-Received: by 2002:a05:6512:696:: with SMTP id
 t22mr23439008lfe.581.1620907991107; 
 Thu, 13 May 2021 05:13:11 -0700 (PDT)
Received: from PC10319.67 ([82.97.198.254])
 by smtp.googlemail.com with ESMTPSA id y8sm275084lfl.78.2021.05.13.05.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 05:13:10 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: ltp@lists.linux.it
Date: Thu, 13 May 2021 15:15:41 +0300
Message-Id: <20210513121541.1235-1-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 25 May 2021 11:50:25 +0200
Subject: [LTP] [PATCH] syscalls/sched_rr_get_interval: Fix typos
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
Cc: Konstantin Aladyshev <aladyshev22@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 .../sched_rr_get_interval/sched_rr_get_interval03.c         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
index 67ad17793..0c9887f36 100644
--- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
+++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
@@ -75,14 +75,14 @@ static void run(unsigned int i)
 	TEST(tv->sched_rr_get_interval(*tc->pid, ts));
 
 	if (TST_RET != -1) {
-		tst_res(TFAIL, "sched_rr_get_interval() passed unexcpectedly");
+		tst_res(TFAIL, "sched_rr_get_interval() passed unexpectedly");
 		return;
 	}
 
 	if (tc->exp_errno == TST_ERR)
-		tst_res(TPASS | TTERRNO, "sched_rr_get_interval() failed as excpected");
+		tst_res(TPASS | TTERRNO, "sched_rr_get_interval() failed as expected");
 	else
-		tst_res(TFAIL | TTERRNO, "sched_rr_get_interval() failed unexcpectedly: %s",
+		tst_res(TFAIL | TTERRNO, "sched_rr_get_interval() failed unexpectedly: %s",
 			tst_strerrno(tc->exp_errno));
 }
 
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
