Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF535B3454
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Sep 2022 11:47:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8D43C3CA9FA
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Sep 2022 11:47:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1920F3CA9DE
 for <ltp@lists.linux.it>; Fri,  9 Sep 2022 11:47:45 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3CFE81401178
 for <ltp@lists.linux.it>; Fri,  9 Sep 2022 11:47:44 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 870381F8B6;
 Fri,  9 Sep 2022 09:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1662716864;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VhYKb+mhn1K6rA1Fhf6UpJhdmkF3+fthRxPNc9g/lV4=;
 b=N+GMIBTPNpnCzr27dPyOwQW4TbJrE8aYujxuoVTfKFgIsab84cOMp9TL7dK6cp+RaTus1P
 2mbUOam7Wc/iV3bUv9Ftqgu2tNwHRmWsDDz0SZXEonbgQCtwOmdow1k/c4QfHs7txkN84Q
 SEdkSKIBgA1STokVX6tB/aipoAD3OdA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1662716864;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VhYKb+mhn1K6rA1Fhf6UpJhdmkF3+fthRxPNc9g/lV4=;
 b=JUmGl0FIcjDF3d4NuS1fRZ1IC6Wfoj6xD7bS58/q4z4lMmjDX1xS+axJAkYM6f6fHY+3OM
 hGS2T/P9/oBEGOCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E7D3813A93;
 Fri,  9 Sep 2022 09:47:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XDWnM78LG2OcaAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 09 Sep 2022 09:47:43 +0000
Date: Fri, 9 Sep 2022 11:47:42 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it,
 Li Wang <liwang@redhat.com>, Richard Palethorpe <rpalethorpe@suse.com>,
 Martin Doucha <mdoucha@suse.cz>, Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <YxsLvtXw2yop0e1h@pevik>
References: <20220902133710.1785-1-pvorel@suse.cz>
 <20220902133710.1785-4-pvorel@suse.cz> <YxsKBI2256Ldmhpn@yuki>
 <YxsKNhHvO5iCCtKW@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YxsKNhHvO5iCCtKW@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 3/9] tst_supported_fs: Implement skip list
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

...
> > > +		switch (ret) {
> > > +		case '?':

> > No usage?
> Ah, make sense to -? be alias of -h.
I mean to call usage() before return 1.

Kind regards,
Petr

> > > +			return 1;
> > > +
> > > +		case 'h':
> > > +			usage();
> > > +			return 0;

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
