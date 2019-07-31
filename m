Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A58457BAF3
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 09:51:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 606E13C1D2E
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 09:51:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 4FB003C194D
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 09:51:00 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id B4F7620148A
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 09:50:59 +0200 (CEST)
Received: from mail-pf1-f199.google.com ([209.85.210.199])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <po-hsu.lin@canonical.com>)
 id 1hsjNy-0006HS-FW
 for ltp@lists.linux.it; Wed, 31 Jul 2019 07:50:58 +0000
Received: by mail-pf1-f199.google.com with SMTP id x10so42698839pfa.23
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 00:50:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=AL5ZD1TKnQIGBuAxJidMhPbVLN2zvO4JzyFHuGWt25s=;
 b=m9Rwvp9/Ts67+oPdWi/QDRTWg34VL2lFZRVVx6vZb2xlqa/QJRjYGg3zNzrRmnpQLU
 cC1woKQE6VwBqOLuvFyDo0hFEanN4hPbN9gtiMXoFOexO5LN85dgFui5ZFOBxdoh5xKw
 T/j5xcU4M7eE5y218dG/Ez87iNISLZ5Zst0Sxt75ZCRAhkBu/ilSWC1rLlMPs4WzFjHh
 +vwboffs3D3k28red9UHClNmJUDHNEBJ6vzVPFdPyK8qdGw178Dr1YX/oZYacPuInQ27
 UHoKq5iIiEmSxyiVTCi0r5aJMJLEjXABeWFUciDd7cEs5vNhNDvwCvAF00P8ysk2lj8o
 2i6Q==
X-Gm-Message-State: APjAAAX4cSQ8GFK0DEE9rBSlhzJ3KTiU4mH83QbjLB5Xss28XgI+bTMK
 VorOwShV/BE/Z+GPkOR8VPsJukx2PWDdKd+aaWse73mBVWr7CmToomjLV/XNWQPAJzCCJn0quDy
 WPIHUEbAumj76PcmbqzA8ppibwak=
X-Received: by 2002:a63:714a:: with SMTP id b10mr80513034pgn.25.1564559456897; 
 Wed, 31 Jul 2019 00:50:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxRiUHrHCld+Ff/URoacm3rR27ihOjiPMrci/SBgSy8W3QiN6JDllozzNgGSqt4agSWQmqA+Q==
X-Received: by 2002:a63:714a:: with SMTP id b10mr80512998pgn.25.1564559456353; 
 Wed, 31 Jul 2019 00:50:56 -0700 (PDT)
Received: from Leggiero.taipei.internal (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id u23sm69399718pfn.140.2019.07.31.00.50.55
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 00:50:55 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it
Date: Wed, 31 Jul 2019 15:50:51 +0800
Message-Id: <20190731075051.5830-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] scenario_groups/default: remove the timers test
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The timers tests were merged into syscalls in commit 0051eab2,
remove the no-longer-exists timers from default test plan.

Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 scenario_groups/default | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scenario_groups/default b/scenario_groups/default
index e5b34782c..093f5f706 100644
--- a/scenario_groups/default
+++ b/scenario_groups/default
@@ -17,7 +17,6 @@ filecaps
 cap_bounds
 fcntl-locktests
 connectors
-timers
 power_management_tests
 hugetlb
 commands
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
