Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCE4271F33
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Sep 2020 11:46:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F01E33C4FAD
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Sep 2020 11:46:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id A30003C1D33
 for <ltp@lists.linux.it>; Mon, 21 Sep 2020 11:46:48 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 239476009C5
 for <ltp@lists.linux.it>; Mon, 21 Sep 2020 11:46:47 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 27559AD83;
 Mon, 21 Sep 2020 09:47:23 +0000 (UTC)
Date: Mon, 21 Sep 2020 11:47:14 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200921094714.GA2311@yuki.lan>
References: <20200918171710.19227-1-chrubis@suse.cz>
 <CAEemH2d_m16MhGrjxWHCeQ0BU9Fa562TVjaa+C_ecnPYhCfthw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2d_m16MhGrjxWHCeQ0BU9Fa562TVjaa+C_ecnPYhCfthw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6] Add a test case for mmap MAP_GROWSDOWN flag
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
Cc: pravin <pravinraghul@zilogic.com>, LTP List <ltp@lists.linux.it>,
 "Vijay Kumar B ." <vijaykumar@zilogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > + *   address.
> > + *
> > + *   Kernel default 'stack_guard_gap' size is '256 * getpagesize()'.
> > + *
> > + *   The stack memory map would look like:
> > + *
> > + *   |  -  -  -   reserved  size   -  -  -  |
> > + *
> > + *   +-- - - - --+------------+-------------+
> > + *   | 256 pages |  unmapped  |   mapped    |
> > + *   +-- - - - --+------------+-------------+
> > + *                            | mapped size |
> > + *   ^           |  -  -  stack size  -  -  |
> > + *   start
> > + *               ^                          ^
> > + *               stack bottom       stack top
> > + *

...

> > +static void *allocate_stack(size_t stack_size, size_t mapped_size)
> > +{
> > +       void *start, *stack_top, *stack_bottom;
> > +
> > +       long reserved_size = 256 * page_size + stack_size;
> > +
> > +       start = SAFE_MMAP(NULL, reserved_size, PROT_READ | PROT_WRITE,
> > +                         MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> > +       SAFE_MUNMAP(start, reserved_size);
> > +
> > +       SAFE_MMAP((start + reserved_size - mapped_size), mapped_size,
> > PROT_READ | PROT_WRITE,
> > +                 MAP_FIXED | MAP_PRIVATE | MAP_ANONYMOUS | MAP_GROWSDOWN,
> > +                 -1, 0);
> > +
> > +       stack_top = start + reserved_size;
> > +       stack_bottom = start + reserved_size - stack_size;
> >
> 
> As the stack grows down, shouldn't grow from stack_bottom to stack_top?
> which
> means stack_bottom = start + reserved_size.

That depends on the definition of top and bottom. For me it makes sense
that the the stack grows from top to the bottom because it grows down,
which is consistent with the MAP_GROWSDOWN flag.

Also this is really the reason why I added the ASCII art to the top
level comment of the test in order to make clear how these terms are
used in the code.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
