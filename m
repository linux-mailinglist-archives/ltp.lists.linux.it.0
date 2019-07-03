Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7793D5E1FD
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jul 2019 12:23:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1CCBF3C1DD4
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jul 2019 12:23:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 268113C1D5F
 for <ltp@lists.linux.it>; Wed,  3 Jul 2019 12:23:15 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id BC5876005D6
 for <ltp@lists.linux.it>; Wed,  3 Jul 2019 12:23:17 +0200 (CEST)
Received: from mail-pf1-f199.google.com ([209.85.210.199])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <po-hsu.lin@canonical.com>)
 id 1hicPy-0004Sg-G8
 for ltp@lists.linux.it; Wed, 03 Jul 2019 10:23:14 +0000
Received: by mail-pf1-f199.google.com with SMTP id d190so1242743pfa.0
 for <ltp@lists.linux.it>; Wed, 03 Jul 2019 03:23:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=pXCbKSIh0YxlyuPxAKtUuCQEDr+ZLbA/LycGyCNSVQc=;
 b=VH7skAIE1L+hCWw3SXorceLMFHigWPd9Gl0FrI4CXBrN1hPHr4qp6bN4xW0irQh+oJ
 IwXtM/UlG8osDZykiVlGn3oqjjuLFe6+91S3UgC2zgpusbANzaPlKNX+s5UrwfAZA7YB
 gikQorwWBFBKlWaUEA9FG9iQyrybp258Z5MFRMHGOnTI71LgDFETwwTFKuSzA5/CbtfN
 PL6yNACuCWPKeps4AC3mhkdjMKpIf+45y/lCjwxAdtmNpU8JwbrDwiwhR3jvj7gXT+yP
 Slhqxfn8w1kXkLFhOkDoPKNAipNprQC3sOzfeZjouvuvN/wGHnfnOwV+1KvnN4NyCJ8t
 uONA==
X-Gm-Message-State: APjAAAWWnm5kRXwMkb+UvsB1iCJJ5xJO4HvgctfrcUPLjIp1iBNSNcYa
 ksnWMWHnS5+tXd/roJb4Xwhs+/+jB6M7Sc9tfJ11tlB/zE94YSN5CIajBDyxAQiOXjgbGG5XHvO
 mGGM6l3+P00LCUZ7MrSAq85sdCkE=
X-Received: by 2002:a63:ff20:: with SMTP id k32mr29463583pgi.445.1562149393023; 
 Wed, 03 Jul 2019 03:23:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxkV+usIkrpQgkqtO+6WYWQ8k1eheb09cEf6k3hne2zoZXOR+tjkmZEKrRNpKhOWRDLg8H+6Q==
X-Received: by 2002:a63:ff20:: with SMTP id k32mr29463556pgi.445.1562149392689; 
 Wed, 03 Jul 2019 03:23:12 -0700 (PDT)
Received: from Leggiero.taipei.internal (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id f19sm3257642pfk.180.2019.07.03.03.23.11
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 03:23:12 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it
Date: Wed,  3 Jul 2019 18:23:02 +0800
Message-Id: <20190703102303.32166-3-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190703102303.32166-1-po-hsu.lin@canonical.com>
References: <20190703102303.32166-1-po-hsu.lin@canonical.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] zram/zram_lib.sh: fix variable name and algorithm
 retrieval
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

The compression algorithm was stored into a local variable algs,
however the variable name zram_algs was used in the for loop later.

Unify them with zram_algs, and use sed to get rid of the square
brackets that indicates the compression algorithm currently in use.
    $ cat /sys/block/zram0/comp_algorithm
    [lzo] lz4 lz4hc 842 zstd

Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 testcases/kernel/device-drivers/zram/zram_lib.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/device-drivers/zram/zram_lib.sh b/testcases/kernel/device-drivers/zram/zram_lib.sh
index d0e7704a8..d50be699d 100755
--- a/testcases/kernel/device-drivers/zram/zram_lib.sh
+++ b/testcases/kernel/device-drivers/zram/zram_lib.sh
@@ -98,8 +98,8 @@ zram_compress_alg()
 
 	tst_resm TINFO "test that we can set compression algorithm"
 
-	local algs="$(cat /sys/block/zram0/comp_algorithm)"
-	tst_resm TINFO "supported algs: $algs"
+	local zram_algs="$(sed 's/[][]//g' /sys/block/zram0/comp_algorithm)"
+	tst_resm TINFO "supported algs: $zram_algs"
 	local i=0
 	for alg in $zram_algs; do
 		local sys_path="/sys/block/zram${i}/comp_algorithm"
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
