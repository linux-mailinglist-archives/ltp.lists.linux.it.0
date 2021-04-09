Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B8A3599D1
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Apr 2021 11:50:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DA5E73C735F
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Apr 2021 11:50:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A3C583C1D8A
 for <ltp@lists.linux.it>; Fri,  9 Apr 2021 11:50:47 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4C1F760032E
 for <ltp@lists.linux.it>; Fri,  9 Apr 2021 11:50:46 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 784DFAFF2;
 Fri,  9 Apr 2021 09:50:46 +0000 (UTC)
References: <20210319091837.27319-1-rpalethorpe@suse.com>
 <20210319091837.27319-8-rpalethorpe@suse.com>
 <CAEemH2dgC4qTYMTXfvf7vKXJKG539BgvhM1-V4u0q8JDvmeKXA@mail.gmail.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2dgC4qTYMTXfvf7vKXJKG539BgvhM1-V4u0q8JDvmeKXA@mail.gmail.com>
Date: Fri, 09 Apr 2021 10:50:45 +0100
Message-ID: <87tuof3hxm.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 7/7] fzsync: Check processor affinity
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

Hello Li,

Li Wang <liwang@redhat.com> writes:

>  static void tst_fzsync_pair_init(struct tst_fzsync_pair *pair)
>>  {
>> +       long ncpus = tst_ncpus_available();
>> +
>>         CHK(avg_alpha, 0, 1, 0.25);
>>         CHK(min_samples, 20, INT_MAX, 1024);
>>         CHK(max_dev_ratio, 0, 1, 0.1);
>>         CHK(exec_time_p, 0, 1, 0.5);
>>         CHK(exec_loops, 20, INT_MAX, 3000000);
>> -       CHK(yield_in_wait, 0, 1, (tst_ncpus() <= 1));
>> +
>> +       if (ncpus <= 1)
>> +               pair->yield_in_wait = 1;
>>
>
> I'm wondering here why not using the CHK macro as before but additionally
> involved a variable 'ncpus'.
>
> Isn't that CHK(yield_in_wait, 0, 1, (tst_ncpus_available() <= 1)) better?

The macro generates compiler warnings because yield_in_wait is bool and
so it is always inside the valid range unless (ncpus <= 1).

However I should remove the useless variable.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
