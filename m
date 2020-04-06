Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2173019F17D
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Apr 2020 10:23:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AF22E3C2E0A
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Apr 2020 10:23:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 5EDF23C050E
 for <ltp@lists.linux.it>; Mon,  6 Apr 2020 10:23:22 +0200 (CEST)
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7260D14012B9
 for <ltp@lists.linux.it>; Mon,  6 Apr 2020 10:23:21 +0200 (CEST)
Received: by mail-lf1-x141.google.com with SMTP id v7so1990521lfg.6
 for <ltp@lists.linux.it>; Mon, 06 Apr 2020 01:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1c07BEC07UZVPJHnU0F7x86Le0JR3iWdmr6B9bHz+yQ=;
 b=a7tYuu3Tabrb7D/49u9jm9lL6eXqgnC87ZMNcPFC7Nhjk8WnjExZ5NeAav2TmLOtTW
 HVNKnRwOQthkpWpKCu2IqTs9B9uLUy+qD+ZXrkoZOQa4SdgWML5ql6jNVz6rjlMO86EM
 vko/niF41g++EhmL5P89Gaw9j9naop8nVPhfPvv8MtqRlJWkb00n0vhf1E8dnZUcusZm
 W0XWYQ8/D5jON++s/0YlrLFub6gpZD2KF1qEuyJMLJsVONTssqP7rGo/2tnCoRIGTPsr
 GLui6R61RHcd9Xb2J+Wnm2rOU8Yv+FJkmZScKBanNWvbolq/1/jbnRCD7nqBKn52Ovdp
 WDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1c07BEC07UZVPJHnU0F7x86Le0JR3iWdmr6B9bHz+yQ=;
 b=PFlYopciXfpvXPteL9/yTmeE4vWYTbEKOtS7LkiT9ZRmN/kSTSXz9q8GYcc9065XxE
 pe171lD3FEGwrcin3BZKgrmxCGlDhZ6RMEghx+PDpAPY2IbxWzIZEyefB4x4Hx3DJ33K
 zeWwUCt0AcXpuytbULVL4xqr5M6Qd4XTRXxoXo+4MnpxQxHJ065JIt8QfctOTfMiLJIZ
 f8Ilu0VSOA3OTpodNZMRl1aiNQu5KfOP2aHTQcGlPoLpB8uyjHVQzRx/rqygsCm3haF1
 9B6o7o6rq4xVhlAMDEvN4LLiWv1fw3SKwyTs/Lf+eJHADdt8motpU1QMHAg1lqeY0Xop
 SQFg==
X-Gm-Message-State: AGi0Puah+Ku6wlagqf2nTGS45f/AP7KlpSvjIo3N6ZfSBHvoA86bf3qd
 WuONmrDEzoe5XyqIiYfaXiS7quHC7GIiooaNIWsmYg==
X-Google-Smtp-Source: APiQypJnyOYlwjP10HGdWQRrOOqzpBCTzDkFCOrs1js1rgvxGv5ZQLRUnz8Sei/ZMVu9arbIsNBG6fLhNsXR4+STv6U=
X-Received: by 2002:a19:5e46:: with SMTP id z6mr11789742lfi.74.1586161400666; 
 Mon, 06 Apr 2020 01:23:20 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYs1xStrrsvGbW7bc4h1a0Kjfz0_zn4c7LL7-bGZb0GH6g@mail.gmail.com>
 <20200402133849.mmkvekzx37kw4nsj@box>
 <CA+G9fYv0xNtnD=eBmxVqYqEoYTbMk6mdn04WmgSUasDw2L7uFg@mail.gmail.com>
 <20200403133252.ivdqoppxhc6w5b47@box>
 <CA+G9fYsnD0vkCpSH98Lpsi6nxXBS+JYbSPhTnNE16CrQ4s4QhQ@mail.gmail.com>
 <20200404160631.7eny3swsqn665m2p@box>
In-Reply-To: <20200404160631.7eny3swsqn665m2p@box>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 6 Apr 2020 13:53:09 +0530
Message-ID: <CA+G9fYtmSMLaqmt-OEovQxXseGqiq_HUDyq_dZZ1kSbsuNQo=Q@mail.gmail.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] mm/mremap.c : WARNING: at mm/mremap.c:211
 move_page_tables+0x5b0/0x5d0
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
Cc: William Kucharski <william.kucharski@oracle.com>,
 Julia Lawall <Julia.Lawall@lip6.fr>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Will Deacon <will.deacon@arm.com>, linux- stable <stable@vger.kernel.org>,
 Michal Hocko <mhocko@kernel.org>, linux-mm <linux-mm@kvack.org>,
 lkft-triage@lists.linaro.org,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Andrew Morton <akpm@linux-foundation.org>, LTP List <ltp@lists.linux.it>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Sat, 4 Apr 2020 at 21:36, Kirill A. Shutemov <kirill@shutemov.name> wrote:
>
> On Sat, Apr 04, 2020 at 08:10:42PM +0530, Naresh Kamboju wrote:
> > On Fri, 3 Apr 2020 at 19:02, Kirill A. Shutemov <kirill@shutemov.name> wrote:
> > >
> > > On Fri, Apr 03, 2020 at 12:56:57AM +0530, Naresh Kamboju wrote:
> > > > [  734.876355] old_addr: 0xbfe00000, new_addr: 0xbfc00000, old_end: 0xc0000000
> > >
> > > The ranges are overlapping. We don't expect it. mremap(2) never does this.
> > >
> > > shift_arg_pages() only moves range downwards. It should be safe.
> > >
> > > Could you try this:
> >
> > Applied the patch and tested and still getting kernel warning.
> > CONFIG_HIGHMEM64G=y is still enabled.
> >
> > [  790.041040] ------------[ cut here ]------------
> > [  790.045664] WARNING: CPU: 3 PID: 3195 at mm/mremap.c:212
> > move_page_tables+0x7a7/0x840
>
> Are you sure the patch is applied? The line number in the warning supposed
> to change.

Yes. The patch was applied and tested.
The reason for line number change is due to linux/mmdebug.h included
because an earlier patch "dump_vma(vma);" needed this.

diff --git a/mm/mremap.c b/mm/mremap.c
index af363063ea23..cf02d4244e83 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -24,6 +24,7 @@
 #include <linux/uaccess.h>
 #include <linux/mm-arch-hooks.h>
 #include <linux/userfaultfd_k.h>
+#include <linux/mmdebug.h>

 #include <asm/cacheflush.h>
 #include <asm/tlbflush.h>
@@ -208,7 +209,7 @@ static bool move_normal_pmd(struct vm_area_struct
*vma, unsigned long old_addr,
         * The destination pmd shouldn't be established, free_pgtables()
         * should have release it.
         */
-       if (WARN_ON(!pmd_none(*new_pmd)))
+       if (WARN_ON(!pmd_none(*new_pmd) && old_addr > new_addr))
                return false;

        /*



- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
