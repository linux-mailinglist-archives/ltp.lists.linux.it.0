Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 958BAF9140
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 15:00:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 117F63C264C
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Nov 2019 15:00:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 4F9183C25F2
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 15:00:27 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 80BDE1001897
 for <ltp@lists.linux.it>; Tue, 12 Nov 2019 15:00:26 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B1DEBB4B1;
 Tue, 12 Nov 2019 14:00:25 +0000 (UTC)
References: <20191107153458.16917-1-rpalethorpe@suse.com>
 <20191107153458.16917-2-rpalethorpe@suse.com>
 <CACT4Y+aYVH=e+ZJhF2b-b92dkJZwjnPP4keup509twcQqK+wMg@mail.gmail.com>
 <CAEemH2eVR4U8dHR6anmirX_X5Y3hXKgL4cHxekeVXH_wSHnnpA@mail.gmail.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2eVR4U8dHR6anmirX_X5Y3hXKgL4cHxekeVXH_wSHnnpA@mail.gmail.com>
Date: Tue, 12 Nov 2019 15:00:25 +0100
Message-ID: <87ftitdwjq.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] Wrapper for Syzkaller reproducers
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
Reply-To: rpalethorpe@suse.de
Cc: Dmitry Vyukov <dvyukov@google.com>, syzkaller <syzkaller@googlegroups.com>,
 LTP List <ltp@lists.linux.it>, Richard Palethorpe <rpalethorpe@suse.com>,
 automated-testing@yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Li Wang <liwang@redhat.com> writes:

>
>
> Just to try build it in LTP and hit errors:
>
> # cd ltp-new/
> # make autotools
> # ./configure --with-syzkaller-repros
> # make -j32
> ...
> error: pathspec '/root/ltp-new/testcases/linux-arts' did not match any
> file(s) known to git
> make[3]: *** [/root/ltp-new/testcases/kernel/syzkaller-repros/Makefile:26:
> /root/ltp-new/testcases/linux-arts/syzkaller-repros/linux] Error 1
> make[3]: Leaving directory '/root/ltp-new/testcases/kernel/syzkaller-repros'
> make[2]: *** [../../include/mk/generic_trunk_target.inc:93: all] Error 2
> make[2]: Leaving directory '/root/ltp-new/testcases/kernel'
> make[1]: *** [../include/mk/generic_trunk_target.inc:93: all] Error 2
> make[1]: Leaving directory '/root/ltp-new/testcases'
> make: *** [Makefile:108: testcases-all] Error 2
>
>

What happens if you try to pull the git submodule manually?

i.e. do git submodule update --init testcases/linux-arts

It looks like it failed on the line where it gets the submodule, so I am
wondering if you have an old git version?

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
