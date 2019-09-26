Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE3FBEFB9
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 12:35:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9BFF13C22D7
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 12:35:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 186A53C24D4
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 12:34:01 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C885320129E
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 11:50:41 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 18D4AAD4E;
 Thu, 26 Sep 2019 09:50:40 +0000 (UTC)
References: <20190808054513.31041-1-liwang@redhat.com>
 <87a7arxznf.fsf@rpws.prws.suse.cz>
 <CAEemH2d=KXmeGs+LVjUph2sgxVhkhVC3sAReyDuLkFNpqd64UQ@mail.gmail.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2d=KXmeGs+LVjUph2sgxVhkhVC3sAReyDuLkFNpqd64UQ@mail.gmail.com>
Date: Thu, 26 Sep 2019 11:50:40 +0200
Message-ID: <877e5vxu6n.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] move_pages12: handle errno EBUSY for
 madvise(..., MADV_SOFT_OFFLINE)
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
Reply-To: rpalethorpe@suse.de
Cc: Michal Hocko <mhocko@suse.cz>, Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>,
 LTP List <ltp@lists.linux.it>, Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Li Wang <liwang@redhat.com> writes:

>
> Can you help to check if these commits have been backported to SLEL
> kernel-5.12?
>     commit e66f17ff71772b209eed39de35aaa99ba819c93d
>     commit c9d398fa237882ea07167e23bcfc5e6847066518
>     commit 4643d67e8cb0b3536ef0ab5cddd1cedc73fa14ad

The final one has not been backported yet, but I don't think we are
hitting that bug (there is a high chance I am wrong ofcourse). Thanks.

>
> The move_pages12 test actually found three regression BUG which has all
> been fixed in the mainline kernel so far.

It is a good test!

>
>
>> TBH I'm not sure what we are testing when checking the return value of
>> MADV_SOFT_OFFLINE? The bug is not reproduced if madvise always fails, so
>> the test should pass right?
>>
>
> The return value checking of MADV_SOFT_OFFLINE are two:
>     EINVAL - To make sure system support MADV_SOFT_OFFLINE
>     EBUSY -  To make ignore the defect(EBUSY when soft-offlining hugepage)
> designed by the kernel
>
> The madvise(MADV_SOFT_OFFLINE) should not always fail, it might get failure
> occasionally on EBUSY(ignored already), but exit with TCONF if hit EINVAL.
>
> @MIke & @Naoyo, If I was wrong please correct me.



-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
