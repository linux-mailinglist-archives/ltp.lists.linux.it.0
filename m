Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EB12FD30A
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 15:53:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7FF153C6960
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 15:53:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 385983C0194
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 15:53:09 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0D36C1A00E5E
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 15:53:08 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5D1D9AB7F;
 Wed, 20 Jan 2021 14:53:08 +0000 (UTC)
Date: Wed, 20 Jan 2021 15:54:11 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <YAhEEzWShFLlHrk1@yuki.lan>
References: <20210118163240.29558-1-mdoucha@suse.cz>
 <YAbT62ecN/lq12cT@yuki.lan>
 <CA+G9fYv_6tiMrF38jLPYK=C6D+LNBndun1XuGQJiOK60LhYRyA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYv_6tiMrF38jLPYK=C6D+LNBndun1XuGQJiOK60LhYRyA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_pollute_memory(): Set minimal safety margin
 to 64MB
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > > -     safety = 4096 * SAFE_SYSCONF(_SC_PAGESIZE) / info.mem_unit;
> > > +     safety = MAX(4096 * SAFE_SYSCONF(_SC_PAGESIZE), 64 * 1024 * 1024);
> > > +     safety /= info.mem_unit;
> >
> > I guess that this is safe enough for the release, since it will only
> > increase the safety margin.
> >
> > Naresh can you please test this patch ASAP?
> 
> I have applied your patch and rebuilt completely and retested
> ioctl_sg01 test case in a loop on three different devices.
> 
> 1 PASS out of 20 runs with overcommit_memory 0 on x86_64.
> 1 PASS out of 20 runs with overcommit_memory 1 on x86_64.
> 
> Which means 19 times the test case triggered oom-killer and the test was broken.

So it looks like 64MB is not enough in your case.

Does it work with 128MB or 256MB?

i.e.:

safety = MAX(4096 * SAFE_SYSCONF(_SC_PAGESIZE), 128 * 1024 * 1024);
safety = MAX(4096 * SAFE_SYSCONF(_SC_PAGESIZE), 256 * 1024 * 1024);

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
