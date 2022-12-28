Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C452865756B
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Dec 2022 11:44:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A290F3CB7E7
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Dec 2022 11:44:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B43933CB366
 for <ltp@lists.linux.it>; Wed, 28 Dec 2022 11:44:18 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0247F1A007AA
 for <ltp@lists.linux.it>; Wed, 28 Dec 2022 11:44:17 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 107815FD6E;
 Wed, 28 Dec 2022 10:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672224256;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DuXZGzxNe6L8fUgYnrUIpa7/2zPwndqVqFFjVmwyVEw=;
 b=rLHwnvpzKfhrBuYng6iWNZVlJ8YvfDruan3Z7/otRsFVCevOZ5zU9WOmWn6iFuqHc2ZroG
 1v5fEPJmAqx62aIW1ZLMs9bRgh7RHKjzeKhC8Bp/w4/m6J4zjo4/95avNLzMB08yC9qsOi
 B5DHJFqbaKZBeUCHsnoG3V1iH5BsRT0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672224256;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DuXZGzxNe6L8fUgYnrUIpa7/2zPwndqVqFFjVmwyVEw=;
 b=kjX2WC2Tp9Be2wJwqVUyziza1sOgIbPyO6ek6gRucMVPybwmfrWr+iGJvjPIvmu1d781LZ
 siCocl6Drk7DHpCA==
Received: from g78 (unknown [10.163.28.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id CB6D52C1A7;
 Wed, 28 Dec 2022 10:44:15 +0000 (UTC)
References: <20221220054549.1757270-1-liwang@redhat.com>
 <Y6HD05Aa9WmWyUhl@yuki>
 <CAEemH2eCfzyTggCu9F0BEanen2aN=zzaB9f3WwMZB+3JDJMypw@mail.gmail.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
Date: Wed, 28 Dec 2022 10:21:38 +0000
Organization: Linux Private Site
In-reply-to: <CAEemH2eCfzyTggCu9F0BEanen2aN=zzaB9f3WwMZB+3JDJMypw@mail.gmail.com>
Message-ID: <87pmc3st8g.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] set_mempolicy01: cancel the limit of maximum
 runtime
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

> On Tue, Dec 20, 2022 at 10:15 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
>> Hi!
>> > It needs more time for running on multiple numa nodes system.
>> > Here propose to cancel the limit of max_runtime.
>> >
>> >   ========= test log on 16 nodes system =========
>> >   ...
>> >   set_mempolicy01.c:80: TPASS: child: Node 15 allocated 16
>> >   tst_numa.c:25: TINFO: Node 0 allocated 0 pages
>> >   tst_numa.c:25: TINFO: Node 1 allocated 0 pages
>> >   tst_numa.c:25: TINFO: Node 2 allocated 0 pages
>> >   tst_numa.c:25: TINFO: Node 3 allocated 0 pages
>> >   tst_numa.c:25: TINFO: Node 4 allocated 0 pages
>> >   tst_numa.c:25: TINFO: Node 5 allocated 0 pages
>> >   tst_numa.c:25: TINFO: Node 6 allocated 0 pages
>> >   tst_numa.c:25: TINFO: Node 7 allocated 0 pages
>> >   tst_numa.c:25: TINFO: Node 8 allocated 0 pages
>> >   tst_numa.c:25: TINFO: Node 9 allocated 0 pages
>> >   tst_numa.c:25: TINFO: Node 10 allocated 0 pages
>> >   tst_numa.c:25: TINFO: Node 11 allocated 0 pages
>> >   tst_numa.c:25: TINFO: Node 12 allocated 0 pages
>> >   tst_numa.c:25: TINFO: Node 13 allocated 0 pages
>> >   tst_numa.c:25: TINFO: Node 14 allocated 0 pages
>> >   tst_numa.c:25: TINFO: Node 15 allocated 16 pages
>> >   set_mempolicy01.c:80: TPASS: parent: Node 15 allocated 16
>> >
>> >   Summary:
>> >   passed   393210
>> >   failed   0
>> >   broken   0
>> >   skipped  0
>> >   warnings 0
>> >
>> >   real        6m15.147s
>> >   user        0m33.641s
>> >   sys 0m44.553s
>>
>> Can't we just set the default to 30 minutes or something large enough?
>>
>
> Yes, I thought about a fixed larger value before, but seems the test
> time go increased extremely faster when the test matrix doubled.
>
> I don't have a system with more than 32 nodes to check if 30mins
> enough, so I guess probably canceling the limitation like what we
> did for oom tests would make sense, that timeout value depends
> on real system configurations.

IMO, this is what the timeout multiplier is for. So if you have a
computer with 512 CPUs or a tiny embedded device, you can adjust the
timeouts upwards.

The default timeouts are for workstations, commodity servers and
VMs. Although I suppose as this is a NUMA test the average machine will
be bigger, but 32 nodes on a physical machine would be 128-512 CPUs?

>
>
> -- 
> Regards,
> Li Wang


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
