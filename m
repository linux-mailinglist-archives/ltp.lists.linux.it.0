Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2691F924E
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jun 2020 10:55:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 56C4F3C2D56
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jun 2020 10:55:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 880153C2D42
 for <ltp@lists.linux.it>; Mon, 15 Jun 2020 10:55:22 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1812A102C82E
 for <ltp@lists.linux.it>; Mon, 15 Jun 2020 10:55:21 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F21FAAF6D;
 Mon, 15 Jun 2020 08:55:23 +0000 (UTC)
References: <20200610072928.1331-1-rpalethorpe@suse.com>
 <CAEemH2fyJKyKwKzF4W35tM_sjbYQAf-Gx7-Vrhv6r+QdLE8+Bw@mail.gmail.com>
User-agent: mu4e 1.4.8; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2fyJKyKwKzF4W35tM_sjbYQAf-Gx7-Vrhv6r+QdLE8+Bw@mail.gmail.com>
Date: Mon, 15 Jun 2020 09:55:14 +0100
Message-ID: <87r1ugwvwt.fsf@our.domain.is.not.set>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] Wrapper for Syzkaller reproducers
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
Cc: Pter Vorel <pvorel@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Li,

Li Wang <liwang@redhat.com> writes:

> On Wed, Jun 10, 2020 at 3:29 PM Richard Palethorpe <rpalethorpe@suse.com>
> wrote:
>
>> Allows one to run the Syzkaller reproducers as part of the LTP.
>>
>> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
>> Reviewed-by: Pter Vorel <pvorel@suse.com>
>>
> Reviewed-by: Li Wang <liwang@redhat.com>

Thanks!

>
> +
>> +static void setup(void)
>> +{
>> +       tst_taint_init(TST_TAINT_W | TST_TAINT_D | TST_TAINT_L);
>>
>
> My only concern is that the limitation is too strict for syzkaller.
>
> Because if one of the tests (near the top of the name rankings)
> trigger a WARNING in SUT kernel, the syzwrap.c will be
> skipping all remaining test cases.
>
> Maybe we can just use 'TST_TAINT_D' here, and I wish to
> hear more opinions from others.
>
> -- 
> Regards,
> Li Wang

You should restart/reset the SUT if the kernel is tainted. Please see
the README section on test runner requirements.

It might even be best to panic on warn instead of relying on syzwrap or
the test runner detecting the taint.

So far I have found enough warnings are caused by bugs that you can't
reliably continue testing afterwards.

OTOH the LTP library should maybe provide some args to override taints,
but that is not specific to syzwrap.
-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
