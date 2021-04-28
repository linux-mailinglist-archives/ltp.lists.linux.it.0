Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C5036D762
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 14:32:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 761743C631F
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 14:32:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 354693C01F4
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 14:32:02 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3B12B1400B89
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 14:32:01 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8FFB2B172;
 Wed, 28 Apr 2021 12:32:01 +0000 (UTC)
Date: Wed, 28 Apr 2021 14:11:45 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YIlRAanTIk9uKVEP@yuki>
References: <20210422065732.61222-1-xieziyao@huawei.com>
 <20210422065732.61222-2-xieziyao@huawei.com>
 <YIaWnt5ksxVyBvxk@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YIaWnt5ksxVyBvxk@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/tkill: Convert tkill01 to the new API
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
> > -#include "test.h"
> >  #include "lapi/syscalls.h"
> > +#include "tst_test.h"
> 
> > +int sig_flag = 0;
> 
> It should be
> static int sig_flag;

It has to be volatile as well, if we are waiting in a bussy loop on it
and it's changed ansynchronously from a signal handler, otherwise
compiler may misoptimize the code.

Generally the code that waits for a signal should look like:

static volatile sig_atomic_t sig_flag;

static void setup(void)
{
	SAFE_SIGNAL(SIGUSR1, sighandler);
}

static void run(void)
{
	int timeout_ms = 1000;
	sig_flag = 0;

	TST_EXP_PASS(tst_syscall(__NR_tkill, tid, SIGUSR1));

	while (timeout_ms--) {
		if (sig_flag)
			break;

		usleep(1000);
	}

	if (sig_flag)
		tst_res(TPASS, ...);
	else
		tst_res(TFAIL, ...);
}

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
