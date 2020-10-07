Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CEB28582D
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Oct 2020 07:37:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F160A3C2830
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Oct 2020 07:37:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 147ED3C223E
 for <ltp@lists.linux.it>; Wed,  7 Oct 2020 07:37:51 +0200 (CEST)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 465542001AB
 for <ltp@lists.linux.it>; Wed,  7 Oct 2020 07:37:51 +0200 (CEST)
Received: by mail-pj1-x1043.google.com with SMTP id ds1so479838pjb.5
 for <ltp@lists.linux.it>; Tue, 06 Oct 2020 22:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7vB2aXfTAd9Dnn3S7T8wZmbr8xoeLWC1TCaKy7PcsNs=;
 b=ojtcpfEawKu03d8SXrmxnYY8aEV7s3yQBBMwX8Ehp3MNLnsQCcRJwojiTU9AgAgvks
 ox7H97j5OfsfwfrF6cO0fBUFyu9VgJju83b3HPC9UBrpMYLXTs2tpZQ3VdZ01s97MQ8v
 L3GZCS2xAhA6dp3rdqbfpx6wJE9aElGQgFv8tVGwqcvgMZPcMSsif+rS0sMQevlAaeb8
 cWrlJZrmB/d3UnvH8z10baIWi+TpkhtjeEgBMCPXo565MRCIOsaAHg65DpsM2j8LL51U
 lB+FSqwAyiXetAPyu3KJsH5MHXSe/N6K26VBfYTPE3Wj63YS8q8aquIRhQF74D5Zk3aM
 l/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7vB2aXfTAd9Dnn3S7T8wZmbr8xoeLWC1TCaKy7PcsNs=;
 b=p/rl8bs3xMMRXb3Md5qo0Yb4ECJd7+BhIrpOGc3n3pqzFP5XjsCPwxgR+xK6qbpivL
 eLZsX6PD2VTGq1suh5sn27qg7EpohNjVesykFoa2lRQEw0MeO0I9nRnbjQLICH3jvMDN
 68SLIbDZbp+N+bM9wsNdzFafnLol9qcwtA6AweK2Pkor+3+ynfU5f0B15DJw/RCJO4Us
 I8HOEnQmV0wjaySdegLJM7PqK8tzHs4qs5NFHjNEZub64nWDLMK4FOELtaDrQrpApOfp
 mXzc+uQACObQAgnETWGte4707p+G0wOSgA8gUBHWe16dqQVM6QBCJExDmupsQIEQbzHf
 BEDQ==
X-Gm-Message-State: AOAM531DIOSU1gu1tt8dI6JRVsY7VO+30/qd/un6TQ5Oz8I8msO1ML3l
 +6i1QyEIqyyRRKkcY9VqUv4SOl315wEdGA==
X-Google-Smtp-Source: ABdhPJwqPkAcpHWiFqKzemXDPpDD2OZ6lUiKwspOxBY+nnykZ7KyqfNa+T1vOovUSejx9b9zu/R6NQ==
X-Received: by 2002:a17:902:b192:b029:d2:f08:f85a with SMTP id
 s18-20020a170902b192b02900d20f08f85amr1343100plr.49.1602049069136; 
 Tue, 06 Oct 2020 22:37:49 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id 190sm1226770pfy.22.2020.10.06.22.37.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Oct 2020 22:37:48 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed,  7 Oct 2020 11:07:44 +0530
Message-Id: <4bec407cc82038233c8977104ccd03b97ae3fc4c.1602048976.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls: semop: Increase timeout for semop03
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, will@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Sometimes the timeout happens before the signal is received and it
causes the test to fail with following error:

 semop03.c:55: TFAIL: unexpected failure: EAGAIN/EWOULDBLOCK (11)

Fix this by increasing the timeout to a sufficiently large value.

Reported-by: Rachel Sibley <rasibley@redhat.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 testcases/kernel/syscalls/ipc/semop/semop03.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/ipc/semop/semop03.c b/testcases/kernel/syscalls/ipc/semop/semop03.c
index 89603f19d651..3a79ed38a904 100644
--- a/testcases/kernel/syscalls/ipc/semop/semop03.c
+++ b/testcases/kernel/syscalls/ipc/semop/semop03.c
@@ -71,7 +71,7 @@ static void setup(void)
 	semop_supported_by_kernel(tv);
 
 	timeout.type = tv->ts_type;
-	tst_ts_set_sec(&timeout, 0);
+	tst_ts_set_sec(&timeout, 2);
 	tst_ts_set_nsec(&timeout, 10000000);
 
 	SAFE_SIGNAL(SIGHUP, sighandler);
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
