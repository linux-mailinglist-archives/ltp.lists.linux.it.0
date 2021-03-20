Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 997FA342E51
	for <lists+linux-ltp@lfdr.de>; Sat, 20 Mar 2021 17:20:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4DF363C95AD
	for <lists+linux-ltp@lfdr.de>; Sat, 20 Mar 2021 17:20:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 2380B3C5FF1
 for <ltp@lists.linux.it>; Sat, 20 Mar 2021 17:20:12 +0100 (CET)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5C85C600835
 for <ltp@lists.linux.it>; Sat, 20 Mar 2021 17:20:12 +0100 (CET)
Received: by mail-pj1-x1029.google.com with SMTP id
 a22-20020a17090aa516b02900c1215e9b33so8205602pjq.5
 for <ltp@lists.linux.it>; Sat, 20 Mar 2021 09:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k+CGA5zgfLZ8rB8tEUJcdpYlg78JBa+WmUwi4ZEBVVY=;
 b=GIJjP0LeDLqrFLGRSb7dEEbc6W9jj3/+YvXBWyEowy2xcy2RyI76lxPmRhTQVjDPhn
 mz2Px21O8DNF8D+zm9WI83f27nzReUezzTP2o2dXSxaJtd87hx95Ly7H8Tr8lM0G/MXW
 hQk/g8i42VQ+4sDOvY6kSQhPMDqDKo8VJ0YKrzDcZ2L/pDIZuPSBgzon2OBHupVn5Zbm
 LxQnHD5s5XE9DKuPUSjJ4dq5fFG4oWAM92gfYFUYr+/vA4IfDTwbk2skkOEMBPt0qYUZ
 WWA7PvFSMoH4zIdLiCjGi9g9wgOW9iQm8KiXnt9uEai2haW41LdKttty4tdYSlJjDakR
 LGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k+CGA5zgfLZ8rB8tEUJcdpYlg78JBa+WmUwi4ZEBVVY=;
 b=SqJpk3rFqcobVw6PuLbRQmWbpofab+J3aTOh6rPtHvI4BAsqlE99btWYhADATTYN5U
 OBUXc/kkgfMz+vlzUVp1ovV7vONhXt4V8TX8Fz1aUdV9E/TuXt09tOPI98huWVjZru/t
 6dcdWVQNi6B7HoonFLOhL5DxdWZdbJn0dxqY4iaHcS6u6TJ97UfXf4gap4hBwkebkq48
 jmkaVpkxbxYrk4B/5i61DarQr2uc3DlNfTwYSrDcbWEGM02QlR2Wc6tRR0Cge5NG/vJb
 ftrBH0zCV6Z33sE2i0mE0i+8UVZevG4FiWFbYVHT5z9B4Lqz2xKGIcM7ywUxKes5BInF
 jNfg==
X-Gm-Message-State: AOAM532bJ19e0Yaiya2m+NMj7xZ3LIuZtSfqENUxToiy4ZWzCJxHuXDU
 jMvhsV6pugGmyvPik2N8VcvgutbLaGk=
X-Google-Smtp-Source: ABdhPJyFjD2lhXdAKt/5K1zZgLawpaBUwtekwrZlK2cKwwwB3F6LM7uY6BIhRbXW0qcXLy9nNOELbg==
X-Received: by 2002:a17:902:850b:b029:e6:bb9f:4bd9 with SMTP id
 bj11-20020a170902850bb02900e6bb9f4bd9mr19548243plb.41.1616257210621; 
 Sat, 20 Mar 2021 09:20:10 -0700 (PDT)
Received: from localhost.localdomain (softbank126008192101.bbtec.net.
 [126.8.192.101])
 by smtp.gmail.com with ESMTPSA id m6sm5793168pfb.111.2021.03.20.09.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 09:20:10 -0700 (PDT)
From: QI Fuli <fukuri.sai@gmail.com>
X-Google-Original-From: QI Fuli <qi.fuli@fujitsu.com>
To: ltp@lists.linux.it
Date: Sun, 21 Mar 2021 01:19:33 +0900
Message-Id: <20210320161933.2088737-1-qi.fuli@fujitsu.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/swapoff/swapoff01: remove the check for BTRFS
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
Cc: QI Fuli <qi.fuli@fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: QI Fuli <qi.fuli@fujitsu.com>

remove the redundant task as BTRFS is checked in is_swap_supported()
Fixes: eadffb391("syscalls/swapoff/swapoff0{1,2}: use helpers to check
	support status")

Signed-off-by: QI Fuli <qi.fuli@fujitsu.com>
---
 testcases/kernel/syscalls/swapoff/swapoff01.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/testcases/kernel/syscalls/swapoff/swapoff01.c b/testcases/kernel/syscalls/swapoff/swapoff01.c
index 87a217a89..1a707625a 100644
--- a/testcases/kernel/syscalls/swapoff/swapoff01.c
+++ b/testcases/kernel/syscalls/swapoff/swapoff01.c
@@ -34,8 +34,6 @@ static void verify_swapoff(void);
 char *TCID = "swapoff01";
 int TST_TOTAL = 1;

-static long fs_type;
-
 int main(int ac, char **av)
 {
 	int lc;
@@ -56,11 +54,6 @@ int main(int ac, char **av)
 static void verify_swapoff(void)
 {
 	if (ltp_syscall(__NR_swapon, "./swapfile01", 0) != 0) {
-		if (fs_type == TST_BTRFS_MAGIC && errno == EINVAL) {
-			tst_brkm(TCONF, cleanup,
-			         "Swapfiles on BTRFS are not implemented");
-		}
-
 		tst_resm(TBROK, "Failed to turn on the swap file"
 			 ", skipping test iteration");
 		return;
--
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
