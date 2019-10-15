Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAA7D7AF7
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2019 18:15:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 55CD73C2218
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2019 18:15:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 2F5933C2092
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 18:15:03 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4D93F1401171
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 18:15:01 +0200 (CEST)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B605220640;
 Tue, 15 Oct 2019 16:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571156099;
 bh=bCurKKXOqiSNNQ+pAh3MmodNUfnccOS8f0vT+9z5B1Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JaQvNWAThhTW+Bl6esKy1t061hiE51EyoZsWttzZHXbBeBwDOBgk/Zrhw/nEL0F5I
 x0lCtc72vHum3TJylgwCfSUm1U1SpSZdkZ96ASOW/ULbl691SmefIudQKVCW+5kFJB
 F7jaqdOvXC5qsvbRJDWoXht9fA3U7LEfLvp0Q40o=
Date: Tue, 15 Oct 2019 17:14:54 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Message-ID: <20191015161453.lllrp2gfwa5evd46@willie-the-truck>
References: <cki.B4A567748F.PFM8G4WKXI@redhat.com>
 <805988176.6044584.1571038139105.JavaMail.zimbra@redhat.com>
 <CAAeHK+zxFWvCOgTYrMuD-oHJAFMn5DVYmQ6-RvU8NrapSz01mQ@mail.gmail.com>
 <20191014162651.GF19200@arrakis.emea.arm.com>
 <20191014213332.mmq7narumxtkqumt@willie-the-truck>
 <20191015152651.GG13874@arrakis.emea.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191015152651.GG13874@arrakis.emea.arm.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E4?=
 =?utf-8?q?=2E0-rc2-d6c2c23=2Ecki_=28stable-next=29?=
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
Cc: Szabolcs Nagy <szabolcs.nagy@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>, Memory Management <mm-qe@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>,
 Dave P Martin <Dave.Martin@arm.com>, CKI Project <cki-project@redhat.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Oct 15, 2019 at 04:26:51PM +0100, Catalin Marinas wrote:
> On Mon, Oct 14, 2019 at 10:33:32PM +0100, Will Deacon wrote:
> > On Mon, Oct 14, 2019 at 05:26:51PM +0100, Catalin Marinas wrote:
> > > On Mon, Oct 14, 2019 at 02:54:17PM +0200, Andrey Konovalov wrote:
> > > > What do you think we should do here?
> > > 
> > > It is an ABI break as the man page clearly states that the above case
> > > should return -ENOMEM.
> > 
> > Although I agree with your analysis, I also thought that these sorts of
> > ABI breaks (changes in error codes) were unfortunately common so we
> > shouldn't throw the baby out with the bath water here.
> > 
> > > The options I see:
> > > 
> > > 1. Revert commit 057d3389108e and try again to document that the memory
> > >    syscalls do not support tagged pointers
> > > 
> > > 2. Change untagged_addr() to only 0-extend from bit 55 or leave the
> > >    tag unchanged if bit 55 is 1. We could mask out the tag (0 rather
> > >    than sign-extend) but if we had an mlock test passing ULONG_MASK,
> > >    then we get -ENOMEM instead of -EINVAL
> > > 
> > > 3. Make untagged_addr() depend on the TIF_TAGGED_ADDR bit and we only
> > >    break the ABI for applications opting in to this new ABI. We did look
> > >    at this but the ptrace(PEEK/POKE_DATA) needs a bit more thinking on
> > >    whether we check the ptrace'd process or the debugger flags
> > > 
> > > 4. Leave things as they are, consider the address space 56-bit and
> > >    change the test to not use LONG_MAX on arm64. This needs to be passed
> > >    by the sparc guys since they probably have a similar issue
> > 
> > I'm in favour of (2) or (4) as long as there's also an update to the docs.
> 
> With (4) we'd start differing from other architectures supported by
> Linux. This works if we consider the test to be broken. However, reading
> the mlock man page:
> 
>        EINVAL The result of the addition addr+len was less than addr
>        (e.g., the addition may have resulted in an overflow).
> 
>        ENOMEM Some of the specified address range does not correspond to
>        mapped pages in the address space of the process.
> 
> There is no mention of EINVAL outside the TASK_SIZE, seems to fall more
> within the ENOMEM description above.

Sorry, I was being too vague in my wording. What I was trying to say is I'm
ok with (2) or (4), but either way we need to update our ABI documentation
under Documentation/arm64/. I personally don't think userspace will care
about EINVAL vs ENOMEM because the kernel is already horribly unreliable
when it comes to keeping error codes stable, which is why I think we could
get away with (4). For example, Jan (who reported this issue) wrote this
change to LTP last year for one of the mmap tests:

https://github.com/linux-test-project/ltp/commit/e7bab61882847609be3132a2f0d94f7469ff5d3e

The fact that we have tagging at all already means that we differ from
many other architectures.

> > > It's slightly annoying to find this now. We did run (part of) LTP but I
> > > guess we never run the POSIX conformance tests.
> > 
> > Yes, and this stuff was in linux-next for a while so it's worrying that
> > kernelci didn't spot it either. Hmm.
> 
> For some reason the mlock test was skipped around the time we pushed the
> TBI patches into -next:
> 
> https://qa-reports.linaro.org/lkft/linux-next-oe/tests/ltp-open-posix-tests/mlock_8-1?&page=2

Coincidence?

> Internally I don't think we've configured LTP with
> --with-open-posix-testsuite, so this explains why we missed it.

Ok, hopefully you can fix that now.

> > > My preference is 2 with a quick attempt below. This basically means
> > > clear the tag if it resembles a valid (tagged) user pointer, otherwise
> > > don't touch it (bit 55 set always means an invalid user pointer). Not
> > > sure how the generated code will look like but we could probably do
> > > something better in assembly directly.
> [...]
> > diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
> > index b61b50bf68b1..c23c47360664 100644
> > --- a/arch/arm64/include/asm/memory.h
> > +++ b/arch/arm64/include/asm/memory.h
> > @@ -215,12 +215,18 @@ static inline unsigned long kaslr_offset(void)
> >   * up with a tagged userland pointer. Clear the tag to get a sane pointer to
> >   * pass on to access_ok(), for instance.
> >   */
> > -#define untagged_addr(addr)	\
> > +#define __untagged_addr(addr)	\
> >  	((__force __typeof__(addr))sign_extend64((__force u64)(addr), 55))
> >  
> > +#define untagged_addr(addr)	({					\
> > +	u64 __addr = (__force u64)addr;					\
> > +	__addr &= __untagged_addr(__addr);				\
> > +	(__force __typeof__(addr))__addr;				\
> > +})
> > +
> >  #ifdef CONFIG_KASAN_SW_TAGS
> >  #define __tag_shifted(tag)	((u64)(tag) << 56)
> > -#define __tag_reset(addr)	untagged_addr(addr)
> > +#define __tag_reset(addr)	__untagged_addr(addr)
> >  #define __tag_get(addr)		(__u8)((u64)(addr) >> 56)
> >  #else
> >  #define __tag_shifted(tag)	0UL
> 
> This works for me. Szabolcs also suggested just zeroing the top byte but
> we wouldn't catch the overflow EINVAL case above, so I'd rather only
> mask the tag out if it was a user address (i.e. bit 55 is 0).

I'll spin it as a proper patch while we decide whether we want to do
anything.

Will

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
