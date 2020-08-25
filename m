Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 680572514A5
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Aug 2020 10:53:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C1C0C3C5686
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Aug 2020 10:53:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id A97B43C02FA
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 10:53:41 +0200 (CEST)
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 020241A00F3E
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 10:53:40 +0200 (CEST)
Received: by mail-lj1-x243.google.com with SMTP id w25so12846214ljo.12
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 01:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EtDubTWcya3bFNIMWt5cpovVHx+/aPFuncLPAlV9+q8=;
 b=hg6SynizBYW+QsJT+XYq5YMt+Nz9cUWGDuKfmhI4lW4tNZLzeavZKk99fUlOfxyi3K
 Xpd9KmZG48QT9+r1neCW3o7qMudIsjtFIcM+bIzkTcE0TIoXL7AZY/DZKfPQR6q4aStp
 Aw+O8kqksFZnlvLi/ts/FSdbod4DZn/D/i4Qc69TTNj3r3FB9Qm9KBePALuNWpXltBOL
 JMeBNp+Td70msn2CiW6D4fci8cxU8LWo/wVPF7q5RLXfyryBurHJYXOfm0AZ/jKgjGtO
 DfnjUAUme1d/Scto+d5AOyLGFXsAirGuVKhAWnINjL+U6DbWPP2d6wikmR8RyiRxUw40
 imMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EtDubTWcya3bFNIMWt5cpovVHx+/aPFuncLPAlV9+q8=;
 b=IQbPLZxqjZWBPfkAnZSxdG1U7YXj/wImQP/32GppPkq5/nK18iHbc2SXObp1VAMbck
 6o9+QBV1ijTqsmyiA9b1Z9lahMoBDyBX/DIWZQdJ8z7TleOoGU23dUpiFNtvxBEXBegl
 A2Iyr70+CpgU+f9LK7cKnod/rE4m3e1PVa11OEfvgAGvY/HdbIbEd6FPF4lQQ3wQQlF8
 XtNh7um/BmP9zZ1bg9iVH3P+MUITd21zfwUpEFAcut0IHitQW2nW4F51miIruYnJ7L4M
 G+6hT/ua9SCiBT4Db9VPTGyUDo47DBX14/v/2VTEAgB9Pkt3ZXXoc+loZo1/aRlBfV0C
 nqrQ==
X-Gm-Message-State: AOAM533H9dNRZwBlfpNYA6aT4020fAZtvZZNsozlNP+cpbBqXNBoov/t
 UgYjwitDEJyPbto36ObmOQD4y6ypF2GWH9xBmw4SiQ==
X-Google-Smtp-Source: ABdhPJzgd8VhaITc7beto8F5Oa1lQp4WYJZVsedInRAxlBWhJv7ZxzqrbHw+79LvHxCSjX2KcL7GkSO6u2tVrErxAxM=
X-Received: by 2002:a2e:920c:: with SMTP id k12mr4632919ljg.29.1598345613076; 
 Tue, 25 Aug 2020 01:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYt=oYWHEG6VNkfEh8+UxbReS6_+9hnz+1bOYZHj5j1F_Q@mail.gmail.com>
 <20200824110645.GC17456@casper.infradead.org>
 <CA+G9fYvjKGF3HZXyd=JQHzRG=r=bmD0hYQn02VL4Y=5y57OgaA@mail.gmail.com>
 <20200825083119.GA69694@linux.ibm.com>
In-Reply-To: <20200825083119.GA69694@linux.ibm.com>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Tue, 25 Aug 2020 10:53:22 +0200
Message-ID: <CADYN=9+2RDeUdbNT+XT6WgTW70UCdsARqaAL7PQ0+OPLvrkNng@mail.gmail.com>
To: Mike Rapoport <rppt@linux.ibm.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] BUG: Bad page state in process true pfn:a8fed on arm
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, opendmb@gmail.com,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 lkft-triage@lists.linaro.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 linux-mm <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Andy Lutomirski <luto@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, afzal.mohd.ma@gmail.com,
 Christoph Hellwig <hch@lst.de>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, 25 Aug 2020 at 10:32, Mike Rapoport <rppt@linux.ibm.com> wrote:
>
> On Tue, Aug 25, 2020 at 01:03:53PM +0530, Naresh Kamboju wrote:
> > On Mon, 24 Aug 2020 at 16:36, Matthew Wilcox <willy@infradead.org> wrote:
> > >
> > > On Mon, Aug 24, 2020 at 03:14:55PM +0530, Naresh Kamboju wrote:
> > > > [   67.545247] BUG: Bad page state in process true  pfn:a8fed
> > > > [   67.550767] page:9640c0ab refcount:0 mapcount:-1024
> > >
> > > Somebody freed a page table without calling __ClearPageTable() on it.
> >
> > After running git bisect on this problem,
> > The first suspecting of this problem on arm architecture this patch.
> > 424efe723f7717430bec7c93b4d28bba73e31cf6
> > ("mm: account PMD tables like PTE tables ")
> >
> > Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> > Reported-by: Anders Roxell <anders.roxell@linaro.org>
>
> Can you please check if this fix helps?

