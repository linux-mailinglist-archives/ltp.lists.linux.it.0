Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FB8A27EF
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Aug 2019 22:28:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A0A23C2017
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Aug 2019 22:28:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id C6D7D3C1CFF
 for <ltp@lists.linux.it>; Thu, 29 Aug 2019 22:28:23 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2FDED14060C3
 for <ltp@lists.linux.it>; Thu, 29 Aug 2019 22:28:21 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 87F45ACB7;
 Thu, 29 Aug 2019 20:28:20 +0000 (UTC)
Date: Thu, 29 Aug 2019 22:28:18 +0200
From: Petr Vorel <pvorel@suse.cz>
To: zhe.he@windriver.com
Message-ID: <20190829202818.GA4408@dell5510>
References: <1567084186-417234-1-git-send-email-zhe.he@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1567084186-417234-1-git-send-email-zhe.he@windriver.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscall: rt_sigtimedwait01: Fix wrong sigset
 length for mips
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi He,

> From: He Zhe <zhe.he@windriver.com>

> rt_sigtimedwait01 fails as follow on MIPS arches
> rt_sigtimedwait01    1  TFAIL  :  .../sigwaitinfo01.c:58: test_empty_set
> (.../sigwaitinfo01.c: 148): Unexpected failure:
> TEST_ERRNO=EINVAL(22): Invalid argument

> As this case purposely bypasses glibc, it should align with the size of kernel
> definition of sigset_t which is different from other arches.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/mips/include/uapi/asm/signal.h#n15

> This patch turns to use _NSIG which is always right for all arches.

> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
> v2: Use _NSIG/8 instead of fixed numbers

Thanks, merged.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
