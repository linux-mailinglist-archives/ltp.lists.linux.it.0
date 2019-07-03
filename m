Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8A15E1FF
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jul 2019 12:23:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D530D3C1DD0
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jul 2019 12:23:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 4F4113C1D9F
 for <ltp@lists.linux.it>; Wed,  3 Jul 2019 12:23:17 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id B42A614019E7
 for <ltp@lists.linux.it>; Wed,  3 Jul 2019 12:23:16 +0200 (CEST)
Received: from mail-pf1-f197.google.com ([209.85.210.197])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <po-hsu.lin@canonical.com>)
 id 1hicPz-0004Sp-OE
 for ltp@lists.linux.it; Wed, 03 Jul 2019 10:23:15 +0000
Received: by mail-pf1-f197.google.com with SMTP id 145so1224014pfw.16
 for <ltp@lists.linux.it>; Wed, 03 Jul 2019 03:23:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=DewWq6MC8NcLEZ8+Dl8TvBIvdhZzqEUnm0BYJiFghGU=;
 b=mTUQu1rM3A94DjHI1fhOHBOiKfa/wydI/mnvBhn9aGBD8evGQxOdnYR6+77EP8cLLM
 5ddnCK0GaLqD5MxSxGRhtOF7L0Fh0c2YdPSAyKPVk0uEpzao8xJJhbQNCA42PEGapSZq
 7OZqZBAG0ENS51NjsrQs9JdC9M07lijkgfuVEKkerL1NpSDPUMTHBU40kT8VnZQbsqxh
 pgMOdmrQgQW59tpFPtkzsHRFnqpv98RmNgZd8wptVrTjKK6gNQ4s5r9pbBGy9F/XWHCh
 6P8SEp+8F/xKP8ZFkG6YGeGdz8MDaJf+7TEY+m7DRY0jkpflHYo3LHHxx9bP/YpUYetF
 lRww==
X-Gm-Message-State: APjAAAUkwWYqXsP/DznkZ34nDZ8bz/NMh4UT5rH0YWpZyh9XPCtUjVzQ
 8m6mahdJ0K6hQIH0t/NfrJxUANMURdnkijeVD7MirhAjpVGU8nfxl7aUqK7BVpwTYkeJ7llP30I
 d8Rr+mxzMCmAAELOE2nWIXu/H/fM=
X-Received: by 2002:a17:902:748c:: with SMTP id
 h12mr35168479pll.208.1562149394315; 
 Wed, 03 Jul 2019 03:23:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz3BvnkWs154te2YMXQ0FR2DIghER+vXBMwi+r8BGyZdsod/nGTJLMMk46WHhmnoBvvRrs9xg==
X-Received: by 2002:a17:902:748c:: with SMTP id
 h12mr35168461pll.208.1562149394121; 
 Wed, 03 Jul 2019 03:23:14 -0700 (PDT)
Received: from Leggiero.taipei.internal (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id f19sm3257642pfk.180.2019.07.03.03.23.12
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 03:23:13 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it
Date: Wed,  3 Jul 2019 18:23:03 +0800
Message-Id: <20190703102303.32166-4-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190703102303.32166-1-po-hsu.lin@canonical.com>
References: <20190703102303.32166-1-po-hsu.lin@canonical.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] zram/zram_lib.sh: iterate through all available
 compression algorithms for all zram block devices
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

The test was designed to switch up to 4 zram compression algorithms,
one of them on a zram block device at a time through 4 devices as
defined in zram01.sh.

As the number of zram block devices are hard-coded in zram01.sh, the
test will fail if your system supports more than 4 compression
algorithms because it will try to access a non-existing block device:
    zram01.sh: cannot create /sys/block/zram4/comp_algorithm: Directory nonexistent
    zram01 2 TFAIL: can't set 'zstd' to /sys/block/zram4/comp_algorithm

Fix this by checking how many available zram block devices we can use
first. And iterate all the available compression algorithms on each one
of block devices. This ensures all the algorithm can be assigned on all
of the zram block devices and thus improves the test coverage.

Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 .../kernel/device-drivers/zram/zram_lib.sh     | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/testcases/kernel/device-drivers/zram/zram_lib.sh b/testcases/kernel/device-drivers/zram/zram_lib.sh
index d50be699d..96400b2d9 100755
--- a/testcases/kernel/device-drivers/zram/zram_lib.sh
+++ b/testcases/kernel/device-drivers/zram/zram_lib.sh
@@ -101,12 +101,18 @@ zram_compress_alg()
 	local zram_algs="$(sed 's/[][]//g' /sys/block/zram0/comp_algorithm)"
 	tst_resm TINFO "supported algs: $zram_algs"
 	local i=0
-	for alg in $zram_algs; do
-		local sys_path="/sys/block/zram${i}/comp_algorithm"
-		echo "$alg" >  $sys_path || \
-			tst_brkm TFAIL "can't set '$alg' to $sys_path"
-		i=$(($i + 1))
-		tst_resm TINFO "$sys_path = '$alg' ($i/$dev_num)"
+	local dev_max=0
+	while [ -d /sys/block/zram$(($dev_max + 1)) ]; do
+		dev_max=$(($dev_max + 1))
+	done
+
+	for i in $(seq 0 $dev_max); do
+		for alg in $zram_algs; do
+			local sys_path="/sys/block/zram${i}/comp_algorithm"
+			echo "$alg" >  $sys_path || \
+				tst_brkm TFAIL "can't set '$alg' to $sys_path"
+			tst_resm TINFO "$sys_path = '$alg' ($i/$dev_max)"
+		done
 	done
 
 	tst_resm TPASS "test succeeded"
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
