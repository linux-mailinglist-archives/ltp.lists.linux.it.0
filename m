Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 914AB2FD364
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 16:05:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3446A3C6960
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 16:05:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A1AC93C2657
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 16:05:39 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 132EA1400E67
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 16:05:38 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 86A87ADC1;
 Wed, 20 Jan 2021 15:05:38 +0000 (UTC)
Date: Wed, 20 Jan 2021 16:06:41 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <YAhHAWTedDb/6Hd/@yuki.lan>
References: <20210118163240.29558-1-mdoucha@suse.cz>
 <YAbT62ecN/lq12cT@yuki.lan>
 <CA+G9fYv_6tiMrF38jLPYK=C6D+LNBndun1XuGQJiOK60LhYRyA@mail.gmail.com>
 <YAhEEzWShFLlHrk1@yuki.lan>
 <CA+G9fYuDpnJOcHA5Me4KM4v+NaFW=2_3id=Am6skbDavb1iACw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYuDpnJOcHA5Me4KM4v+NaFW=2_3id=Am6skbDavb1iACw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
> > > I have applied your patch and rebuilt completely and retested
> > > ioctl_sg01 test case in a loop on three different devices.
> > >
> > > 1 PASS out of 20 runs with overcommit_memory 0 on x86_64.
> > > 1 PASS out of 20 runs with overcommit_memory 1 on x86_64.
> > >
> > > Which means 19 times the test case triggered oom-killer and the test was broken.
> >
> > So it looks like 64MB is not enough in your case.
> >
> > Does it work with 128MB or 256MB?
> >
> > i.e.:
> >
> > safety = MAX(4096 * SAFE_SYSCONF(_SC_PAGESIZE), 128 * 1024 * 1024);
> > safety = MAX(4096 * SAFE_SYSCONF(_SC_PAGESIZE), 256 * 1024 * 1024);
> 
> 
> I will test with these changes and get back to you.
> 
> Meanwhile,
> 
> 20 PASS out of 20 runs with overcommit_memory 2 on x86_64.

That is to be expected, since with overcommit_memory=2 we fail the
mmap() when the kernel does  not think there is enough free memory. See
the part where we do:

	if (map_blocks[i] == MAP_FAILED) {
		map_count = i;
		break;
	}

It would be interesting to print the map_count and the value of i in
this fucntion and see where it breaks with overcommit_memory=2.

i.e.

	if (map_blocks[i] == MAP_FAILED) {
		tst_res(TINFO, "mmap() failed at %zu expected %zu",
		        i, map_count);
		map_count = i;
		break;
	}


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
