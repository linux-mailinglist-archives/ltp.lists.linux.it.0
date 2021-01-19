Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7572FB5A2
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 12:21:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 73ECE3C309C
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 12:21:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id CE73E3C3089
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 12:21:37 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5F9531000A74
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 12:21:36 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A9D5FAB9F;
 Tue, 19 Jan 2021 11:21:35 +0000 (UTC)
Date: Tue, 19 Jan 2021 12:21:34 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <YAbAvorwMJUaeIGP@pevik>
References: <X/8ehCeZbWs6TIA4@yuki.lan>
 <1610590728-15813-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <600543C9.9080708@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <600543C9.9080708@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/2] cpuset: skip test when cpu or nodes are
 not numbered continuously from 0
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

Hi Xu,

> > These cpuset cases(cpuset_base_ops_test, cpuset_hierarchy_test, cpuset_inherit_test...)
> > seem all not consider the situation(cpus/memory are not numbered continuously). It is
> > continuously from 0 as default. Skip test if there are not numbered continuously to
> > avoid unexpected error.

> > This patch also fix cpu_inherit error by using original mem value.

> > cpuset_inherit case fails on 4 numa nodes pc, as below:
> > cpuset_inherit 1 TPASS: cpus: Inherited information is right!
> > cpuset_inherit 3 TPASS: cpus: Inherited information is right!
> > cpuset_inherit 5 TPASS: cpus: Inherited information is right!
> > cpuset_inherit 7 TPASS: cpus: Inherited information is right!
> > cpuset_inherit 9 TPASS: cpus: Inherited information is right!
> > cpuset_inherit 11 TPASS: cpus: Inherited information is right!
> > cpuset_inherit 13 TPASS: mems: Inherited information is right!
> > cpuset_inherit 15 TPASS: mems: Inherited information is right!
> > cpuset_inherit 17 TPASS: mems: Inherited information is right!
> > cpuset_inherit 19 TPASS: mems: Inherited information is right!
> > cpuset_inherit 21 TPASS: mems: Inherited information is right!
> > cpuset_inherit 23 TFAIL: mems: Test result - 0-3 Expected string - "4"

Good catch :).

BTW how this happen? hot-unplug on lpar?
Maybe add brief note about it into commit message.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

...
> > +++ b/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
> > @@ -26,23 +26,34 @@

> >   . test.sh

> > +cpu_string="`cat /sys/devices/system/cpu/online`"
> >   NR_CPUS=`tst_ncpus`
> > +
> >   if [ -f "/sys/devices/system/node/has_high_memory" ]; then
> > -	N_NODES="`cat /sys/devices/system/node/has_high_memory | tr ',' ' '`"
> > +	mem_string="`cat /sys/devices/system/node/has_high_memory`"
> >   else
> > -	N_NODES="`cat /sys/devices/system/node/has_normal_memory | tr ',' ' '`"
> > +	mem_string="`cat /sys/devices/system/node/has_normal_memory`"
> >   fi
> > +N_NODES="`echo $mem_string | tr ',' ' '`"

nit: I'd personally do:

f="/sys/devices/system/node/has_high_memory"
[ -f "$f" ] || f="/sys/devices/system/node/has_normal_memory"
N_NODES="$(cat $f | tr ',' ' ')"

but that's a tiny detail.

It'd be great to rewrite these tests into C.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
