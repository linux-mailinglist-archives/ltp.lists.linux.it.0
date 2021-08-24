Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C38353F5E30
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 14:46:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B4C043C31FA
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 14:46:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DC0B73C3189
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 14:46:32 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 099106005CC
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 14:46:31 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 621F01FD8B;
 Tue, 24 Aug 2021 12:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629809191;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z5nOhePZn8kiSO6TcmVfZzxNvKAJ+MAuUSXcA2Q0vH4=;
 b=dePeHnnwXoROrIam/Es9LTEPMFku8bX3na1LOrRb2tgYtSnVkqrAMISCElCEJvDk8c6AkN
 5Dz3bAlmqjcGdGwc/2Co0TOP7J4Pf15EpfY4yGG4vue08Jfwpz+RJnBuxO8A6NchxTyfDj
 4M3OoTOf+aEx6E4hdMTRKFffIpezowQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629809191;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z5nOhePZn8kiSO6TcmVfZzxNvKAJ+MAuUSXcA2Q0vH4=;
 b=0U+gE75Fec3xf9/jcKzocTwWzSgnd0+L3gPeRxT4jnyX/R0Z4Ia7jiZVpuxHbBw5x8oNzD
 vlqff/uRQcCdNrBA==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 22EE4A3B81;
 Tue, 24 Aug 2021 12:46:31 +0000 (UTC)
References: <20210823150520.25614-1-chrubis@suse.cz>
 <20210823150520.25614-2-chrubis@suse.cz>
 <CAEemH2dYcF=N3F=MZXPVLgBHBa3Xt=iT8ACeQ4_9THXu-kyYtA@mail.gmail.com>
 <YSSyVtSF6UmqYlu4@yuki>
 <CAEemH2dpz577XH6q2fEw7uHYOvOORs8NLT_CroRvOnoAK2jQnw@mail.gmail.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2dpz577XH6q2fEw7uHYOvOORs8NLT_CroRvOnoAK2jQnw@mail.gmail.com>
Date: Tue, 24 Aug 2021 13:46:25 +0100
Message-ID: <87mtp7ko2m.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] tst_test_macros: Fix TST_EXP_*() default
 message
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

Li Wang <liwang@redhat.com> writes:

> On Tue, Aug 24, 2021 at 4:48 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
>> Hi!
>> > Patchset looks good from the code layer though it is a bit complicate
>> > in 2/3 stringify handling, but that should be acceptable.
>> >
>> > My only hesitating is about ##__VA_ARGS__, because it says that is still
>> > as GNU's extension but have not got into standard C.
>>
>> Note that we have been using it in the header from the start. There were
>> just a few places where it was missing, mostly in the variants that have
>> been added later.
>>
>
> Ah great, I was neglect that point.  Hence it should be safe enough.
>
> -- 
> Regards,
> Li Wang

There is also __VA_OPT__(,) which can't be confused with concatenation.

I'm not sure we should use it thought, it seems like it was only
recently added to other compilers. Still might be a good idea to link to
the following page somewhere:

https://gcc.gnu.org/onlinedocs/cpp/Variadic-Macros.html#Variadic-Macros

LGTM otherwise!

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
