Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D48587C7F7
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Mar 2024 04:31:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1710473518; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=qTOBfHaB8tZQPqhHSMnI2mMhUOXRQWDfWifn6IWG3BU=;
 b=lAzS4NUurL6RdjuN2O7x4e9iDwxlwDQKK2EztC+iv0t7OCG7s5+A8tXmRdtzjNSVRSkHI
 hm7ufT/ebcBiCuQ6H1R/n5Xybqi2evE/OTli/ObvyRb575bWjC+WAkJmq3wGDkTCxPpHYIs
 cWjN7aK5bAUwlXKqkSC8kFwZyDAwBEQ=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 01D743D018D
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Mar 2024 04:31:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1F2EC3CD745
 for <ltp@lists.linux.it>; Fri, 15 Mar 2024 04:31:55 +0100 (CET)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3131B1A004ED
 for <ltp@lists.linux.it>; Fri, 15 Mar 2024 04:31:55 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d47a92cfefso19218821fa.1
 for <ltp@lists.linux.it>; Thu, 14 Mar 2024 20:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1710473514; x=1711078314; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LUXP4zscd3FQBaXMdHnDPH8eCtPviOyczz/pGS7yUG0=;
 b=Jdmr8CIqhGJILChCV1pX17VN1Cf1hedjg/EusBpHy24kF5mxlx2NTgXYW0zdIg7RMS
 SUjasuUdUKzeSPUpc5Bwwo/FD853NTp0AnegZEuRfZuNgZeZIyzZNcShdeAyFtT9T90u
 Aq7mpQofPsswMJ6pMbHtels69B4x1t7VjGXILfYKee9CQVdr05n6H1rD4efFstBkf9sc
 iCSJ6Hb/BSd3KDEPLm2ZP7qhDpa4mIlx+AYRKMxobE6lPqwTcSfO4ONHreyOqS39cuvW
 c2kleTeutjhBsqlsADoEzB0Y1HaQKLhrMc3lJEveVGkPmurU6ETCnATtsBsHZtKR5P0E
 +HDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710473514; x=1711078314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LUXP4zscd3FQBaXMdHnDPH8eCtPviOyczz/pGS7yUG0=;
 b=jtUMkv6Nl8cxhRnd8+HIhOYwzshmzOROb1eyNNJ0SIFv581Q6eW7SnlLhgF+mXhXYy
 avdHEZo1qh4Fu71Zv5nFo0YHAvF7zcUs/sZsg0ATvo4fdnqS/OTFrZV2/HJZ+zFJNGh8
 Zch87DoYgdN4d27PnYrKTZ+omDUgmjgY3L2/P8noSDpMeTpBAlzTFbLO3uK2rHLuuP22
 JWeR2cJQ2dfvKF+VF6uinIpv3iC2sVL7jbAq9vCR1ttGlaTBMLQQ6GKBdx62Umr3IHqf
 EV6HTVKc3+v+hiQxPS9r8q3vkZji75Sfoh2jqpeYFNQWZHKUX7+JSoGpO5EXoeVxtaiC
 6GEQ==
X-Gm-Message-State: AOJu0YxPPEDqjYrzK2jZf2ZXk+e2mc2FNLKG9jMg4vY9/XrTMrE926dw
 k9rddIFgqSb0UmnK2YXrtW/rNF0zRwxf56nfXXMmmcS/+KrFLG0AfhbqYRodGgC967A8emV3kLg
 =
X-Google-Smtp-Source: AGHT+IE1SpYytmfybpzB/RLhla3ZZ25zwsWoXMotGn6N6dMBi3YwZXcoorKgmIWbaHYxX6GagRdPGA==
X-Received: by 2002:a2e:b051:0:b0:2d3:2a95:6f0b with SMTP id
 d17-20020a2eb051000000b002d32a956f0bmr966980ljl.12.1710473513602; 
 Thu, 14 Mar 2024 20:31:53 -0700 (PDT)
Received: from localhost ([223.72.60.77]) by smtp.gmail.com with ESMTPSA id
 u7-20020a170902b28700b001dbcfb23d6csm2547613plr.267.2024.03.14.20.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 20:31:53 -0700 (PDT)
To: ltp@lists.linux.it
Date: Thu, 14 Mar 2024 23:31:39 -0400
Message-Id: <20240315033139.20557-1-wegao@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240308023312.25449-1-wegao@suse.com>
References: <20240308023312.25449-1-wegao@suse.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2] memcontrol03: Using clean page cache to avoid
 dependency on IO rate
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

Bad IO situation(storage bandwidth ~10MB/sec) will lead background
writeback has uncertain progress for dirty page. So system can not
reclaim enough memory for new process and finally lead a unexpected
OOM.

memcontrol03.c:218: TPASS: Expect: (A/B/E memory.current=0) ~= 0
memcontrol03.c:116: TPASS: Child 1918 killed by OOM
memcontrol03.c:224: TPASS: Expect: (A/B memory.current=52588544) ~= 52428800
memcontrol03.c:129: TFAIL: Expected child 1944 to exit(0), but instead killed by SIGKILL

Signed-off-by: Wei Gao <wegao@suse.com>
---
 testcases/kernel/controllers/memcg/memcontrol03.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/kernel/controllers/memcg/memcontrol03.c b/testcases/kernel/controllers/memcg/memcontrol03.c
index 9c6c808e0..e2fc85cc8 100644
--- a/testcases/kernel/controllers/memcg/memcontrol03.c
+++ b/testcases/kernel/controllers/memcg/memcontrol03.c
@@ -144,6 +144,7 @@ static void alloc_pagecache_in_child(const struct tst_cg_group *const cg,
 	tst_res(TINFO, "Child %d in %s: Allocating pagecache: %"PRIdPTR,
 		getpid(), tst_cg_group_name(cg), size);
 	alloc_pagecache(fd, size);
+	SAFE_FSYNC(fd);
 
 	TST_CHECKPOINT_WAKE(CHILD_IDLE);
 	TST_CHECKPOINT_WAIT(TEST_DONE);
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
