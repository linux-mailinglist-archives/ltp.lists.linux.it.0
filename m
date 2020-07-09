Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2FB219777
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jul 2020 06:36:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0F5B23C2974
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jul 2020 06:36:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id E9A893C133E
 for <ltp@lists.linux.it>; Thu,  9 Jul 2020 06:36:37 +0200 (CEST)
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 541781000C42
 for <ltp@lists.linux.it>; Thu,  9 Jul 2020 06:36:37 +0200 (CEST)
Received: by mail-lj1-x242.google.com with SMTP id q7so837791ljm.1
 for <ltp@lists.linux.it>; Wed, 08 Jul 2020 21:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=FwMHQwkgTEwQRptlW5b6jzutVAPRI0aEXcdLLOfXyrw=;
 b=cnHOXpWiDEMUEEnM/npZ01dnQ0+XeacZ4HDG0MkrzFEdqj1Hinv22sosTGO8htk8Ei
 t6FtfVP2OkWl4fM7jXfc766XO9uacNco8e9LxoGKbfiVSs+Dq7X2+kdBn3sXyZDJml04
 C5nUKTA3XSgSzyo79lqDL9lQ1WPpZoY4eM9K8LMaqC9ydDBhRHMjOqfZbAExdDOdk36k
 NqSb0i+QJMlDGHnbII+jXKD9mEA31S5gFydR54ExjJ90QwVAInx86P8OA63lriqW4Ir9
 1z9QxJ6rMSvFEkPsqQ3oJMDeQAH0jUU+gmrW1rUATFRxgAQsCgzBVXqSnZ/OkJxtsWAo
 aJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=FwMHQwkgTEwQRptlW5b6jzutVAPRI0aEXcdLLOfXyrw=;
 b=Wiw8MgMZb8/Xo9Dk1/MjU64elIO/Ajr0KGjFD3UutlQliT9d4mkw6lkdqQLHXbGAYm
 y2wj1oraoLGo1MIj0RSY1aB0/OXiiUR47CH0+ynGlxKCwXVSZQCunQE/3iXX84Yra9sB
 AoDviOqe2XxZqrTyTxHyNabO6zo0Mk6030kq82ICU9NPpB6i1cz9NhIX1jtBWejsNdPr
 D2+x4OCQ/Z2dXAjswpgBX7/tXBVZG+IC16jYNHsQyKBIfiJWWtMidvyKTh0NaUplS5Yp
 VswsfYesidcnhp/KAjugy45aI+d9C15KIO7dNYu5GseMY6beRG/wANbwiRUrS9Hx+6sS
 jzzQ==
X-Gm-Message-State: AOAM533FTT6KBsL2sjeluklsFq9j1tKg+//ZAz3a6VYX7Z2OXMyaz41Q
 mknxOrM6W0svy62JqAH7k0lwkWGtM69mm6PGS0d5qA==
X-Google-Smtp-Source: ABdhPJzYJsqzNKsY4EAkHAFqAD9WzPmTSzI/cSxjIUQZyqXtIMrWqPk/XFPswbYH7OGJEtEIjVIwdNbXjTus2j+Hm1I=
X-Received: by 2002:a05:651c:1a6:: with SMTP id
 c6mr26721004ljn.358.1594269396489; 
 Wed, 08 Jul 2020 21:36:36 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 9 Jul 2020 10:06:24 +0530
Message-ID: <CA+G9fYs3EavpU89-rTQfqQ9GgxAMgMAk7jiiVrfP0yxj5s+Q6g@mail.gmail.com>
To: open list <linux-kernel@vger.kernel.org>, LTP List <ltp@lists.linux.it>, 
 linux-arm-kernel@lists.infradead.org
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] BUG: KASAN: global-out-of-bounds in
 is_affected_midr_range_list on arm64
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
Cc: Mark Rutland <mark.rutland@arm.com>, saiprakash.ranjan@codeaurora.org,
 Arnd Bergmann <arnd@arndb.de>, suzuki.poulose@arm.com,
 Marc Zyngier <marc.zyngier@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, james.morse@arm.com,
 ascull@google.com, Basil Eljuse <Basil.Eljuse@arm.com>,
 catalin.marinas@arm.com, steven.price@arm.com, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

