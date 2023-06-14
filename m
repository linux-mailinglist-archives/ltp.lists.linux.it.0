Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BA80B70F45B
	for <lists+linux-ltp@lfdr.de>; Wed, 24 May 2023 12:39:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F1DFB3CEFB7
	for <lists+linux-ltp@lfdr.de>; Wed, 24 May 2023 12:39:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0BA7E3CB279
 for <ltp@lists.linux.it>; Wed, 24 May 2023 12:39:50 +0200 (CEST)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 14BA5200270
 for <ltp@lists.linux.it>; Wed, 24 May 2023 12:39:49 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 769E0637E2;
 Wed, 24 May 2023 10:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E98C4C433EF;
 Wed, 24 May 2023 10:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684924786;
 bh=ykWf/BsEMJ2nHh1fRf8HHlKhBbhIgAcSBi7PwSJdrhM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mJBfisukXHDDnmFYSI8ew+2pcSFYaYhJqCZLjQE3jEMorWPg50zoKcpH/POyloI4y
 j+jcmCpzqtTjxVz/tqWJxr67W2XAHH3Wns9O47m+EpXxSx9p6kxg9TVWf0s+ujQWlP
 Yc0c6lLUa6Vn+Is1TZ9ZqX+R4JnCBe4Q/hsqwA3S7Gce0qi9Y+OffhA2IspRdayrwh
 aOiIB7cVjrqdEALqaaADmIZYZJeIQcSm6mDIsE800rIA70+nDmlYHdF0wIFfO3ht6l
 dbP/cX9KqSQGJY/uMrQ36opwcxcQLmBuuROV18Dj1G0wK4YkcjGtNDOyydCtBL+1bE
 dJ+hzsOqdITCg==
Date: Wed, 24 May 2023 12:39:40 +0200
From: Christian Brauner <brauner@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20230524-windhund-karikatur-354025f2ef1c@brauner>
References: <CA+G9fYuGT0esjqBT9=xCTtWKV1DxYspXTtM5gqprbDKiTrb7qQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYuGT0esjqBT9=xCTtWKV1DxYspXTtM5gqprbDKiTrb7qQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: Re: [LTP] LTP: tracing: RIP: 0010:security_inode_permission+0x5/0x70
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
 open list <linux-kernel@vger.kernel.org>,
 linux-stable <stable@vger.kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, lkft-triage@lists.linaro.org,
 linux-fsdevel@vger.kernel.org, LTP List <ltp@lists.linux.it>,
 Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, May 24, 2023 at 02:32:25PM +0530, Naresh Kamboju wrote:
> While running LTP tracing tests on qemu-x86_64 following kernel crash noticed
> with stable-rc 6.3.4-rc2.
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> FAILED COMMAND File:
> /lava-1/0/tests/0_ltp-tracing/automated/linux/ltp/output/LTP_tracing.failed
> TCONF COMMAND File: /opt/ltp/output/LTP_RUN_ON-LTP_tracing.log.tconf
> Running tests.......

No idea and seems very odd. Only thing I see is that there's ftrace
regression testing running while the crash happens.

