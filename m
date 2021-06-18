Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C673ACBB3
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 15:05:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8D7BA3C3232
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 15:05:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 22D2D3C2B09
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 15:05:42 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 10D85601090
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 15:05:41 +0200 (CEST)
Received: from mail-ej1-f69.google.com ([209.85.218.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1luEBp-0000lG-81
 for ltp@lists.linux.it; Fri, 18 Jun 2021 13:05:41 +0000
Received: by mail-ej1-f69.google.com with SMTP id
 jw19-20020a17090776b3b0290481592f1fc4so2261722ejc.2
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 06:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xkfuYySS2nU2vKDAafMaapQYc8BE8aYHgiKlx7qk3n4=;
 b=fyZFkSo82lrbu9lPwML485yCGOdlWdYWO1XmdcC0d1Cj8I/7yxAYeQGUuTguZzEyLg
 W93/cp7G3u62J5BUtLn9lFcM6fqL+e+3uSyl688glNt2sUT60RCFUEqJ2x1DfWQiLR9o
 exsKiaolhcwIgN2fACGy8H1ClnENubShbJE/zq3GEZB/hB83HksnB/4/Jc6OAxc3fGkk
 qDJnpxp3vfPblQPVhmHu76Nd/WjIxM8VZOZA6KrkK38w3vWebKBh+lZSMTxZInj7+yE4
 z8HmxmV4n88xgh9iBNO3efZaE9qvrA6ot78zZyfWTUXuA9Pv0fK2Hamb3cbcccccf8t0
 I7/g==
X-Gm-Message-State: AOAM532sVUzw/ktWqN4VqBAYUicp8bZBYtL+POuOvJJiE+sbANl7IsOa
 Ou7Q+/IvJVPbTr3xlLDMDy7Px0mXc7Be/uc1a7YRF7CpXwf7K6t091Lxv11z3RdPNgJ3OARLGq6
 DCjdz//6VKYHQz8UPH3Z0+Jb8Mz8z
X-Received: by 2002:a05:6402:51cf:: with SMTP id
 r15mr4742512edd.263.1624021540751; 
 Fri, 18 Jun 2021 06:05:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZPnNaot8RBmC45ohQe4t5Cs1me9HOkOXaXj3xDqu61g6P85GZWCT8moD06wB4qTQ0PBtuGA==
X-Received: by 2002:a05:6402:51cf:: with SMTP id
 r15mr4742492edd.263.1624021540609; 
 Fri, 18 Jun 2021 06:05:40 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id f21sm6253895edr.45.2021.06.18.06.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 06:05:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Fri, 18 Jun 2021 15:05:36 +0200
Message-Id: <20210618130536.54806-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210618130536.54806-1-krzysztof.kozlowski@canonical.com>
References: <20210618130536.54806-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] tpci: accept ENOMEM resource failure with
 virtio-pci
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

Assigning the memory prefetch resource to virtio-pci might fail on VM
guests.  For example on Oracle cloud instance (describing itself as
"Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.4.1
12/03/2020"):

    test_pci   76  TFAIL  :  tpci.c:73: PCI bus 00 slot 20 : Test-case '12'

In dmesg:

    ltp_tpci: test-case 12
    ltp_tpci: assign resources
    ltp_tpci: assign resource #0
    ltp_tpci: name = 0000:00:04.0, flags = 262401, start 0xc000, end 0xc03f
    ltp_tpci: assign resource #1
    ltp_tpci: name = 0000:00:04.0, flags = 262656, start 0xc1010000, end 0xc1010fff
    ltp_tpci: assign resource #2
    ltp_tpci: name = 0000:00:04.0, flags = 0, start 0x0, end 0x0
    ltp_tpci: assign resource #3
    ltp_tpci: name = 0000:00:04.0, flags = 0, start 0x0, end 0x0
    ltp_tpci: assign resource #4
    ltp_tpci: name = 0000:00:04.0, flags = 538190348, start 0x800004000, end 0x800007fff
    virtio-pci 0000:00:04.0: BAR 4: no space for [mem size 0x00004000 64bit pref]
    virtio-pci 0000:00:04.0: BAR 4: failed to assign [mem size 0x00004000 64bit pref]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Found the failure on multiple different kernels in different cloud
providers (Oracle, AWS, Azure):
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1878389
---
 .../device-drivers/pci/tpci_kernel/ltp_tpci.c     | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.c b/testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.c
index f2d4a4ba497c..41462d4ead6d 100644
--- a/testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.c
+++ b/testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.c
@@ -108,8 +108,9 @@ static int probe_pci_dev(unsigned int bus, unsigned int slot)
 	if (!dev || !dev->driver)
 		return -ENODEV;
 
-	prk_info("found pci_dev '%s', bus %u, devfn %u",
-		pci_name(dev), bus, slot);
+	prk_info("found pci_dev '%s', driver '%s', bus %u, devfn %u",
+		pci_name(dev), (dev->driver) ? dev->driver->name : "",
+		bus, slot);
 
 	ltp_pci.dev = dev;
 	ltp_pci.bus = dev->bus;
@@ -444,7 +445,15 @@ static int test_assign_resources(void)
 			r->flags & IORESOURCE_PREFETCH) {
 			ret = pci_assign_resource(dev, i);
 			prk_info("assign resource to '%d', ret '%d'", i, ret);
-			rc |= (ret < 0 && ret != -EBUSY) ? TFAIL : TPASS;
+			if (dev->driver && !strncmp(dev->driver->name, "virtio-pci",
+						    strlen("virtio-pci"))) {
+				if (ret < 0 && ret != -EBUSY && ret != -ENOMEM)
+					rc |= TFAIL;
+				else
+					rc |= TPASS;
+			} else {
+				rc |= (ret < 0 && ret != -EBUSY) ? TFAIL : TPASS;
+			}
 		}
 	}
 
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
