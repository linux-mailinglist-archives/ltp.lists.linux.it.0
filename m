Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 860212B8FFF
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 11:18:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 462B53C4EEB
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 11:18:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 59F5A3C2E8F
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 11:18:29 +0100 (CET)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 40DDB1000A22
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 11:18:28 +0100 (CET)
Received: from mail-pf1-f199.google.com ([209.85.210.199])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1kfh1I-0004wJ-5Q
 for ltp@lists.linux.it; Thu, 19 Nov 2020 10:18:28 +0000
Received: by mail-pf1-f199.google.com with SMTP id x26so3502401pfo.23
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 02:18:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F8E1nW4mmp5J7eCALbomfD7n3CKrLH+nLUKsB9/kh3k=;
 b=c5w+TBJXEjct9i3uqxpl2jWX5dcU3d5uh1iGeynwKd74AjaHO0ADV4njy0A4WvD+ZY
 j2lo3jmYWT7kYvox/GI9kdprAMWyFkCIOu18p2D+4YylpyusyhrxVHcjdLXKf+NVh1k2
 WVx4VypnSdsSIx3pSp/0WnP2+iggctPBPCQOn3djbZK+jVFLdISJy4Z/dL6n37tef1tS
 vb2Wes57kHG9izHieoxpM5VGVzchTkyFypOGvM6TK9cojW1+SqUZJ+aMvHj2i6Eto3vc
 zeuD0Pw4/3EIqBDinuf/6YhFqS9SBeG0y3K+96LUVj4aTwruo/janeHR56hIZa95VjvD
 ulBQ==
X-Gm-Message-State: AOAM532FX7MNITi9FAwM89cRi0Y36COG9xu5tPdu7p7hadXjTpxIb4pW
 IrlLbgLewcdQVgHojjB56CMlnTSHArlI08Rt8qieiL9cb6k8EJpXTE5j6fQCTFR/1Sq0p1ISI7X
 EeouFSf+7iJad53DQQhIuSHxCX0k=
X-Received: by 2002:a17:902:7445:b029:d9:d:e419 with SMTP id
 e5-20020a1709027445b02900d9000de419mr8316508plt.8.1605781106566; 
 Thu, 19 Nov 2020 02:18:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4PQ64H9vsP5PLGsWLZlLfcT0ZqjyLi5yNrnXBTiPHSUpMEKAEzkDQ32Kipc7ZghM85/5uqw==
X-Received: by 2002:a17:902:7445:b029:d9:d:e419 with SMTP id
 e5-20020a1709027445b02900d9000de419mr8316493plt.8.1605781106269; 
 Thu, 19 Nov 2020 02:18:26 -0800 (PST)
Received: from localhost.localdomain (223-137-197-222.emome-ip.hinet.net.
 [223.137.197.222])
 by smtp.gmail.com with ESMTPSA id y9sm6171250pjj.8.2020.11.19.02.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 02:18:25 -0800 (PST)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it
Date: Thu, 19 Nov 2020 18:18:18 +0800
Message-Id: <20201119101818.71869-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] msgrcv03: make explicit kernel config requirement
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

In this msgrcv03 test, it will fail on an ARM64 system running with
Ubuntu Bionic 4.15 kernel:
  tag=msgrcv03 stime=1605780268
  cmdline=msgrcv03
  contacts=
  analysis=exit
  <<<test_output>>>
  CONFIG_CHECKPOINT_RESTORE
                           ^
  Missing value

  tst_kconfig.c:475: TBROK: Invalid kconfig variables!

While the kernel config shows:
  $ grep CONFIG_CHECKPOINT_RESTORE /boot/config-4.15.0-1087-aws
  CONFIG_CHECKPOINT_RESTORE=y

Change the kernel config requirement to CONFIG_CHECKPOINT_RESTORE=y
to solve this issue.

Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 testcases/kernel/syscalls/ipc/msgrcv/msgrcv03.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv03.c b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv03.c
index b578e2810..015351a65 100644
--- a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv03.c
+++ b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv03.c
@@ -93,7 +93,7 @@ static struct tst_test test = {
 	.needs_tmpdir = 1,
 	.needs_root = 1,
 	.needs_kconfigs = (const char *[]) {
-		"CONFIG_CHECKPOINT_RESTORE",
+		"CONFIG_CHECKPOINT_RESTORE=y",
 		NULL
 	},
 	.min_kver = "3.8.0",
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
