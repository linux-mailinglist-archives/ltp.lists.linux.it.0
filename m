Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A1B3B1BCB
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 15:59:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 23FF63C6FDB
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 15:59:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1E7BE3C2B93
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 15:59:17 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C9C2B200D2E
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 15:59:16 +0200 (CEST)
Received: from mail-ed1-f69.google.com ([209.85.208.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lw3PQ-0000jV-5z
 for ltp@lists.linux.it; Wed, 23 Jun 2021 13:59:16 +0000
Received: by mail-ed1-f69.google.com with SMTP id
 p23-20020aa7cc970000b02903948bc39fd5so1354635edt.13
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 06:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5CPLG80RehDIUiK5cgZNw3q4KhSLuLMlyU1kJwD+uKk=;
 b=jn0jLxuO61rbQGGCwa2NFH+K3K9Ghfu8rf2WSKoqE6i+73FtGLtec0nBTA9Y8VmBdm
 gSV4ymAaqccU6VuncPUYFHKHScJ3CO/rjb0EXleDBphgOl3nayYeOwCmlCznYy0fx8kZ
 7ktJldMdOYBRBeTam1M9hwxzzifE4DMsL0lz2CYUX6gHKAiL1dHlt6FQOgiZFqS6Niqm
 HuzDfTg0eXz1LTWzvwtJ+Gb6uQH4QCOI1yi0kuYPkE37wZSD0gM0FAuj3r7iGJwtedDl
 Pk/yEUzf3kzR94M7ux1eLRjMVkUwy5RUaf6nzye9q/5qa3l6mwE1An1uqtQUZq1wUtCK
 BTnw==
X-Gm-Message-State: AOAM531WtbjvMh2GKlHut/wULzAPoixBEcYGDioUjLdftJCw09D3hMkr
 JXdnA4d1Queo/TgLRhxU6MxXh6m6Z2Oc6QYKMhy7WXjdlzQdXooLoq5xQb/4beXQsG0c5/QeYzz
 OfrtKv7C9mBhPedLhSrknMysdTiZq
X-Received: by 2002:a17:907:a8f:: with SMTP id
 by15mr117953ejc.357.1624456755552; 
 Wed, 23 Jun 2021 06:59:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtPFVHRsHeD3AvCJF+8nwWLootMBnjKDkPKctM/CpWPo0ut8VA24qkENmX2fpM2ZiRULBC/w==
X-Received: by 2002:a17:907:a8f:: with SMTP id
 by15mr117924ejc.357.1624456755048; 
 Wed, 23 Jun 2021 06:59:15 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id bz27sm7441030ejc.15.2021.06.23.06.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 06:59:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Wed, 23 Jun 2021 15:59:08 +0200
Message-Id: <20210623135912.81156-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/4] syscalls/msgstress: fixes for small systems
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
  syscalls/msgstress04: fix fork failure on small memory systems
  syscalls/msgstress03: fix fork failure on small memory systems
  syscalls/msgstress: tune limit of processes for small machines

 include/tst_pid.h                             |  6 +-
 lib/tst_pid.c                                 | 81 ++++++++++++++++++-
 .../syscalls/ipc/msgstress/msgstress03.c      | 15 +++-
 3 files changed, 98 insertions(+), 4 deletions(-)

-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
