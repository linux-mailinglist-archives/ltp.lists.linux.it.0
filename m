Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 773006428D
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 09:23:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 47D8C3C1C72
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 09:23:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 7170A3C1CE7
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 09:23:23 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 64EFE6009F2
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 09:23:25 +0200 (CEST)
Received: from mail-pl1-f200.google.com ([209.85.214.200])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <po-hsu.lin@canonical.com>)
 id 1hl6wj-0008IR-RP
 for ltp@lists.linux.it; Wed, 10 Jul 2019 07:23:22 +0000
Received: by mail-pl1-f200.google.com with SMTP id e95so849392plb.9
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 00:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=aogrjOWjacI0OgpX8HQFkTc8wUyvlFxYbFHYJVXIwI4=;
 b=NkcVLncFQvqa3VfdVAR2eaB4U6wnNK7fPcxcdw7t6CbOjbSY5jnl6uRbzmdrx36g5r
 KemTI0FGZ01eCcSi326Ac0gF7EMz35qjveYZZXNyVNWJI1JKJnFQV3LKbSeHogjua5O5
 2FyFo62Ob7nRCipBuY+7u7gfa6Tt0OUnunDXDi3/JeDwkDn8M85Rk9BQlT4raJehmnu2
 T93wdYkznNblZk/6Qhm3T15ZG7Y+cTbZo/9FMC61hVAoPDTll8mZjK9coGyBhf8qSkXN
 Y+E8r9rxPkKseOjDEWVxowd3rWy52CGggSnrFTvxESIWZnVTGmVjdkGbltpXMOqznku9
 rtKw==
X-Gm-Message-State: APjAAAWQIbL+krefb8BNVIA84vVvDOi6OPTe1AWo9Nmf2zl9q3hWl1+k
 f2SSsn+0C6bYIsUecDrzvd0t5QPUFlJxc04jrS5KciaBv3IOS2aYAV2qcaVXeDmuofpAk+mhNDD
 UarZq0pGEoTPUE7JOdBieC7zWuRU=
X-Received: by 2002:a17:90a:f98a:: with SMTP id
 cq10mr5184733pjb.43.1562743400324; 
 Wed, 10 Jul 2019 00:23:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyHhb5Bp4yBpr2w0ErzY1NDcV6zJrh3QbmI7KgK0RzuphcRPvrWaFPqTTEnpKlKaeilYU3NXA==
X-Received: by 2002:a17:90a:f98a:: with SMTP id
 cq10mr5184688pjb.43.1562743399790; 
 Wed, 10 Jul 2019 00:23:19 -0700 (PDT)
Received: from Leggiero.taipei.internal (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id h26sm1192653pfq.64.2019.07.10.00.23.18
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 00:23:19 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it
Date: Wed, 10 Jul 2019 15:23:04 +0800
Message-Id: <20190710072305.25806-3-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190710072305.25806-1-po-hsu.lin@canonical.com>
References: <20190710072305.25806-1-po-hsu.lin@canonical.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCHv2 2/3] zram/zram_lib.sh: iterate through all available
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

Fix this by using the number of devices defined in zram01.sh. And
iterate all the available compression algorithms on each block device.
This ensures all the algorithm can be assigned on all of the zram block
devices and thus improves the test coverage.

Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 testcases/kernel/device-drivers/zram/zram_lib.sh | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/testcases/kernel/device-drivers/zram/zram_lib.sh b/testcases/kernel/device-drivers/zram/zram_lib.sh
index 599e5f0f3..7773f4338 100755
--- a/testcases/kernel/device-drivers/zram/zram_lib.sh
+++ b/testcases/kernel/device-drivers/zram/zram_lib.sh
@@ -101,12 +101,15 @@ zram_compress_alg()
 	local algs="$(sed 's/[][]//g' /sys/block/zram0/comp_algorithm)"
 	tst_resm TINFO "supported algs: $algs"
 	local i=0
-	for alg in $algs; do
-		local sys_path="/sys/block/zram${i}/comp_algorithm"
-		echo "$alg" >  $sys_path || \
-			tst_brkm TFAIL "can't set '$alg' to $sys_path"
-		i=$(($i + 1))
-		tst_resm TINFO "$sys_path = '$alg' ($i/$dev_num)"
+	local dev_max=$(($dev_num - 1))
+
+	for i in $(seq 0 $dev_max); do
+		for alg in $algs; do
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
