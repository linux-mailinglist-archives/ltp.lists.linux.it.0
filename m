Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E2A3B1551
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 10:02:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 760FA3C6FF2
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 10:02:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 719A43C218C
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 10:02:02 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C0693600707
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 10:02:01 +0200 (CEST)
Received: from mail-ed1-f71.google.com ([209.85.208.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lvxpg-0007hd-Le
 for ltp@lists.linux.it; Wed, 23 Jun 2021 08:02:00 +0000
Received: by mail-ed1-f71.google.com with SMTP id
 l9-20020a0564022549b0290394bafbfbcaso867778edb.3
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 01:02:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yd2pFwOPCsRGfYcqntFhxTgm/lnaSEYLINTtEL8lsR4=;
 b=OXDKFlMR/S/brNtL32P36GYymxzecWIkgEvgu879eRzTeOqJQs3/a5GjO0TqjVzuTV
 We7OsUfnlbShD+jXP1dzzkixyDqxWg2lrUmKNrczGfEx+C5TPP0uh4ZSvBx3I/01HoDv
 N+nsNOA4Zuo1FeCguRMdCtbJtHMIOwXSJprdWR9IslnZ5n5GNqkMuR/9ROP8LNCUsaih
 iGkzChlpXRkgSkf50cxxBHlRD8chhr2/zhhNAbOhmPBICBRX2vMejuGMXMHToY+t+pPI
 uavxxobyrtkntkofO8iNjxg8kpzp5iDvuF5c3IlRT2t0HohFdUYzYpT1LX1m9zn8Cl/9
 mpIw==
X-Gm-Message-State: AOAM530Sf8CaLWEVAWkWaeaCG73rLUUScvdwK/8dy4ISQusMb5uPDln2
 Zy4hV0v/kwrABYOP+9JL7W2wgFF3XkHzT8Nt1PnrHDHAP7P22p7w0bsvhGjwqvsZtzSv0xJcjAs
 MWiekd5sdYslW8Jl6k1vOOEaDC1Q7
X-Received: by 2002:a17:907:2637:: with SMTP id
 aq23mr8737280ejc.17.1624435320231; 
 Wed, 23 Jun 2021 01:02:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTyNZ79/yUUIEXG+OIsR6314CoO6+XHMky7caSuOM5Q25WEE1I8lnIJ6XGRYiJWsqagLPJWA==
X-Received: by 2002:a17:907:2637:: with SMTP id
 aq23mr8737269ejc.17.1624435320093; 
 Wed, 23 Jun 2021 01:02:00 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id ck2sm4510268edb.72.2021.06.23.01.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 01:01:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Wed, 23 Jun 2021 10:01:57 +0200
Message-Id: <20210623080157.26424-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] device-drivers/cpufreq_boost: skip test on virtual
 machines
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

Testing CPU frequency boost on a virtual machines is not reliable.  Even
if cpufreq driver reports boost frequencies, the underlying hypervisor
might decide otherwise.

For example on AWS x1e.xlarge instance (claimed to be running on Intel
Xeon E7 8880) under Xen hypervisor the test always fails:

    cpufreq_boost    0  TINFO  :  found 'intel_pstate' driver, sysfs knob '/sys/devices/system/cpu/intel_pstate/no_turbo'
    cpufreq_boost    0  TINFO  :  maximum speed is 3100000 KHz
    cpufreq_boost    0  TINFO  :  load CPU0 with boost enabled
    cpufreq_boost    0  TINFO  :  elapsed time is 1155 ms
    cpufreq_boost    0  TINFO  :  load CPU0 with boost disabled
    cpufreq_boost    0  TINFO  :  elapsed time is 1155 ms
    cpufreq_boost    1  TFAIL  :  cpufreq_boost.c:186: compare time spent with and without boost (-2%)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c b/testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c
index b9739db37cb7..67917b3fea25 100644
--- a/testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c
+++ b/testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c
@@ -90,6 +90,9 @@ static void setup(void)
 	unsigned int i;
 	tst_require_root();
 
+	if (tst_is_virt(VIRT_ANY))
+		tst_brkm(TCONF, NULL, "running in a virtual machine, overclock not reliably measureable");
+
 	for (i = 0; i < ARRAY_SIZE(cdrv); ++i) {
 		fd = open(cdrv[i].file, O_RDWR);
 		if (fd == -1)
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
