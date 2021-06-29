Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A743B71C8
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 14:10:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C8BF3C6CCD
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 14:10:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BB2013C0F90
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 14:10:56 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1B3911A00E5F
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 14:10:55 +0200 (CEST)
Received: from mail-ed1-f71.google.com ([209.85.208.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lyCZr-0006kn-00
 for ltp@lists.linux.it; Tue, 29 Jun 2021 12:10:55 +0000
Received: by mail-ed1-f71.google.com with SMTP id
 w15-20020a05640234cfb02903951279f8f3so6228583edc.11
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 05:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tFzqbIL9NekbCqS+oimAAc+wSCrh7WNDqbwW2zSkdWs=;
 b=MSUe39SBZ5wNYBjvQLblA9stLPH3i0myjKpPwAq2zv22DQOWUhfZBbonL2Fcy/YnYU
 Bbdv6aVVTw+5l+FYwFDlYLqoB156ciVSpMnsxs4hHEHIyK98rx2pTbQMwQCNaOqs/oEE
 drPMaOnVPSS0r3dq8YGShsehVC+W6s/COUcsxZ4bedsOxzh4P+BH1X7BPTPJm4X3/ddC
 /9UrYdGcelooZx4Ia0INSla1/rH0QwYZ45TPOACuGGIV78TZHgLhHv/gS8KLVY4gW5ms
 YDiznuZgy3tldZrktawrChnnTWrBlgAZVzz31yW6IzHKkeSfd+tz6yA6NcNO1Qgt0pka
 yJwQ==
X-Gm-Message-State: AOAM533Lk9eTc6uhxc/rpJYuiPwLqHY6zCr8vjQVni9sl+ubq2sv7vZj
 Yzggj0j+SgCMOnCLOAhxgkhBUcwJ4VXdTweFAfAY46OEcOogN/D3xj7qsyKu7DclX/zstjedE93
 cH9g/4SFNL6A/uhTKUhNIMICSPt9t
X-Received: by 2002:aa7:c043:: with SMTP id k3mr39310490edo.160.1624968654354; 
 Tue, 29 Jun 2021 05:10:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoKZBXF89+uEjqI0AWVd3iZyfEGFWMi6aR96gXJdMH+i7Pm1zaKTaLSefGxiTbNM6d1UROZg==
X-Received: by 2002:aa7:c043:: with SMTP id k3mr39310476edo.160.1624968654239; 
 Tue, 29 Jun 2021 05:10:54 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id n4sm8084256eja.121.2021.06.29.05.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 05:10:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Tue, 29 Jun 2021 14:10:43 +0200
Message-Id: <20210629121047.100391-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v4 0/4] syscalls/msgstress: fixes for small systems
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

Hi,

Changes since v3:
1. Adjust subject of patch 2/4.
2. Don't use TEST() macro in 2/4.
3. Remove debug messages in 2/4.
4. Return unsigned int in get_session_uid() as it cannot fail in 2/4.

Changes since v2:
1. Resend due to messed up previous submission.

Changes since v1:
1. Move the code reading cgroups session limit to lib/tst_pid.c to
   existing tst_get_free_pids_().
2. Allow reading session limits from cgroups v2.
3. Add patch 1/4 - typo fix.
4. Add patch 4/4 with the buffer/reserve of pids.

Best regards,
Krzysztof

Krzysztof Kozlowski (4):
  include/tst_pid.h: fix language typo (subtraction)
  tst_pid.c: fix fork failure on small memory systems
  syscalls/msgstress03: fix fork failure on small memory systems
  syscalls/msgstress: tune limit of processes for small machines

 include/tst_pid.h                             |  6 +-
 lib/tst_pid.c                                 | 72 ++++++++++++++++++-
 .../syscalls/ipc/msgstress/msgstress03.c      | 15 +++-
 3 files changed, 89 insertions(+), 4 deletions(-)

-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
