Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DD74E3A6895
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 15:57:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A29183C4D44
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 15:57:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 20EEC3C2819
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 15:57:51 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A51061A0048F
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 15:57:50 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 10B931FD29;
 Mon, 14 Jun 2021 13:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623679070;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M6BfcyJyPWHv/YHvF/jY3mnqb6iv48WyP2I56ID1GLY=;
 b=Vkdf++xAFhm1tidh+fSZ+79KBQUcfTAz4W2SIPu/VOxajpmp/EcgvzSIMEtgicFh/A+37w
 110dTLtytHzwtQwZHti/RLF8/6viyfLDx9tcqyPHjVzFOb208WFI81YGbuq6exUpPhQCpv
 j5B5+Ck43o7tN90LaRV+OS/4DEaMBPQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623679070;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M6BfcyJyPWHv/YHvF/jY3mnqb6iv48WyP2I56ID1GLY=;
 b=BiNHkv2eDuvH5HLR8pYQdeUUQpTQFGcVCeQ9370YN+b35Ldr+iO4AitVUbCQRdiGBepTYe
 zNCNLz9YRjIjaWBw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id D4745118DD;
 Mon, 14 Jun 2021 13:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623679070;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M6BfcyJyPWHv/YHvF/jY3mnqb6iv48WyP2I56ID1GLY=;
 b=Vkdf++xAFhm1tidh+fSZ+79KBQUcfTAz4W2SIPu/VOxajpmp/EcgvzSIMEtgicFh/A+37w
 110dTLtytHzwtQwZHti/RLF8/6viyfLDx9tcqyPHjVzFOb208WFI81YGbuq6exUpPhQCpv
 j5B5+Ck43o7tN90LaRV+OS/4DEaMBPQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623679070;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M6BfcyJyPWHv/YHvF/jY3mnqb6iv48WyP2I56ID1GLY=;
 b=BiNHkv2eDuvH5HLR8pYQdeUUQpTQFGcVCeQ9370YN+b35Ldr+iO4AitVUbCQRdiGBepTYe
 zNCNLz9YRjIjaWBw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id /JXoMV1gx2DzawAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 14 Jun 2021 13:57:49 +0000
Date: Mon, 14 Jun 2021 15:57:48 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YMdgXPeTNHMtna/M@pevik>
References: <20210610101917.1251564-1-lkml@jv-coder.de>
 <YMcB3Wcu0J9C3Z/Q@pevik>
 <5db0624b-a6ce-2c02-d1d4-52034c85b2f1@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5db0624b-a6ce-2c02-d1d4-52034c85b2f1@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ssh-stress: Convert to new api
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

> Hi,

> I will send a v2 with the changes commented here.
Thanks!

> On 6/14/2021 9:14 AM, Petr Vorel wrote:
> > Hi Joerg,

> > [ Cc Alexey ]
> > > From: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> > > Apart from pure conversion:
> > >   - Use "StrictModes no" in ssh config, to get rid of
> > >     access permission problems; All part of the path of the
> > >     authorized_keys file must not be writeable by anyone but the owner.
> > >     This allows writing the file to the default temp directory
> > >   - Moved all rhost scripts into ssh-stress.sh
> > +1

> > Nice work, LGTM, few small notes (could be fixed before merge).
> > Reviewed-by: Petr Vorel <pvorel@suse.cz>

> > Out of curiosity, did you test this on Two Host Configuration [2] (i.e. ssh)?
> > Or just netns?
> No, but should have...
> I found two major problems with the test (will send a v2). But apart from
> that, either I was not able to find the documentation or it is not clear
> enough to me, how to run the two host setup.
> I found network/README.md, but it only mentions to set RHOST, but for my
> setup (with ips different from the default ones, IPV{4,6}_{L,R}HOST is also
Yes we should be more verbose at Two Host Configuration [1] as there is nothing
more. At least to mention IPV{4,6}_{L,R}HOST.

> required) and ltp must already be in the PATH on rhost, which was not
> possible for my rhost setup, where the filesystem is read-only and I had to
> hack setting the path into tst_rhost_run. It is not totally clear, that ltp
What exactly was your problem? Having to modify PATH on shell config on read
only system? I'll send a proposal to set PATH in tst_test.sh.

> > > -	check_icmpv${TST_IPVER}_connectivity $(tst_iface) $(tst_ipaddr rhost) || \
> > > -		tst_brkm TBROK "Failed to ping to $(tst_ipaddr rhost)"
> > > +	check_icmpv${TST_IPVER}_connectivity $(tst_iface) $(tst_ipaddr rhost) \
> > > +		|| tst_brk TBROK "Failed to ping $(tst_ipaddr rhost)"
> > Anything from testcases/network/stress/ns-tools/ is deprecated,
> > including check_icmpv{4,6}_connectivity. But this can be safely removed.
> > Although I don't see any connectivity check in tst_net.sh, it should be handled
> > there. IMHO it's needed at least for for two host based configuration, but it does not harm to test also netns based setup, thus somewhere after init_ltp_netspace.
> There is tst_ping in tst_net.sh. Without arguments, it just tests
> connectivity to rhost.
> Nevertheless, this is kind of useless in setup here. Other network tests do
> not check availability before execution, so I just dropped it for v2.
> +1 on adding it to tst_net.sh initialization
Yes, we should do it as a separate effort.

...

Kind regards,
Petr

[1] https://github.com/linux-test-project/ltp/blob/master/testcases/network/README.md#two-host-configuration

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
