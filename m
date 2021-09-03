Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD033FF97B
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 06:29:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 857A63C2EE5
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 06:29:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B3C983C1C62
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 06:28:44 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9BD91200FEE
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 06:28:43 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 471469F66D;
 Fri,  3 Sep 2021 04:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1630643322; bh=XialmQJkfA0sI1/e6gTulLJ6WP7dRXUyvnSzlSJ22uU=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=ZWr6xK4o4gLI2ybi/ZyFJKX0OCkh/BkqdyLJSbgXwSeO5Acfj3jBCJ+zZ6gpSg7Ko
 R6Lx+SGUyZUBrXk4g2GaNkPROeoi8Oc4DWQT5ntvtGxuJoSE49M4oop2D68lpABBHA
 qUGrPxoWTOPzZkRkGv1fIEgeboZ0mdfO1DM7iDAA=
To: Petr Vorel <pvorel@suse.cz>
References: <20210902103740.19446-1-pvorel@suse.cz>
 <015140e9-0eba-4057-4a91-35d958af2bb8@jv-coder.de> <YTDpQxDDPY3HCli6@pevik>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <16028467-ecd5-ecc0-26d7-b7a617045970@jv-coder.de>
Date: Fri, 3 Sep 2021 06:28:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YTDpQxDDPY3HCli6@pevik>
Content-Language: en-US
X-Spam-Status: No, score=-2.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
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

H Petr,

On 9/2/2021 5:09 PM, Petr Vorel wrote:
>
>> $ checkbashisms testcases/kernel/connectors/pec/cn_pec.sh
>> possible bashism in testcases/kernel/connectors/pec/cn_pec.sh line 127
>> (should be >word 2>&1):
>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 done <&${fd_act}
>> This one is just a false positive and I have no clue how to prevent this.
>> I think the script does not like the <&, but this is posix...
> The same here, I'm not sure if it's POSIX. &> definitely is not POSIX.
> I remember we were talking about it. Can we avoid it somehow?
<&n is the only way to use the file handle n for input. <n would use the =

file n.
See: =

https://pubs.opengroup.org/onlinepubs/009604499/utilities/xcu_chap02.html#t=
ag_02_07_05

checkbashisms has no problems if n is a number, not a variable. There is =

nothing in the standard about n being a variable, but I guess this =

should be posix as well.
Furthermore the suggested fix "(should be >word 2>&1)" clearly shows, =

that checkbashisms thinks, this is &>.

I don't see another way to implement this (but using an implementation =

in c). And I am not really happy to bend my code around bugs in a tool, =

that is supposed to ensure better code.
I'd rather try to fix checkbashims in this case. Even the ((-case should =

be fixed, after checking if it is posix. The suggestion (replace with =

"$((") indicates at least a bug in the tool.
To be honest, I am a bit disappointed from this tool. It doesn't seem to =

be tested very well... Probably barely good enough for scripting in the =

kernel.

Joerg

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
