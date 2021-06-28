Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E553B5AB3
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 10:49:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6649D3C86C5
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 10:49:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4911F3C6E14
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 10:49:42 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 831481400BDD
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 10:49:42 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E1EB120231;
 Mon, 28 Jun 2021 08:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624870181;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aK5IbFpXErxuqYP6O1cDt76Xg8NwWYLZQkPMuEvLxus=;
 b=JNb78m8NNE6+srarqQgNfJMzdEh1UNwwFravhNqxj68TsM6IkGXUxCAGfQGTW0TB5Vb4+Q
 gQHHvqMGLSYOPH1mz7XeP4WSXJBCuxgq/hszUZGN8m4uup9n7RMGYq6or2yU7u4nkLzO3S
 5yHRezmbJVrxNPcDj2hZu/a8NaS2NdU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624870181;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aK5IbFpXErxuqYP6O1cDt76Xg8NwWYLZQkPMuEvLxus=;
 b=75wvR1pEuBhEQ2eOs2DuK37g66XJTaSL2EFQN2recxNisM6BGa7yZ+xcw4UKN6ckSQ+HQ+
 z6xPzIY1haqOskCw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 8E089118DD;
 Mon, 28 Jun 2021 08:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624870181;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aK5IbFpXErxuqYP6O1cDt76Xg8NwWYLZQkPMuEvLxus=;
 b=JNb78m8NNE6+srarqQgNfJMzdEh1UNwwFravhNqxj68TsM6IkGXUxCAGfQGTW0TB5Vb4+Q
 gQHHvqMGLSYOPH1mz7XeP4WSXJBCuxgq/hszUZGN8m4uup9n7RMGYq6or2yU7u4nkLzO3S
 5yHRezmbJVrxNPcDj2hZu/a8NaS2NdU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624870181;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aK5IbFpXErxuqYP6O1cDt76Xg8NwWYLZQkPMuEvLxus=;
 b=75wvR1pEuBhEQ2eOs2DuK37g66XJTaSL2EFQN2recxNisM6BGa7yZ+xcw4UKN6ckSQ+HQ+
 z6xPzIY1haqOskCw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id mmx4ICWN2WAURQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 28 Jun 2021 08:49:41 +0000
Date: Mon, 28 Jun 2021 10:49:39 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YNmNI3omBfAnj5dN@pevik>
References: <20210628033002.GA1469@andestech.com>
 <caf1bb46-5212-3c3d-f180-e722ef2cf8dd@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <caf1bb46-5212-3c3d-f180-e722ef2cf8dd@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] cgroup/cgroup_regression_test: Fix umount
 failure
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
Cc: richiejp@f-m.fm, alankao@andestech.com, ltp@lists.linux.it
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

[ changed Cyril's address in Cc to the working one ]

> >   	mkdir cgroup/0
> >   	sleep 100 < cgroup/0 &	# add refcnt to this dir
> >   	rmdir cgroup/0
> > +	sync
> >   	# remount with some subsystems removed
> >   	# since 2.6.28, this remount will fail
> I would like a short comment close to the syncs. When I converted
> cpuset_regression_test.sh, I would have removed the sync in there, if the=
re
> wouldn't have been any comment.
> Most of the time syncs are not required and just added by paranoid
> developers, but if there is a real reason, I think it should be stated in=
 a
> comment.

Agree with this. Are all these sync really needed? Or just some?

Kind regards,
Petr

> J=F6rg

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
