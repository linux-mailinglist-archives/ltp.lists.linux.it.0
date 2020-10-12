Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8235728B139
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Oct 2020 11:12:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3EEDE3C5858
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Oct 2020 11:12:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id BA02C3C1C9E
 for <ltp@lists.linux.it>; Mon, 12 Oct 2020 11:12:17 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id ECB166000FD
 for <ltp@lists.linux.it>; Mon, 12 Oct 2020 11:12:16 +0200 (CEST)
Received: from mail-pf1-f199.google.com ([209.85.210.199])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1kRtsN-00085i-2T
 for ltp@lists.linux.it; Mon, 12 Oct 2020 09:12:15 +0000
Received: by mail-pf1-f199.google.com with SMTP id 62so12137387pfv.3
 for <ltp@lists.linux.it>; Mon, 12 Oct 2020 02:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=XC29rVa831AK3ZD++/M6A4BrGgsTLEqFwllBsZci+EI=;
 b=U9LaCFrtOUuA75m7xIiLa21zomptvxJpY2m87EH4lUk4pOEmMZzO0L8rf0QPaa2qGv
 hUR+iouGBfbt7ZXy7mTbfPEj7QGLmwudCoNh7oDwHrdm1XE47DGQBvU7Mq3UEPwKQ8Oz
 ILcfCybK6KWyzLeDsQSpQCIMUDW8ytBb+6jo9dUaG7cHLz/bHYz0Y9c1juy9LCQ55anP
 dP1X9DQnQinF6BnFqx+pSpsv7a9B41X5JZOPw3crSUBHnL4MVqeZURrMf9bwhzbfA/sE
 TY9k44MfnS65olku+FLLhqiscoKZckfEVhPoSbRu2xsb5FMz7Tck14a+4+IUvm9CyhqX
 D0gg==
X-Gm-Message-State: AOAM532qp7wZhsn2HGV9zEwlbEibQig33J4rf7v8qltL0K8rRalv91lN
 ICN+hHZxmIfxuUfz4kTpsIGXGg1lHLoh4QsJ01A0IpuSlA59Vx6fjRX6i+0PQ2SlPFMM3RwMDSu
 VATB+Q910bDwXpgV+N/LIwy+iMy0=
X-Received: by 2002:a17:90a:9ec:: with SMTP id
 99mr19092075pjo.138.1602493933493; 
 Mon, 12 Oct 2020 02:12:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypbTiDDziZD+RqDSvGCezdZNJ49MvUelsqwrHJfhx1cZ5q47bUch8trMvQ+AmKEyjUoCYSHA==
X-Received: by 2002:a17:90a:9ec:: with SMTP id
 99mr19092051pjo.138.1602493933159; 
 Mon, 12 Oct 2020 02:12:13 -0700 (PDT)
Received: from Leggiero.taipei.internal (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id f17sm19230881pfq.141.2020.10.12.02.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 02:12:12 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it
Date: Mon, 12 Oct 2020 17:12:04 +0800
Message-Id: <20201012091204.875-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] ioctl_sg01: correct the fix SHA1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Correct the fix SHA1 to match with the one in the comment.

Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 testcases/kernel/syscalls/ioctl/ioctl_sg01.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl_sg01.c b/testcases/kernel/syscalls/ioctl/ioctl_sg01.c
index 8ad2ffed5..94b30dc6b 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl_sg01.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl_sg01.c
@@ -127,7 +127,7 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.tags = (const struct tst_tag[]) {
-		{"linux-git", "e093c4be760e"},
+		{"linux-git", "a45b599ad808"},
 		{"CVE", "2018-1000204"},
 		{}
 	}
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
