Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F7B3C863F
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 16:37:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B90513C8651
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 16:37:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4E49E3C5580
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 16:37:15 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DEE8C60070E
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 16:37:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5AC1D202BC;
 Wed, 14 Jul 2021 14:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626273434;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wzo8kFDYpuh1N5Xkt87syHlwKTi1SLtdoZu1KmLHpe8=;
 b=yyHDhFJX/ZGzYNUI6QXvnSWKDJ5Ks3B7wfQxCOQl8JOOV53H9K8HYWfip1heIvqwIkA+nn
 /lwNlP2AlX3vNgaYl8iYn/gc+lPmGPm8OvQwqC5YJP6kNiOy8+xcukakqiWZKuQIW8H99r
 OAD91ISYz4c5Hl8g+8A1qfqYLDLo6q0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626273434;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wzo8kFDYpuh1N5Xkt87syHlwKTi1SLtdoZu1KmLHpe8=;
 b=6A8YMflqJMdQefv4uzmdD8KozO0bRrk9cvS+/O7Dc21bjtSBOfMFa4Ll1z7wfxeLO+B52W
 Kj+mU67fKcxmmfDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2035A13C06;
 Wed, 14 Jul 2021 14:37:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LrxtBpr27mCFewAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 14 Jul 2021 14:37:14 +0000
Date: Wed, 14 Jul 2021 16:37:12 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YO72mA9nhaCq1bLe@pevik>
References: <20210713101338.6985-1-pvorel@suse.cz>
 <20210713101338.6985-5-pvorel@suse.cz> <YO2T4J14roLUT32t@yuki>
 <YO2gUL2/s29SGdNo@pevik> <YO2f+P8Z9l6SISDG@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YO2f+P8Z9l6SISDG@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 4/7] lib: Add script for running tests
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>,
 Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

...
> > > Not sure what we can do here, I guess that timings would be hard to fix
> > > on VMs that run the tests.

> > If I remember correctly Richie suggested that FAIL is also OK. He said only
> > TBROK and TCONF is a problem. I'd prefer to fuzzy sync tests which always pass,
> > but after this effort I can work on API tests metadata, which would allow also
> > this.

> Another possibility would be relaxing the timings on VMs. I guess that
> we could change the treshold for reaching the criticall section to 10 on
> VMs.
I'd be for it, we have checks for VM. @Richie, any opinion about it?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
