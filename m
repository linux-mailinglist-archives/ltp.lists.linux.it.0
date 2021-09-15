Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1904A40C178
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Sep 2021 10:14:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2420D3C89A8
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Sep 2021 10:14:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 36A6B3C2E5D
 for <ltp@lists.linux.it>; Wed, 15 Sep 2021 10:14:11 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5ABB7601CB7
 for <ltp@lists.linux.it>; Wed, 15 Sep 2021 10:14:10 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6C6C61FE4A;
 Wed, 15 Sep 2021 08:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631693649; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AVFDEWPRu0oRA4DCf5hYm8RroxI55g/CwOlGzj+Bf0U=;
 b=K2FDYG78S5l1ByrtY1xaMo0Fu8TNdFIw9nxKr9g1+vF/wgE+CxCRv77Y8VZWHzeBclgOzg
 alF0md7Z4XflTieSiqUMwLQP51uCKaRW/yer5z/y4EpJ7jjHHlTN/nRo5FErU54oDStALC
 oeCDWNOOWoFEQDa4QKFLceJ/HKa4OoE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631693649;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AVFDEWPRu0oRA4DCf5hYm8RroxI55g/CwOlGzj+Bf0U=;
 b=DGgSYkKFMussmOWDi47R2qz61pYJdte8Sdq1G6qs0W0CBJJiRYsHX3EQQqTIRVNcqPoWxF
 VIVBphuexTdQKUBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4EACF13C21;
 Wed, 15 Sep 2021 08:14:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rvm4ElGrQWFgLgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 15 Sep 2021 08:14:09 +0000
Date: Wed, 15 Sep 2021 10:14:31 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YUGrZ/My4DHyUAT5@yuki>
References: <20210914150220.2467-1-chrubis@suse.cz>
 <CAEemH2cfT85O5HFPwG1d1Fso+JQBPi2h+cNFKRxhgsmW2j8f4w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cfT85O5HFPwG1d1Fso+JQBPi2h+cNFKRxhgsmW2j8f4w@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: tst_virt: Add option to override virt
 detection
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > There seems to be cases where systemd-detect-virt does not detect
> > virtualization correctly. To work around this bugs this commit adds a
> > a support for LTP_VIRT_OVERRIDE environment variable that if set is used
> > instead of the output from the systemd-detect-virt command.
> >
> > Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> >
> 
> Reviewed-by: Li Wang <liwang@redhat.com>

I've added a description for the variable into doc/user-guide.txt and
pushed, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
