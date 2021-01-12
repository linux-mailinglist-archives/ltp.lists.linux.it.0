Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC842F3C95
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 00:38:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 436683C5DD3
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 00:38:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id EC9763C26DD
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 00:38:08 +0100 (CET)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8A4D8200B80
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 00:38:08 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id t16so210848wra.3
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 15:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hax1ls1xv3/MUIfirb/0S1Yyqg/rXy/WmaXhvsbL4A8=;
 b=eFc+AnNYyyys2NYada6d2X4LoSFtqRbt77jiK+UAKUnrE+6gFOE1vgtTNACy3xPofy
 Lfgc7XlHN8anDAOvb86M++HZvYNH9iGjv4TX8jFx14LpX9ih3+L51YHY9mh1XYwLueKZ
 gQBjpuBxE7GIpsVfWXC3g8piJQUfBH3BpI82p1/nhy5xp7m9D9JcsXSWZ0cSeYRNeHNh
 DfCLFJTG8ip/Wpp3uj934g0VnDyfO5bPF/sKRO7nyuURxfjFs709/SmOIkrqATizQWa+
 86PwCzjhdn6G5nl0i58rVR34wfscKa5AMNYpUz99KxSZ/wSfAgvbw62WB/oo3ZSwLvRQ
 6WWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hax1ls1xv3/MUIfirb/0S1Yyqg/rXy/WmaXhvsbL4A8=;
 b=si+GJZw/uftr/jYEA1DhLK+vRbvxJdKwZ6CtfT57hW4Lhqv2Mx7KbXUNWUup+EVgtT
 xhZQoSRut5YJErpjihdsbCqBiXNHYArB/SCcgA0uQrFn3GN3Kc4BKtW9b4/v/r//NdNC
 t/DGc8bQjJF9H3IYNDqgWom2zBP/pBS5Zr0jtkvjfCm3i6J7pfPA618ogEGm6pwrvWN2
 48OJHFjkuZkOjRPCousHDyUWsl99KD327YUeZ/X29RE4PW4554rWNPnktiVmkCOcO/4z
 08Bt+XFwymE8r14cAbEnt/v9LdOWpEtUKny2OJ+QfADek7+aG00HLv80Ka7XVRLmUaX+
 DpKg==
X-Gm-Message-State: AOAM532yw+JemK3VerQgIV3g/SIstBQ6ECIN8TapQMa8XlCfA/RQ5+Ql
 nnYfe5cg9BoA7K5RX68PzEX5iqn0LmN5dQ==
X-Google-Smtp-Source: ABdhPJxQJnfYkLdhe338u1UEpj3+BE3kd2gO06KSYRQ6ore7TAS1NGYhSTjoVSPINkKbQF4bnDPJiQ==
X-Received: by 2002:a05:6000:ce:: with SMTP id
 q14mr1061190wrx.277.1610494688119; 
 Tue, 12 Jan 2021 15:38:08 -0800 (PST)
Received: from dell5510.suse.de ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id a13sm7737wrt.96.2021.01.12.15.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 15:38:07 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Wed, 13 Jan 2021 00:37:58 +0100
Message-Id: <20210112233758.11658-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] Fix struct __kernel_old_timeval redefinition on
 64bit sparc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

64bit sparc is the only arch which defines struct __kernel_old_timeval
in it's asm/posix_types.h header, thus guard it.

NOTE: previously it was guarded with __kernel_timex, which worked as well.

Fixes: a6607b81b ("syscalls: Don't pass struct timeval to tst_syscall()")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 include/tst_timer.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/tst_timer.h b/include/tst_timer.h
index d2c3f3cb1..657c0824f 100644
--- a/include/tst_timer.h
+++ b/include/tst_timer.h
@@ -99,10 +99,12 @@ static inline long long tst_timeval_diff_ms(struct timeval t1,
 
 typedef __kernel_long_t	__kernel_old_time_t;
 
+#ifndef __kernel_old_timeval
 struct __kernel_old_timeval {
 	__kernel_old_time_t	tv_sec;		/* seconds */
 	__kernel_suseconds_t	tv_usec;	/* microseconds */
 };
+#endif
 
 struct __kernel_old_timespec {
 	__kernel_old_time_t	tv_sec;		/* seconds */
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
