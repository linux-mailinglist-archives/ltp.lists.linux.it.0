Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABCF28F1FC
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Oct 2020 14:22:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D696C3C325A
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Oct 2020 14:22:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 49DE53C23F5
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 14:22:49 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CD3FE20099A
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 14:22:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1602764568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O3E1pC9UGTTt4nprLSiUqABd2GQPiIsCgYSgfRuYliQ=;
 b=Ykf3d86Z3+f9jbCUC7X8f0cbnMTdZA65/bvHBAhZVj869a4ZulOk456qdgRS3OqXlSMU4/
 c6/z9DPUQcllBbXn4AVwCwcs7bPT9SKG3wIm7O39X4m3IDoGXjO/aGjszNcn4TsFeE7bvP
 +fB2bScxULYBI2EiImGUd/IV4zGsiUk=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EC176B27B;
 Thu, 15 Oct 2020 12:22:47 +0000 (UTC)
Date: Thu, 15 Oct 2020 14:22:46 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>
Message-ID: <20201015122246.GD8871@alley>
References: <CA+G9fYt46oC7-BKryNDaaXPJ9GztvS2cs_7GjYRjanRi4+ryCQ@mail.gmail.com>
 <20201014140514.GB17231@alley> <20201014151311.GB13775@alley>
 <20201014175051.GC13775@alley>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014175051.GC13775@alley>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] printk: ringbuffer: Wrong data pointer when
 appending small string
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Mike Rapoport <rppt@linux.ibm.com>, linux-mm <linux-mm@kvack.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed 2020-10-14 19:50:54, Petr Mladek wrote:
> data_realloc() returns wrong data pointer when the block is wrapped and
> the size is not increased. It might happen when pr_cont() wants to
> add only few characters and there is already a space for them because
> of alignment.
> 
> It might cause writing outsite the buffer. It has been detected by LTP
> tests with KASAN enabled:
> 
> Link: https://lore.kernel.org/r/CA+G9fYt46oC7-BKryNDaaXPJ9GztvS2cs_7GjYRjanRi4+ryCQ@mail.gmail.com
> Fixes: 4cfc7258f876a7feba673ac ("printk: ringbuffer: add finalization/extension support")
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Signed-off-by: Petr Mladek <pmladek@suse.com>

The patch is committed into printk/linux.git, branch for-5.10-fixup.

I am going to send a pull request with it tomorrow unless something
happens in the meantime.

Best Regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
