Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A18A6428C
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 09:23:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 491A93C1D24
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 09:23:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 759A93C02C2
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 09:23:21 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 6AC4A6007A9
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 09:23:23 +0200 (CEST)
Received: from mail-pl1-f199.google.com ([209.85.214.199])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <po-hsu.lin@canonical.com>)
 id 1hl6wi-0008IH-4G
 for ltp@lists.linux.it; Wed, 10 Jul 2019 07:23:20 +0000
Received: by mail-pl1-f199.google.com with SMTP id f2so861327plr.0
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 00:23:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=Yx40ejwzegqRRwKVkPKNnnPYLfJDMbAW2uc5wcIH2U8=;
 b=OGNmvAh6C/eC2c4PRu6PDF4Gkhc4xlVh992SUbRa5+uKyS6EslcaznniM69DMhC4Dt
 sCTzWiMi/pRQATWGNYudltLUHkrzE2SNU4EgYCJN6eE7CM8+t6yIMFgAYGmsbqaZV7Jn
 b2UcjikT6rOlfo8YSLs0g/v5rVHZB/AcecgQiyEQBO+3zFnEQqmKLg3n6AJvcajc0b6F
 ibUdD88ZnUqCiswCjF7Gbq391D0/BJ1nr+lFZCkAxT2oAHTFjqsa1mydd7WJx1mIsMad
 l0CNa8e/BSn5yB+HaCTK6LGBf9g08W1PbBh9AHaHLsQpVPrYrgUNszO8SRseMCEdJUJ5
 rUBw==
X-Gm-Message-State: APjAAAWYrzTLBRLfKXdsJhxcnBfK2VH2/8QwG0dqh855M+akz6Wy6S8i
 FWuJqiJ4uW8eUJFLe/SU4zyZNHL831Zmuqv2Jn6wsdtMFL2wPkTVoEmMOZ3L9ri+E6vWq0BJ0mw
 u8JHZrnIJGbwVotR8m4yVyizfWhU=
X-Received: by 2002:a63:c006:: with SMTP id h6mr34744774pgg.285.1562743398572; 
 Wed, 10 Jul 2019 00:23:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxsKLftVPCcnyz30fmoXw0siQ5lAXanuBxyCh9UmEp8k4ZLDsmGIciDt+XSZPi1vAKBHrsOLw==
X-Received: by 2002:a63:c006:: with SMTP id h6mr34744758pgg.285.1562743398293; 
 Wed, 10 Jul 2019 00:23:18 -0700 (PDT)
Received: from Leggiero.taipei.internal (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id h26sm1192653pfq.64.2019.07.10.00.23.17
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 00:23:17 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it
Date: Wed, 10 Jul 2019 15:23:03 +0800
Message-Id: <20190710072305.25806-2-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190710072305.25806-1-po-hsu.lin@canonical.com>
References: <20190710072305.25806-1-po-hsu.lin@canonical.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCHv2 1/3] zram/zram_lib.sh: fix variable name and
 algorithm retrieval
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

The compression algorithm was stored into a local variable "algs",
however the variable name zram_algs was used in the for loop later.

Unify them with algs so the default zram_algs defined in zram01 won't
be altered.

Also, use sed to get rid of the square brackets that indicates the
compression algorithm currently in use.
    $ cat /sys/block/zram0/comp_algorithm
    [lzo] lz4 lz4hc 842 zstd

Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 testcases/kernel/device-drivers/zram/zram_lib.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/device-drivers/zram/zram_lib.sh b/testcases/kernel/device-drivers/zram/zram_lib.sh
index d0e7704a8..599e5f0f3 100755
--- a/testcases/kernel/device-drivers/zram/zram_lib.sh
+++ b/testcases/kernel/device-drivers/zram/zram_lib.sh
@@ -98,10 +98,10 @@ zram_compress_alg()
 
 	tst_resm TINFO "test that we can set compression algorithm"
 
-	local algs="$(cat /sys/block/zram0/comp_algorithm)"
+	local algs="$(sed 's/[][]//g' /sys/block/zram0/comp_algorithm)"
 	tst_resm TINFO "supported algs: $algs"
 	local i=0
-	for alg in $zram_algs; do
+	for alg in $algs; do
 		local sys_path="/sys/block/zram${i}/comp_algorithm"
 		echo "$alg" >  $sys_path || \
 			tst_brkm TFAIL "can't set '$alg' to $sys_path"
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
