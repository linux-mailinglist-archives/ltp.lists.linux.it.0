Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3BB3F29B6
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 12:01:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 567A53C2997
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 12:01:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3C7B93C194A
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 12:01:08 +0200 (CEST)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 296D4600940
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 12:01:07 +0200 (CEST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1A843406E1
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 10:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629453667;
 bh=MBUzdkQulOVvPP70mrvZwwSzXSHs0EoH2GUp2bBhI8A=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=nsUoAAb4RK7BlMRhWiXQp/a75/Pxs5/iklcJl6fxy2ItUGQFNkVrKlzMzwSbQUAET
 9OnnMqwe2qU+qN8ljjDBXpaz47F6+C2ixARNAO2i7hccczF1VT4vKJs2Sgoz4/nAX7
 6uIQlJyY6ojVOsg8viYPD8Yvf9yMfwIC2nsD8U1PeCV/6RPYGiSqnnlpWJv3ueapkT
 ZF2qS4UYSzoTRM/fEE3aU61i0wOPhZO1Mb0sQwZlY3lPS8++hHPNRD13iuPefkWuCb
 joapav5ysqYcFDMPhSyWlaP8TH5vJhrk48EWXMjcA/TAQmJkGXycqNxNUyj10Ubigs
 WjeRMi/VzCPwA==
Received: by mail-ed1-f70.google.com with SMTP id
 z4-20020a05640240c4b02903be90a10a52so4284725edb.19
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 03:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MBUzdkQulOVvPP70mrvZwwSzXSHs0EoH2GUp2bBhI8A=;
 b=NMD3M8VnmXshE4Tf31NDdpJXdr7YLC/K75210BItdONQJ0Mhg4aRGVKJQgvIpr37a+
 /3X+vpC/iKqPCtwdZKh2abOf+CeLWDM0LXzmnXX5BqdFSy4w61/jLxxXTVdaQliLANBF
 KrxbYVpw8yC9LEFgZUOmcZl1S1edCuIaJz/HZjJLuRJ/n93JxkgH3lctEKkp6jUJonn5
 Xl8YigguCiztmVtSugrXsDffZJYMBiBAmxsR6Jw1QAsY7x5kYxj9lV/lB28u/R1T+Qdh
 sA8hyh+7mN/2qGwz1GlqNZqRJ72zHd+O75jrcNAHl1tqO8RIyL62+hTSMasdDbfO/T74
 FOdA==
X-Gm-Message-State: AOAM530UVUz+afGrD66I+g2KgieUeh9Kjjm6G7S7dCjnBmtPAh32liw7
 nx+lo+Jgcx15Q2Pb+LLiKzbHEJ1T+b+68LC7TgeSNTymVaOXPtYeaemDMg5zRiBs25Ah3TiqJjO
 QEs+NbxHs83dKEHc8OEwcXMJYUrBL
X-Received: by 2002:a17:906:1bb1:: with SMTP id
 r17mr20933252ejg.533.1629453666397; 
 Fri, 20 Aug 2021 03:01:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyks91kAQD4WPqsq2EmAVKEGcxrVoGqMomL7Hxu9xzDKTQihS8QO7YTDCKgoNliA4Az9hDN8w==
X-Received: by 2002:a17:906:1bb1:: with SMTP id
 r17mr20933234ejg.533.1629453666219; 
 Fri, 20 Aug 2021 03:01:06 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id r2sm3280162edv.78.2021.08.20.03.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 03:01:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Fri, 20 Aug 2021 12:00:25 +0200
Message-Id: <20210820100028.97487-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v5 0/3] syscalls/msgstress: fixes for small systems
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

Changes since v4:
1. Drop applied patches.
2. Add patch 1/3 moving code to lib.
3. Change limit 500->50 in patch 3/3.

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

Krzysztof Kozlowski (3):
  lib/tst_pid: simplify error handling by callers of tst_get_free_pids()
  syscalls/msgstress03: fix fork failure on small memory systems
  syscalls/msgstress: tune limit of processes for small machines

 lib/tst_pid.c                                       | 13 +++++++++----
 .../kernel/syscalls/ipc/msgstress/msgstress03.c     | 10 +++++++++-
 .../kernel/syscalls/ipc/msgstress/msgstress04.c     |  6 ------
 3 files changed, 18 insertions(+), 11 deletions(-)

-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
