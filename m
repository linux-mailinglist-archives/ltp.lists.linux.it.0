Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFB45E1FC
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jul 2019 12:23:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8082C3C1DB3
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jul 2019 12:23:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 3CDC73C1D50
 for <ltp@lists.linux.it>; Wed,  3 Jul 2019 12:23:15 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 9A1821A014A8
 for <ltp@lists.linux.it>; Wed,  3 Jul 2019 12:23:14 +0200 (CEST)
Received: from mail-pl1-f200.google.com ([209.85.214.200])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <po-hsu.lin@canonical.com>)
 id 1hicPx-0004SY-8m
 for ltp@lists.linux.it; Wed, 03 Jul 2019 10:23:13 +0000
Received: by mail-pl1-f200.google.com with SMTP id w14so1148245plp.4
 for <ltp@lists.linux.it>; Wed, 03 Jul 2019 03:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=m7hogjVOWPvvGOB0cbtzRindsNKpgKi2lf5iCmvjbtY=;
 b=emnNKUd9BK7xoUly6r+wjBvRMAy3KoF6+UOCJudnx7C9Zvjy3+aHwaYDNKPpVcQx94
 YcHH/kw8fi/iD4z7Qjtb0r7S6yiTrFxZlwxk/IwVGbJSNNmYc0qZnmGpGgQvInO6OyRq
 0oX/lvqAqfqGykiH7ZO/GXWpUL/+cysd2/k07NKsZH2ghbSe4JodqSAxybQF/XPHEIbw
 WWy9I3kWtTZm0RnTM6X/wUGQRBbiixleigqXfXsNvvYof24m6PvV4yJVluQMVqkfIOnF
 AJpfGt2p7JDMRoEHRJ19ZL1jZJsljHSnq1KJSD+rhDJ77ClndXgkO3k1EblIt1U54iUI
 d12g==
X-Gm-Message-State: APjAAAUk0zDlFSzUsDHAn+mGaz9+eZEZFF/ViJNmQvyuJgjAGZdUg8co
 ND3WNQV0xJ5NLsMzP4J8a7mT8bSWhm947+/Wgle6DxrSJUEFGMEKlGAJynO0GzNcZhNN5BN8DEk
 gi5Zx5YNGM5D95FrgCNMcR778kbI=
X-Received: by 2002:a63:d755:: with SMTP id w21mr36688373pgi.311.1562149391759; 
 Wed, 03 Jul 2019 03:23:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwI54lW+U7WnPJ2GvRhpKDVa5QMoZYkt+nKzy3EF6uDNVM3rLpiaqmBX1c94i2GofHP0aRp7g==
X-Received: by 2002:a63:d755:: with SMTP id w21mr36688341pgi.311.1562149391347; 
 Wed, 03 Jul 2019 03:23:11 -0700 (PDT)
Received: from Leggiero.taipei.internal (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id f19sm3257642pfk.180.2019.07.03.03.23.10
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 03:23:10 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it
Date: Wed,  3 Jul 2019 18:23:01 +0800
Message-Id: <20190703102303.32166-2-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190703102303.32166-1-po-hsu.lin@canonical.com>
References: <20190703102303.32166-1-po-hsu.lin@canonical.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] zram/zram_lib.sh: fix local variable assignment
 for DASH
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

The /bin/sh was symbolically link to dash in Ubuntu.
This is making the one-liner local variable assignment not working [1]:
    /opt/ltp/testcases/bin/zram01.sh: 102: local: 842: bad variable name

This is because there are more then one string in the return value:
    $ cat /sys/block/zram0/comp_algorithm
    [lzo] lz4 lz4hc 842 zstd

Use a pair of quotes to enclose to solve this issue.

[1] https://wiki.ubuntu.com/DashAsBinSh#local

Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 testcases/kernel/device-drivers/zram/zram_lib.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/device-drivers/zram/zram_lib.sh b/testcases/kernel/device-drivers/zram/zram_lib.sh
index 45116af3e..d0e7704a8 100755
--- a/testcases/kernel/device-drivers/zram/zram_lib.sh
+++ b/testcases/kernel/device-drivers/zram/zram_lib.sh
@@ -98,7 +98,7 @@ zram_compress_alg()
 
 	tst_resm TINFO "test that we can set compression algorithm"
 
-	local algs=$(cat /sys/block/zram0/comp_algorithm)
+	local algs="$(cat /sys/block/zram0/comp_algorithm)"
 	tst_resm TINFO "supported algs: $algs"
 	local i=0
 	for alg in $zram_algs; do
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
