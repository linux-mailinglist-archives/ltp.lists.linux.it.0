Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B05503A9DB4
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 16:36:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3E9453C8904
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 16:36:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 54B853C3106
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 16:36:48 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id CAA061401180
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 16:36:47 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 006B31FD3F;
 Wed, 16 Jun 2021 14:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623854207;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tE8xjLYf+ADQ5Yv/EVWM9hlvoe9v2YeFF+PJvYb6Icc=;
 b=IdpK4cGgtdaETWIsSQJnxxNpjQ8NRrrguEHrQcPtwMOT6IlD22VbRJ8NsDYp277MtrH+m0
 ys1B0xK4lAx5/tMqrStl4yd6s6wBCedcfRqC0dMB1qaFrLH3CqyqhhjW5FaHRTsVU529Yj
 EjKNCKNc6PyrZBWYsWYwfrjP8OC1Ui4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623854207;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tE8xjLYf+ADQ5Yv/EVWM9hlvoe9v2YeFF+PJvYb6Icc=;
 b=3r/0ee7ai/lP/JEdBwxPqsMHGowcwyTPQXqruq6DWxkCJp1p4nP/F5p2wS/JaRrYAloGCa
 i3sTC/apTyJEhjBg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id B7EC8118DD;
 Wed, 16 Jun 2021 14:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623854206;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tE8xjLYf+ADQ5Yv/EVWM9hlvoe9v2YeFF+PJvYb6Icc=;
 b=ye5kCmx6ifov53yNS75dqUBjhw5qofynM/AuDN129JnVZn1T+iNDBlScyER0dt/gb189RP
 sFxy4BUmHJ+7l89ewdA7mKT2H87KKkb3BmDRTqP6QsnTgrL290gYA1uJ/Tkexa9qTEpm1P
 F7UX7VDIwYtF8s0VNAQ0lDi+2TWjFPE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623854206;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tE8xjLYf+ADQ5Yv/EVWM9hlvoe9v2YeFF+PJvYb6Icc=;
 b=R/nWu9kzsx886J7Gv9gCHjLIpcq7/hBtIIYpbdQr8Oj/Q3mP4RDsIEep2mRqlojuEN3xQa
 8Utlfn8mzUYDhgAA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id Pu+5Kn4MymAMYQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 16 Jun 2021 14:36:46 +0000
Date: Wed, 16 Jun 2021 16:36:45 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YMoMfS+cFx4aau01@pevik>
References: <20210616081856.3026223-1-lkml@jv-coder.de>
 <fb4b9d45-2cbb-5e5c-fefe-3ca429373a54@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fb4b9d45-2cbb-5e5c-fefe-3ca429373a54@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] ssh-stress: Convert to new api
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

...
> >  cleanup()
> >  {
> > +	local pids
> > +
> >  	# Stop the ssh daemon
> > -	test -s sshd.pid && kill $(cat sshd.pid)
> > -	pkill 'netstress$'
> > -	tst_rmdir
> > -	[ "$rtmpdir" ] && tst_rhost_run -c "rm -rf $rtmpdir"
> > -	TMPDIR=
> > +	[ -s sshd.pid ] && kill $(cat sshd.pid)
> > +	[ -n "$NETSTRESS_PID" ] && kill -2 $NETSTRESS_PID >/dev/null 2>&1
> > +
> > +	tst_rhost_run -c "kill $RHOST_PIDS"  >/dev/null 2>&1
And check also $RHOST_PIDS, right?
[ -n "$RHOST_PIDS" ] && tst_rhost_run -c "kill $RHOST_PIDS" >/dev/null 2>&1

> > +
> > +	# Kill all remaining ssh processes
> > +	tst_rhost_run -c "pkill -f '^ssh $RHOST_SSH_CONF'"

> Perhaps we should check that $RHOST_SSH_CONF is set before running
> pkill.
[ -n "$RHOST_SSH_CONF" ] && tst_rhost_run -c "pkill -f '^ssh $RHOST_SSH_CONF'"

No need to repost, I'll fix it before merge.

> For the rest:
> Reviewed-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
