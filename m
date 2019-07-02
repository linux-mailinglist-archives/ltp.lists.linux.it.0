Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 404725CE12
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jul 2019 13:04:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF4403C1DAC
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Jul 2019 13:04:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 48BA23C1D15
 for <ltp@lists.linux.it>; Tue,  2 Jul 2019 13:04:40 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id B4CFC201033
 for <ltp@lists.linux.it>; Tue,  2 Jul 2019 13:04:39 +0200 (CEST)
Received: from mail-pl1-f200.google.com ([209.85.214.200])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <po-hsu.lin@canonical.com>)
 id 1hiGaU-00087W-IW
 for ltp@lists.linux.it; Tue, 02 Jul 2019 11:04:38 +0000
Received: by mail-pl1-f200.google.com with SMTP id w14so193652plp.4
 for <ltp@lists.linux.it>; Tue, 02 Jul 2019 04:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=J/Cz67e9UO7dCWxRva94S9KAal8tzOEHBlR2/dEPmbo=;
 b=RDD+fX1U/iOziXHWLyL80wuIaTR26xPt5hEFFY0jbLTYJFGNlYgMbt9IrJ/uV3BphY
 GjcEHUn/IEHK5Elg029ltmwrU0xUkYcgN0Cwys1kPvsxpacWbp+3WAQgn4tHrX8918rR
 tjwgAq4IkzGIiOmlbAgJN4c8dsPZkzUVtONnjZGf4Vjmhas2As3311vfEjVg/twazzFt
 rlZM/lyVvggYUXX8Dzo6ScxvmZ80hklLVWb4Jr8fm3NUhhKXdZKCYpTS+utHuBkU/uHc
 C/3Gy44YtePAkWFlnei/kPzajU11ztCVSKmu7Wm1bfGadV1w8t0KCEYkf3lNtJvlifpC
 ABmg==
X-Gm-Message-State: APjAAAX3mfLQBsDDI+6zvX4Ger2x7MsiIfG9OPsnnumlHswC4clvUkk9
 HAQ6NzaRcyrUqWP4mDh7tt+F63RY3FfcsCTypFkkegQK7wzGbhBTfwjHyMDhu7d7XbpyaQS6Kvu
 cfS3zDPTthByVid5MDzN48Oxwv1g=
X-Received: by 2002:a17:902:a409:: with SMTP id
 p9mr35064455plq.218.1562065477051; 
 Tue, 02 Jul 2019 04:04:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyNWphhxq+mmMzsyBMK3qge79o/2hvl3HyWXomjZOkZWtkbmrs2/QfhwWnv6nLd83ZpprXRFQ==
X-Received: by 2002:a17:902:a409:: with SMTP id
 p9mr35064402plq.218.1562065476450; 
 Tue, 02 Jul 2019 04:04:36 -0700 (PDT)
Received: from Leggiero.taipei.internal (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id q198sm21204377pfq.155.2019.07.02.04.04.35
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 04:04:35 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it
Date: Tue,  2 Jul 2019 19:04:19 +0800
Message-Id: <20190702110419.21221-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] zram/zram_lib.sh: fix local variable assignment for
 DASH
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

Break it into two lines to solve this issue.

[1] https://wiki.ubuntu.com/DashAsBinSh#local

Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 testcases/kernel/device-drivers/zram/zram_lib.sh | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/device-drivers/zram/zram_lib.sh b/testcases/kernel/device-drivers/zram/zram_lib.sh
index 45116af3e..5cf1ba435 100755
--- a/testcases/kernel/device-drivers/zram/zram_lib.sh
+++ b/testcases/kernel/device-drivers/zram/zram_lib.sh
@@ -98,11 +98,13 @@ zram_compress_alg()
 
 	tst_resm TINFO "test that we can set compression algorithm"
 
-	local algs=$(cat /sys/block/zram0/comp_algorithm)
+	local algs
+	algs=$(cat /sys/block/zram0/comp_algorithm)
 	tst_resm TINFO "supported algs: $algs"
 	local i=0
 	for alg in $zram_algs; do
-		local sys_path="/sys/block/zram${i}/comp_algorithm"
+		local sys_path
+		sys_path="/sys/block/zram${i}/comp_algorithm"
 		echo "$alg" >  $sys_path || \
 			tst_brkm TFAIL "can't set '$alg' to $sys_path"
 		i=$(($i + 1))
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
