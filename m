Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA632C35B6
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 01:46:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 39CEA3C5E6D
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 01:46:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 17B703C223E
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 01:46:51 +0100 (CET)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1FE13600070
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 01:46:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=nqi5GITho3z+SfilHsBCZVHw/SyTqLLJCGfQpf9o3uc=; b=A6/g4yiHt9hfRYsnfjLurXxAAd
 JCP/BYsja1/nM5Tmri1eIdjD1AIAC80NOPB2lM2HDjRkvWnsJ5b7q65xPK+h9s5YsnUr8qtMafdwI
 gjNcOZ2WuW1uR/9Uy2JnTxhKUJPzC2EwihfRH6FoD14vG8Mm2dYl4nnTEPtcgsv7ISEjakwm2Ip9Q
 cF9cbvrQlrLQw1aKr4Fx99mcB/Ui/zM1jAOmRkTEh6rol5+GNHn8J/jQ3qRF1sR3wAb/lBOXvj9f/
 ahYWw7eXJthvk5mSgZ1q4qJ1dD/5+uphFikmUnVErtdZLT/7m4ZBK/ArtiNSpgNCfyPF4OjDa6Ppr
 0VzBHdQQ==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1khix6-00075q-Sg; Wed, 25 Nov 2020 00:46:33 +0000
Date: Wed, 25 Nov 2020 00:46:32 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Message-ID: <20201125004632.GG4327@casper.infradead.org>
References: <CA+G9fYuKZGaHVvAv=ZwOL_p6UM3YhOHy0DcJRRM_DOLGYXg1Dw@mail.gmail.com>
 <20201124171628.dk6tle5lh3sx2jxg@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124171628.dk6tle5lh3sx2jxg@linutronix.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] kernel BUG at mm/highmem.c:417! invalid opcode: 0000 EIP:
 zero_user_segments
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
Cc: Song Liu <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>,
 Jan Kara <jack@suse.cz>, Arnd Bergmann <arnd@arndb.de>, vtolkm@googlemail.com,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 linux-mm <linux-mm@kvack.org>, torvalds@linuxfoundation.org,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Mel Gorman <mgorman@suse.de>,
 Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Yang Shi <shy828301@gmail.com>, LTP List <ltp@lists.linux.it>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Nov 24, 2020 at 06:16:28PM +0100, Sebastian Andrzej Siewior wrote:
> On 2020-11-24 18:52:44 [+0530], Naresh Kamboju wrote:
> > While running LTP test case access01 the following kernel BUG
> > noticed on linux next 20201124 tag kernel on i386.
> > 
> > git short log:
> > ----------------
> > git log --oneline next-20201120..next-20201124 -- mm/highmem.c
> > d9927d46febf Merge branch 'akpm-current/current'
> > 72d22a0d0e86 mm: support THPs in zero_user_segments
> > 2a656cad337e mm/highmem: Take kmap_high_get() properly into account
> > 
> > Please find these easy steps to reproduce the kernel build and boot.
> 
> This BUG_ON() is in zero_user_segments() which ash been added in commit
>    72d22a0d0e86 mm: support THPs in zero_user_segments
> 
> > [   50.852189] kernel BUG at mm/highmem.c:417!
> 
> I managed to capture one invocation with:
> zero_user_segments(0xd4367a90,
> 		   0x1000, 0x1000,
> 		   0x0, 0x50)
> page_compound() -> 1
> page_size() -> 4096

Thanks for debugging this!  I didn't realise start1 was allowed to be
less than start2.  Try this ... (systemd is sabotaging my efforts to
test an i386 kernel)

diff --git a/mm/highmem.c b/mm/highmem.c
index 3e1087f2b735..6306a535dd9c 100644
--- a/mm/highmem.c
+++ b/mm/highmem.c
@@ -369,46 +369,39 @@ void zero_user_segments(struct page *page, unsigned start1, unsigned end1,
 	BUG_ON(end1 > page_size(page) || end2 > page_size(page));
 
 	for (i = 0; i < compound_nr(page); i++) {
-		void *kaddr;
-		unsigned this_end;
+		void *kaddr = NULL;
 
-		if (end1 == 0 && start2 >= PAGE_SIZE) {
-			start2 -= PAGE_SIZE;
-			end2 -= PAGE_SIZE;
-			continue;
-		}
+		if (start1 < PAGE_SIZE || start2 < PAGE_SIZE)
+			kaddr = kmap_atomic(page + i);
 
 		if (start1 >= PAGE_SIZE) {
 			start1 -= PAGE_SIZE;
 			end1 -= PAGE_SIZE;
-			if (start2) {
-				start2 -= PAGE_SIZE;
-				end2 -= PAGE_SIZE;
-			}
-			continue;
-		}
-
-		kaddr = kmap_atomic(page + i);
+		} else {
+			unsigned this_end = min_t(unsigned, end1, PAGE_SIZE);
 
-		this_end = min_t(unsigned, end1, PAGE_SIZE);
-		if (end1 > start1)
-			memset(kaddr + start1, 0, this_end - start1);
-		end1 -= this_end;
-		start1 = 0;
+			if (end1 > start1)
+				memset(kaddr + start1, 0, this_end - start1);
+			end1 -= this_end;
+			start1 = 0;
+		}
 
 		if (start2 >= PAGE_SIZE) {
 			start2 -= PAGE_SIZE;
 			end2 -= PAGE_SIZE;
 		} else {
-			this_end = min_t(unsigned, end2, PAGE_SIZE);
+			unsigned this_end = min_t(unsigned, end2, PAGE_SIZE);
+
 			if (end2 > start2)
 				memset(kaddr + start2, 0, this_end - start2);
 			end2 -= this_end;
 			start2 = 0;
 		}
 
-		kunmap_atomic(kaddr);
-		flush_dcache_page(page + i);
+		if (kaddr) {
+			kunmap_atomic(kaddr);
+			flush_dcache_page(page + i);
+		}
 
 		if (!end1 && !end2)
 			break;

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
