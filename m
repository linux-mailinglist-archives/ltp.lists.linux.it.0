Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4438E2B8FDC
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 11:06:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0C42D3C4EE0
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 11:06:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 8E2673C2E8F
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 11:06:31 +0100 (CET)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C68B51A00F66
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 11:06:30 +0100 (CET)
Received: from mail-pg1-f200.google.com ([209.85.215.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1kfgpg-0003TV-SL
 for ltp@lists.linux.it; Thu, 19 Nov 2020 10:06:29 +0000
Received: by mail-pg1-f200.google.com with SMTP id z130so3623465pgz.19
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 02:06:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GIk1bnTPYeiKtdZeOI6c5S1fPs38P3yg1KDOUSxkiMo=;
 b=Bz4bAmsoTXEByY1/foxQR3k0XaDl3n8KuI5DwRH/7JJpIvJGGprbVfz3q6YCP2TCyL
 QlVw2mRVPc1J34JrkpgPHyecgM7gfBbDNtH7TRMz5qbz5IBqykKv/x4uuatE8B0dWW6b
 wXyixwZQQTO2CcZiwibykJY0fgL9iuKtC6XqLbaDNjzO+6N3O5EWb++IBHStONc5QA6j
 m4eYjyizzmOnbIhhusHv4uq7Uo3nCz0KtS3B1VEWSTYMFLpu1t+BQgTm0IV+2ZOvmwlx
 Wno9ouAfkcFa3dVYXx7upVrAmAMFjgaOkkxd0szqokC6q7M+PxadrkFiNLyLb8E7T+Dk
 F1sg==
X-Gm-Message-State: AOAM533PHUV/HImYMPkdnoJCUdQEFdM1FyYrzoQKVpOmre4LAz9eHbcS
 k6A/FX+qGhVcsBRvHcy5PScOy8dhjRHEYZuvPewsE8yZc+rIK3sKBMMIngmH5FByQc8tc/O/WtD
 1rEJRYi801nkjZSjBiiP5EdjWxoY=
X-Received: by 2002:a17:90a:d355:: with SMTP id
 i21mr3593799pjx.235.1605780387124; 
 Thu, 19 Nov 2020 02:06:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYGObIWVvGtZse5udBoPIOFQRycUDMYXCR6ZQk8rcO0D7Duw6rk52YuLZyrqjJioBFB9voaQ==
X-Received: by 2002:a17:90a:d355:: with SMTP id
 i21mr3593772pjx.235.1605780386830; 
 Thu, 19 Nov 2020 02:06:26 -0800 (PST)
Received: from localhost.localdomain (223-137-197-222.emome-ip.hinet.net.
 [223.137.197.222])
 by smtp.gmail.com with ESMTPSA id z5sm1967885pgi.27.2020.11.19.02.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 02:06:26 -0800 (PST)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it
Date: Thu, 19 Nov 2020 18:06:17 +0800
Message-Id: <20201119100617.70968-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] acct02: make explicit kernel config requirement
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
Cc: po-hsu.lin@canonical.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

With commit eeed458492cc ("lib/tst_kconfig: Validate variables"), the
kernel config check is now more strict.

In this acct02 test, it will fail on an ARM64 system running with
Ubuntu Bionic 4.15 kernel:
  tag=acct02 stime=1605709219 dur=0 exit=exited stat=2 core=no cu=0 cs=0
  startup='Wed Nov 18 14:20:19 2020'
  CONFIG_BSD_PROCESS_ACCT
  ^
  Missing value

  tst_kconfig.c:475: TBROK: Invalid kconfig variables!

While the kernel config shows:
  $ grep CONFIG_BSD_PROCESS_ACCT /boot/config-4.15.0-1087-aws
  CONFIG_BSD_PROCESS_ACCT=y
  CONFIG_BSD_PROCESS_ACCT_V3=y

Change the kernel config requirement to CONFIG_BSD_PROCESS_ACCT=y
to solve this issue.

Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 testcases/kernel/syscalls/acct/acct02.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/acct/acct02.c b/testcases/kernel/syscalls/acct/acct02.c
index fbcde0bcb..bd0427848 100644
--- a/testcases/kernel/syscalls/acct/acct02.c
+++ b/testcases/kernel/syscalls/acct/acct02.c
@@ -255,7 +255,7 @@ static void cleanup(void)
 }
 
 static const char *kconfigs[] = {
-	"CONFIG_BSD_PROCESS_ACCT",
+	"CONFIG_BSD_PROCESS_ACCT=y",
 	NULL
 };
 
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
