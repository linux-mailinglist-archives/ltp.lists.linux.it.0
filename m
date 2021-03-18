Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA07340CFC
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 19:30:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C15453C6086
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Mar 2021 19:30:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 29E903C1CDB
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 19:30:19 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D7AFF600715
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 19:30:18 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EEB7CAC24
 for <ltp@lists.linux.it>; Thu, 18 Mar 2021 18:30:17 +0000 (UTC)
Date: Thu, 18 Mar 2021 19:30:16 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YFOcOJP4innlbIk4@pevik>
References: <20210318162409.9871-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210318162409.9871-1-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/semctl09: Skip libc test if SEM_STAT_ANY
 not defined
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

Hi Martin,

> The libc test variant should run only if system headers define SEM_STAT_ANY.
> Skip it if we're falling back to the LAPI definition.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Thanks!

...
> +#if !HAVE_DECL_SEM_STAT_ANY
nit: I'd prefer
#ifndef HAVE_DECL_SEM_STAT_ANY

> +	if (tst_variant == 1)
> +		tst_brk(TCONF, "libc does not support semctl(SEM_STAT_ANY)");
> +#endif
Although I understand why you want to quit only tests with root
(only these fail), it's a bit confusing to test with user nobody
and then quit the same testing with root.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
