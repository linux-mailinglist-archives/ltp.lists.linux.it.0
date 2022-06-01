Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BDB53A5C4
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Jun 2022 15:17:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 928103C6AD0
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Jun 2022 15:17:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BBA303C62DF
 for <ltp@lists.linux.it>; Wed,  1 Jun 2022 15:17:24 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 45BC9600072
 for <ltp@lists.linux.it>; Wed,  1 Jun 2022 15:17:23 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 718D0219BA;
 Wed,  1 Jun 2022 13:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1654089443;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yTzI2rnmJ6VZ+UpIzg7/Vpltp2oMPbmOZUz73QrZyU4=;
 b=Q7wQUT4G6KZkPfLWGcqeGAXI9nYvVFGNV6GdnQVyK7R0lp6vURR2EX3Sj/k/16cgKATEfo
 +7sAr8bBK1CgfD/Z7yiJqZHpG52Q051ym0Lf0a/mMhNSy7LICUi8BykESP3lXbu1lukopn
 c7DQfekbtfmvsA1sD/FgXNTqvUQFuJI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1654089443;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yTzI2rnmJ6VZ+UpIzg7/Vpltp2oMPbmOZUz73QrZyU4=;
 b=k5G4k8HZa8zC0fiW1DF+TPahi4V37fo6ly3/Nf4eIDLfbua2+/M5dU78mOlC7Pg26tu8Sc
 gGTLqznl55MIOWCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2BCB91330F;
 Wed,  1 Jun 2022 13:17:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wpjzCONml2IEbwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 01 Jun 2022 13:17:23 +0000
Date: Wed, 1 Jun 2022 15:17:21 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <Ypdm4epvpqwfBXci@pevik>
References: <20220512194557.30911-1-pvorel@suse.cz>
 <20220512194557.30911-6-pvorel@suse.cz> <YpTexs/dQDZdxr4m@yuki>
 <YpdAmGFZR01I6zmA@pevik> <YpdMC5l/C+arTzCb@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YpdMC5l/C+arTzCb@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5/8] shell: Add tst_clear_device
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
Cc: Martin Doucha <martin.doucha@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> > > Can't we just add clear command to the tst_device.c instead?
> > Not sure what you mean, can you be more specific?

> We do have tst_device binary that has two commands acquire and release,
> why can't we add clear command for that binary instead?
Ah, you mean testcases/lib/tst_device.c. I forget on this one, I was looking
just into lib/tst_device.c. Makes sense, thx!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
