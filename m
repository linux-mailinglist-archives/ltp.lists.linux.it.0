Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF5F6CC9D
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jul 2019 12:15:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9E6773C1D11
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jul 2019 12:15:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 4E7F23C1C90
 for <ltp@lists.linux.it>; Thu, 18 Jul 2019 12:15:05 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E462C601E74
 for <ltp@lists.linux.it>; Thu, 18 Jul 2019 12:15:04 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id ED65DAF81;
 Thu, 18 Jul 2019 10:15:03 +0000 (UTC)
Date: Thu, 18 Jul 2019 12:15:03 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <20190718101503.GA25712@rei.lan>
References: <20190718073941.13153-1-linus.walleij@linaro.org>
 <20190718100848.GA24931@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718100848.GA24931@rei.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/ioprio: Add test cases for I/O
 priority
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
Cc: Jens Axboe <axboe@kernel.dk>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > +	/* Bump to best effort scheduling, all 8 priorities */
> > +	class = IOPRIO_CLASS_BE;
> > +
> > +	fail_in_loop = 0;
> > +	for (prio = 0; prio < 8; prio++) {
> > +		TEST(ioprio_set(IOPRIO_WHO_PROCESS, 0,
> > +				IOPRIO_PRIO_VALUE(class, prio)));
> > +		if (TST_RET == -1) {
> > +			tst_res(TFAIL | TTERRNO, "ioprio_set IOPRIO_CLASS_BE prio %d failed", prio);
> > +			fail_in_loop = 1;
> > +		}
> > +	}
> > +	if (!fail_in_loop)
> > +		tst_res(TPASS, "tested all 8 prios in class %s",
> > +			 to_class_str[class]);
> 
> Just btw, we don't have to have the fail_in_loop variable here
> (fail_in_loop) == (prio < 8)

And that only works when we have a break; on failure, which we don't
have here...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
