Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2545F3F7041
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 09:17:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CCD193C300F
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 09:17:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E9C6F3C2F63
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 09:17:29 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7E23E600806
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 09:17:29 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 99C071FD3C;
 Wed, 25 Aug 2021 07:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629875848;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uc0QXMIOTNLy0xVP8VLsH8jGemwaJPA3vY9+a47MYx4=;
 b=KUGRIOGY8Yfho6yuudVsVGHMfU9bwDGNPQGoGb+0V1EBhKWrqm6Y7Mk3SvkXM1oYOSp2QN
 kqcbEFL/5I5KmvTnKGr7G4HRAEK/rXUhAvE3dMH9rpmu4wDyeeF4+oDYTtZljTijcVNuvj
 H8uen+gYWQXSnddQ7d3lgEGlp+LuNCY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629875848;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uc0QXMIOTNLy0xVP8VLsH8jGemwaJPA3vY9+a47MYx4=;
 b=X6/QVQrGdfFN4kxRLvk92spHrmXF/3/gZYK0LCeQjNSVLR0yHt7r7ESG4gZME7KflT3eqd
 0kqrU57KOCsG4GBQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 385A313929;
 Wed, 25 Aug 2021 07:17:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id C0PMC4juJWHlZQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 25 Aug 2021 07:17:28 +0000
Date: Wed, 25 Aug 2021 09:17:26 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YSXuhovPqvZiZ4VL@pevik>
References: <YSTj7CB6PdG2HZsQ@ubuntu02>
 <YSTvNANtOqYxNZSe@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YSTvNANtOqYxNZSe@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v7,
 4/4] Make argument to tst_umount an absolute path
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
Cc: richiejp@f-m.fm, ycliang@cs.nctu.edu.tw, alankao@andestech.com,
 metan@ucw.cz, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril, Leo,

> Hi!
> >  	[ "$mounted" ] || return
> > -	tst_umount $MNTDIR
> > +	tst_umount $PWD/$MNTDIR

> I guess that we should have the $PWD/$MNTDIR inside of double quotes
> just to be extra careful.
Thanks for catching problems, updated and merged.

I also post yet additional update of docs (TST_MNTPOINT should be full path).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
