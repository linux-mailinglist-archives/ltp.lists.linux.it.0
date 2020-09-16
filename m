Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC9826C1B4
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 12:34:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2CB053C4EB7
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 12:34:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 936803C2ADA
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 12:34:35 +0200 (CEST)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 274AF1A00EB6
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 12:34:35 +0200 (CEST)
Received: by mail-pf1-x442.google.com with SMTP id z19so3705176pfn.8
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 03:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v1CGyhhj0Xl3Eu3t/HTbQXpqWkX7DF1LbvW4R/cLd9w=;
 b=p2TGHcRLDeBTqatKEEFecKX0OORCHkl3g3mbb2qhfO38ZHpGkm+ondAI4ZsxsTFii7
 0shMJfIjrkb2Hj+h3Rkya1OTJmVYu7/i9Xfv9fKj3k8VYVh8cWEma46d43LuOZ30P+1s
 yKJKLKr5agQJNIOrWNziDfKxIbeSVFGC1ySjmYrjoK2+ZkfqdWvPGfqUSVtqw0PUTsxF
 ZXuYb5IROPwqQ6kJdzd/Vq8QCxuND2bhp8QwwgsDvLsiKLvHUaiSrpx9P1WKy1DcGxyG
 Ns0ahgbFWak2m4vLuZOzkRvlRdEyElVQ0Qbrt/176Nvxyo82aJp5dkXdapZdoBFbczmu
 b9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v1CGyhhj0Xl3Eu3t/HTbQXpqWkX7DF1LbvW4R/cLd9w=;
 b=WMC47qS2NBP+d3XeI8MYDfumPrPpro6sclqDEgKDO7gKkGL6oN48kVIVAcpdu/6A7B
 wPgu6ZOhmsEKFabS7fuuPnJOfTKDpKowzgOs77Le9zZy8/ZMoAVZAHGMNtzNqextUjHN
 zXyCqcscPnwGMDxuikv2/sX9PUozSKf7XDGHXVJSoRQUIwohphyCj9u7KckTt2/o959S
 QAnAd5QPrPzXm+qWA2mjrSwVmgAB7hdwx+yBD5BS3Pqtqm4krPf8dzeksJedCgx46NB2
 zWlMxdRWbEzhYVMptBJcFa3R1hLYHZoyr+JqoKLJIbtcggxFHj9V49RCnfyt4bPAuXpY
 Fqxw==
X-Gm-Message-State: AOAM533m+MVngRgVLV+GqmV/tTA+CD9XGEQXu5uGBfLNHyLbuGv0HAWQ
 PO7G6x1wJpfgkNGkuYRgwhd4/a2Q5TA5aA==
X-Google-Smtp-Source: ABdhPJySbh1iXyEK8ZVZpFKrTzeJqZID6e9oLfP/Vd27V2jsCw/nsJu/slIQEv1EWS217a2mFfLmxA==
X-Received: by 2002:a63:594a:: with SMTP id j10mr16693616pgm.402.1600252473364; 
 Wed, 16 Sep 2020 03:34:33 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id 124sm16744243pfd.132.2020.09.16.03.34.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Sep 2020 03:34:32 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 16 Sep 2020 16:04:28 +0530
Message-Id: <fdae254836743a2200145a3883bdd869fb610bc2.1600252429.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls: fcntl: Update .gitignore
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Update gitignore file to include new binaries.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 testcases/kernel/syscalls/fcntl/.gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/kernel/syscalls/fcntl/.gitignore b/testcases/kernel/syscalls/fcntl/.gitignore
index be8d9739e51b..ede0c97b8bba 100644
--- a/testcases/kernel/syscalls/fcntl/.gitignore
+++ b/testcases/kernel/syscalls/fcntl/.gitignore
@@ -72,3 +72,5 @@
 /fcntl36_64
 /fcntl37
 /fcntl37_64
+/fcntl38
+/fcntl38_64
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
