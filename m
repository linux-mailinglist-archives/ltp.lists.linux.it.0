Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 515D2597BA
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Jun 2019 11:37:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 817293C1CA8
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Jun 2019 11:37:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id C10C73C181B
 for <ltp@lists.linux.it>; Fri, 28 Jun 2019 11:37:22 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 1C6B41A00484
 for <ltp@lists.linux.it>; Fri, 28 Jun 2019 11:37:21 +0200 (CEST)
Received: from mail-pf1-f198.google.com ([209.85.210.198])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <po-hsu.lin@canonical.com>)
 id 1hgnJo-0007a8-O0
 for ltp@lists.linux.it; Fri, 28 Jun 2019 09:37:20 +0000
Received: by mail-pf1-f198.google.com with SMTP id b195so3136939pfb.3
 for <ltp@lists.linux.it>; Fri, 28 Jun 2019 02:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=4v0xK3W/tNFZA2Q4kpM6wDoGoixSCuspYiVEmAWaaxQ=;
 b=bMPeHIHw6/EQI1BOjjNLlQDTXSXxE0rPddEtZnIQMXg9wkdesoQL8xTtI1SqnoEZO6
 8fQyfHizRlYNHjiBfl+XKNdR8Std+eu5tn9wdnSt/yoMnsmcvcXQSwystp4v7nu8R5bl
 5XYVAoXkQxAYzqCVZfcj99DKJV7+mEWyjvfI5+8PjMsIjk93pUV5ulIxuLRRR0zML+c7
 CfyEpwCaWd8djvOe9aw0bGZfDSUmoL4bkRRmdVaHw/Ib3hD1NJF3kkHNcZGpVMRV9dJf
 ++DoDPmOf8FFlTZk3/m7ffDmd5EuI/auMSPvAXW0J7ACYuTkbwL1jv+tSNBggN0jZAsZ
 D32Q==
X-Gm-Message-State: APjAAAV+20mTuEZE08pt+jSaHbcFfRzOtHcnLeyZrk2PipvxSeqTWHES
 efReroCn76MyMdpCMy3yo4yRkpPx13BgbsxI+GvXWrT0nFT7M17kOCIR5N73OUa+6WKxKkmsM/I
 bSa6N8qW54p5olTmpkVaJ3Sbv+Cc=
X-Received: by 2002:a17:902:fe10:: with SMTP id
 g16mr10678399plj.44.1561714639272; 
 Fri, 28 Jun 2019 02:37:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw/u4tkl/MtdeGyvS/vxaNHdvYVI0U0a62FAeI/wHVyuiTjkaSwUH143lG1Hd2UI+7YfgK+lw==
X-Received: by 2002:a17:902:fe10:: with SMTP id
 g16mr10678364plj.44.1561714638998; 
 Fri, 28 Jun 2019 02:37:18 -0700 (PDT)
Received: from Leggiero.taipei.internal (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id y14sm1467015pjr.13.2019.06.28.02.37.17
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 02:37:18 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it
Date: Fri, 28 Jun 2019 17:37:09 +0800
Message-Id: <20190628093709.6625-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] cve/meltdown.c: abort the test if kallsyms was not
 enabled
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

The cve-2017-5754 meltdown test does not work with a kernel that does
not have CONFIG_KALLSYMS enabled (e.g. Ubuntu KVM kernel).

Add and extra check for /proc/kallsyms to determine if we can run it.

Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 testcases/cve/meltdown.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/testcases/cve/meltdown.c b/testcases/cve/meltdown.c
index 1a3303ec0..f78c38b80 100644
--- a/testcases/cve/meltdown.c
+++ b/testcases/cve/meltdown.c
@@ -269,6 +269,9 @@ find_kernel_symbol(const char *name)
 	struct utsname utsname;
 	unsigned long addr;
 
+	if (access("/proc/kallsyms", F_OK) == -1)
+		tst_brk(TCONF, "/proc/kallsyms not enabled");
+
 	addr = find_symbol_in_file("/proc/kallsyms", name);
 	if (addr)
 		return addr;
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