That fixed the problem.

Cheers,
Anders

>
> diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
> index 9415222b49ad..b8cbe03ad260 100644
> --- a/arch/arm/include/asm/tlb.h
> +++ b/arch/arm/include/asm/tlb.h
> @@ -59,6 +59,7 @@ __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp, unsigned long addr)
>  #ifdef CONFIG_ARM_LPAE
>         struct page *page = virt_to_page(pmdp);
>
> +       pgtable_pmd_page_dtor(page);
>         tlb_remove_table(tlb, page);
>  #endif
>  }
>
> > Additional information:
> > We have tested linux next by reverting this patch and confirmed
> > that the reported BUG is not reproduced.
> >
> > These configs enabled on the running device,
> >
> > CONFIG_TRANSPARENT_HUGEPAGE=y
> > CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y
> >
> >
> > -- Suspecting patch --
> > commit 424efe723f7717430bec7c93b4d28bba73e31cf6
> > Author: Matthew Wilcox <willy@infradead.org>
> > Date:   Thu Aug 20 10:01:30 2020 +1000
> >
> >     mm: account PMD tables like PTE tables
> >
> >     We account the PTE level of the page tables to the process in order to
> >     make smarter OOM decisions and help diagnose why memory is fragmented.
> >     For these same reasons, we should account pages allocated for PMDs.  With
> >     larger process address spaces and ASLR, the number of PMDs in use is
> >     higher than it used to be so the inaccuracy is starting to matter.
> >
> >     Link: http://lkml.kernel.org/r/20200627184642.GF25039@casper.infradead.org
> >     Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> >     Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>
> >     Cc: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
> >     Cc: Andy Lutomirski <luto@kernel.org>
> >     Cc: Arnd Bergmann <arnd@arndb.de>
> >     Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> >     Cc: Joerg Roedel <joro@8bytes.org>
> >     Cc: Max Filippov <jcmvbkbc@gmail.com>
> >     Cc: Peter Zijlstra <peterz@infradead.org>
> >     Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> >     Cc: Stafford Horne <shorne@gmail.com>
> >     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> >     Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index b0a15ee77b8a..a4e5b806347c 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -2239,7 +2239,7 @@ static inline spinlock_t *pmd_lockptr(struct
> > mm_struct *mm, pmd_t *pmd)
> >   return ptlock_ptr(pmd_to_page(pmd));
> >  }
> >
> > -static inline bool pgtable_pmd_page_ctor(struct page *page)
> > +static inline bool pmd_ptlock_init(struct page *page)
> >  {
> >  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >   page->pmd_huge_pte = NULL;
> > @@ -2247,7 +2247,7 @@ static inline bool pgtable_pmd_page_ctor(struct
> > page *page)
> >   return ptlock_init(page);
> >  }
> >
> > -static inline void pgtable_pmd_page_dtor(struct page *page)
> > +static inline void pmd_ptlock_free(struct page *page)
> >  {
> >  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >   VM_BUG_ON_PAGE(page->pmd_huge_pte, page);
> > @@ -2264,8 +2264,8 @@ static inline spinlock_t *pmd_lockptr(struct
> > mm_struct *mm, pmd_t *pmd)
> >   return &mm->page_table_lock;
> >  }
> >
> > -static inline bool pgtable_pmd_page_ctor(struct page *page) { return true; }
> > -static inline void pgtable_pmd_page_dtor(struct page *page) {}
> > +static inline bool pmd_ptlock_init(struct page *page) { return true; }
> > +static inline void pmd_ptlock_free(struct page *page) {}
> >
> >  #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
> >
> > @@ -2278,6 +2278,22 @@ static inline spinlock_t *pmd_lock(struct
> > mm_struct *mm, pmd_t *pmd)
> >   return ptl;
> >  }
> >
> > +static inline bool pgtable_pmd_page_ctor(struct page *page)
> > +{
> > + if (!pmd_ptlock_init(page))
> > + return false;
> > + __SetPageTable(page);
> > + inc_zone_page_state(page, NR_PAGETABLE);
> > + return true;
> > +}
> > +
> > +static inline void pgtable_pmd_page_dtor(struct page *page)
> > +{
> > + pmd_ptlock_free(page);
> > + __ClearPageTable(page);
> > + dec_zone_page_state(page, NR_PAGETABLE);
> > +}
> > +
> >  /*
> >   * No scalability reason to split PUD locks yet, but follow the same pattern
> >   * as the PMD locks to make it easier if we decide to.  The VM should not be
> >
> >
> >
> >
> > - Naresh
>
> --
> Sincerely yours,
> Mike.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
