Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1872465FF
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 14:07:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7340C3C58CC
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 14:07:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id B21F93C3000
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 14:06:57 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 07D7F600B80
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 14:06:56 +0200 (CEST)
Received: from mail-pj1-f70.google.com ([209.85.216.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1k7duh-0005HE-Od
 for ltp@lists.linux.it; Mon, 17 Aug 2020 12:06:55 +0000
Received: by mail-pj1-f70.google.com with SMTP id hi12so10317054pjb.6
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 05:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=lYeCqLMtGRJu68hEZwD+9Oo8V3/Xbl8pn+i8whIfd1I=;
 b=msT23kGQIsNinrUhfMvsWAPkLF47X4VFJkkOHLfNAeH6ffIsVgSIBj2jRiuvXmb2Fk
 l8gqrCRUSqkI8r7rOueS1j3fd/EaNR0rDxsron132jTfjMy1z394JcKc6Z30xoD763bP
 A+gRJDgRPhzgQaP7oxeSO1DusoBFmv5OLVZ4eQhoSaLoF/i9eMQBNOSO2kbS9tjqN/PN
 c1jimMAef43zgOIrJobKxTQimRgGeh2AjBhEqv4yev93CV/+RjvVfMC6w7JfDbxhKqlR
 dtnvOG2V35mFe4cEGlpBwe38egjRIA3uFOvhwM+k/P2A5IX78ctcQiFqOcNwGHSqaKot
 +hwQ==
X-Gm-Message-State: AOAM530U++zxE19yQ0ANtjciPpmztI5rc3RsuzuIMK1lDYaA4o5aHPRo
 eRxw9W7wqflvEqmfyrjs5xlyqIK1vhEfawZaxPibusX/0nVTudt+PPM7A8zLOSxrmwpuJ9brIL0
 0ddMClHouqu79eNeUfGZmCo0bQp4=
X-Received: by 2002:a62:cf04:: with SMTP id b4mr10738382pfg.84.1597666013870; 
 Mon, 17 Aug 2020 05:06:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy07CJBzBNnjBSkrVD5tVX7gsZ7iiNuQO/KtuLb9jjxhwVGYI6jleVQJ0HPuLQ1RaQrl6Mr0g==
X-Received: by 2002:a62:cf04:: with SMTP id b4mr10738359pfg.84.1597666013465; 
 Mon, 17 Aug 2020 05:06:53 -0700 (PDT)
Received: from Leggiero.taipei.internal (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id e29sm19597278pfj.92.2020.08.17.05.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 05:06:52 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it,
	viresh.kumar@linaro.org,
	chrubis@suse.cz
Date: Mon, 17 Aug 2020 20:06:42 +0800
Message-Id: <20200817120644.9401-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 0/2] Fix for syscalls/utimensat01 test on Ubuntu 4.4
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
MIME-Version: 1.0
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

Also add support to get the distname for Ubuntu by using grep for
^ID=ubuntu from /etc/os-release in tst_kvcmp_distname()

There is no need to know the codename of the release, as we just need
distname UBUTNU and the detailed kernel version for tst_kvercmp2() to
compare the kernel version in syscalls/utimensat01.

Po-Hsu Lin (2):
  lib/tst_kvercmp: Add support to get distname for Ubuntu in
    tst_kvcmp_distname
  syscalls/utimensat01: add exception for Ubuntu 4.4 kernel

 lib/tst_kvercmp.c                                 |  5 +++++
 testcases/kernel/syscalls/utimensat/utimensat01.c | 11 +++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