> 
> <4>[   57.932577] int3: 0000 [#1] PREEMPT SMP PTI
> <4>[   57.933090] CPU: 0 PID: 138 Comm: systemd-udevd Not tainted 6.3.4-rc2 #1
> <4>[   57.933243] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009),
> BIOS 1.14.0-2 04/01/2014
> <4>[   57.933447] RIP: 0010:security_inode_permission+0x5/0x70
> <4>[   57.934163] Code: c0 c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00
> 00 00 0f 1f 40 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 66
> 0f 1f 00 e8 <e7> 8d 64 18 f6 47 0d 02 75 50 55 48 89 e5 41 55 41 89 f5
> 41 54 49
> <4>[   57.934257] RSP: 0018:ffffa300c050bca0 EFLAGS: 00000246
> <4>[   57.934363] RAX: 00000000000041ed RBX: ffff9bda012805c0 RCX:
> 0000000000000000
> <4>[   57.934390] RDX: ffff9bda01f6df00 RSI: 0000000000000081 RDI:
> ffff9bda012805c0
> <4>[   57.934415] RBP: ffffa300c050bcd0 R08: ffffa300c050bd80 R09:
> 00000000ffffff9c
> <4>[   57.934440] R10: 0000000000000fe0 R11: ffc9d09b99d09993 R12:
> 0000000000000081
> <4>[   57.934465] R13: 0000000000000000 R14: ffffffffa958f970 R15:
> 2f2f2f2f2f2f2f2f
> <4>[   57.934544] FS:  00007fb89665f800(0000)
> GS:ffff9bda7bc00000(0000) knlGS:0000000000000000
> <4>[   57.934578] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> <4>[   57.934604] CR2: 00007f60c9b0e000 CR3: 0000000104402000 CR4:
> 00000000000006f0
> <4>[   57.934793] Call Trace:
> <4>[   57.934958]  <TASK>
> <4>[   57.935082]  ? inode_permission+0x70/0x1a0
> <4>[   57.935235]  link_path_walk.part.0.constprop.0+0xdd/0x3b0
> <4>[   57.935360]  path_lookupat+0x3e/0x190
> <4>[   57.935426]  filename_lookup+0xe8/0x1f0
> <4>[   57.935638]  user_path_at_empty+0x42/0x60
> <4>[   57.935692]  do_fchmodat+0x5f/0xc0
> <4>[   57.935809]  __x64_sys_chmod+0x1f/0x30
> <4>[   57.935845]  do_syscall_64+0x3e/0x90
> <4>[   57.935886]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> <4>[   57.935996] RIP: 0033:0x7fb8964fbd6b
> <4>[   57.936393] Code: ff ff ff ff eb e6 66 0f 1f 84 00 00 00 00 00
> f3 0f 1e fa b8 5f 00 00 00 0f 05 c3 0f 1f 40 00 f3 0f 1e fa b8 5a 00
> 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 85 40 0f 00 f7 d8 64
> 89 01 48
> <4>[   57.936422] RSP: 002b:00007ffcf4c2aa38 EFLAGS: 00000202
> ORIG_RAX: 000000000000005a
> <4>[   57.936471] RAX: ffffffffffffffda RBX: 0000000000000190 RCX:
> 00007fb8964fbd6b
> <4>[   57.936490] RDX: 00007ffcf4c2aa4f RSI: 0000000000000190 RDI:
> 00007ffcf4c2aa40
> <4>[   57.936504] RBP: 0000000000000190 R08: 0000000000000000 R09:
> 00007ffcf4c2a8e0
> <4>[   57.936528] R10: 0000000000000000 R11: 0000000000000202 R12:
> 00007ffcf4c2aa40
> <4>[   57.936542] R13: 0000000000000005 R14: 0000000000000000 R15:
> 0000000000000001
> <4>[   57.936754]  </TASK>
> <4>[   57.936853] Modules linked in:
> <4>[   57.962890] ---[ end trace 0000000000000000 ]---
> <4>[   57.963006] RIP: 0010:security_inode_permission+0x5/0x70
> <4>[   57.963080] Code: c0 c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00
> 00 00 0f 1f 40 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 66
> 0f 1f 00 e8 <e7> 8d 64 18 f6 47 0d 02 75 50 55 48 89 e5 41 55 41 89 f5
> 41 54 49
> <4>[   57.963105] RSP: 0018:ffffa300c050bca0 EFLAGS: 00000246
> <4>[   57.963145] RAX: 00000000000041ed RBX: ffff9bda012805c0 RCX:
> 0000000000000000
> <4>[   57.963163] RDX: ffff9bda01f6df00 RSI: 0000000000000081 RDI:
> ffff9bda012805c0
> <4>[   57.963180] RBP: ffffa300c050bcd0 R08: ffffa300c050bd80 R09:
> 00000000ffffff9c
> <4>[   57.963195] R10: 0000000000000fe0 R11: ffc9d09b99d09993 R12:
> 0000000000000081
> <4>[   57.963209] R13: 0000000000000000 R14: ffffffffa958f970 R15:
> 2f2f2f2f2f2f2f2f
> <4>[   57.963226] FS:  00007fb89665f800(0000)
> GS:ffff9bda7bc00000(0000) knlGS:0000000000000000
> <4>[   57.963246] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> <4>[   57.963261] CR2: 00007f60c9b0e000 CR3: 0000000104402000 CR4:
> 00000000000006f0
> <0>[   57.963444] Kernel panic - not syncing: Fatal exception in interrupt
> <0>[   57.964629] Kernel Offset: 0x26600000 from 0xffffffff81000000
> (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
> 
> 
> links,
>  - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.3.y/build/v6.3.3-364-ga37c304c022d/testrun/17168198/suite/log-parser-test/tests/
>  - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.3.y/build/v6.3.3-364-ga37c304c022d/testrun/17168198/suite/log-parser-test/test/check-kernel-panic/log
>  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2QCeudZ18KF3RXw3A5qfr5lPC2N/
>  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2QCeudZ18KF3RXw3A5qfr5lPC2N/config
> 
> --
> Linaro LKFT
> https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
