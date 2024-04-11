Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D65228A0745
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Apr 2024 06:47:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1712810824; h=to : date :
 message-id : mime-version : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : content-type : content-transfer-encoding : sender : from;
 bh=YQlAeKRfvfKfbXN3ZEKrqBB7rl/kGm+k6eKsTN1d4Qw=;
 b=Nl6YjcLTa+wxOt5SbLgn1OWzqOj7xv/bsK7Kk90WCqi7FBO4JCiC//pFTQ7MlzAEHleSW
 7gn4nhCKO7vRRHA6Ql2393swjbKXMIEpawbuqaec4CHUqzkAP8haa4LGvRVrlHkbfzG/i1g
 VsPZzxAgqux3tQ/uIuMsyCZFpLDvvMw=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 071E93CF7B5
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Apr 2024 06:47:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3F8033CB493
 for <ltp@lists.linux.it>; Thu, 11 Apr 2024 06:46:56 +0200 (CEST)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3AF2D208E11
 for <ltp@lists.linux.it>; Thu, 11 Apr 2024 06:46:55 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d6fc3adaacso91827841fa.2
 for <ltp@lists.linux.it>; Wed, 10 Apr 2024 21:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1712810814; x=1713415614; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3rCmH0kzEV60+bD5w47AJTG0t8xg0TAlViDU3+du+vU=;
 b=TtuQEZoGG6uye0kGkaO/FeBTPERqcRFflYXGYuvKosjF32BlXJ7HKt0JK5uVXtCxHX
 IM9NDi25sly1tSdyVqlP03EnYwotZPUEBXMB9HX75bB7iQzIOHtIXD9w2Uz2Pa7lnQyg
 fmjMwF7Uia7Dkl/mkg/J+BDikX3eZ9B26SL4o2il8X6qbpeOR+uzfs/5DXhWyvWUlG3G
 aIfGK8tQvhp7fSAymnLsh+zH9HHx12gUbFbadT20VBr2oqDMCUXibnlRenMVPa5rfN6r
 FnjqhjNKOSSwPR9egY9FTMR+e2dw2UNRlvzIpXME7mMnr65bLpknwGdK5eXJH1jGGqzL
 KLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712810814; x=1713415614;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3rCmH0kzEV60+bD5w47AJTG0t8xg0TAlViDU3+du+vU=;
 b=GKsCt+3vqA8w+EpwBeGbXx0mG5jccRm4dNfmRubx/e+9ypD1UZRLUiAtjLOLnTSQ1N
 HGbuOEZrCOQGE4SoJ+G7Fy04Dx4BaAbJ33hJKV7pWMDiChzBY7t4A+BqyCTvTjjgGHaD
 skVN+kdOx7dcLuiPxFsi31GngaCpErEfWWu8U11j0fXld55CA38WrcLiKCtoLYvBceTN
 +pq9GDpUwbFnvPUCteS8rdQYRwfWAWH43yJTOUx2MOOlYGa0IV4ibhqtLPU9OcyZPveZ
 lwQp/QbcD17OzD1RN/bqxAbKiMlrla+CCNVGvbYGnSrIIW0WY+0DUoWISSp4SQPf8mJj
 Nc8Q==
X-Gm-Message-State: AOJu0YxK+z/uuma5tZT2+sQsLQK0qAkFYJKjuD6/mFsJwKsrOjfy/pKm
 Nw5kN+U1kp5vM9yQQWEk3ytNhugODcUJvDYOPn5G9yBILPecRgrfxjerfkZR60N/iA/uNR/1dRg
 =
X-Google-Smtp-Source: AGHT+IEwQVN/eIQIWOSn6uocXEe/4/Y96ozJLHS2xzBXmXDgiBGDwyu1SqrUmMA9TiZrL1/TlW8rnA==
X-Received: by 2002:a05:651c:1543:b0:2d8:d972:67e0 with SMTP id
 y3-20020a05651c154300b002d8d97267e0mr2597790ljp.10.1712810814147; 
 Wed, 10 Apr 2024 21:46:54 -0700 (PDT)
Received: from localhost ([2a07:de40:b240:0:dc1a:df90:dc1a:df90])
 by smtp.gmail.com with ESMTPSA id
 di7-20020a0560000ac700b003439d2a5f99sm822546wrb.55.2024.04.10.21.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 21:46:53 -0700 (PDT)
To: ltp@lists.linux.it
Date: Thu, 11 Apr 2024 00:46:45 -0400
Message-Id: <20240411044645.29938-1-wegao@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v1] zram01.sh: Increase timeout for
 check_read_mem_used_total
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Increase timeout value to let case pass on our low ppc64le
machine.

Signed-off-by: Wei Gao <wegao@suse.com>
---
 testcases/kernel/device-drivers/zram/zram01.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/device-drivers/zram/zram01.sh b/testcases/kernel/device-drivers/zram/zram01.sh
index 0c100b706..959dab217 100755
--- a/testcases/kernel/device-drivers/zram/zram01.sh
+++ b/testcases/kernel/device-drivers/zram/zram01.sh
@@ -155,7 +155,7 @@ zram_fill_fs()
 			continue
 		fi
 
-		TST_RETRY_FUNC "check_read_mem_used_total /sys/block/zram$i/mm_stat" 0
+		TST_RETRY_FN_EXP_BACKOFF "check_read_mem_used_total /sys/block/zram$i/mm_stat" 0 10
 		mem_used_total=$(read_mem_used_total /sys/block/zram$i/mm_stat)
 		tst_res TINFO "mem_used_total: $mem_used_total"
 
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
