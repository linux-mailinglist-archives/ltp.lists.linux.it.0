Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 997765E5BD3
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Sep 2022 09:07:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CE37B3CAD65
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Sep 2022 09:07:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 523B93C9111
 for <ltp@lists.linux.it>; Thu, 22 Sep 2022 09:07:11 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A65811401176
 for <ltp@lists.linux.it>; Thu, 22 Sep 2022 09:07:10 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 99E031F891;
 Thu, 22 Sep 2022 07:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1663830429;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0SLWpH9xKfqNRNbrpwmcP4sh/1YMmfzU4GA8RtwFXYQ=;
 b=oJ9Psc4j92P4rsRXKZhRWPi4lOwt7J1Qt/JxzuMbW6M3h370FvH9zRTT9BFUiHVZmqK9d4
 YR3JUywgSH8YHJhasPIv2CNNEDg82kjYVmOiF+1bIt6e9x///F7BYQVFAujs4EDHY2bzMO
 nNxrhSGcP/hrVo66/DW9FW5jNuhpoTA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1663830429;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0SLWpH9xKfqNRNbrpwmcP4sh/1YMmfzU4GA8RtwFXYQ=;
 b=qiXvu8GOrYM2mEodSSA/I5lECbwP2qQHb0VWsJFICQcP2ZnEu0QweSfstZXLpValiWYvJ8
 a2AtreDnljevFPCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5ECFD1346B;
 Thu, 22 Sep 2022 07:07:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 975pFZ0JLGOfQAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 22 Sep 2022 07:07:09 +0000
Date: Thu, 22 Sep 2022 09:07:07 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YywJm8rokd8rnuYG@pevik>
References: <20220921102655.31156-1-pvorel@suse.cz>
 <CAEemH2fWzcXuOC8-=n9H0p1OAvJhOfB33EAJT0yC06=vS=_7DA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2fWzcXuOC8-=n9H0p1OAvJhOfB33EAJT0yC06=vS=_7DA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] tst_test.sh: Fix filesystem support
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li, all,

...
> > Instead adding yet another binary, I wonder if we could add extra getopt
> > parameter to ask for current filesystem.

> > i.e. to replace:
> > -tst_supported_fs -s skip_list fs_type
> > +tst_supported_fs -s skip_list -d DIR


> +1, and Martin already sent out the achievement patch,
> you can rebase this patch on that.
Yep, I'm planning to do.

> And I'd like to vote for merging your both patches for
> adding to the new release.
+1

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
