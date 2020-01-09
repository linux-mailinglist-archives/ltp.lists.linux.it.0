Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DCD135411
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 09:06:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 006663C2401
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 09:06:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 8B76F3C23AF
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 09:06:20 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AE0762013C6
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 09:06:19 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 201B9AB91;
 Thu,  9 Jan 2020 08:06:19 +0000 (UTC)
Date: Thu, 9 Jan 2020 09:06:17 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200109080617.GA10609@dell5510>
References: <20200107071324.29492-1-liwang@redhat.com>
 <20200107101119.GA22967@rei.lan>
 <CAEemH2fmmQ2a0EVHoqkMwMOjy5EZoiNT+02yYRz-TnWpTQ__0A@mail.gmail.com>
 <20200108112537.GA22954@dell5510> <20200108113535.GA17272@rei.lan>
 <CAEemH2dZ0pVqpaecjO06stw8RiK-hmSUWwo=kndm3EsvoXCW2w@mail.gmail.com>
 <20200108114141.GB17272@rei.lan> <20200108114545.GA28867@dell5510>
 <CAEemH2dUhpixZoorh_-H1CHenk9-XG9ZocjHB30RqzW_Kb0dCw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dUhpixZoorh_-H1CHenk9-XG9ZocjHB30RqzW_Kb0dCw@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_device: add new tst_dev_sync
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

Hi Li,

> > > You would need to define _GNU_SOURCE at the top of each test that uses
> > > it otherwise the definition is not exposed.
> > Yep :(. I join to Cyril's vote for raw syscall.
> > BTW please test it with travis or locally build.sh script (which adds
> > -Werror=implicit-function-declaration).

> I'd go with syscall(__NR_syncfs, fd) in the tst_device.h and
> define _GNU_SOURCE in relevant test cases.

> The reason why not use tst_syscall() is that involves a new compile error
> of tst_brk, and it can not get rid of errors only via include tst_test.h
> file.
+1. (I already tested it and replied to that patch).

I wonder if this is a pattern (try to avoid _GNU_SOURCE code in the library, if
needed use syscall() instead).
I'm asking because I still plan to write v2 for library API writing guidelines
docs patch.

BTW you didn't update wiki after merging eca0fa3c3.
I did it :) (we need some maintainer docs as well, we keep with Cyril to update
wiki and (sometimes) maintain patchwork for other maintainers).
BTW there is git repository for each git on github (our [2]), I maintain it with
shell script.

> > I guess we should work on travis CI integration so we don't have to push
> > it to
> > travis manually [1].


> That's a good proposal. I feel so sorry for pushing without a compiling in
> Travis this time, because I thought the code is good enough but ...
No problem :).

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/patch/1166786/
[2] https://github.com/linux-test-project/ltp.wiki.git

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
