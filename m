Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4078025133F
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Aug 2020 09:34:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 01C243C2ECA
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Aug 2020 09:34:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 039C23C12A1
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 09:34:07 +0200 (CEST)
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EDF8A1401113
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 09:34:06 +0200 (CEST)
Received: by mail-ua1-x944.google.com with SMTP id z12so3422577uam.12
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 00:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nv6CSGIbCknVAshl07j/5xGDdqtleXXUaO2AgALOcBQ=;
 b=Apqc+J7zJjLt7HIY9LJFORqtLChLWyXyW9OPPAm2IWuGKCEajOMJOtXt10DCqIEofM
 xvvHt+AE/VOWITfgJLQESVHUSXbl5SlmedCTjvNoU6i4abY1JLQs5mDoynT8Fpan7Hve
 URdOCRAMTN7YlABeKlRlIHyHB9fb7JRo8O2x66tNawMGyqBwQm9OQ4U9+CljGwOgEEum
 pN53ulxBMNpATD0T+DEUnY3jpR0IPiAa1DOZ2AtxLPw3InU5Wx2J0fgKInN09ExID/3P
 LkyET0zqDcSGBHVmedmDFcAy5zPKkEh8SiTsqt2rEpCJDplMY23oKHlDSsiyyxM6WRIa
 Cmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nv6CSGIbCknVAshl07j/5xGDdqtleXXUaO2AgALOcBQ=;
 b=Hiv0iRsnEIoc8tSX2Mwkxspm/uDAhOy8upw6+aGSLncaDEeeWOGoALn6vdLqvoe+mv
 VkXyMinZlV9UuPJBhSVi+mjKU7F8fR0tyR7HP3B+SLgP3gFiN9v5B+GMOuyJl810OfHT
 nWWWG4dIHIvz7CUf1uAIXu4WFRBajARwGxevxa2zWy8Ydc/zDo8fBqeLsqScx0eecsAB
 4lV3D8qNPIJueQzXn7CxMP+nWc3wTsdyuKim+D3GkiSjFLPSimg+odo0FWiuO4opWP9Q
 OG7BsvKFIQc76WyzWEJmTNEAmi0gZIPCzUhVKmjYFmEIqeJvdGcNZNK1AnjFyPM93vEz
 3zVA==
X-Gm-Message-State: AOAM533HCD5T/dd/fdQScYjHdnOjd2GMEErITUnD//iaL9kS9CUyYO3c
 a0uwgciP+fRz9ZxbkBgzwqEJNP+M12JRHxXteSJCRA==
X-Google-Smtp-Source: ABdhPJzaForEfiwBwHGNvHwRx3BWRXpyG8wDtoenb+p3GP/dDIygv4Sf8WgzvnHPl3pAkzXAJYtywlXsz8c7R9LZ5dk=
X-Received: by 2002:ab0:462:: with SMTP id 89mr4776164uav.34.1598340845625;
 Tue, 25 Aug 2020 00:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYt=oYWHEG6VNkfEh8+UxbReS6_+9hnz+1bOYZHj5j1F_Q@mail.gmail.com>
 <20200824110645.GC17456@casper.infradead.org>
In-Reply-To: <20200824110645.GC17456@casper.infradead.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 25 Aug 2020 13:03:53 +0530
Message-ID: <CA+G9fYvjKGF3HZXyd=JQHzRG=r=bmD0hYQn02VL4Y=5y57OgaA@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 linux-mm <linux-mm@kvack.org>, Will Deacon <will@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Peter Xu <peterx@redhat.com>, Andy Lutomirski <luto@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>,
 afzal.mohd.ma@gmail.com, Christoph Hellwig <hch@lst.de>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, 24 Aug 2020 at 16:36, Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Aug 24, 2020 at 03:14:55PM +0530, Naresh Kamboju wrote:
