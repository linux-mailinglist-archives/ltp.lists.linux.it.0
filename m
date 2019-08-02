Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4517F585
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 12:54:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EF5FB3C202E
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 12:54:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 224D93C1E00
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 12:54:14 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 02B6D60141E
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 12:54:12 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 083645AFD9;
 Fri,  2 Aug 2019 10:54:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1307608C2;
 Fri,  2 Aug 2019 10:54:10 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id E738041F40;
 Fri,  2 Aug 2019 10:54:10 +0000 (UTC)
Date: Fri, 2 Aug 2019 06:54:10 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <370665456.4222470.1564743250713.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190802094708.GA27727@rei>
References: <20190801092616.30553-1-chrubis@suse.cz>
 <20190801092616.30553-3-chrubis@suse.cz>
 <1516778317.3992530.1564656190448.JavaMail.zimbra@redhat.com>
 <20190801115418.GB23916@rei>
 <1801920982.4081964.1564677172725.JavaMail.zimbra@redhat.com>
 <20190802094708.GA27727@rei>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.26]
Thread-Topic: Add a canary for guarded buffers
Thread-Index: h3z9Nt0/1YrV4b3EugbMReUJrtRCyw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 02 Aug 2019 10:54:11 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 2/9] lib: Add a canary for guarded buffers
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



----- Original Message -----
> Hi!
> > > I'm aware of that. My reasoning here is that:
> > > 
> > > * The end of the page is aligned by definition to 2^page_order
> > > 
> > > * Any primitive types such as integer, etc. are hence aligned
> > > 
> > > * Structures are padded so that the total size is multiple of
> > >   the largest alignment required (because otherwise arrays of
> > >   structures would end up causing unaligned access as well).
> > > 
> > > That leaves out things such as buffers for direct I/O, the only way to
> > > allocate aligned buffers there is to make the size to be multiple of
> > > the block size.
> > 
> > I don't have concrete example at hand, but I foggily recall
> > s390 issue from couple years back, where it didn't like odd addresses.
> > Can't recall if it was data or code pointer.
> 
> Data should be fine as far as they are aligned accordingly to the type sizes.
> 
> I.e. one byte acces is fine on odd addresses, otherwise most of the
> functions in string.h wouldn't work.
> 
> For shorts i.e. two byte integers odd addresses are slower on x86 and
> x86_64 however does not work at all on many architectures. I remember
> that 32bit arm used to have in-kernel emulation that mostly did the
> right job but sometimes you got wrong results, so unaligned accesses are
> better to be avoided.
> 
> The question is if kernel expects some alignment for buffers for things
> such as read()/write() etc. I doubt so, since that would still break
> things like write(fd, "aabbcc" + 1, 3) which I would expect is still
> valid code.
> 
> Or do you have anything else in mind that may break?

I was thinking of buffers, but as it turns out the example I had in mind
was about alignment of symbols:

[    1.888972] Loading compiled-in X.509 certificates
[    1.888974] Problem parsing in-kernel X.509 certificate list

Dump of assembler code for function load_system_certificate_list:
   0x00000000009ad2c0 <+0>:     stmg    %r6,%r15,72(%r15)
   0x00000000009ad2c6 <+6>:     larl    %r13,0x64bdb8
   0x00000000009ad2cc <+12>:    larl    %r2,0x799032
   0x00000000009ad2d2 <+18>:    tmll    %r15,16256
   0x00000000009ad2d6 <+22>:    lgr     %r14,%r15
   0x00000000009ad2da <+26>:    lay     %r15,-104(%r15)
   0x00000000009ad2e0 <+32>:    je      0x9ad2e2 <load_system_certificate_list+34>
   0x00000000009ad2e4 <+36>:    stg     %r14,152(%r15)
   0x00000000009ad2ea <+42>:    larl    %r8,0x9ee28c <__setup_str_nosmp+5>
                                           ^^^^^^^^
From z/Architecture Principles of Operation SA22-7832-07:
"Only even addresses (halfword addresses) can
be generated. If an odd address is desired,
LOAD ADDRESS can be used to add one to an
address formed by LOAD ADDRESS RELATIVE
LONG."

> 
> > Could we apply/enforce some minimum alignment, similar to what glibc
> > does for malloc?
> 
> That would be against the purpose of this patchset, i.e. catching
> off-by-one bugs, since the page boundary would be a few bytes after the
> end of the buffer in some cases. Well I guess that most of the
> allocations would be as a matter of fact aligned and even these that are
> not could be easily fixed by choosing buffers that are multiples of
> four.

OK, that's a fair point.

> 
> I would be fine with aligning the buffers for architectures that turn
> out to be problematic if we find some. However I would like to avoid to
> "just in case" modifications.
> 
> --
> Cyril Hrubis
> chrubis@suse.cz
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
