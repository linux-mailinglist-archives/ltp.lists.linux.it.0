Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BF637291E
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 12:34:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D4AC83C582E
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 12:34:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 28A933C2660
 for <ltp@lists.linux.it>; Tue,  4 May 2021 12:34:12 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8BB10600950
 for <ltp@lists.linux.it>; Tue,  4 May 2021 12:34:11 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 81DE29FBF6;
 Tue,  4 May 2021 10:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1620124449; bh=vU/nPfv5cozMfrq0IO+42Zq1Nt2BsvUI4+5loyrPm/4=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=U8uJLaLphrTHkYECYDcho+YHar59oU9n1WUS2QjsziaQqNhyf4rowDBfTDwyL7vPY
 R4kz/56TteT51g2WYSbuiouCck4DH1q4luPXVSYKh55gA3lUw1jyTKzBgnvGPBbcM8
 OYWx7c7M4s/06TH7RHUYUO8yz7ER415ZfpLeogSg=
To: Petr Vorel <pvorel@suse.cz>
References: <f781c0d8-6707-56ba-fa14-e0dbc1b645a1@jv-coder.de>
 <YJDvIcgdl8ae58YB@pevik> <5fdefbf3-2b4e-f44b-6cb2-c133ecf36975@jv-coder.de>
 <YJEKFLmcKvnHvlIV@pevik>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <651cb158-c640-e0b5-a2f2-4b77efcfa288@jv-coder.de>
Date: Tue, 4 May 2021 12:35:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YJEKFLmcKvnHvlIV@pevik>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [RFC] Shell API timeout sleep orphan processes
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
Cc: LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-2"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

>>>> The only way to fix this really portable I can think of is moving the
>>>> timeout code (including the logic in _tst_kill_test) into c code. This=
 way
>>>> there would only be one binary, that can be killed flawlessly.
>>> Maybe set -m would be enough. But sure, rewriting C is usually the best=
 approach
>>> for shell problems, we use quite a lot of C helpers for shell already.
>> I will send the patch, if this introduces any new issues, we can still
>> switch to a c based implementation.
> Thank you!

I guess I will not submit the fix with set -m...
My colleague working testing on a new target just ran into a problem =

with out fix using set -m.
For busybox sh, it only works, if a tty is allocated, otherwise it =

refuses to enable job monitor mode and the whole construct fails...

Since using the monitor mode only exploits the side effect, that it =

creates a process group and we already found a first issue, I think the =

only solution is switching to a c-based solution for the timeout stuff.
Personally I like that it is written in shell script, but I see no other =

option to do it in pure shell. There is no builtin way, to create a =

process group and just redirecting the output of sleep to null does not =

seem to be a very good solution to me, because there would still be a =

lot of orphans around.

J=F6rg

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
