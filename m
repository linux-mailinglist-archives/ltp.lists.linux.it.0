Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EC15E3F1C8D
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Aug 2021 17:22:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8723D3C95A5
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Aug 2021 17:22:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 851D83C535F
 for <ltp@lists.linux.it>; Thu, 19 Aug 2021 17:22:48 +0200 (CEST)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3E264200388
 for <ltp@lists.linux.it>; Thu, 19 Aug 2021 17:22:47 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id u22so13703262lfq.13
 for <ltp@lists.linux.it>; Thu, 19 Aug 2021 08:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r6xP50cJ9aemIhj02wMD43mNssRkZ+0D7hBOxXl1MP0=;
 b=lYRAgnjQj0GOiJajdsyHwht2dAV/JgYq/8P2cu3Uj+Ymy3xLFTrD+Q70IFJVFhbMRn
 mtPRhILqnrmMYnLB7IZDj4F0uJQ/G9Gzi2bKRuJln9qcYt4LCRrwOFDfC1IEgtWunxBp
 5y7gUwNdnfHMGzupaBcln+jJ2UV5U7ReZsjb9e+KSlOIDhLOKNisjAPqozcfVYfl30J9
 /x+XclSLvu2a4WIdcRAEfr4RVFkZio3CsuLnY+U4P+iRXsXT7XNtwaCht1MuV+SqEeWB
 2N7XqGyQMDVN09ky281lH8j0hS6LFkR2P4WlK6BRMeHPtgeqxIYlnMr9LwjU0iDN32oQ
 bIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r6xP50cJ9aemIhj02wMD43mNssRkZ+0D7hBOxXl1MP0=;
 b=P3B3wfAdQH94R/Qa29ppKRAe4Ibkl56NJtBiLkueEZoxXkE0FhbR6+7FpO7Wi0u5OI
 5iUli9np7tKIz8/jmVO9PJv/z4V2DzjF/3tZRfSptbGn8Vg2y5Tr2NS4fa5TfZxCZjji
 e39uq1CDeiuPzWorVeuyUD2ikgSmCCjSTaFmR13J32lD4wtp1OS2Rw1JHSDatHfPgTwL
 70XwvmjSmRjAJQDcZz+jDCqKWN880Qkbk9g6xfz8pY5LE6PWEN8dootagEn3nXFYkosJ
 1a/qcRHudUHRILDMbC2kZiBynfejVmFP/InPrpLUR9SHzF9gKnkG3CSQgEDZzu1nxeMZ
 Tw7Q==
X-Gm-Message-State: AOAM533WaNpZ6XB8sYTZh0VAxVSRlw1FRErYpAtTyEagS+JSkCZvh8/J
 pL9vu40cqNqK799PQ30S5kTM8zx950DQ
X-Google-Smtp-Source: ABdhPJwJ5K6qjtrE/fwNRvDCx+3Gnk/fDCr08qaMY2T+OF71DsZxnh7T0Jf0tvj5OjR8pgZzPoINhw==
X-Received: by 2002:ac2:4573:: with SMTP id k19mr10854255lfm.622.1629386566460; 
 Thu, 19 Aug 2021 08:22:46 -0700 (PDT)
Received: from localhost.localdomain ([91.247.148.3])
 by smtp.gmail.com with ESMTPSA id u12sm336155lfq.173.2021.08.19.08.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 08:22:46 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Thu, 19 Aug 2021 18:21:54 +0300
Message-Id: <20210819152154.16185-1-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] lib/tst_test.sh: fix ROD_SILENT command return status
 check
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

"local tst_out=$(some_command)" always returns status 0, i.e.
not the return status of the command in the assignment, but the
status for 'local' builtin command, which creates a new local
variable inside the function.

As a result, the library calls and tests that invoke ROD_SILENT
don't actually check the return status of commands passed to it.

The old API library function is also fixed.

Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
---
 testcases/lib/test.sh     | 4 +++-
 testcases/lib/tst_test.sh | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/testcases/lib/test.sh b/testcases/lib/test.sh
index 92278d7aa..8947f47c1 100644
--- a/testcases/lib/test.sh
+++ b/testcases/lib/test.sh
@@ -233,7 +233,9 @@ tst_timeout()
 
 ROD_SILENT()
 {
-	local tst_out="$($@ 2>&1)"
+	local tst_out
+
+	tst_out="$($@ 2>&1)"
 	if [ $? -ne 0 ]; then
 		echo "$tst_out"
 		tst_brkm TBROK "$@ failed"
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index c6aa2c487..3710c857e 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -126,7 +126,9 @@ tst_brk()
 
 ROD_SILENT()
 {
-	local tst_out="$(tst_rod $@ 2>&1)"
+	local tst_out
+
+	tst_out="$(tst_rod $@ 2>&1)"
 	if [ $? -ne 0 ]; then
 		echo "$tst_out"
 		tst_brk TBROK "$@ failed"
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
