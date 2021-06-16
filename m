Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD773A92F3
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 08:42:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5F42A3C4CB8
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 08:42:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AF0C63C2DDA
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 08:42:36 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 158C4600C35
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 08:42:35 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 138A61FD47;
 Wed, 16 Jun 2021 06:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623825755;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TmlBoWBXZpDdBl9rrx/Tt3gxA6ySmd9IuFea82n4rws=;
 b=uIYtFfjaVCvWf7U1pzhiSzu9OLJonN+vI36rJYYrIb0Wpw4OBbeX4VaRqJj0Y0srdWkyMN
 jomW25HXymexaQgqX2mHY17TDSEmuPtCL4EdgTULjunDCyTina9vSJhIDQtleU+Q7WN24v
 yEhWxDNc4msvLEj3f2X+KWQGLDWazXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623825755;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TmlBoWBXZpDdBl9rrx/Tt3gxA6ySmd9IuFea82n4rws=;
 b=chYqLWKyWBVnZ0TSN8MlALpF+qljdRqsaxu3qah/H9ORjsYOruUjO18DbyvSeF6t8fHm9w
 qKOQRM8NutXa4/CQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id CB5A7118DD;
 Wed, 16 Jun 2021 06:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623825755;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TmlBoWBXZpDdBl9rrx/Tt3gxA6ySmd9IuFea82n4rws=;
 b=uIYtFfjaVCvWf7U1pzhiSzu9OLJonN+vI36rJYYrIb0Wpw4OBbeX4VaRqJj0Y0srdWkyMN
 jomW25HXymexaQgqX2mHY17TDSEmuPtCL4EdgTULjunDCyTina9vSJhIDQtleU+Q7WN24v
 yEhWxDNc4msvLEj3f2X+KWQGLDWazXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623825755;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TmlBoWBXZpDdBl9rrx/Tt3gxA6ySmd9IuFea82n4rws=;
 b=chYqLWKyWBVnZ0TSN8MlALpF+qljdRqsaxu3qah/H9ORjsYOruUjO18DbyvSeF6t8fHm9w
 qKOQRM8NutXa4/CQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id qhzVL1qdyWAnTQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 16 Jun 2021 06:42:34 +0000
Date: Wed, 16 Jun 2021 08:42:33 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YMmdWRGTB0MrtdxJ@pevik>
References: <20210614094338.125870-1-lkml@jv-coder.de>
 <a2ad7106-3e96-48a0-d195-80d7d09c8613@bell-sw.com>
 <fae3c38e-ae64-05ac-264b-f11cae8c1c55@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fae3c38e-ae64-05ac-264b-f11cae8c1c55@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] ssh-stress: Convert to new api
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

Hi Joerg, Alexey,

> Hi Alexey,

> > > +	# Kill all remaining ssh processes
> > > +	tst_rhost_run -c "ps auwx | \
> > > +		awk '\$0 ~ \"$RHOST_SSH_CONF\" && \$11 == \"ssh\" {print \$2}' | \
> > > +		xargs -r -t kill -- >/dev/null 2>&1"
> > >   }
> > What about using pkill -f instead of ps|awk|kill?
> I guess I did not use pkill for two reasons:
> 1. I wanted to be sure to really only kill ssh processes with
> $RHOST_SSH_CONF in their arguments
> 2. I did not want to use an extra tool, that is not necessarily available on
> all systems.

> The first one could be solved by using "pkill -f "^ssh .*$RHOST_SSH_CONF", I
> guess. This still leaves a problem with unescaped regexp meta characters in
> RHOST_SSH_CONF, but my awk solution has the same problem. But I think this
> is only theoretical, it is extremely unlikely, that any regexp meta
> character apart from "." is used in RHOST_SSH_CONF and the dot will unlikely
> produce false positives.
> The second point can be ignored. pkill is used in many locations throughout
> ltp already. It should probably be added as a runtime dependency.

+1. pkill as runtime dependency is probably better than xargs dependency.
BTW I thought in the past to write tst_kill command, either as a shell
implementation (which would look on pkill, killall and if none of them
it'd used ps and grep) or (better) just to implement it in C.


> > > -	tst_rhost_run -s -c "ssh-stress02-rmt.sh $TST_IPVER $(tst_ipaddr) \
> > > -		$rconfig $CONNECTION_TOTAL $NS_DURATION"
> > > +	tst_res TINFO "Verify the ssh connectivity over IPv4/IPv6 is not broken after creating many ssh sessions"
> >                                                             ^
> > The message may have indicated the exact IP version with $TST_IPVER
> Yeah right, that was just copy and pasted from the original test
> description.
+ nit: "Verify SSH connectivity ..."

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
