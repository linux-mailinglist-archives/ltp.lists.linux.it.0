Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B38262EF9
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 15:13:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B52C23C2C0D
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 15:12:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 95E153C14F7
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 15:12:58 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 094FE1000A85
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 15:12:57 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6E3E3B253;
 Wed,  9 Sep 2020 13:13:12 +0000 (UTC)
Date: Wed, 9 Sep 2020 15:13:27 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200909131327.GA3241@yuki.lan>
References: <20200908073138.GB2475@yuki.lan>
 <CAEemH2cHvM_KD7W6fyX6z3bc0qfVtkp=yEM8MDvvohouyj5N2w@mail.gmail.com>
 <20200908153659.GA16066@yuki.lan>
 <CAEemH2eq0fwF8zt1uez5vuwM0vtrLtoFd_45sFqE=iQ8hpudfQ@mail.gmail.com>
 <CAEemH2es3sMSfAar8Xj4_Vr+2nsD0isPws4v=8=csLyYROAQGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2es3sMSfAar8Xj4_Vr+2nsD0isPws4v=8=csLyYROAQGQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] LTP release
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
Cc: "Pravin Raghul S." <pravinraghul@zilogic.com>,
 LTP List <ltp@lists.linux.it>, "Vijay Kumar B." <vijaykumar@zilogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Sounds reasonable. I tried to reserve more space for the mapping grows,
> > and that works for me:).
> >
> 
> To precisely, we could reserve 256 pages size at the end of the free-range
> memory to let the stack keep away from a preceding mapping in its growing
> then.
> (my only concern is the stack_guard_gap can be changed via kernel command
> line, but I assume that happen rarely, so here use the default 256 pages)
> 
> If there is no objection, I'd make these changes in patch V4.
> 
> --------
> 
> static void *find_free_range(size_t size)
> {
>     void *mem;
>     long stack_guard_gap = 256 * getpageszie();
> 
>     /*
>     * Since the newer kernel does not allow a MAP_GROWSDOWN mapping to grow
>     * closer than stack_guard_gap pages away from a preceding mapping.
>     * The guard then ensures that the next-highest mapped page remains more
>     * than stack_guard_gap below the lowest stack address, and if not then
>     * it will trigger a segfault. So, here let's reserve 256 pages memory
>     * spacing for stack growing safely.
>     */
>     mem = SAFE_MMAP(NULL, size + stack_guard_gap, PROT_READ | PROT_WRITE,
>                       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>     SAFE_MUNMAP(mem, size + stack_guard_gap);
> 
>     return mem;
> }
> 
> static void split_unmapped_plus_stack(void *start, size_t size)
> {
>     /* start           start + size
>     * +---------------------+----------------------+-----------+
>     * + unmapped            | mapped               | 256 pages |
>     * +---------------------+----------------------+-----------+
>     *                       stack
>     */

Shouldn't the 256 pages follow the unmapped part?

If I'm not mistaken if stack grows down the address decreases with stack
allocations, so it should be as:

| 256 pages | unmapped | mapped |


That would also mean that we should map the stack at address start +
total_size - size if I'm not mistaken. I guess that we can put all the
mess into a single function as well and have just allocate_stack() that
will find a suitable address, mmap the stack together, splitting this
into two functions is unnecessary confusing.

>     stack = SAFE_MMAP(start + size, size, PROT_READ | PROT_WRITE,
>                              MAP_FIXED | MAP_PRIVATE | MAP_ANONYMOUS |
> MAP_GROWSDOWN,
>                              -1, 0);
> }

Also I would like to get rid of the -fno-optimize-sibling-calls in the
Makefile, this makes the test a bit fragile and less portable.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
