Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C92C7EACA
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 05:49:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AD1FD3C1DFB
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 05:49:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id B52CD3C1DC8
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 05:49:34 +0200 (CEST)
Received: from tyo161.gate.nec.co.jp (tyo161.gate.nec.co.jp [114.179.232.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0E72B604832
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 05:49:30 +0200 (CEST)
Received: from mailgate02.nec.co.jp ([114.179.233.122])
 by tyo161.gate.nec.co.jp (8.15.1/8.15.1) with ESMTPS id x723nHRd021476
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 2 Aug 2019 12:49:17 +0900
Received: from mailsv01.nec.co.jp (mailgate-v.nec.co.jp [10.204.236.94])
 by mailgate02.nec.co.jp (8.15.1/8.15.1) with ESMTP id x723nHF8020504;
 Fri, 2 Aug 2019 12:49:17 +0900
Received: from mail03.kamome.nec.co.jp (mail03.kamome.nec.co.jp [10.25.43.7])
 by mailsv01.nec.co.jp (8.15.1/8.15.1) with ESMTP id x723nHQm016586; 
 Fri, 2 Aug 2019 12:49:17 +0900
Received: from bpxc99gp.gisp.nec.co.jp ([10.38.151.147] [10.38.151.147]) by
 mail02.kamome.nec.co.jp with ESMTP id BT-MMP-7341281;
 Fri, 2 Aug 2019 12:48:27 +0900
Received: from BPXM23GP.gisp.nec.co.jp ([10.38.151.215]) by
 BPXC19GP.gisp.nec.co.jp ([10.38.151.147]) with mapi id 14.03.0439.000; Fri, 2
 Aug 2019 12:48:26 +0900
From: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
To: Li Wang <liwang@redhat.com>
Thread-Topic: =?utf-8?B?W01NIEJ1Zz9dIG1tYXAoKSB0cmlnZ2VycyBTSUdCVVMgd2hpbGUgZG9pbmcg?=
 =?utf-8?B?dGhl4oCLIOKAi251bWFfbW92ZV9wYWdlcygpIGZvciBvZmZsaW5lZCBodWdl?=
 =?utf-8?Q?page_in_background?=
Thread-Index: AQHVRc0JEN0QZXp8lkC2QA8h/0i/bKbmp8yA
Date: Fri, 2 Aug 2019 03:48:26 +0000
Message-ID: <20190802034825.GA20130@hori.linux.bs1.fc.nec.co.jp>
References: <CAEemH2dMW6oh6Bbm=yqUADF+mDhuQgFTTGYftB+xAhqqdYV3Ng@mail.gmail.com>
In-Reply-To: <CAEemH2dMW6oh6Bbm=yqUADF+mDhuQgFTTGYftB+xAhqqdYV3Ng@mail.gmail.com>
Accept-Language: en-US, ja-JP
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.34.125.150]
Content-ID: <2CC86BE40AAF934886BEF4A53FDE2B6F@gisp.nec.co.jp>
MIME-Version: 1.0
X-TM-AS-MML: disable
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=5BMM_Bug=3F=5D_mmap=28=29_triggers_SIGBUS_while?=
 =?utf-8?b?IGRvaW5nIHRoZeKAiyDigItudW1hX21vdmVfcGFnZXMoKSBmb3Igb2ZmbGlu?=
 =?utf-8?q?ed_hugepage_in_background?=
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
Cc: "xishi.qiuxishi@alibaba-inc.com" <xishi.qiuxishi@alibaba-inc.com>,
 "mhocko@kernel.org" <mhocko@kernel.org>, Linux-MM <linux-mm@kvack.org>,
 LTP List <ltp@lists.linux.it>,
 "mike.kravetz@oracle.com" <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Jul 29, 2019 at 01:17:27PM +0800, Li Wang wrote:
> Hi Naoya and Linux-MMers,
> 
> The LTP/move_page12 V2 triggers SIGBUS in the kernel-v5.2.3 testing.
> https://github.com/wangli5665/ltp/blob/master/testcases/kernel/syscalls/
> move_pages/move_pages12.c
> 
> It seems like the retry mmap() triggers SIGBUS while doing the numa_move_pages
> () in background. That is very similar to the kernel bug which was mentioned by
> commit 6bc9b56433b76e40d(mm: fix race on soft-offlining ): A race condition
> between soft offline and hugetlb_fault which causes unexpected process SIGBUS
> killing.
> 
> I'm not sure if that below patch is making sene to memory-failures.c, but after
> building a new kernel-5.2.3 with this change, the problem can NOT be reproduced
> . 
> 
> Any comments?
> 
> ----------------------------------
> --- a/mm/memory-failure.c
> +++ b/mm/memory-failure.c
> @@ -1695,15 +1695,16 @@ static int soft_offline_huge_page(struct page *page,
> int flags)
>         unlock_page(hpage);
> 
>         ret = isolate_huge_page(hpage, &pagelist);
> +       if (!ret) {
> +               pr_info("soft offline: %#lx hugepage failed to isolate\n",
> pfn);
> +               return -EBUSY;
> +       }
> +
>         /*
>          * get_any_page() and isolate_huge_page() takes a refcount each,
>          * so need to drop one here.
>          */
>         put_hwpoison_page(hpage);
> -       if (!ret) {
> -               pr_info("soft offline: %#lx hugepage failed to isolate\n",
> pfn);
> -               return -EBUSY;
> -       }

Sorry for my late response.

This change skips put_hwpoison_page() in failure path, so soft_offline_page()
should return without releasing hpage's refcount taken by get_any_page(),
maybe which is not what we want.

- Naoya

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
