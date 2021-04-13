Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A45035D82E
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 08:43:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 69BA33C7201
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 08:43:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CABDF3C1C14
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 08:43:01 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2CE6A100117B
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 08:43:00 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 748C5AF0F;
 Tue, 13 Apr 2021 06:43:00 +0000 (UTC)
References: <20210319091837.27319-1-rpalethorpe@suse.com>
 <20210319091837.27319-2-rpalethorpe@suse.com>
 <CAEemH2f1OtzmP+Vh+afVHuZvHNZSq0kwG0HrK79z7THEu1smmQ@mail.gmail.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2f1OtzmP+Vh+afVHuZvHNZSq0kwG0HrK79z7THEu1smmQ@mail.gmail.com>
Date: Tue, 13 Apr 2021 07:42:59 +0100
Message-ID: <87o8ei3css.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/7] fzsync: Add self tests
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

>> +/* The time signatures of threads A and B */
>> +struct race {
>> +       const struct window a;
>> +       const struct window b;
>> +};
>> +
>> +static int c;
>>
>
> Maybe define a volatile 'c' here will be better?

We always access it with the atomic functions so it is not necessary.

>
>
>
>> +
>> +       tst_res(critical > 50 ? TPASS : TFAIL,
>> +               "cs:%-2d ct:%-2d rt:%-2d | =:%-4d -:%-4d +:%-4d",
>> +               a.critical_s, a.critical_t, a.return_t,
>>
>
> A tiny issue on output is, 'a.critical_s' abbreviate to 'cs' which
> has duplicated name with above variable, a bit confused for me
> a while:).
>
> Anyway, the patches look quite good to me.
> Reviewed-by: Li Wang <liwang@redhat.com>

Thanks for the review! I will modify the printed variable name.


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
