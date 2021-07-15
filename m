Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1F83C9B53
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 11:22:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 655653C863E
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 11:22:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 989D53C65D4
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 11:22:09 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E537F100117A
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 11:22:08 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 432572284F;
 Thu, 15 Jul 2021 09:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626340928;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=34IQhthz1lgJtdYcEk5Yu9TNg1EQF4Cle/qi/guHgYs=;
 b=RKjjZNPYftpns8qB3alkF2caPSHHX4ICp5Jec/cL3rmw+VgeDtQjMsUw8OOCxNvgyc8H4q
 PtDhaU8/bP6c2ZM062E4YPC6EaunRV2sKmh92RXI2UzZMacYjc6XFmxXNNimqKWbIoOZ+Q
 72tqhbA9Q5J94Jpe4ittGDUF502tbng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626340928;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=34IQhthz1lgJtdYcEk5Yu9TNg1EQF4Cle/qi/guHgYs=;
 b=yu9yIsDE4165tUYFQapLbAJPvTxaZvfCj4NuBSehGRpV2ZFmAnW9Lme0Rdowc85v45m0U0
 yVpMaMoBItiKtfCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D68F113C30;
 Thu, 15 Jul 2021 09:22:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mLlCLj/+72CxBAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 15 Jul 2021 09:22:07 +0000
Date: Thu, 15 Jul 2021 11:22:05 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YO/+PVxKTMem0wZd@pevik>
References: <20210714142001.20566-1-pvorel@suse.cz> <YO70PiTdyxzTw0k2@pevik>
 <YO77+MmmxwMewgnQ@yuki> <YO8UIP310jsAmq8I@pevik>
 <YO/l6yni/AAOGhn9@pevik> <YO/3AYqt8tAABFxy@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YO/3AYqt8tAABFxy@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 0/4] Run tests in CI
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> > > Thanks! Testing it in https://github.com/pevik/ltp/actions/runs/1031005963

> > The result is much better but still not correct:
> > https://github.com/pevik/ltp/runs/3068932859?check_suite_focus=true#step:11:707

> If tests are printing into stdout as well it will be easier to redirect
> the test output in the script so that the CI gets it all into a single
> file descriptor.

> What about doing ./$i 1>&2 in the loop that runs the tests instead?
How simple, that should work, I'll test that.

FYI I also need to install iproute (runtime shell API test dependency).
Simple enough to just merge it after this gets merged.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
