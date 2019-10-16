Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCCDD9786
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 18:35:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B37DF3C22BA
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 18:35:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 57DCC3C1443
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 18:35:39 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 0724620114A
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 18:35:33 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE0051570;
 Wed, 16 Oct 2019 09:35:32 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 453613F68E;
 Wed, 16 Oct 2019 09:35:31 -0700 (PDT)
Date: Wed, 16 Oct 2019 17:35:29 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Message-ID: <20191016163528.GA27757@arm.com>
References: <cki.B4A567748F.PFM8G4WKXI@redhat.com>
 <805988176.6044584.1571038139105.JavaMail.zimbra@redhat.com>
 <CAAeHK+zxFWvCOgTYrMuD-oHJAFMn5DVYmQ6-RvU8NrapSz01mQ@mail.gmail.com>
 <20191014162651.GF19200@arrakis.emea.arm.com>
 <20191014213332.mmq7narumxtkqumt@willie-the-truck>
 <20191015152651.GG13874@arrakis.emea.arm.com>
 <20191015161453.lllrp2gfwa5evd46@willie-the-truck>
 <20191016042933.bemrrurjbghuiw73@willie-the-truck>
 <20191016144422.GZ27757@arm.com>
 <20191016145238.GL49619@arrakis.emea.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191016145238.GL49619@arrakis.emea.arm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] ? FAIL: Test report for kernel 5.4.0-rc2-d6c2c23.cki
 (stable-next)
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
Cc: Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>, Memory Management <mm-qe@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>,
 CKI Project <cki-project@redhat.com>,
 Vincenzo Frascino <Vincenzo.Frascino@arm.com>, Will Deacon <will@kernel.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Oct 16, 2019 at 03:52:38PM +0100, Catalin Marinas wrote:
> On Wed, Oct 16, 2019 at 03:44:25PM +0100, Dave P Martin wrote:
> > On Wed, Oct 16, 2019 at 05:29:33AM +0100, Will Deacon wrote:
> > > diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
> > > index b61b50bf68b1..c23c47360664 100644
> > > --- a/arch/arm64/include/asm/memory.h
> > > +++ b/arch/arm64/include/asm/memory.h
> > > @@ -215,12 +215,18 @@ static inline unsigned long kaslr_offset(void)
> > >   * up with a tagged userland pointer. Clear the tag to get a sane pointer to
> > >   * pass on to access_ok(), for instance.
> > >   */
> > > -#define untagged_addr(addr)	\
> > > +#define __untagged_addr(addr)	\
> > >  	((__force __typeof__(addr))sign_extend64((__force u64)(addr), 55))
> > >  
> > > +#define untagged_addr(addr)	({					\
> > 
> > Having the same informal name ("untagged") for two different address
> > representations seems like a recipe for confusion.  Can we rename one of
> > them?  (Say, untagged_address_if_user()?)
> 
> I agree it's confusing. We can rename the __* one but the other is
> spread around the kernel (it can be done, though as a subsequent
> exercise; untagged_uaddr?).
> 
> > > +	__addr &= __untagged_addr(__addr);				\
> > > +	(__force __typeof__(addr))__addr;				\
> > > +})
> > 
> > Is there any reason why we can't just have
> > 
> > #define untagged_addr ((__force __typeof__(addr))(	\
> > 	(__force u64)(addr) & GENMASK_ULL(63, 56)))
> 
> I guess you meant ~GENMASK_ULL(63,56) or GENMASK_ULL(55,0).
> 
> This changes the overflow case for mlock() which would return -ENOMEM
> instead of -EINVAL (not sure we have a test for it though). Does it
> matter?

It looks like SUSv7 has m{,un}local() and mprotect() aligned with one
another regarding ENOMEM versus EINVAL:

https://pubs.opengroup.org/onlinepubs/9699919799/functions/mprotect.html
https://pubs.opengroup.org/onlinepubs/9699919799/functions/mlock.html

So whatever we do, it should probably have the same effect on both
calls.


There's another wrinkle that occurrs to me though.  Rounding "kernel"
addresses up can spuriously change ENOMEM to EINVAL -- but the fix for
userspace addresses (i.e., rounding down) can likewise spuriously change
EINVAL to ENOMEM.

Maybe this is OK -- the SUSv7 wording doesn't seem to call out address
wraparound as a special case, and therefore supposedly doesn't require
EINVAL to be returned for it.

The asymmetry is concerning though, and a bit ugly.

Cheers
---Dave

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