While running LTP cpuhotplug test on mainline 5.8.0-rc4 the kernel BUG noticed
on arm64 Juno-r2 KASAN config enabled kernel.

steps to reproduce:
- boot KASAN enabled Juno-r2 device
- cd /opt/ltp
- ./runltp -f cpuhotplug

metadata:
  git branch: master
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
  git commit: 63e1968a2c87e9461e9694a96991935116e0cec7
  kernel-config:
https://builds.tuxbuild.com/wc75HkrGrWgQCdI-l_1jUw/kernel.config
  vmlinux: https://builds.tuxbuild.com/wc75HkrGrWgQCdI-l_1jUw/vmlinux.xz
  system.map: https://builds.tuxbuild.com/wc75HkrGrWgQCdI-l_1jUw/System.map

Test log:
Name:   cpuhotplug02
Date:   Thu Jul  9 00:09:24 UTC 2020
Desc:   What happens to a process when its CPU is offlined?

CPU is 1
[  123.400330] process 722 (cpuhotplug_do_s) no longer affine to cpu1
[  123.400428] CPU1: shutdown
[  123.409425] psci: CPU1 killed (polled 0 ms)
[  123.752216] ==================================================================
[  123.759476] BUG: KASAN: global-out-of-bounds in
is_affected_midr_range_list+0x50/0xe8
[  123.767327] Read of size 4 at addr ffffa0001159bf78 by task swapper/1/0
[  123.773953]
[  123.775453] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.8.0-rc4 #1
[  123.781648] Hardware name: ARM Juno development board (r2) (DT)
[  123.787579] Call trace:
[  123.790041]  dump_backtrace+0x0/0x2b8
[  123.793716]  show_stack+0x18/0x28
[  123.797043]  dump_stack+0xec/0x158
[  123.800456]  print_address_description.isra.0+0x6c/0x448
[  123.805785]  kasan_report+0x134/0x200
[  123.809457]  __asan_load4+0x9c/0xd8
[  123.812957]  is_affected_midr_range_list+0x50/0xe8
[  123.817763]  has_cortex_a76_erratum_1463225+0x10/0x30
[  123.822830]  verify_local_cpu_caps+0xbc/0x1a0
[  123.827202]  check_local_cpu_capabilities+0x24/0x128
[  123.832183]  secondary_start_kernel+0x1b8/0x2b0
[  123.836719]
[  123.838211] The buggy address belongs to the variable:
[  123.843364]  erratum_1463225+0x18/0x40
[  123.847117]
[  123.848607] Memory state around the buggy address:
[  123.853413]  ffffa0001159be00: 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
[  123.860654]  ffffa0001159be80: 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00
[  123.867895] >ffffa0001159bf00: 00 00 00 00 00 00 00 00 fa fa fa fa
00 00 00 fa
[  123.875131]                                                                 ^
[  123.882286]  ffffa0001159bf80: fa fa fa fa 00 00 00 00 00 00 00 00
00 fa fa fa
[  123.889526]  ffffa0001159c000: fa fa fa fa 00 00 00 00 00 00 00 00
00 00 00 00
[  123.896762] ==================================================================
[  123.903997] Disabling lock debugging due to kernel taint
[  123.909333] Detected PIPT I-cache on CPU1
[  123.913420] CPU1: Booted secondary processor 0x0000000000 [0x410fd080]

Full test log link,
https://qa-reports.linaro.org/lkft/linux-mainline-oe/build/v5.8-rc4-81-g63e1968a2c87/testrun/2911119/suite/linux-log-parser/test/check-kernel-bug-1548361/log

-- 
Linaro LKFT
https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
