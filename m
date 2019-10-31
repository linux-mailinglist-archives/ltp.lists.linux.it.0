Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EE5EB607
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 18:22:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 499313C234C
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 18:22:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 5969C3C1815
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 18:22:55 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id ABF271A013C2
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 18:22:53 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C50F11FB;
 Thu, 31 Oct 2019 10:22:51 -0700 (PDT)
Received: from arm.com (e112269-lin.cambridge.arm.com [10.1.194.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFE213F6C4;
 Thu, 31 Oct 2019 10:22:48 -0700 (PDT)
Date: Thu, 31 Oct 2019 17:22:43 +0000
From: Steven Price <steven.price@arm.com>
To: lkp report check <lkp@intel.com>
Message-ID: <20191031172241.GA54073@arm.com>
References: <20191028135910.33253-13-steven.price@arm.com>
 <20191031151510.GA16405@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191031151510.GA16405@xsang-OptiPlex-9020>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [mm] 9343f6818b: BUG:kernel_NULL_pointer_dereference,
 address
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <Catalin.Marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Zong Li <zong.li@sifive.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, "Liang,
 Kan" <kan.liang@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, "ltp@lists.linux.it" <ltp@lists.linux.it>,
 Arnd Bergmann <arnd@arndb.de>, "lkp@lists.01.org" <lkp@lists.01.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Oct 31, 2019 at 03:15:10PM +0000, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> 
> commit: 9343f6818bb98cf0c982bfff6ed89b2c7176bcf9 ("[PATCH v14 12/22] mm: pagewalk: Allow walking without vma")
> url: https://github.com/0day-ci/linux/commits/Steven-Price/Generic-page-walk-and-ptdump/20191030-085205
> 
[...]
> 
> [   36.010874] BUG: kernel NULL pointer dereference, address: 0000000000000053
> [   36.012644] #PF: supervisor read access in kernel mode
> [   36.014074] #PF: error_code(0x0000) - not-present page
> [   36.015481] PGD 0 P4D 0 
> [   36.016433] Oops: 0000 [#1] SMP PTI
> [   36.017561] CPU: 1 PID: 2376 Comm: mmap12 Not tainted 5.4.0-rc5-00046-g9343f6818bb98 #1
> [   36.019340] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.10.2-1 04/01/2014
> [   36.021250] RIP: 0010:pagemap_pmd_range+0x5ae/0x7b0

So it looks like this has broken /proc/<pid>/pagemap because we can now
call the callbacks with a NULL vma if the region passed into
walk_page_range is (partially) outside the VMA range.

Somehow, in this situation, there is a region which has a PMD entry but
no corresponding VMA. So the pmd_entry callback is called but with
walk->vma==NULL.

The options for fixing this seem to be:
 a) Make the pagemap callback robust against a PMD entry without a VMA.
    For example treating it as a hole (as it would have been before this
    patch):

---8<---
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 9442631fd4af..b6d819c4bbb2 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1369,6 +1369,9 @@ static int pagemap_pmd_range(pmd_t *pmdp, unsigned long addr, unsigned long end,
 	pte_t *pte, *orig_pte;
 	int err = 0;
 
+	if (!vma)
+		return pagemap_pte_hole(addr, end, walk);
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 	ptl = pmd_trans_huge_lock(pmdp, vma);
 	if (ptl) {
---8<---

 b) Provide a flag (or another function) for walk_page_range() which
    restores the previous behaviour. Only those users that want to walk
    ranges without VMAs would then need to deal with NULL-vma returns.

---8<---
diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
index 12004b097eae..519258e8fffa 100644
--- a/include/linux/pagewalk.h
+++ b/include/linux/pagewalk.h
@@ -61,6 +61,7 @@ struct mm_walk {
 	const struct mm_walk_ops *ops;
 	struct mm_struct *mm;
 	struct vm_area_struct *vma;
+	bool ignore_vma;
 	void *private;
 };

diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index 4139e9163aee..f2fccbc3cba8 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -38,7 +38,7 @@ static int walk_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
 	do {
 again:
 		next = pmd_addr_end(addr, end);
-		if (pmd_none(*pmd)) {
+		if (pmd_none(*pmd) || (!walk->vma && walk->ignore_vma)) {
 			if (ops->pte_hole)
 				err = ops->pte_hole(addr, next, walk);
 			if (err)
@@ -89,7 +89,7 @@ static int walk_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
 	do {
  again:
 		next = pud_addr_end(addr, end);
-		if (pud_none(*pud)) {
+		if (pud_none(*pud) || (!walk->vma && !walk->ignore_vma)) {
 			if (ops->pte_hole)
 				err = ops->pte_hole(addr, next, walk);
 			if (err)
---8<---

I'm currently inclined towards the latter because I don't want to have
to try to audit all existing users in case there's anything similar
lurking in another user of walk_page_range().

Steve


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
