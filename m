Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7C75F0DAF
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Sep 2022 16:36:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5BE053C9586
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Sep 2022 16:36:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EF17D3C9586
 for <ltp@lists.linux.it>; Fri, 30 Sep 2022 16:36:27 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 74D94601F4B
 for <ltp@lists.linux.it>; Fri, 30 Sep 2022 16:36:26 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5160D1F88B;
 Fri, 30 Sep 2022 14:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1664548586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4IGOkdaWQzZdXUY8y0bYTOR6KnPJdpS1Of2JTypkhjU=;
 b=qK94cILCYuJkHpmF/KS7THiyVC3GWd6NOI0RMrnWOSd2wTFhAEp79tPTDKsRY8mlvh2mxQ
 56wNsC5/sXwDu74RVI4smjwJhbW71IjpZa3kfnubF4BMRdnaKKYARDA1sajAo/AxcYbMdb
 kocXEraIyED7AKbI6PZA2iN/ppX9A84=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1664548586;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4IGOkdaWQzZdXUY8y0bYTOR6KnPJdpS1Of2JTypkhjU=;
 b=VdFYes8LQdk7WLyBbANVX33lDziHYeQLFsV2lM4SeZfc+VO+tce73dIeoKiPSG5DicmCMq
 m7BgS/EWHVo9avDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 77D8813677;
 Fri, 30 Sep 2022 14:36:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id y63iGOn+NmMMXQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 30 Sep 2022 14:36:25 +0000
Date: Fri, 30 Sep 2022 16:38:18 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <Yzb/WiPvCDvv8A36@yuki>
References: <20220930112434.13038-1-pvorel@suse.cz> <YzbV5JFPNNoVmqth@yuki>
 <YzbbgS6O0vBPUXbp@pevik> <Yzb87NdckmwzQiWN@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yzb87NdckmwzQiWN@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] tst_test.sh: Fix missing cleanup run from
 setup
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > I rerun whole LTP tests on 3 SLES versions, most of the shell tests on
> > Tumbleweed, I'll also try some shell tests on some Debian version.
> > Also CI passed (which runs make test-shell), + I run make test-shell manually
> > (covers more than CI), but that's not that relevant as we don't cover much.
> 
> Tests results looks ok, looked into the output (not just the exit code),
> thus I merged this. This should be the last commit, we can tag the release and
> the rest of the release process.

Sounds good to me. Feel free to tag the git, you signed for generating
and uploading the tarballs anyway. I'm preparing release notes and send
them once tarballs are uploaded on github.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
