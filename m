Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 831156428E
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 09:23:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4236E3C1CF3
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 09:23:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 9FF953C14F9
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 09:23:24 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 5711614019C3
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 09:23:24 +0200 (CEST)
Received: from mail-pg1-f200.google.com ([209.85.215.200])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <po-hsu.lin@canonical.com>)
 id 1hl6wl-0008Ic-83
 for ltp@lists.linux.it; Wed, 10 Jul 2019 07:23:23 +0000
Received: by mail-pg1-f200.google.com with SMTP id f18so927409pgb.10
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 00:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=ZpJR1OfFQw8skCK+/5XffIHOFH+VQ4BsmDLyfghBdhw=;
 b=PddUtrN39qrRAAiZIHZVkFcJMLcwdHdzHPBYrv+ZRNbWHalyS5t5saJiMzL8YKzUCZ
 D/6ipB5QwwqLhlTFOZN9zgKjAQ+tYS1bhw4VN6udIgjfmVcWdupeSIuoeMH2YAmHWMWq
 OqWSa3R36qo6E6Hq8hoFfKtBNN3V9J6Rq1o23f5h3DFUOhv4UmSOcaEcaedsyrjTmE7b
 n7F5XWadWPUGwZFOa19hvu9hiI8ounoojhwQ1u/yGVlvqg/8BnpXkf13b84/b5b6NU79
 kIbtTHbCRna74fwYb+9o2WQ6k0qmc/qR7h9JmKtfirO711xDBJku4uJ8SfPuAlqeNBJs
 ZsOA==
X-Gm-Message-State: APjAAAVN7HGwH+dpsvtZ2qD7R21X1xDzaPOAzFtzdiinAon0E5xtnMzD
 piRlJSqxMhgvTzCm58VEaNda1p3RZsjq8PLSDYtp0fXWJMrjh3uY8m1JB3nKao+IZeZdZT8mhSz
 IX1n0r+bfuK3QY5EMrSf/8Ykk8Cg=
X-Received: by 2002:a65:6694:: with SMTP id b20mr34573721pgw.155.1562743401366; 
 Wed, 10 Jul 2019 00:23:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyTheBMvYjdMnZeQolh4rEp+HVODpxiUtSiQ+Oka0MaZDO57CDDc/OKbgGtklQYh4k7wQLLgg==
X-Received: by 2002:a65:6694:: with SMTP id b20mr34573705pgw.155.1562743401142; 
 Wed, 10 Jul 2019 00:23:21 -0700 (PDT)
Received: from Leggiero.taipei.internal (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id h26sm1192653pfq.64.2019.07.10.00.23.19
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 00:23:20 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it
Date: Wed, 10 Jul 2019 15:23:05 +0800
Message-Id: <20190710072305.25806-4-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190710072305.25806-1-po-hsu.lin@canonical.com>
References: <20190710072305.25806-1-po-hsu.lin@canonical.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] zram/zram_lib.sh: set the compression algorithms
 back to default after test
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

Set the compression algorithm back to the default one in the end of the
zram_compress_alg() test.

Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 testcases/kernel/device-drivers/zram/zram_lib.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/testcases/kernel/device-drivers/zram/zram_lib.sh b/testcases/kernel/device-drivers/zram/zram_lib.sh
index 7773f4338..e2b6eb8ec 100755
--- a/testcases/kernel/device-drivers/zram/zram_lib.sh
+++ b/testcases/kernel/device-drivers/zram/zram_lib.sh
@@ -99,6 +99,7 @@ zram_compress_alg()
 	tst_resm TINFO "test that we can set compression algorithm"
 
 	local algs="$(sed 's/[][]//g' /sys/block/zram0/comp_algorithm)"
+	local alg_default="$(grep -oP '(?<=\[).*(?=\])' /sys/block/zram0/comp_algorithm)"
 	tst_resm TINFO "supported algs: $algs"
 	local i=0
 	local dev_max=$(($dev_num - 1))
@@ -110,6 +111,12 @@ zram_compress_alg()
 				tst_brkm TFAIL "can't set '$alg' to $sys_path"
 			tst_resm TINFO "$sys_path = '$alg' ($i/$dev_max)"
 		done
+		# Restore the compression algorithm to the default one
+		if [ -n "$alg_default" ]; then
+			echo "$alg_default" >  $sys_path || \
+				tst_brkm TFAIL "can't restore '$alg_default' to $sys_path"
+			tst_resm TINFO "Set $sys_path back to $alg_default"
+		fi
 	done
 
 	tst_resm TPASS "test succeeded"
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
