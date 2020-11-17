Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F532B5B5F
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Nov 2020 09:55:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7F9FE3C4F26
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Nov 2020 09:55:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 55A553C2F6C
 for <ltp@lists.linux.it>; Tue, 17 Nov 2020 09:55:06 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9E28D200CE7
 for <ltp@lists.linux.it>; Tue, 17 Nov 2020 09:55:05 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CC400AF9F;
 Tue, 17 Nov 2020 08:55:04 +0000 (UTC)
References: <20201116085844.29499-1-rpalethorpe@suse.com>
 <CAEemH2frY_yJhm1sh6YQFH84J6CzTr0z2UzW-Ofz4fnod1O3fA@mail.gmail.com>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2frY_yJhm1sh6YQFH84J6CzTr0z2UzW-Ofz4fnod1O3fA@mail.gmail.com>
Date: Tue, 17 Nov 2020 08:55:04 +0000
Message-ID: <878sb0pdlj.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] madvise06: Do no set swap limit
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Li Wang <liwang@redhat.com> writes:

> Hi Richard,
>
> On Mon, Nov 16, 2020 at 4:59 PM Richard Palethorpe <rpalethorpe@suse.com>
> wrote:
>
>> Setting the swap limit is unnecessary for this test. By default it
>> appears to be set to some large value which is OK. Setting it may fail
>> for reasons unrelated to the test's purpose making the test less
>> reliable.
>>
>
> Generally, this is right. And if the 'memory.limit_in_bytes' has been set
> successfully, that means the default value of 'memory.memsw.limit_in_bytes'
> is bigger than or equal to it.
> (an invalid argument error will occur if not like this)
>
> But in this madvise06, set 'memory.memsw.limit_in_bytes' will safer to test.
>
> The reason is to make sure memsw.limit_in_bytes' is bigger(twifold) than
> 'memory.limit_in_bytes' otherwise it can't be finished as we expected.
> (madvise06 will be stuck when memsw.limit_in_bytes < 2 *
> memory.limit_in_bytes)

OK.

>
>
>>
>> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
>> ---
>>
>> I should not have included this in the first update to the test. It
>> appears that it fails with EACCES on at least one configuration, where
>> the test ran previously. Also it could fail with EBUSY in theory.
>>
>> I don't know why limit_in_bytes can be set, but memsw.limit_in_bytes
>> results in EACCES. This is interesting, however should be the focus of
>> a different test IMO.
>>
>
> This sounds like a cgroup issue or related configuration caused.

Yes, it is probably due to the memsw counter being disabled. So I will
send a V2 of the other madvise06 patch.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
