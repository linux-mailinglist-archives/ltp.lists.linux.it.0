Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5093ACBB2
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 15:05:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 569C43C2DBE
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 15:05:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D193C3C2B09
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 15:05:42 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 23DC7140138B
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 15:05:41 +0200 (CEST)
Received: from mail-ed1-f69.google.com ([209.85.208.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1luEBo-0000lC-TN
 for ltp@lists.linux.it; Fri, 18 Jun 2021 13:05:40 +0000
Received: by mail-ed1-f69.google.com with SMTP id
 h11-20020a50ed8b0000b02903947b9ca1f3so1753768edr.7
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 06:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eYRGR00Nrqs61IcaggfqL8W9m3yJ+HKOEDEUdT4fAYc=;
 b=BYVzW/mpq4dvUIIQLEAgpzrfwgL/gMR4rc593iaAtxgncVkozqrQz6TOYUQuGh0sCV
 yxL2nFLAIKLwe9f7KXK16b3zLE7MstGYtus6Xl3WogdpTUPiY2maiq4Rfw4/LF6+AQn7
 CZIcqk+MdsqxnhA8G9c30La9oH9dJSCNCdLztQVz+tOlijshHhg3BV0/kivr+jcUSwkM
 U+KaBLayGTktu8WkcvGCeHf4MoyphG5mO4b9sM0DhyEBgrIenvKhzqvlobyia8LquZLL
 WdX0c9t5633ADcA0EnTHZ8+ay/vUhymzydEaCf049BiSWjvMpBk/NXLJVSte2QNz9ztm
 UVkg==
X-Gm-Message-State: AOAM533H+OrmIZYhv5nC3riuYLoBbOzbHoMX4aXWvxULxqN+0QZoYiJM
 DZNOHt9k+hKA4CQS6vwW5EY8ha9tMxn4fbRpgundTdAwlkmooaX9nF9hSztZ/ftSDmgxOzptfJH
 hixToRsN9JyZK7BvGysQeJUdfNdwD
X-Received: by 2002:a50:ee13:: with SMTP id g19mr566135eds.147.1624021540222; 
 Fri, 18 Jun 2021 06:05:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBAVFDufGMzarsFOag+wjnMqQ2Xh3RrniKadLKzC0Y5nM9gLWdLQAdopjGluXzjZl+P3SLEQ==
X-Received: by 2002:a50:ee13:: with SMTP id g19mr566107eds.147.1624021540071; 
 Fri, 18 Jun 2021 06:05:40 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id f21sm6253895edr.45.2021.06.18.06.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 06:05:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Fri, 18 Jun 2021 15:05:35 +0200
Message-Id: <20210618130536.54806-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] tpci: fix NULL pointer dereference on wrong test
 invocation
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

Fix NULL pointer dereference when a ltp_tpci test case is started before
choosing the device:

    ltp_tpci: test-case 12
    ltp_tpci: assign resources
    ltp_tpci: assign resource #0
    BUG: kernel NULL pointer dereference, address: 00000000000003b8
    ...
     Call Trace:
      dev_attr_store+0x17/0x30
      sysfs_kf_write+0x3e/0x50
      kernfs_fop_write_iter+0x13c/0x1d0
      new_sync_write+0x113/0x1a0
      vfs_write+0x1c5/0x200
      ksys_write+0x67/0xe0
      __x64_sys_write+0x1a/0x20
      do_syscall_64+0x49/0xc0
      entry_SYSCALL_64_after_hwframe+0x44/0xa9

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.c b/testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.c
index 5b48aa0c7ece..f2d4a4ba497c 100644
--- a/testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.c
+++ b/testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.c
@@ -556,6 +556,11 @@ static int test_case(unsigned int cmd)
 {
 	int rc = TSKIP;
 
+	if (!ltp_pci.dev || !ltp_pci.bus) {
+		prk_err("device or bus not selected for test");
+		return TFAIL;
+	}
+
 	switch (cmd) {
 	case PCI_ENABLE:
 		rc = pci_enable();
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
