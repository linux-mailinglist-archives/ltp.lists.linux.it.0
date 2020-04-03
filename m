Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7AA19D7A2
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 15:33:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 645053C2FB3
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 15:32:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 312753C2F6B
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 15:32:55 +0200 (CEST)
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5576E6018B2
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 15:32:54 +0200 (CEST)
Received: by mail-lj1-x241.google.com with SMTP id 19so6917964ljj.7
 for <ltp@lists.linux.it>; Fri, 03 Apr 2020 06:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1B9NLeMDtTnr4dZAofQWYRGmeVDWcEa7QUbOLt8Zif0=;
 b=V9OaIG26ZZXBs2ja92clufhFn4bOl7BZKyyKBPjIS97kJICoeFTJ/gNh0JRjSkG8XM
 sELHUQIHzUNHOUZ1KDMD/J+JEE+vaUJpNarNzd+T8/0ftnB72UpO4ubBpiHPXj/zfB/H
 qSb3zG1ktIjiC5q7Fdq8Qpf+r7s1gTZ76sQZ/8I9hP0pHwprXb16FgqdXMOUJzZYq8+m
 ItiVGlE5Rswak81VqO7oL4nCyx0sPtR8LrcNBqEU1YCGzZUuzifVW9lZr3AL+487jotX
 MmK7sbjRL0Ey5HtpevAa+FI9mrXKmMspJxdLSoKnl7MKovjcPchWGV9RwTc6OsmH+M8P
 8STg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1B9NLeMDtTnr4dZAofQWYRGmeVDWcEa7QUbOLt8Zif0=;
 b=mfEav5872cepKyiN7/RmLku1w1TwQLR5zQp9RlxecRz/5tmxJWYyHEl6QCpXV4AgWg
 NIxjZ3CCNM/hoNFsY3Ul2Xp5fWzyajrRCaFGS98EUAaVghkANKP15GYrdoT+4HLvtNZi
 cvx5TViwOPF07CGTunK/bK1A0oKgZonISDCidTzaKjbiiyNvdtgi3056/V1buDRcfnr3
 IZt5At4JZsilbWwd/s3Tza7bwxClaVTuNJUBf37WeBWZWQRXSEspkn9DV0euIgEI1T+b
 VdJ3xW2Rc5gv23Hl3S5yZThqS5IeEXh7aieFhm9vMBUCRLy17uvGwizGGQ8vFbiafPWL
 o23Q==
X-Gm-Message-State: AGi0Pub+e4vZSwVUHv9QsRDa68b2o/omCUcj10E/XOqwx/nofSy6dyvX
 wPUei5cBtkZ9QG/Mw8D7vp3/gQ==
X-Google-Smtp-Source: APiQypJoMxosZHh+k2+LEa98vRpsbBdcqv2X4B9kWQ22u0lddJXax1ykbJNUZYV1LR2PHYfc5evJKQ==
X-Received: by 2002:a2e:95c4:: with SMTP id y4mr4912219ljh.94.1585920773859;
 Fri, 03 Apr 2020 06:32:53 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id d12sm5748186lfi.86.2020.04.03.06.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:32:53 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id AB1DD100F13; Fri,  3 Apr 2020 16:32:52 +0300 (+03)
Date: Fri, 3 Apr 2020 16:32:52 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20200403133252.ivdqoppxhc6w5b47@box>
References: <CA+G9fYs1xStrrsvGbW7bc4h1a0Kjfz0_zn4c7LL7-bGZb0GH6g@mail.gmail.com>
 <20200402133849.mmkvekzx37kw4nsj@box>
 <CA+G9fYv0xNtnD=eBmxVqYqEoYTbMk6mdn04WmgSUasDw2L7uFg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYv0xNtnD=eBmxVqYqEoYTbMk6mdn04WmgSUasDw2L7uFg@mail.gmail.com>
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

On Fri, Apr 03, 2020 at 12:56:57AM +0530, Naresh Kamboju wrote:
> [  734.876355] old_addr: 0xbfe00000, new_addr: 0xbfc00000, old_end: 0xc0000000

The ranges are overlapping. We don't expect it. mremap(2) never does this.

shift_arg_pages() only moves range downwards. It should be safe.

Could you try this:

diff --git a/mm/mremap.c b/mm/mremap.c
index af363063ea23..ddd5337de395 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -205,10 +205,14 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 		return false;
 
 	/*
-	 * The destination pmd shouldn't be established, free_pgtables()
-	 * should have release it.
+	 * mremap(2) clears the new place, so the new_pmd is expected to be
+	 * clear.
+	 *
+	 * But move_page_tables() is also called from shift_arg_pages() that
+	 * allows for overlapping address ranges. The shift_arg_pages() case
+	 * is also safe as we only move page tables downwards.
 	 */
-	if (WARN_ON(!pmd_none(*new_pmd)))
+	if (WARN_ON(!pmd_none(*new_pmd) && old_addr > new_addr))
 		return false;
 
 	/*
-- 
 Kirill A. Shutemov

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
