Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 242173B6408
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 17:02:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A88253C8DA7
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 17:02:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B95DA3C2B0E
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 17:02:52 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id EB4ED2003BE
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 17:02:51 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5788F202A7;
 Mon, 28 Jun 2021 15:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624892571;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XUxMNVB70VYt+NPjUD9xi903yh6c44A8qEvJsi9pkso=;
 b=EL/oMiZSzwdxHRwVBzkJUFOI6o0Qxt6NwV2Bz2GYE9CGVMnkfpCbf8wevZsumZt3hHwyh0
 J3O9vc+UtAIT7Pmz+QEAA4xC+VlLiG5qiq8AsuHSHie99ptvrdxwzCdqr0PAQHqd4//MCv
 ojuaheKz0Trb560jzTMAYZ6ZsRYFoxw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624892571;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XUxMNVB70VYt+NPjUD9xi903yh6c44A8qEvJsi9pkso=;
 b=EF78HG1/hpLlhhrFPdB68Ak2BhKwihfSZkSeJzFCH0M4lwK6qRI4OQeKpMTQpqS5JE6klP
 h5ANYh5Zk9IA+OBw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 25BA111906;
 Mon, 28 Jun 2021 15:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624892571;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XUxMNVB70VYt+NPjUD9xi903yh6c44A8qEvJsi9pkso=;
 b=EL/oMiZSzwdxHRwVBzkJUFOI6o0Qxt6NwV2Bz2GYE9CGVMnkfpCbf8wevZsumZt3hHwyh0
 J3O9vc+UtAIT7Pmz+QEAA4xC+VlLiG5qiq8AsuHSHie99ptvrdxwzCdqr0PAQHqd4//MCv
 ojuaheKz0Trb560jzTMAYZ6ZsRYFoxw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624892571;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XUxMNVB70VYt+NPjUD9xi903yh6c44A8qEvJsi9pkso=;
 b=EF78HG1/hpLlhhrFPdB68Ak2BhKwihfSZkSeJzFCH0M4lwK6qRI4OQeKpMTQpqS5JE6klP
 h5ANYh5Zk9IA+OBw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id na/8B5vk2WDkHwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 28 Jun 2021 15:02:51 +0000
Date: Mon, 28 Jun 2021 17:02:49 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YNnkmWjatDqcqAwQ@pevik>
References: <20210621143056.2724-1-rpalethorpe@suse.com>
 <YNNV1NeXNUyLNE4a@pevik>
 <CAEemH2dG8kH9ExofdAh3U1_n_kNpU53ZGsmLT-w9v2fL83K93Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dG8kH9ExofdAh3U1_n_kNpU53ZGsmLT-w9v2fL83K93Q@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] rm unused controllers/io-throttle tests
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
Cc: LTP List <ltp@lists.linux.it>, automated-testing@yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richie,

thanks a lot, merged!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
