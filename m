Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E54A6388A44
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 11:11:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 50EE73C3200
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 11:11:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7CFC73C1A9C
 for <ltp@lists.linux.it>; Wed, 19 May 2021 11:11:06 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DDA62600631
 for <ltp@lists.linux.it>; Wed, 19 May 2021 11:11:05 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 09DC5AECB
 for <ltp@lists.linux.it>; Wed, 19 May 2021 09:11:05 +0000 (UTC)
References: <20210517163029.22974-1-rpalethorpe@suse.com>
 <20210517163029.22974-7-rpalethorpe@suse.com> <YKN4SZcHP9GAGRH4@pevik>
 <87im3gl5yx.fsf@suse.de> <YKPVwoRiJKLqneN3@pevik>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <YKPVwoRiJKLqneN3@pevik>
Date: Wed, 19 May 2021 10:11:04 +0100
Message-ID: <87cztnks0n.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 6/6] API: Check exported symbols
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

Petr Vorel <pvorel@suse.cz> writes:

> Hi Richie,
>
>> Hello Petr,
>
>> Petr Vorel <pvorel@suse.cz> writes:
>
>> > Hi Richie,
>
>> >> Abort the build process if a new symbol is exported from the library
>> >> without tst_ or safe_ prepended.
>
>> > The PR does not work few on old toolchains [1], it fails on [2]:
>
>> > awk: line 1: regular expression /parse_opts ... exceeds implementation size limit
>
>> > It's one of the 2 awk calls in check_export_syms.sh, I suppose the other one.
>> > Maybe put non_prefix_syms into temporary file and then run awk on it?
>
>> I doubt it will help, it seems the ignore regex is too long. I'm not
>> sure we need the script to run on old toolchains though.
>
>> Maybe we need a development mode configure flag?
>
> I'll have a look into it, as I'd prefer to be fixed
> (than repeat people on mailing list that this does not work on older distros).
> It's actually only on Debian stable or older.

OK, I guess you can just shorten the regex by substituing "[lL]io_\w+"
for all the lio stuff. Or filter by file instead.

>
> Kind regards,
> Petr
>
>> > Kind regards,
>> > Petr
>
>> > [1] https://travis-ci.org/github/pevik/ltp/builds/771465129
>> > [2] https://travis-ci.org/github/pevik/ltp/jobs/771465135#L3115


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
