Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F33B139754F
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 16:21:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A4D083C801C
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 16:21:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BDB273C5599
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 16:21:06 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 47DF960067B
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 16:21:05 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 687161FD2A;
 Tue,  1 Jun 2021 14:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622557265;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fJ2dLnpnHGJevQejIkpumOIoDGpLrkt5cpB7cb0l3PU=;
 b=RO2ngYbH/BHHXsa5pyF6vALizsuFTPHjZKn3CUGznYwuRu8MlkQjvm4Mggv1fXOlUMDANR
 UHqttY+pnTkSl7GoZLN9R0OY1xjrWOBtqWpuyIc050cWjSWksu2tQ8EnawVvOBHbyldhmz
 8fV1AA9jxLSGHAmln9lKUQHRd4DuJiQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622557265;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fJ2dLnpnHGJevQejIkpumOIoDGpLrkt5cpB7cb0l3PU=;
 b=Ym2A6J+1KOYNS4DOMFzLY80bg37honWuVOIEKLejZAU35fn7XrNgZXUQJTDfn8JDqmdgpZ
 fFJB4FqUN4az7/Dw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 36019118DD;
 Tue,  1 Jun 2021 14:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622557265;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fJ2dLnpnHGJevQejIkpumOIoDGpLrkt5cpB7cb0l3PU=;
 b=RO2ngYbH/BHHXsa5pyF6vALizsuFTPHjZKn3CUGznYwuRu8MlkQjvm4Mggv1fXOlUMDANR
 UHqttY+pnTkSl7GoZLN9R0OY1xjrWOBtqWpuyIc050cWjSWksu2tQ8EnawVvOBHbyldhmz
 8fV1AA9jxLSGHAmln9lKUQHRd4DuJiQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622557265;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fJ2dLnpnHGJevQejIkpumOIoDGpLrkt5cpB7cb0l3PU=;
 b=Ym2A6J+1KOYNS4DOMFzLY80bg37honWuVOIEKLejZAU35fn7XrNgZXUQJTDfn8JDqmdgpZ
 fFJB4FqUN4az7/Dw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 7d4gDFFCtmC4JgAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 01 Jun 2021 14:21:05 +0000
Date: Tue, 1 Jun 2021 16:21:03 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <YLZCTyoEUrAGG6C3@pevik>
References: <20210531165052.8731-1-pvorel@suse.cz>
 <CAASaF6zQt38sSkA7PDNZL53J7gbOXTCgC54Xbwb6qe=7-_wpWg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAASaF6zQt38sSkA7PDNZL53J7gbOXTCgC54Xbwb6qe=7-_wpWg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] CI: Move from Travis to GitHub Actions
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
Cc: ltp@lists.linux.it, Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> On Mon, May 31, 2021 at 6:51 PM Petr Vorel <pvorel@suse.cz> wrote:

> > Hi,

> > Travis often false positive due "pull rate limit" issue [1],
> > thus I decided to finally switch to GitHub Actions.

> > Also using GitHub native CI allows more advanced features
> > (e.g. update wiki with doc/*.txt, nightly build docparser doc).

> > Whole thing is tested [2].

> > I rewritten build.sh, added -r step.
> > It's ugly, using commands in yaml would be more readable. But I'd prefer
> > 1) not writting shell in yaml 2) have build script for local use.

> > Please comment, test.

Hi Jan,

> We should update docs too, but series looks OK, ACK.

Doc fixed in c77c62d64, thanks for reporting it!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
