Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AEB2FFD79
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Jan 2021 08:36:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 631DC3C5399
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Jan 2021 08:36:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 2EDC23C3026
 for <ltp@lists.linux.it>; Fri, 22 Jan 2021 08:36:43 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B8D9D1A01019
 for <ltp@lists.linux.it>; Fri, 22 Jan 2021 08:36:42 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B76A9ACBA;
 Fri, 22 Jan 2021 07:36:41 +0000 (UTC)
Date: Fri, 22 Jan 2021 08:36:40 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexander Egorenkov <egorenar@linux.ibm.com>
Message-ID: <YAqAiB3fQwVAKHFF@pevik>
References: <20210115143246.369676-1-egorenar@linux.ibm.com>
 <CAEemH2fDzPp3D6KZ_G0UDbS=eh2tWDAcy7CTt_4Yw7FUT4zGxg@mail.gmail.com>
 <87zh14rrxm.fsf@oc8242746057.ibm.com> <YAgmPjaf8iRn20x2@pevik>
 <8735ytzbj4.fsf@oc8242746057.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8735ytzbj4.fsf@oc8242746057.ibm.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] swapping01: make test more robust
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Alex,

> Hi Petr,
> Date: Fri, 22 Jan 2021 08:16:41 +0100
> Message-ID: <874kj9zbja.fsf@oc8242746057.ibm.com>
> X-Trend-IP-HD: ip=[9.171.79.240]sender=(egorenar@linux.ibm.com)recipient=<ltp@lists.linux.it;liwang@redhat.com;pvorel@suse.cz>

> Petr Vorel <pvorel@suse.cz> writes:

> > Hi Alexander, Li,

> > First I found quite hard to have correct setup to avoid TCONF "Not enough swap
> > space to test". It often requires to add additional swap file via mkswap && swapon
> > and use some RAM with:

> > dd if=/dev/zero of=/dev/shm/fill bs=1k count=14024k

> > It'd be great if test could do required setup itself.
> > And it'd also help at least to print swap_free_init and mem_over_max in that TCONF:

> >         if (swap_free_init < mem_over_max)
> > -               tst_brk(TCONF, "Not enough swap space to test.");
> > +               tst_brk(TCONF, "Not enough swap space to test (%ld < %ld)", swap_free_init, mem_over_max);


> yeah, that was a problem for me too when i was new to this test :/
:)


> > I tried to debug swapping01 on s390x (without this patch) with using additional
> > swap and eat RAM with dd. and got bus error (core dumped). Is that due too
> > aggressive memory eating? I'm not able to crash it on intel arch.


> that's something new for me. If possible please run it in gdb with debug symbols
> to find out where exactly this signal is raised.
I'll do.

Kind regards,
Petr

> Regards
> Alex

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
