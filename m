Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 418CB2283C8
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jul 2020 17:29:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E5D6D3C285D
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jul 2020 17:29:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id ABD863C1D5B
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 17:29:11 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id EEE66601871
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 17:27:54 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 96B28AED2;
 Tue, 21 Jul 2020 15:29:17 +0000 (UTC)
Date: Tue, 21 Jul 2020 17:29:32 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Erico Nunes <ernunes@redhat.com>
Message-ID: <20200721152932.GC13733@yuki.lan>
References: <20200720194920.22784-1-ernunes@redhat.com>
 <20200720194920.22784-3-ernunes@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720194920.22784-3-ernunes@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] iopl01: skip test if kernel is locked down
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> iopl is restricted under kernel lockdown.
> 
> Signed-off-by: Erico Nunes <ernunes@redhat.com>
> ---
>  testcases/kernel/syscalls/iopl/iopl01.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/testcases/kernel/syscalls/iopl/iopl01.c b/testcases/kernel/syscalls/iopl/iopl01.c
> index edf586cd1..4237d3f10 100644
> --- a/testcases/kernel/syscalls/iopl/iopl01.c
> +++ b/testcases/kernel/syscalls/iopl/iopl01.c
> @@ -42,6 +42,12 @@ static void verify_iopl(void)
>  	}
>  }
>  
> +static void setup(void)
> +{
> +	/* iopl is restricted under kernel lockdown. */
> +	tst_lockdown_skip();
> +}
> +
>  static void cleanup(void)
>  {
>  	/*
> @@ -54,6 +60,7 @@ static void cleanup(void)
>  static struct tst_test test = {
>  	.test_all = verify_iopl,
>  	.needs_root = 1,
> +	.setup = setup,
>  	.cleanup = cleanup,
>  };

Here as well, shouldn't we add iopl03?

Or at least change the library so that we have a function that returns
if kernel is locked or not so that someone can write such test.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
