Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BF67F3A7
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 11:59:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 10B853C1E27
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 11:59:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 9F4503C1DDD
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 11:59:22 +0200 (CEST)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id AC779601067
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 11:59:21 +0200 (CEST)
Received: by mail-lj1-f195.google.com with SMTP id v18so72211813ljh.6
 for <ltp@lists.linux.it>; Fri, 02 Aug 2019 02:59:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FRhDmYHZIC1Hev3Vv4LwKKKvNdO5WcDiXLTEJa0Wb6Q=;
 b=sCweaeaTVW8lWrRSdDe6gtIoNHUbCA00CgRU18jDshDoVTZPhh6hXCgtbIQ8SYtaWL
 e8OCqeRjPg/ulSTOnW/rbw5nrfzhdTdnRLDoy4vXCGmWC0t+NyDH5L28eehQB+gDxskY
 Ka7Z1AAeHLcQP+yin5PmHQF6o3pP2rM+wddNofkcKSYy7yT9lxIp3mU3JyaFf6OVykge
 xYhswhMkIGkcR6QdishqcV3pj+YjoYQQ2zCFggyp45RVqgTilKuMXnU4tp8GwD3lKOYf
 +2FExSNyL48Rpm+V+LJgw4+H97suIP3NcqizG8uI4qi5zUGk15GSeKT6BaI4s5JaNElf
 Z4ig==
X-Gm-Message-State: APjAAAVY9IdiSHtMJ/kDZzcyL5akXKe1o2IpBl9kZGJd9RvvO+IXdTtx
 Xxe/uiSIGqVbBhmLUZEcjUtm1Pa8bPRnYwomlFpFtQ==
X-Google-Smtp-Source: APXvYqyyK8EgEmz8hF+2gSEiUSnFsdUe/4zdhbsFLQgor8iBA7jBOi8dJU07SXwKtSguTF5nPuH/prS2cMwzOy8x7vA=
X-Received: by 2002:a2e:5b94:: with SMTP id m20mr69692992lje.7.1564739960962; 
 Fri, 02 Aug 2019 02:59:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAEemH2dMW6oh6Bbm=yqUADF+mDhuQgFTTGYftB+xAhqqdYV3Ng@mail.gmail.com>
 <47999e20-ccbe-deda-c960-473db5b56ea0@oracle.com>
 <CAEemH2d=vEfppCbCgVoGdHed2kuY3GWnZGhymYT1rnxjoWNdcQ@mail.gmail.com>
 <a65e748b-7297-8547-c18d-9fb07202d5a0@oracle.com>
 <27a48931-aff6-d001-de78-4f7bef584c32@oracle.com>
In-Reply-To: <27a48931-aff6-d001-de78-4f7bef584c32@oracle.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 2 Aug 2019 17:59:09 +0800
Message-ID: <CAEemH2drL4LKRi52SQMOgVXQJSpztSKp54jRdNTkfWvPCxe34g@mail.gmail.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] 
	=?utf-8?q?=5BMM_Bug=3F=5D_mmap=28=29_triggers_SIGBUS_while?=
	=?utf-8?b?IGRvaW5nIHRoZeKAiyDigItudW1hX21vdmVfcGFnZXMoKSBmb3Igb2Zm?=
	=?utf-8?q?lined_hugepage_in_background?=
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
Cc: xishi.qiuxishi@alibaba-inc.com, mhocko@kernel.org,
 Linux-MM <linux-mm@kvack.org>, Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Mike,

Thanks for working on this.

On Fri, Aug 2, 2019 at 8:20 AM Mike Kravetz <mike.kravetz@oracle.com> wrote:
>
> On 7/30/19 5:44 PM, Mike Kravetz wrote:
> > A SIGBUS is the normal behavior for a hugetlb page fault failure due to
> > lack of huge pages.  Ugly, but that is the design.  I do not believe this
> > test should not be experiencing this due to reservations taken at mmap
> > time.  However, the test is combining faults, soft offline and page
> > migrations, so the there are lots of moving parts.
> >
> > I'll continue to investigate.
>
> There appears to be a race with hugetlb_fault and try_to_unmap_one of
> the migration path.
>
> Can you try this patch in your environment?  I am not sure if it will
> be the final fix, but just wanted to see if it addresses issue for you.

It works for me. After rebuilding the kernel with your patch, SIGBUS
does not appear anymore.

And I'm also thinking that why the huge_pte is not none here when race
with page migration (try_to_unmap_one).

--
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
