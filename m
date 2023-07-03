Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 153F474EC5A
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jul 2023 13:11:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B975D3CB91F
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jul 2023 13:11:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E47EF3C99D4
 for <ltp@lists.linux.it>; Mon,  3 Jul 2023 22:40:25 +0200 (CEST)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9177F600199
 for <ltp@lists.linux.it>; Mon,  3 Jul 2023 22:40:24 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2E76B61043;
 Mon,  3 Jul 2023 20:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8ABEDC433CA;
 Mon,  3 Jul 2023 20:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688416821;
 bh=a/WFLQXH/cv3+fruGQcAKSvSqa+ZGYpp9BtzzN48c/0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=u0cxCr7tFWkzj7eGIRVzTNOUKv9gyTJjVseB9qs3Gk1mhul26GVwXljdwBp7RXa53
 FIVZwFTonFzkzq+ke0uENxC3D3usM9aE8MzJjhn/QN/bcdrG9Z3pCMLquBZbfflZxY
 +CcQEzowkiidMVFINL8wwph6oyonLW/4f6YztNhxi7I8l+5OTdaOUQNiPnD30lSfiM
 JNODE6e9M45BlP8DHW9npBFivhqwBspTYs+6CdDpS7XjnGLgV7+5/K1DMyra/yPs73
 SqxwJ++HYYZv3niYodC71ox5JMJHiS4quy4oG+ds4Mbjr6JCof2j4yROQS1sPHJO54
 oSJDwyE2+2WHw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 6CB85C04E32; Mon,  3 Jul 2023 20:40:21 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168841682144.15554.860228703846635745.git-patchwork-notify@kernel.org>
Date: Mon, 03 Jul 2023 20:40:21 +0000
References: <20230627232139.213130-1-rrameshbabu@nvidia.com>
In-Reply-To: <20230627232139.213130-1-rrameshbabu@nvidia.com>
To: Rahul Rameshbabu <rrameshbabu@nvidia.com>
X-Virus-Scanned: clamav-milter 1.0.1 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 11 Jul 2023 13:11:05 +0200
Subject: Re: [LTP] [PATCH net v1] ptp: Make max_phase_adjustment sysfs
 device attribute invisible when not supported
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
Cc: lkft@linaro.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 lkft-triage@lists.linaro.org, davem@davemloft.net, nathan@kernel.org,
 saeed@kernel.org, kuba@kernel.org, pabeni@redhat.com, gal@nvidia.com,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 27 Jun 2023 16:21:39 -0700 you wrote:
> The .adjphase operation is an operation that is implemented only by certain
> PHCs. The sysfs device attribute node for querying the maximum phase
> adjustment supported should not be exposed on devices that do not support
> .adjphase.
> 
> Fixes: c3b60ab7a4df ("ptp: Add .getmaxphase callback to ptp_clock_info")
> Signed-off-by: Rahul Rameshbabu <rrameshbabu@nvidia.com>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Link: https://lore.kernel.org/netdev/20230627162146.GA114473@dev-arch.thelio-3990X/
> Link: https://lore.kernel.org/all/CA+G9fYtKCZeAUTtwe69iK8Xcz1mOKQzwcy49wd+imZrfj6ifXA@mail.gmail.com/
> 
> [...]

Here is the summary with links:
  - [net,v1] ptp: Make max_phase_adjustment sysfs device attribute invisible when not supported
    https://git.kernel.org/netdev/net/c/2c5d234d7f55

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