> > [   67.545247] BUG: Bad page state in process true  pfn:a8fed
> > [   67.550767] page:9640c0ab refcount:0 mapcount:-1024
>
> Somebody freed a page table without calling __ClearPageTable() on it.

After running git bisect on this problem,
The first suspecting of this problem on arm architecture this patch.
424efe723f7717430bec7c93b4d28bba73e31cf6
("mm: account PMD tables like PTE tables ")

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Reported-by: Anders Roxell <anders.roxell@linaro.org>

Additional information:
We have tested linux next by reverting this patch and confirmed
that the reported BUG is not reproduced.

These configs enabled on the running device,

CONFIG_TRANSPARENT_HUGEPAGE=y
CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y


-- Suspecting patch --
commit 424efe723f7717430bec7c93b4d28bba73e31cf6
Author: Matthew Wilcox <willy@infradead.org>
Date:   Thu Aug 20 10:01:30 2020 +1000

    mm: account PMD tables like PTE tables

    We account the PTE level of the page tables to the process in order to
    make smarter OOM decisions and help diagnose why memory is fragmented.
    For these same reasons, we should account pages allocated for PMDs.  With
    larger process address spaces and ASLR, the number of PMDs in use is
    higher than it used to be so the inaccuracy is starting to matter.

    Link: http://lkml.kernel.org/r/20200627184642.GF25039@casper.infradead.org
    Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
    Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>
    Cc: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
    Cc: Andy Lutomirski <luto@kernel.org>
    Cc: Arnd Bergmann <arnd@arndb.de>
    Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
    Cc: Joerg Roedel <joro@8bytes.org>
    Cc: Max Filippov <jcmvbkbc@gmail.com>
    Cc: Peter Zijlstra <peterz@infradead.org>
    Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
    Cc: Stafford Horne <shorne@gmail.com>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

diff --git a/include/linux/mm.h b/include/linux/mm.h
index b0a15ee77b8a..a4e5b806347c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2239,7 +2239,7 @@ static inline spinlock_t *pmd_lockptr(struct
mm_struct *mm, pmd_t *pmd)
  return ptlock_ptr(pmd_to_page(pmd));
 }

-static inline bool pgtable_pmd_page_ctor(struct page *page)
+static inline bool pmd_ptlock_init(struct page *page)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
  page->pmd_huge_pte = NULL;
@@ -2247,7 +2247,7 @@ static inline bool pgtable_pmd_page_ctor(struct
page *page)
  return ptlock_init(page);
 }

-static inline void pgtable_pmd_page_dtor(struct page *page)
+static inline void pmd_ptlock_free(struct page *page)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
  VM_BUG_ON_PAGE(page->pmd_huge_pte, page);
@@ -2264,8 +2264,8 @@ static inline spinlock_t *pmd_lockptr(struct
mm_struct *mm, pmd_t *pmd)
  return &mm->page_table_lock;
 }

-static inline bool pgtable_pmd_page_ctor(struct page *page) { return true; }
-static inline void pgtable_pmd_page_dtor(struct page *page) {}
+static inline bool pmd_ptlock_init(struct page *page) { return true; }
+static inline void pmd_ptlock_free(struct page *page) {}

 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)

@@ -2278,6 +2278,22 @@ static inline spinlock_t *pmd_lock(struct
mm_struct *mm, pmd_t *pmd)
  return ptl;
 }

+static inline bool pgtable_pmd_page_ctor(struct page *page)
+{
+ if (!pmd_ptlock_init(page))
+ return false;
+ __SetPageTable(page);
+ inc_zone_page_state(page, NR_PAGETABLE);
+ return true;
+}
+
+static inline void pgtable_pmd_page_dtor(struct page *page)
+{
+ pmd_ptlock_free(page);
+ __ClearPageTable(page);
+ dec_zone_page_state(page, NR_PAGETABLE);
+}
+
 /*
  * No scalability reason to split PUD locks yet, but follow the same pattern
  * as the PMD locks to make it easier if we decide to.  The VM should not be




- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
