Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8D121B0E6
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jul 2020 10:01:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2130D3C5398
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jul 2020 10:01:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id DD3F63C133E
 for <ltp@lists.linux.it>; Fri, 10 Jul 2020 10:01:57 +0200 (CEST)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8AA281A019B3
 for <ltp@lists.linux.it>; Fri, 10 Jul 2020 10:01:56 +0200 (CEST)
Received: by mail-pg1-x542.google.com with SMTP id e18so2184797pgn.7
 for <ltp@lists.linux.it>; Fri, 10 Jul 2020 01:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J+6QMOxSHbKAHibNCb10koVgBNUdw11e+L6pB5G3/uw=;
 b=UNaFFUaLfml8LsGs9HQJ25gvLFfXkJkzm7hnEgQDoTqDUYRdX+wJAeruIMjY/Ze6Fo
 5dj787Nali38NXIXLc3OI2U4g4Tv62ePeeTHQFCRN/C5NFLNUeX7OL0H55korbI5uUkc
 dlfV6iXqVOm5tn6k17KCFBsS5sQ2U0Yg5HveDYOBJU+WN+0elG1KL1t+eiSREa18wN4K
 TKC3DZbyjcn6Yt6nU9+ava+zlpWyOchzl3fJinKS3hZbnNFbyOv5KPADs8LlaFt1CiSD
 cJLyN3x9nCfeiUnjy68+Lci/VxBSZhBaRf8IHX90b72GVqwjXldVpuAF9+qbNzZSMOIa
 1n3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J+6QMOxSHbKAHibNCb10koVgBNUdw11e+L6pB5G3/uw=;
 b=Us0flpsuglj7UpFpxWDWGwX2zS05I6o/SCtB2pXboSmHQ3e9N2DewlysSYwtwmctdd
 wIdUtp6y8Kdwse3MHv+P8q2q0FDg2M+qvv2g7AVwbrLN/7C3qMHMAo+mp36OcXYSAQFA
 e7l1OLxXfdl0vzSdaXfoQLsJhW98V3vX42DRdCEInXdJ30A7ruRszVHutZml6oeAqPGc
 /w2KyLXafC7GCnGwYLFyCY+6jLS310Du80PkoTYj9NeC3amLNitFt44FM3GwYafX5urF
 pbPPDjc5uwTYEAEJ8w15W8oZKd78vgXG1zi5HGRk1M9F8Bvk6+mspnLzEJGfE/3iudiF
 3Dyw==
X-Gm-Message-State: AOAM530zwAvqzldnfYQNZpNN42Qq1nMWBlI3/5I/ONn9uF5soDGWmaL0
 rdKtFjCVqln5RQzMiqUXQxXUCNK4aFw=
X-Google-Smtp-Source: ABdhPJzmVucRiQkc+YSVx0Wd+zBgsw23AY6DBH7+5lysMQi/4Zula1d+ogKv4oXHJiv+1wcmXdMv1Q==
X-Received: by 2002:a62:1b4a:: with SMTP id b71mr54422132pfb.9.1594368114254; 
 Fri, 10 Jul 2020 01:01:54 -0700 (PDT)
Received: from localhost ([122.172.34.142])
 by smtp.gmail.com with ESMTPSA id y19sm5519179pfc.135.2020.07.10.01.01.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Jul 2020 01:01:53 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 10 Jul 2020 13:31:45 +0530
Message-Id: <cover.1594367611.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [RFC 0/3] syscalls: Rearrange sigwait syscall tests
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

Hi Cyril,

As suggested by you I have tried to rearrange stuff here and having some
difficulty in getting rid of the last few build and runtime errors. And
so sending this as RFC.

Problem 1: Build failure.
---------

This fails with the error:
ltp/libs/libltpsigwait/sigwaitinfo01.c:53: undefined reference to `create_sig_proc'

create_sig_proc() is defined in lib/ and I am trying to use it in libs/.
Somehow linking is failing here as there is no local user of the routine
create_sig_proc() within lib/ directory. If I create a dummy user
(https://pastebin.com/LiNukt1n) there, then the build passes.

I don't know how to properly fix this.

Problem 2: Runtime breakage.
---------

If I build it using the earlier hack then at runtime I have started to
get following error while running the tests now, right after the first
test passes:

tst_test.c:362: BROK: Child (14595) killed by signal SIGTERM

I don't really understand why this has started to come up now, while it
didn't happen earlier at all.

This is rebased over the earlier series which is under review
(specifically the following patch,
[PATCH V7 10/19] syscalls/rt_sigtimedwait: Add support for time64 tests).

--
viresh

Viresh Kumar (3):
  syscalls: sigwaitinfo: Suppress all warnings around unused parameter
  syscalls: sigwaitinfo: Remove SUCCEED_OR_DIE() macro
  syscalls: sigwait: Separate out code to relevant folders

 include/libsigwait.h                          |  45 ++
 libs/libltpsigwait/Makefile                   |  11 +
 libs/libltpsigwait/sigwait.c                  | 428 +++++++++++++++
 .../kernel/syscalls/rt_sigtimedwait/Makefile  |  10 +-
 .../rt_sigtimedwait/rt_sigtimedwait01.c       |  78 +++
 .../kernel/syscalls/sigtimedwait/Makefile     |   9 +-
 .../syscalls/sigtimedwait/sigtimedwait01.c    |  37 ++
 testcases/kernel/syscalls/sigwait/Makefile    |   9 +-
 testcases/kernel/syscalls/sigwait/sigwait01.c |  37 ++
 .../kernel/syscalls/sigwaitinfo/Makefile      |   4 +-
 .../syscalls/sigwaitinfo/sigwaitinfo01.c      | 511 +-----------------
 11 files changed, 662 insertions(+), 517 deletions(-)
 create mode 100644 include/libsigwait.h
 create mode 100644 libs/libltpsigwait/Makefile
 create mode 100644 libs/libltpsigwait/sigwait.c
 create mode 100644 testcases/kernel/syscalls/rt_sigtimedwait/rt_sigtimedwait01.c
 create mode 100644 testcases/kernel/syscalls/sigtimedwait/sigtimedwait01.c
 create mode 100644 testcases/kernel/syscalls/sigwait/sigwait01.c

-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
