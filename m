Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E7524827B
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Aug 2020 12:04:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5F7A53C587C
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Aug 2020 12:04:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id CBFAC3C24E2
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 12:04:37 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 048AB1000F5F
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 12:04:36 +0200 (CEST)
Received: from mail-pl1-f197.google.com ([209.85.214.197])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1k7yTs-00009m-2A
 for ltp@lists.linux.it; Tue, 18 Aug 2020 10:04:36 +0000
Received: by mail-pl1-f197.google.com with SMTP id bg5so11891504plb.18
 for <ltp@lists.linux.it>; Tue, 18 Aug 2020 03:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fjgtj70lj+s3VfMdS5UnUcERCnmU5Om+AkhRT5nloeI=;
 b=XojQ82hPwDBZwyWj4ZTKDGp2lbGDUj6DBtILxqCfzwHrDX4DdSkoJquOa9LvDAw0Fa
 pUU2ewCBUC7UYUPVegDNYSpVQSzJov0Iy3Q9eMoWp8pGSB20nFxEEUrpd3ijHWiQLWTY
 DCdSeS1bSN1HLDTHr/3STlnntlHZDKihRdXnujXtDaajOXv+XJv4xvouWSMbV62ilNQi
 yr6V0u+HsWl91gV4kyMiBB4WAzUx73HXzc5kLYC1sZ9bYRBiYly/lVSA+Q4LCqKrvKZt
 N1dHMnGom9bjeCGh5aTbw839rQqaaMclT3v+5hBiHRTO214hwVe3+0MDb57XxvgcGUhc
 wwpg==
X-Gm-Message-State: AOAM530AWfURnP3/9MHxrnPfq4oWHELY0EaJqCYS+plxOMCoQT/xvGMh
 zy9QL09lO8mW5/nrV/En3RaKr7yyd8Zzo8yVZf4GUrcDmUY40yLfj62iNyd7zB9ako9LCn0fa6s
 wSS1TzZ9fcoOt6JUSleJwfpcn9fQ=
X-Received: by 2002:a63:8f41:: with SMTP id r1mr12305137pgn.375.1597745074260; 
 Tue, 18 Aug 2020 03:04:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEPcGaXGZvSHpo8Q7rjlWyTKcoxR77a3jbxXi4hdUbkCNRciTQXhIfUNbzCVIs/OfsQiq2lQ==
X-Received: by 2002:a63:8f41:: with SMTP id r1mr12305113pgn.375.1597745073760; 
 Tue, 18 Aug 2020 03:04:33 -0700 (PDT)
Received: from localhost.localdomain (223-137-244-244.emome-ip.hinet.net.
 [223.137.244.244])
 by smtp.gmail.com with ESMTPSA id q10sm23433222pfs.75.2020.08.18.03.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 03:04:32 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it,
	viresh.kumar@linaro.org,
	chrubis@suse.cz
Date: Tue, 18 Aug 2020 18:04:20 +0800
Message-Id: <20200818100422.27775-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCHv2 0/2] Fix for syscalls/utimensat01 test on Ubuntu 4.4
 kernel
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
Cc: po-hsu.lin@canonical.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Ubuntu 4.4 kernel got the backported kernel patch (b3b4283) for
syscalls/utimensat01 since 4.4.0-48.69, therefore it will return
EPERM instead of EACCES.

Without this fix, the test will fail on Ubuntu 4.4 kernel with:
  FAIL: 18: utimensat() failed with incorrect error, expected EACCES: EPERM (1)
  FAIL: 19: utimensat() failed with incorrect error, expected EACCES: EPERM (1)

Add Ubuntu kernel version comparison to fix this.

Also add support to get the distname for different OS by parsing ID=
from /etc/os-release in tst_kvcmp_distname()

Po-Hsu Lin (2):
  lib/tst_kvercmp: Add support to get distname for different OS in
    tst_kvcmp_distname
  syscalls/utimensat01: add exception for Ubuntu 4.4 kernel

 lib/tst_kvercmp.c                                | 16 ++++++++++++++++
 .../kernel/syscalls/utimensat/utimensat01.c      |  7 ++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
