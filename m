Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7A46C506B
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Mar 2023 17:20:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD05D3CD2A8
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Mar 2023 17:20:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1EBBF3C1BCE
 for <ltp@lists.linux.it>; Wed, 22 Mar 2023 17:20:49 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1923860005C
 for <ltp@lists.linux.it>; Wed, 22 Mar 2023 17:20:48 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A6F8233CE7;
 Wed, 22 Mar 2023 16:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1679502047;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wd+C+JWr58CSCDvadg5pc1JKYRFQca7P91v3M2cus30=;
 b=gut6Nw0CGXl6wWatxYPSPYdL3BuIQ7Kl2zGLODwb3eenYxIy+qKOa+GTBRzvXFazwW5Sf9
 OwCQqG8GRJsmjHo7rldayq3+OkqIAxFNzOs11WaXm/soF18j0d7zLWq8QVAabz+6Bz3R1Z
 Ol/GNgO97HQrVhQZrpG+HR0u2ntce4U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1679502047;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wd+C+JWr58CSCDvadg5pc1JKYRFQca7P91v3M2cus30=;
 b=CswgTOz7Jc4BPbS/jEiLQOlrEE8zsZ10TZnkyA+JYFagHD4aoj22Fzy3/Fmv44JjvBdl/b
 GchbxpYOWHmE/XCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 877A013416;
 Wed, 22 Mar 2023 16:20:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id U+joH98qG2TLawAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 22 Mar 2023 16:20:47 +0000
Date: Wed, 22 Mar 2023 17:20:46 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20230322162046.GA369840@pevik>
References: <20230217151036.10295-1-pvorel@suse.cz>
 <20230217151036.10295-2-pvorel@suse.cz> <ZBr9v2cz6/gmksAW@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZBr9v2cz6/gmksAW@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] tst_net.sh: Detect IPv6 disabled via sysct
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

...
> > +	if [ $? -ne 0 ]; then
> > +		TST_NET_IPV6_ENABLED=0
> > +		tst_res_ TINFO "IPv6 disabled on $type via ipv6.disable=1"

> Doesn't this happen also in the unlikely case that CONFIG_IPV6 is not
> set?

> So maybe "IPv6 disabled on kernel commandline or not compiled in"
Indeed, You're right, I'll use (to show where it was disabled):

tst_res_ TINFO "IPv6 disabled on $type via kernel command line or not compiled in"

> > +		return
> > +	fi
> > +
> > +	cmd='sysctl -n net.ipv6.conf.all.disable_ipv6'

> I'm not sure why we should use sysctl when this the same as doing

> cat /proc/sys/net/ipv6/conf/all/disable_ipv6
> Or is there any added value from the sysctl command?

No, but we already use sysctl in tst_init_iface():
sysctl -qw net.ipv6.conf.$iface.accept_dad=0 || return $?
tst_rhost_run -c "sysctl -qw net.ipv6.conf.$iface.accept_dad=0" || return $?

and we don't check for sysctl (expecting is everywhere). I'd also allow using
sysctl (and then add a check via tst_require_cmds) or change also these with
cat for reading and echo ... > for writing. WDYT?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
