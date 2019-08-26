Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C2F9CCC5
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 11:47:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A89ED3C1CF6
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Aug 2019 11:47:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 49B0D3C1C6D
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 11:47:29 +0200 (CEST)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D15791000A01
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 11:47:21 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id m24so14417702ljg.8
 for <ltp@lists.linux.it>; Mon, 26 Aug 2019 02:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=V4wnC1IESTIvccJjycijXVomS8LY+xe0wyWh2XpadOM=;
 b=EJBPUqONNfST5dbaQN3WVBVLSK2FdlYkAB3W+e5L2SPL1yrC0uMz2eYkryWWZFfKJx
 08KLHFLhiH6aUXuNCi2XiBqdXUESKNpaEAp3JOe9FJByq6vEQRNTugAAGzAXRQws+4RI
 mU8/1T+qXoo6124lsJ2bXZtfB291e6OwieCYwon/dWML3a0lWiEH+DY4St+h21vjGzYl
 ZgVzO+mgaFdBpLwsMuDmzhmf2fai/bBOMnH5b2PDVPExkoq2rajppnLJ4WBwoLlK27f0
 dZGhouppmrP7Y8wZj6W1gBhXG34408H7o/gLZ9jfsS1pfU3ME6pXrT+//Fp6H25+xBbq
 +n0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=V4wnC1IESTIvccJjycijXVomS8LY+xe0wyWh2XpadOM=;
 b=l3WKlBnepVWV3vrIvR4Rx8Vxs44FWwhMWm+FhwfXmppU7pp2eWNsf6lNR46Mx/XeqW
 4ClTmzFd72evuZUH0ci77A+X/MacbzNNWjiwko5KUCR74B9MmKPAYdGmtjXo9VG86+Hd
 WLfSUSrtBfQ5UOL+RrzEr/16tlT3VJIOoygLNo3wfN2jCyJ0J+u47ryt664RS0+I/Ckd
 H+r3gV90bhCPv/8xV919cWey4TElODJUJJJGXL/RFvQ/g2j8H9ZNDtkB7ndArDuQ3yLA
 O/zSAQTy8fFHsI2ojBubz9BhjCfIqBIB6NZIUbrsZP7kQ64/JsTgvf435EJ7M8A9JWhz
 gllw==
X-Gm-Message-State: APjAAAV+FXAcBgwYKNAQPgc9+x6KQzv869XLmqjAR/XkbK0pyY8FPi61
 XMeE9b6FxrvVngZ0XbxGJG3EO/3aXZne3CWc4ThJBScsMPs=
X-Google-Smtp-Source: APXvYqymkztdlCAHqJp6WG1YtlxHoUjq6nFfsqaRgdYCw2b5Y7d3wdgrnYU4I272qiRDH+DdWgFa1C71lRg4iAGcgcw=
X-Received: by 2002:a2e:f19:: with SMTP id 25mr9882288ljp.149.1566812847394;
 Mon, 26 Aug 2019 02:47:27 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 26 Aug 2019 15:17:16 +0530
Message-ID: <CA+G9fYtN2tjHZtjtc8isdsD5hF76teeh2-pngUp+uj3WYdj7jA@mail.gmail.com>
To: ltp@lists.linux.it, Linux-Next Mailing List <linux-next@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>, alexey.kodanev@oracle.com, 
 the_hoang0709@yahoo.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] Linux-next-20190823: x86_64/i386: prot_hsymlinks.c:325:
 Failed to run cmd: useradd hsym
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

Do you see this LTP prot_hsymlinks failure on linux next 20190823 on
x86_64 and i386 devices?

test output log,
useradd: failure while writing changes to /etc/passwd
useradd: /home/hsym was created, but could not be removed
userdel: user 'hsym' does not exist
prot_hsymlinks    1  TBROK  :  prot_hsymlinks.c:325: Failed to run
cmd: useradd hsym
prot_hsymlinks    2  TBROK  :  prot_hsymlinks.c:325: Remaining cases broken
prot_hsymlinks    3  TBROK  :  prot_hsymlinks.c:325: Failed to run
cmd: userdel -r hsym
prot_hsymlinks    4  TBROK  :  tst_sig.c:234: unexpected signal
SIGIOT/SIGABRT(6) received (pid = 8324).
prot_hsymlinks    5  TBROK  :  tst_sig.c:234: unexpected signal
SIGIOT/SIGABRT(6) received (pid = 8324).
prot_hsymlinks    6  TBROK  :  tst_sig.c:234: unexpected signal
SIGIOT/SIGABRT(6) received (pid = 8324).
prot_hsymlinks    7  TBROK  :  tst_sig.c:234: unexpected signal
SIGIOT/SIGABRT(6) received (pid = 8324).
prot_hsymlinks    8  TBROK  :  tst_sig.c:234: unexpected signal
SIGIOT/SIGABRT(6) received (pid = 8324).
prot_hsymlinks    9  TBROK  :  tst_sig.c:234: unexpected signal
SIGIOT/SIGABRT(6) received (pid = 8324).
prot_hsymlinks   10  TBROK  :  tst_sig.c:234: unexpected signal
SIGIOT/SIGABRT(6) received (pid = 8324).

Full test log,
https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20190823/testrun/886412/log

Linux version:
Linux version 5.3.0-rc5-next-20190823 (oe-user@oe-host) (gcc version
7.3.0 (GCC)) #1 SMP Fri Aug 23 09:35:54 UTC 2019

steps to reproduce:
   cd /opt/ltp
   ./runltp -s prot_hsymlinks

metadata:
metadata:
  git branch: master
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git commit: 9733a7c62c66722bcfdb1a6fe4d35c497312d59a
  git describe: next-20190823
  make_kernelversion: 5.3.0-rc5
  kernel-config:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/intel-corei7-64/lkft/linux-next/591/config
  build-location:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/intel-corei7-64/lkft/linux-next/591
  toolchain: x86_64-linaro-linux 7.%
  series: lkft
  ltp-syscalls-tests__url: git://github.com/linux-test-project/ltp.git
  ltp-syscalls-tests__version: '20190517'

Best regards
Naresh Kamboju

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
