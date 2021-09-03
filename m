Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE773FFB91
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 10:10:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2C3943C28F4
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 10:10:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1CCA03C2849
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 10:10:12 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A73D81000150
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 10:10:11 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id ABD2D9F66D;
 Fri,  3 Sep 2021 08:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1630656609; bh=vZ2ws933VnRI40ailLynlC/IT1Et83Ku/AUEKmnCOzs=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=bDPiKhyzGHiy1yY4lOqkt8DB0azf9CSDHYaplouSrNoQ0mDl4X7daWOlwwbEB153i
 TPd4OMbCeu0E9PCYEoAjFReeNFR6ZqJ6Vu7BMkiVOtlLlXpbOAfZEjIUFiB+eBdz9A
 f4l8WtWtLGWl/lsh5393Wa0Pfjx5dmAoWX6fwDiA=
To: Petr Vorel <pvorel@suse.cz>
References: <20210902103740.19446-1-pvorel@suse.cz>
 <015140e9-0eba-4057-4a91-35d958af2bb8@jv-coder.de> <YTDpQxDDPY3HCli6@pevik>
 <16028467-ecd5-ecc0-26d7-b7a617045970@jv-coder.de> <YTHSO4IQ+Qn1Fo8l@pevik>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <73036de1-6a17-36c2-4ce0-663d1bd6a267@jv-coder.de>
Date: Fri, 3 Sep 2021 10:10:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YTHSO4IQ+Qn1Fo8l@pevik>
Content-Language: en-US
X-Spam-Status: No, score=-0.8 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 0/4] checkbashisms.pl in make check + fixed docs
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-2"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

On 9/3/2021 9:43 AM, Petr Vorel wrote:
>
>>>> $ checkbashisms testcases/kernel/connectors/pec/cn_pec.sh
>>>> possible bashism in testcases/kernel/connectors/pec/cn_pec.sh line 127
>>>> (should be >word 2>&1):
>>>>   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 done <&${fd_act}
>>>> This one is just a false positive and I have no clue how to prevent th=
is.
>>>> I think the script does not like the <&, but this is posix...
>>> The same here, I'm not sure if it's POSIX. &> definitely is not POSIX.
>>> I remember we were talking about it. Can we avoid it somehow?
>> <&n is the only way to use the file handle n for input. <n would use the
>> file n.
>> See: https://pubs.opengroup.org/onlinepubs/009604499/utilities/xcu_chap0=
2.html#tag_02_07_05
>> checkbashisms has no problems if n is a number, not a variable. There is
>> nothing in the standard about n being a variable, but I guess this shoul=
d be
>> posix as well.
>> Furthermore the suggested fix "(should be >word 2>&1)" clearly shows, th=
at
>> checkbashisms thinks, this is &>.
> Agree, it's very likely checkbashims bug which should be fixed.
>
>> I don't see another way to implement this (but using an implementation in
>> c). And I am not really happy to bend my code around bugs in a tool, tha=
t is
>> supposed to ensure better code.
> +1
>> I'd rather try to fix checkbashims in this case. Even the ((-case should=
 be
>> fixed, after checking if it is posix. The suggestion (replace with "$((")
>> indicates at least a bug in the tool.
> I'll try to search for $(( )) in POSIX docs.
>
> What is the outcome? Should I first fix checkbashisms before merging thes=
e?
> I suggest to merge it for local checking (similar to checkpatch.pl for C).
> Because it cannot be used in CI right now, not even because these 2 false
> positives, but because not everything has been converted to use new shell=
 API.
I am not sure what the best way is here. I am not against integrating =

it, even with the bugs,
just against being "religious" about fixing "bugs" found by it. Of =

course that means, no way,
to enable it for ci, at least not without enforcement... But it allows =

developers, to quickly run it.


>> To be honest, I am a bit disappointed from this tool. It doesn't seem to=
 be
>> tested very well... Probably barely good enough for scripting in the ker=
nel.
> This tool comes from Debian, written long time ago (2009) for release goa=
l to
> use dash as /bin/sh [1] [2]. Kernel developers usually don't care about P=
OSIX
> shell and happily use /bin/bash with all arrays and other crazy bashisms.
Yeah I mixed up checkbashisms and checkpatch... That's why I pulled =

linux into this :)
> There is tool shellcheck, which IMHO has a lot of false positives (I supp=
ose
> Cyril agrees with it, as he added checkbashisms to our docs long time ago=
) and
> we both aren't happy about occasional patches which are based on it's out=
put.
> See full output below for comparison. E.g. in "In POSIX sh, 'local' is un=
defined" is
> useless, if we decide to trust local, at least for "local msg" i.e. witho=
ut
> assignment. Or other not useful for us:
> SC2166: Prefer [ p ] && [ q ] as [ p -a q ] is not well defined.
>
> Not sure about: TST_ARGS=3D"$@":
> SC2124: Assigning an array to a string! Assign as array, or use * instead=
 of @ to concatenate.
>
> The only good thing about shellcheck is that it has full shell parser [3],
> unlike checkbashisms.

Actually scrolling over the results, there are a lot of valid =

complaints, e.g. missing quotes.
At least there are no false-positives (as per definition of spellcheck), =

as far as I see.
Would it be possible to tailor it for ltp?

Joerg

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
