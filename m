Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FB23B1BAB
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 15:55:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D84E83C6FDC
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 15:55:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CBDF93C2307
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 15:55:30 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id F2F06200D44
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 15:55:29 +0200 (CEST)
Received: from mail-wm1-f70.google.com ([209.85.128.70])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lw3Ll-0000J7-3f
 for ltp@lists.linux.it; Wed, 23 Jun 2021 13:55:29 +0000
Received: by mail-wm1-f70.google.com with SMTP id
 i82-20020a1c22550000b02901d64e84b3c9so637633wmi.5
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 06:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MXKdP9TpHh47o1O7hjbbxS6xn+CzSqZW3ZzX7lMlszE=;
 b=Tlguy5cxuNEWhp3f/rmUomD92dqsBCu5VTF434QOTokc70GTRpgJyWR/A/Z3Jg4FQo
 xIGQJwXZ23t8szePfzBDr7L45M9E+kTPzy42vGwO4113oDrJKCbkh7WnvST1AdGKa9OI
 3jq3Dj7pS1g6jB2AZj7+BehZI6eaOCL3s3udJbDFEbqnfJjai0ISBictnFdKAIDeqCd8
 szEDnL/ceXadOsLKk+l/Hlbt+LPmwd+XmjvYcho4X/XriA31VHZat/saqFJY7TJR+W2Y
 nU1r/mpVPcBv7KoodxTKVucvxwyA2TSHRJ+ikM7YaA4bbrhl/NHQhuSBuulDavzmTFam
 H0KA==
X-Gm-Message-State: AOAM532eAUVjRAfE+Tj1T8p00PIuZei/U2rH1nA9ea1rK7mcZbk0nqvF
 02y6IWNOBf+maNohBjCuf7vs0WkdkNoCgx2aV9Mx80qtewpfLORup+phyD1OAdx/FtkEyAlILC1
 jwOUpH5KM6EOL8brWqGKB2qqGL8Aq
X-Received: by 2002:a1c:c388:: with SMTP id t130mr10808028wmf.57.1624456528687; 
 Wed, 23 Jun 2021 06:55:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoq1H4t1NVZgtv9zEyHUtDgJYR7jrJBFdnmIMRaoLbH+T1ZZlSfphLOZgKVOPZnVoyFpSdFw==
X-Received: by 2002:a1c:c388:: with SMTP id t130mr10808018wmf.57.1624456528497; 
 Wed, 23 Jun 2021 06:55:28 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id v5sm5746567wml.26.2021.06.23.06.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 06:55:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Wed, 23 Jun 2021 15:55:17 +0200
Message-Id: <20210623135524.80663-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/4] syscalls/msgstress: fixes for small systems
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
