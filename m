Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DEC3D778A
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 15:54:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A2C263C9122
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 15:54:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7A7B13C65E9
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 15:53:58 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B9D6F1A00981
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 15:53:57 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1013C1FF0F;
 Tue, 27 Jul 2021 13:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627394037;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XGAHKM/lpfpiBJiO0qN3x34FKCMGfQT9XQ7TWUuIxJY=;
 b=T7p/N3vAG1M8YgsfWldLB0YyraWBjK75ViDrPzZWCnSZWGJm4cpYj0eG/mdiFJZOke5ASd
 zWQHo8V2JJE0anqHLpS4EiBRtAnJeZaEbau/JlRVPGvopIh6N5ozlV3LZtLhMSqSQFmzi4
 RM4aXaYgbJrEOR2tGM/HqY6+aBzpT1Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627394037;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XGAHKM/lpfpiBJiO0qN3x34FKCMGfQT9XQ7TWUuIxJY=;
 b=WSS8f/F7Lx+N2hPKaNTas54Kvz5xlW4ysbwglSdpMdxBZeD3SRAbteYwFsUrDFqhZBVWhV
 wR1bkg3TE4zwqnCw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 98DC0133DE;
 Tue, 27 Jul 2021 13:53:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id t155I/QPAGEOBAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Tue, 27 Jul 2021 13:53:56 +0000
Date: Tue, 27 Jul 2021 15:53:54 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YQAP8hoNpE+xykFA@pevik>
References: <20210719092239.GA1475@atcfdc88> <YPgxJwx795fhXgLa@pevik>
 <62262681-222f-8d09-a100-0d7be0c7526f@jv-coder.de>
 <YQAFcVwvz+eXGOsk@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YQAFcVwvz+eXGOsk@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4,
 2/2] cgroup/cgroup_regression_test: Fix umount failure
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
Cc: richiejp@f-m.fm, Alan Quey-Liang Kao <alankao@andestech.com>, metan@ucw.cz,
 ycliang@cs.nctu.edu.tw, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

FYI this discussion is on v4, there is already v5 (marking it changes requested
in patchwork) and obviously v6 will be needed. Leo, I suppose you'll implement
everything mentioned here in v6.

> Hi!
> > I had a first look at this patches and was curious, what the reasoning 
> > behind the "/" is.
+1 I should have ask myself as well :).

> > The comment you suggest is wrong. The / was introduced to prevent 
> > unmounting some other mountpoint,
> > where the device was cgroup.
> > Imho the approach of adding a / to the end was wrong and intransparent. 
> > I would rather use "./cgroup" or "$PWD/cgroup".

> Passing full path to the cgroup directory sound much safer to me
> especially when the directory name is just 'cgroup', try it yourself:

> device=cgroup/; grep "${device%/}" /proc/mounts

> On my machine this yields 10 lines and 21 matches.

> > If possible, I'd actually change tst_umount, to always unmount the 
> > mountpoint and not the device, i.e. if the given path is not an absolute 
> > path, make it absolute (e.g. by prepending $PWD").
> > This way the check if the mountpoint exist wouldn't be the fuzzy thing 
> > it is right now.
+1

> Strongly agree here.

> I would go even one step further and change the library so that it
> rejects anything that does not start with '/'.
+1

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
