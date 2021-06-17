Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3443AAAAB
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 07:14:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4078C3C30DB
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 07:14:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 337B53C2E0B
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 07:14:44 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4D44B1A011FF
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 07:14:44 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 974371FDB1;
 Thu, 17 Jun 2021 05:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623906883;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bnti981gFP3vGQ4dCr3tntz0387eWNv3GD865YsRmbc=;
 b=wdJvDOnR+qHluQVJjh1pRbeFLo9AxPMS1DNHKhDak4a31Edj7d3TbfYDL+2b3Uv3GMfcTz
 lPXtU4LhOrksE62Mh7FUg21E7ZXO2vVZV9ViOB9e+RxfCtEdcid2UtDIGtEZEZuxcV3HAa
 aWAj2k49L35g/vJlL8FaekB7WZC/XxA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623906883;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bnti981gFP3vGQ4dCr3tntz0387eWNv3GD865YsRmbc=;
 b=zd8b+VYOshkU3Ryd+M3jxQGmpq9NI279Yy7m6hG5aj4rDzGd2UfHOEXstO2ZYeuHGyzs2+
 FU8ENMaWv+7jEeCg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 5A855118DD;
 Thu, 17 Jun 2021 05:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623906883;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bnti981gFP3vGQ4dCr3tntz0387eWNv3GD865YsRmbc=;
 b=wdJvDOnR+qHluQVJjh1pRbeFLo9AxPMS1DNHKhDak4a31Edj7d3TbfYDL+2b3Uv3GMfcTz
 lPXtU4LhOrksE62Mh7FUg21E7ZXO2vVZV9ViOB9e+RxfCtEdcid2UtDIGtEZEZuxcV3HAa
 aWAj2k49L35g/vJlL8FaekB7WZC/XxA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623906883;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bnti981gFP3vGQ4dCr3tntz0387eWNv3GD865YsRmbc=;
 b=zd8b+VYOshkU3Ryd+M3jxQGmpq9NI279Yy7m6hG5aj4rDzGd2UfHOEXstO2ZYeuHGyzs2+
 FU8ENMaWv+7jEeCg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id e9wSFEPaymAKSgAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Thu, 17 Jun 2021 05:14:43 +0000
Date: Thu, 17 Jun 2021 07:14:41 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YMraQVl2Hjnlu2rX@pevik>
References: <20210616081856.3026223-1-lkml@jv-coder.de>
 <fb4b9d45-2cbb-5e5c-fefe-3ca429373a54@bell-sw.com>
 <YMoMfS+cFx4aau01@pevik>
 <b092967d-2104-03d3-a95d-2042724ecca0@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b092967d-2104-03d3-a95d-2042724ecca0@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

> Hi Petr,

> On 6/16/2021 4:36 PM, Petr Vorel wrote:
> > Hi Joerg, Alexey,

> > ...
> > > >   cleanup()
> > > >   {
> > > > +	local pids
> > > > +
> > > >   	# Stop the ssh daemon
> > > > -	test -s sshd.pid && kill $(cat sshd.pid)
> > > > -	pkill 'netstress$'
> > > > -	tst_rmdir
> > > > -	[ "$rtmpdir" ] && tst_rhost_run -c "rm -rf $rtmpdir"
> > > > -	TMPDIR=3D
> > > > +	[ -s sshd.pid ] && kill $(cat sshd.pid)
> > > > +	[ -n "$NETSTRESS_PID" ] && kill -2 $NETSTRESS_PID >/dev/null 2>&1
> > > > +
> > > > +	tst_rhost_run -c "kill $RHOST_PIDS"  >/dev/null 2>&1
> > And check also $RHOST_PIDS, right?
> > [ -n "$RHOST_PIDS" ] && tst_rhost_run -c "kill $RHOST_PIDS" >/dev/null =
2>&1
> Right... But actually doesn't matter. Just "kill" does nothing"
Sure, but just to sync it with previous kill of $NETSTRESS_PID
(both have stderr redirected, thus it shouldn't be necessary, but does not
harm).

Kind regards,
Petr

> > > > +
> > > > +	# Kill all remaining ssh processes
> > > > +	tst_rhost_run -c "pkill -f '^ssh $RHOST_SSH_CONF'"
> > > Perhaps we should check that $RHOST_SSH_CONF is set before running
> > > pkill.
> > [ -n "$RHOST_SSH_CONF" ] && tst_rhost_run -c "pkill -f '^ssh $RHOST_SSH=
_CONF'"
> Yes, this should be done...

> > No need to repost, I'll fix it before merge.
> Thanks

> J=F6rg

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
