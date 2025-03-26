Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E18A7667A
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Mar 2025 15:03:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1743426189; h=date :
 mime-version : message-id : to : subject : list-id : list-unsubscribe
 : list-archive : list-post : list-help : list-subscribe : from :
 reply-to : content-type : content-transfer-encoding : sender : from;
 bh=/eKwTz1hOWGcr1OQLTgv8dnbWGVsM2IN7waSd8Iu9tM=;
 b=Gwvx6elEepLdLL/Xc3bPYWVhpoEdBzXX6ZdHarQfN66iCcv3P1MJAuz7TzB7zqzQNzFRX
 NrHkYjgoBm4ukMwkQ2v6kEC0a3skX79S8h8RrnrXoSUC1A5sSGj6i4uiYqHaz49/F690C49
 hx0pd4Vnnxr41gR/l6HKnv7+8wNiGgw=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EB6AE3CABEA
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Mar 2025 15:03:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 426823C9AEF
 for <ltp@lists.linux.it>; Wed, 26 Mar 2025 05:12:43 +0100 (CET)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9D124215360
 for <ltp@lists.linux.it>; Wed, 26 Mar 2025 05:12:43 +0100 (CET)
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-2262051205aso74323585ad.3
 for <ltp@lists.linux.it>; Tue, 25 Mar 2025 21:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1742962362; x=1743567162; darn=lists.linux.it;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WtuGtloFL+b9M31/dg+51tGW3jh13hBZahzo2pxNMdM=;
 b=n4tvAas4clWFO8OxXbxYICysByXwk2qTg1RTWzSZNN74JdMSD/RKO6P8NaCD46U+NO
 rA+l6OSPdJo3CxTAi50RzGoVxhMW1HcN2lIN1WS4fqKPkCbG4QWaJAw3rgbQJ7gXA85Z
 7ICXvTJ7c5PAo7eNIK+2GSr2LjzVf94Ytbr8FkpwoSfwLbsD2hsU9PoSVxC3CM/fZNdA
 J0w7PUSO1Ceel6R0Lu5jBeg6EnHoK7wuNO4WfmV0f1UY88p9TgEMG9YBOQ5Hqwd9t7mK
 OzY5YeU3UrxAvfsTcydbL5HIONTimLD/hcWCi+Hx7zskffvIdZVA0PWXz7YLNzkmRqMS
 I5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742962362; x=1743567162;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WtuGtloFL+b9M31/dg+51tGW3jh13hBZahzo2pxNMdM=;
 b=KfAOLegzM1izci3xIf1lPHwKuWmP76d9Ms+rueLdG8f0VZkSWW9XK9TBo7HwdtudhC
 Msb4OWk8HXUCdEfwzbo1n7f8i3A6e1Ip6nworZaZdLIz0C/M1hUn0nvNqPvpnnFTUJW9
 aPpmUpLXoSUaIHPXTJoZ4cR4WWGcubfiYJPTL7MDyJ22w5RV+s0ygndm6WqWlkyAWv9f
 Top9orSmRe5qMEwOXe8P+5C7cF9XzMBpneQxPMRlXn0C02+j66qVk6iVCWKp35/oUbFB
 isUUOjxaJw0EIhdXBMobZ7QR4daIza2AqUtVjGzJ4pwIQm7H5Dj6LuIll9HxvE1QEOUm
 YSmQ==
X-Gm-Message-State: AOJu0Yz6pas8XJxUFhsmMhjNBUUR3/xeFKoGg880Zod5BEux8a3857z2
 csRLke/BgfsXupPUMPt3IIfv3nskbR+x1cJMPYv5VsRXtBu6wREUG7l5Ud5y6VwkS+hLxhSkBO3
 2bJhw4bX8Pp4hRf944abzvcy+c03FSMW4rapKfQwCjzK64MxdhIsSFDaKPdQ8hU0CFrDV6g8j9/
 lsGGEqfDBgUcL9u5mBM3Twkw+5Zq4ciOhpZnDMcU5acE4=
X-Google-Smtp-Source: AGHT+IGgQbzWRDYPoo84er6NnTsjAflvUAJU7wh5MhionVBv8QJqdkFhNlVcNZ1a9iAaub4LxdBj4j6wrySCVsc=
X-Received: from plqt12.prod.google.com ([2002:a17:902:a5cc:b0:21f:14cc:68b0])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:c951:b0:223:42ca:10ef with SMTP id
 d9443c01a7336-22780e23682mr314347965ad.43.1742962361759; 
 Tue, 25 Mar 2025 21:12:41 -0700 (PDT)
Date: Wed, 26 Mar 2025 04:11:56 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250326041156.2755631-1-tjmercier@google.com>
To: ltp@lists.linux.it
X-Spam-Status: No, score=-7.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Mailman-Approved-At: Mon, 31 Mar 2025 15:03:06 +0200
Subject: [LTP] [PATCH] memcg_control_test: Disable swapping in test cgroup
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
From: "T.J. Mercier via ltp" <ltp@lists.linux.it>
Reply-To: "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

memcg_control_test_1 sets both a memory limit and a memsw/swap limit to
a single page, and then asks mem_process to allocate 2 pages in an
attempt to cause a memcg OOM kill. However, if swapping is enabled the
first page can be swapped before the second is allocated causing neither
limit to be exceeded, and no OOM kill to occur which results in a test
failure. Fix this by disabling swap in the test cgroup if it is enabled,
causing both pages to always be accounted under memory.max (v2) /
memory.limit_in_bytes (v1).

Fixes: c0b815736 ("New testcase added by Naufal.")
Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 .../kernel/controllers/memcg/control/memcg_control_test.sh   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/controllers/memcg/control/memcg_control_test.sh b/testcases/kernel/controllers/memcg/control/memcg_control_test.sh
index 68287a70c..eb8db3e30 100644
--- a/testcases/kernel/controllers/memcg/control/memcg_control_test.sh
+++ b/testcases/kernel/controllers/memcg/control/memcg_control_test.sh
@@ -12,7 +12,6 @@ TST_NEEDS_TMPDIR=1
 
 PAGE_SIZE=$(tst_getconf PAGESIZE)
 
-TOT_MEM_LIMIT=$PAGE_SIZE
 ACTIVE_MEM_LIMIT=$PAGE_SIZE
 PROC_MEM=$((PAGE_SIZE * 2))
 
@@ -50,13 +49,13 @@ test1()
 
 	# If the kernel is built without swap, the $memsw_memory_limit file is missing
 	if [ -e "$test_dir/$memsw_memory_limit" ]; then
-		ROD echo "$TOT_MEM_LIMIT" \> "$test_dir/$memsw_memory_limit"
+		ROD echo 0 \> "$test_dir/$memsw_memory_limit"
 	fi
 
 	KILLED_CNT=0
 	test_proc_kill
 
-	if [ $PROC_MEM -gt $TOT_MEM_LIMIT ] && [ $KILLED_CNT -eq 0 ]; then
+	if [ $KILLED_CNT -eq 0 ]; then
 		tst_res TFAIL "Test #1: failed"
 	else
 		tst_res TPASS "Test #1: passed"
-- 
2.49.0.395.g12beb8f557-goog


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
