Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD492DBB0F
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 07:12:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9914D3C2ADB
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 07:12:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id ABC113C0174
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 07:12:42 +0100 (CET)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4B3001000AFC
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 07:12:42 +0100 (CET)
Received: by mail-pl1-x62c.google.com with SMTP id g20so11510764plo.2
 for <ltp@lists.linux.it>; Tue, 15 Dec 2020 22:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9/4qZNk6kTdEXgce23Dn8K/ExwZABGMAn4R4QhUpMvc=;
 b=xMwh07lMdH4m+VND3n9W05JaNf/E8H+RW6IDaKZP2FrxFAsUxGd8ezd4C9ug3nKZt/
 THMH68qPbb8QsVWKIpZMaonZu79n38lc1Tud1+sapuMjL15R9ucxWUb7Vs07GBvU2k28
 yfGPn7+CRYxGnYsbegF/3vAOQc29ZGcVCq2ypejxlXF+IOFdfvi6E/LnyEQKb/Rfsfck
 IoLN7bpqhq+IU/MEmtLCRDWRH11w5SSAT6sEVAQAIG7HCD3FP9AY/5TcX/ZVJeAEDXh3
 WkuVduRrSp7Gg2v3xI/AzhXFYqtFF1J0OnwisDjGfSxwPphMiF9RRqtdnSXMZuJWZfOC
 e8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9/4qZNk6kTdEXgce23Dn8K/ExwZABGMAn4R4QhUpMvc=;
 b=twlsqpn4cgQKguT5A+E8jDq70+U27UeFK4p0rWLIKYMYuyi3TQAXDdbJkKMVh8EqV7
 MTNJD59oyMMqFrwh68oMutQX+2DCF6jwVKONDHIeZEhKcT19qYWvdF7MPv7hGCV5VSC1
 3iF5LpkqzqkXCQ19adl7fRaAQqHNOxpXMFDeGISeEATOR8RY7sQBVItLchdsJrvPjPTo
 S94NRp8XCeZgapNoWyqm4I3avMCHdSs6xHF8OvJKHukFQyD15ImxD5KqPLONBifrUkHe
 wubYeklNQ+erc3wgPaXS4EHgcFPJrcEkuOi8xrUdvCt8aP7XSOSC4Cedeg/S0nEOj/v3
 VSpQ==
X-Gm-Message-State: AOAM533KWUV4GzFkzQx51yDtAqNvXaZVuAq8LLRgtJBEFq/8nSpzq4+K
 +f9Wz4lId8kECDBeDg6/MA01Pg97z/buqA==
X-Google-Smtp-Source: ABdhPJyRRzMsvoPhNuoEK0tTwDmIYw9TCzuQHu+fGBLEVQnqdBX9esEVwC+1lzSMnjxU2Q8Q202lyw==
X-Received: by 2002:a17:902:9a49:b029:da:b3b0:94a1 with SMTP id
 x9-20020a1709029a49b02900dab3b094a1mr280307plv.11.1608099159981; 
 Tue, 15 Dec 2020 22:12:39 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id 197sm1041395pgd.69.2020.12.15.22.12.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Dec 2020 22:12:39 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 16 Dec 2020 11:42:33 +0530
Message-Id: <a23e8cb8ae3f227d4355b89347b36d6dda6160c6.1608099138.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls: recvmmsg: Add gitignore
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

Add the missing gitignore file.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 testcases/kernel/syscalls/recvmmsg/.gitignore | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 testcases/kernel/syscalls/recvmmsg/.gitignore

diff --git a/testcases/kernel/syscalls/recvmmsg/.gitignore b/testcases/kernel/syscalls/recvmmsg/.gitignore
new file mode 100644
index 000000000000..974ae1ef90ea
--- /dev/null
+++ b/testcases/kernel/syscalls/recvmmsg/.gitignore
@@ -0,0 +1 @@
+recvmmsg01
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
