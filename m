Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF61F1B462E
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 15:26:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B0CE3C2976
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 15:26:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 82AB13C0137
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 15:26:24 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E7C3C2001B6
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 15:26:23 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 919ABAEBB;
 Wed, 22 Apr 2020 13:26:22 +0000 (UTC)
Date: Wed, 22 Apr 2020 15:26:42 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200422132642.GA9086@yuki.lan>
References: <cover.1587033556.git.viresh.kumar@linaro.org>
 <08a307591b531593bbaa5b1e8a4c841e80493937.1587033556.git.viresh.kumar@linaro.org>
 <20200421154006.GA14036@yuki.lan> <20200422131801.GA9146@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200422131801.GA9146@dell5510>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 1/2] tst_timer: Add support for kernel's 64 bit
 timespec
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> include/tst_timer.h is broken on gcc 4, which we have in Travis (CentOS 6).
> I don't know how to fix this, but maybe fix is trivial.
> Or is it time to finally drop this oldest distro? If it's easy to fix, I'd
> postpone dropping CentOS 6 after release (some embedded distros/projects might
> still use old compilers).
> 
> gcc -g -O2 -g -O2 -fno-strict-aliasing -pipe -Wall -W -Wold-style-definition -W -Wall -D_FORTIFY_SOURCE=2 -I../../include -I../../include -I../../include/old/   -L../../lib  test_timer.c   -lltp -o test_timer
> In file included from test_timer.c:11:
> ../../include/tst_timer.h: In function ???tst_ts_from_timespec???:
> ../../include/tst_timer.h:214: error: unknown field ???libc_ts??? specified in initializer
> ../../include/tst_timer.h:214: warning: missing braces around initializer
> ../../include/tst_timer.h:214: warning: (near initialization for ???t.<anonymous>???)
> ../../include/tst_timer.h:215: warning: missing initializer
> ../../include/tst_timer.h:215: warning: (near initialization for ???t.<anonymous>.libc_ts.tv_nsec???)
> ../../include/tst_timer.h:215: error: unknown field ???libc_ts??? specified in initializer
> ../../include/tst_timer.h:215: warning: excess elements in struct initializer
> ../../include/tst_timer.h:215: warning: (near initialization for ???t???)
> make: *** [test_timer] Error 1
> 
> $ gcc --version
> gcc (GCC) 4.4.7 20120313 (Red Hat 4.4.7-18)

Looks like there are some problems with the anonymouns unions, probably
gcc 4.4 does not support these. I will have a look later on.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
