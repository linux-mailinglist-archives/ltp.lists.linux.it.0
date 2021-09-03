Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B38F3FFC5B
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 10:53:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D5D753C30F4
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 10:53:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 010A93C3006
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 10:53:37 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 53069140126B
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 10:53:35 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 649EB20391;
 Fri,  3 Sep 2021 08:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630659215;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tRGebNZZriPOfQ5BfUBGlOFe71eX1yoJF6RxumeDNdg=;
 b=T/cFnyIb20wFtPiniZjzkHyjcz4y4hqR60y9obCGyqwH2PRN7SyPx3e05UPqBbkYTNGpxX
 QKs1H9hDHvFd+2jgEM2++VE+2UudXJmIp5woJ6aSEAPk3wI89/zD8XDAi2HpE45WU3ZHlG
 fcOYDpkOzW+T9bfZm1ktA7FMbxwlgtk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630659215;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tRGebNZZriPOfQ5BfUBGlOFe71eX1yoJF6RxumeDNdg=;
 b=aF7z1oTG+FLm55MAcTEbEa2dYubAFGtNtfk+f5OTXYKLE0vu534vzml6buJ3OOo5oK+dnv
 HzZn+vcI35E8eqDg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 32A821374A;
 Fri,  3 Sep 2021 08:53:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id zwDjCo/iMWFAdQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Fri, 03 Sep 2021 08:53:35 +0000
Date: Fri, 3 Sep 2021 10:53:33 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YTHijSezRFjCP/C+@pevik>
References: <20210902103740.19446-1-pvorel@suse.cz>
 <015140e9-0eba-4057-4a91-35d958af2bb8@jv-coder.de>
 <YTDpQxDDPY3HCli6@pevik>
 <16028467-ecd5-ecc0-26d7-b7a617045970@jv-coder.de>
 <YTHSO4IQ+Qn1Fo8l@pevik>
 <73036de1-6a17-36c2-4ce0-663d1bd6a267@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <73036de1-6a17-36c2-4ce0-663d1bd6a267@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

> Hi Petr,

> On 9/3/2021 9:43 AM, Petr Vorel wrote:

> > > > > $ checkbashisms testcases/kernel/connectors/pec/cn_pec.sh
> > > > > possible bashism in testcases/kernel/connectors/pec/cn_pec.sh lin=
e 127
> > > > > (should be >word 2>&1):
> > > > >   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 done <&${fd_act}
> > > > > This one is just a false positive and I have no clue how to preve=
nt this.
> > > > > I think the script does not like the <&, but this is posix...
> > > > The same here, I'm not sure if it's POSIX. &> definitely is not POS=
IX.
> > > > I remember we were talking about it. Can we avoid it somehow?
> > > <&n is the only way to use the file handle n for input. <n would use =
the
> > > file n.
> > > See: https://pubs.opengroup.org/onlinepubs/009604499/utilities/xcu_ch=
ap02.html#tag_02_07_05
> > > checkbashisms has no problems if n is a number, not a variable. There=
 is
> > > nothing in the standard about n being a variable, but I guess this sh=
ould be
> > > posix as well.
> > > Furthermore the suggested fix "(should be >word 2>&1)" clearly shows,=
 that
> > > checkbashisms thinks, this is &>.
> > Agree, it's very likely checkbashims bug which should be fixed.

> > > I don't see another way to implement this (but using an implementatio=
n in
> > > c). And I am not really happy to bend my code around bugs in a tool, =
that is
> > > supposed to ensure better code.
> > +1
> > > I'd rather try to fix checkbashims in this case. Even the ((-case sho=
uld be
> > > fixed, after checking if it is posix. The suggestion (replace with "$=
((")
> > > indicates at least a bug in the tool.
> > I'll try to search for $(( )) in POSIX docs.

> > What is the outcome? Should I first fix checkbashisms before merging th=
ese?
> > I suggest to merge it for local checking (similar to checkpatch.pl for =
C).
> > Because it cannot be used in CI right now, not even because these 2 fal=
se
> > positives, but because not everything has been converted to use new she=
ll API.
> I am not sure what the best way is here. I am not against integrating it,
> even with the bugs,
Thanks! Feel free to add your ack to patches.

> just against being "religious" about fixing "bugs" found by it.
Agree.

> Of course that means, no way,
> to enable it for ci, at least not without enforcement... But it allows
> developers, to quickly run it.
My short term goal is to run make check-* for those library parts which are
ready for it (both C and shell). That means to list specific targets (some =
work,
but I'd really have in CI before we convert all tests which allows us to co=
nvert
library). We could also add some filtering target to make check, which woul=
d be
enabled by environment variable (default off to allow see errors locally,
enabled only for CI).

> > > To be honest, I am a bit disappointed from this tool. It doesn't seem=
 to be
> > > tested very well... Probably barely good enough for scripting in the =
kernel.
> > This tool comes from Debian, written long time ago (2009) for release g=
oal to
> > use dash as /bin/sh [1] [2]. Kernel developers usually don't care about=
 POSIX
> > shell and happily use /bin/bash with all arrays and other crazy bashism=
s.
> Yeah I mixed up checkbashisms and checkpatch... That's why I pulled linux
> into this :)
Ah :).

> > There is tool shellcheck, which IMHO has a lot of false positives (I su=
ppose
> > Cyril agrees with it, as he added checkbashisms to our docs long time a=
go) and
> > we both aren't happy about occasional patches which are based on it's o=
utput.
> > See full output below for comparison. E.g. in "In POSIX sh, 'local' is =
undefined" is
> > useless, if we decide to trust local, at least for "local msg" i.e. wit=
hout
> > assignment. Or other not useful for us:
> > SC2166: Prefer [ p ] && [ q ] as [ p -a q ] is not well defined.

> > Not sure about: TST_ARGS=3D"$@":
> > SC2124: Assigning an array to a string! Assign as array, or use * inste=
ad of @ to concatenate.

> > The only good thing about shellcheck is that it has full shell parser [=
3],
> > unlike checkbashisms.

> Actually scrolling over the results, there are a lot of valid complaints,
> e.g. missing quotes.
> At least there are no false-positives (as per definition of spellcheck), =
as
> far as I see.
Yep, I have better impression now than I had before. But integrating it wou=
ld
require even more fixes than checkbashisms.

> Would it be possible to tailor it for ltp?
Would you prefer to have just shellcheck or use both?

Also both checkbashisms [4] and shellcheck [5] are supported on various dis=
tros.
We have vendored checkpatch.pl to allow modifications, the same is for
checkbashisms. Both are perl, which is ok for us as not-required dependency=
 for
building LTP (we already use perl partly for docparse). shellcheck is Haske=
ll
=3D> we don't want to bring Cabal to LTP build toolchain. But it looks it
shouldn't be needed as it's configurable via .shellcheckrc or in runtime wi=
th
--exclude=3DCODE.

@Cyril?

[4] https://pkgs.org/search/?q=3Dcheckbashisms
[5] https://pkgs.org/search/?q=3Dshellcheck
[6] https://github.com/koalaman/shellcheck/tree/master/src/ShellCheck

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
