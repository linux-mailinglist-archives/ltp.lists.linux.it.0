Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9689519C2CA
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Apr 2020 15:38:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4DE083C2FFD
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Apr 2020 15:38:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 91C203C2FE3
 for <ltp@lists.linux.it>; Thu,  2 Apr 2020 15:38:52 +0200 (CEST)
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 88142600669
 for <ltp@lists.linux.it>; Thu,  2 Apr 2020 15:38:51 +0200 (CEST)
Received: by mail-lj1-x242.google.com with SMTP id k21so3297548ljh.2
 for <ltp@lists.linux.it>; Thu, 02 Apr 2020 06:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Exs+wcW8pqgTK370fZw+VgeJY6A05eU9Q6JVvMKSZ5A=;
 b=ZtUyWy0R2Z5oSIViPZp5LZkLeggJSxUyZnS7rn5QBfuXfMm36UY64CFejQ6rDLK27M
 ck8f+uK76r+ypnQb1eJ+r2wYJfzjan9U6qOtBrsZMq3xFfGa9VZBO2JSPc9uY//+e8x/
 JKda+C2ufhRLa2BYr2vvq3BbYpG/BLEKZoUnabqg/dzTitex1dkSJK4M9AGMjwBXU3vq
 U8vW18JxWxqvX3y1ts5f2RGJYrp0xV6XHvrN7jh9XmkobXSel3F2PKWjzqIfRz6iIvLZ
 nDa6+bCrIWFQHWmdv8ICJSpVgdj64W2zx7uDldTa26YxVxR00sH9NOK4VISRbR8+ATsN
 EqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Exs+wcW8pqgTK370fZw+VgeJY6A05eU9Q6JVvMKSZ5A=;
 b=qLk7o2U/a2dlcQoWHZdPD8z5ALAr3yG3Omq9lEuH93VJ+H2w8H8AdGpyDeSGmP0xTO
 sWrnBpsEpIpbGL3n/BwgU3Y+2W4i8DbsOtJlk/OsNuCvCBvWCHyIH5Dkw6GSiY4AqGGq
 CmjR5tYSzalxEc0I8vCNPv8I/Ayi6L3CaYL7pMDigzQ5y35bzg1m1EEjGYgZHd4RLz+s
 9RDWlJO9IXt6Zer+++GilKC6E8CR1476RS+RzjIZDm5jg8w1D1CrdluyKsSL3AFQ2xWH
 MgcXFO2L83ZA3nqgWqsGKTZ9JVs0Nf2yUuBrD1/vFBpU4OVGpeSQWztloWzFyVGMK2UK
 Iu4g==
X-Gm-Message-State: AGi0PubIaijwLUalFTfOtJo2xUzpOaWQnUO51aWpPNXblb7nuPzyGEJS
 kZpHfnUEogZ7fwPQP9xHvRVD6A==
X-Google-Smtp-Source: APiQypJKLmrPDaM+SDnr4wmawnXsXtnQLFd7hmufLkhv5z3INZXRH64Iqc60CAZAwjstSbK8pKN4qQ==
X-Received: by 2002:a2e:884d:: with SMTP id z13mr2088608ljj.158.1585834731008; 
 Thu, 02 Apr 2020 06:38:51 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id m193sm1960052lfa.39.2020.04.02.06.38.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 06:38:49 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id 204491020A6; Thu,  2 Apr 2020 16:38:49 +0300 (+03)
Date: Thu, 2 Apr 2020 16:38:49 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20200402133849.mmkvekzx37kw4nsj@box>
References: <CA+G9fYs1xStrrsvGbW7bc4h1a0Kjfz0_zn4c7LL7-bGZb0GH6g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYs1xStrrsvGbW7bc4h1a0Kjfz0_zn4c7LL7-bGZb0GH6g@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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

On Thu, Apr 02, 2020 at 04:49:02PM +0530, Naresh Kamboju wrote:
> While running LTP mm thp01 test case on i386 kernel running on x86_64 device
> the following kernel warning was noticed multiple times.
> 
> This issue is not new,
> we have noticed on stable-rc 5.4, stable-rc 5.5 and stable-rc 5.6 branches.
> FYI, CONFIG_HAVE_MOVE_PMD=y is set on
> and total memory 2.2G as per free output.
> 
> steps to reproduce:
> --------------------
> boot i386 kernel on x86_64 device,
> cd /opt/ltp
> ./runltp -f mm
> thp01.c:98: PASS: system didn't crash.
> thp01.c:98: PASS: system didn't crash.
> thp01.c:98: PASS: system didn't crash.
> 
> [  207.317499] ------------[ cut here ]------------
> [  207.322153] WARNING: CPU: 0 PID: 18963 at mm/mremap.c:211
> move_page_tables+0x5b0/0x5d0


> Kernel config:
> https://builds.tuxbuild.com/RJ9BGpsgfPfj3Sfje8oLSw/kernel.config

Interesting. I suspect it's related to 2-level page tables in this
configuration. But I cannot immediately see how.

Could you test if enabling HIGHMEM64 fixes the issue?

Below is patch that prints some additional info:

diff --git a/mm/mremap.c b/mm/mremap.c
index d28f08a36b96..065d5ec3614a 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -208,8 +208,14 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 	 * The destination pmd shouldn't be established, free_pgtables()
 	 * should have release it.
 	 */
-	if (WARN_ON(!pmd_none(*new_pmd)))
+	if (WARN_ON(!pmd_none(*new_pmd))) {
+		dump_vma(vma);
+		printk("old_addr: %#lx, new_addr: %#lx, old_end: %#lx\n",
+				old_addr, new_addr, old_end);
+		printk("old_pmd: %#lx", pmd_val(*old_pmd));
+		printk("new_pmd: %#lx", pmd_val(*new_pmd));
 		return false;
+	}
 
 	/*
 	 * We don't have to worry about the ordering of src and dst
-- 
 Kirill A. Shutemov

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
