Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBA044BF49
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Nov 2021 11:57:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EAF073C1316
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Nov 2021 11:57:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 579E33C091D
 for <ltp@lists.linux.it>; Wed, 10 Nov 2021 11:57:05 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 241F2600658
 for <ltp@lists.linux.it>; Wed, 10 Nov 2021 11:57:04 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 0CF7A1FD6C;
 Wed, 10 Nov 2021 10:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636541824;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A0WdlGixWTyr/zhefGUPWyC1QvkagaZe0QcAcj0sYks=;
 b=EwpU3WZeGM+k3wQt/RJNgfKcAzO5mju8VIRk/reu+BhxkJVtSooiZ7bq4+YlFsiN7i5xsu
 F79rixbL2QFdEJc+90fJFMmOKi1SN0MJ2uEQ7xvl9+uxr1/o9zlPJX6GQ3EjzdEgWpqxCF
 XdJ+Jwy2HmceyG2JTgcJ+MkSTFiRjYo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636541824;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A0WdlGixWTyr/zhefGUPWyC1QvkagaZe0QcAcj0sYks=;
 b=HzpCIBdat4QESHVRsz4o4qUrL3JGBdws9FoloAYu3FUPNyusrDKeXJhrxu7tut/agmHxz1
 6SAhQLGZP8ucFjDA==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id C3997A3B8C;
 Wed, 10 Nov 2021 10:57:03 +0000 (UTC)
References: <20190508084447.18191-1-liwang@redhat.com>
 <20190509071605.GB6096@dhcp-9-109-247-167.in.ibm.com>
 <CAEemH2e=9eRgj_1H50dY_=fEsL3vsZbxexxUceJhW24ebsQ1Kg@mail.gmail.com>
 <20190509091911.GA8751@dhcp-9-109-247-167.in.ibm.com>
 <CAEemH2e6WURWFkMneL6vdEwPpbwxj0Lt=HjpfSYdyzxnhGdODQ@mail.gmail.com>
 <20190514150619.GA4394@rei.lan>
User-agent: mu4e 1.6.9; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Wed, 10 Nov 2021 10:54:51 +0000
In-reply-to: <20190514150619.GA4394@rei.lan>
Message-ID: <878rxwqnwg.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] numa: fix numa test error with
 non-continuous nodes
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Cyril Hrubis <chrubis@suse.cz> writes:

> Hi!
>> > diff --git a/testcases/kernel/numa/numa01.sh
>> > b/testcases/kernel/numa/numa01.sh
>> > index 33393ac8d..47c18edd6 100755
>> > --- a/testcases/kernel/numa/numa01.sh
>> > +++ b/testcases/kernel/numa/numa01.sh
>> > @@ -94,6 +94,7 @@ setup()
>> >  test1()
>> >  {
>> >         Mem_curr=0
>> > +       node_index=0
>> >
>> >         for node in $nodes_list; do
>> >                 numactl --cpunodebind=$node --membind=$node support_numa
>> > alloc_1MB &
>> > @@ -101,7 +102,8 @@ test1()
>> >
>> >                 TST_RETRY_FUNC "check_for_support_numa $pid" 0
>> >
>> > -               Mem_curr=$(echo "$(extract_numastat_p $pid $node) * $MB"
>> > |bc)
>> > +               Mem_curr=$(echo "$(extract_numastat_p $pid $node_index) *
>> > $MB" |bc)
>> > +               let node_index++
>> >
>> 
>> I guess it can be work, but the disadvantage of that is we have to involve
>> a new variable(node_index) in each of the tests (from test1 to test10).
>> Hence I don't think it is much better than my patch. For which way to go,
>> I'd leave this to Cyril to make a choice. Or, maybe he has different
>> thoughts on this:).
>
> I actually do not care that much about the numa01.sh tests, because
> these are broken in more ways than this and were never correct to begin
> with.
>
> I've started to rewrite these into proper tests, the set_mempolicy() was
> first part of that effort, the mbind() tests are continuation of that
> and the end goal is to get rid of these broken tests eventually.

We have quite a few mbind and set_mempolicy tests now. So should we
delete this test?

>
> -- 
> Cyril Hrubis
> chrubis@suse.cz


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
