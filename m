Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB18475650
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Dec 2021 11:27:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7D1E43C8DF8
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Dec 2021 11:27:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7AA793C2BBF
 for <ltp@lists.linux.it>; Wed, 15 Dec 2021 11:27:13 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C03541A01525
 for <ltp@lists.linux.it>; Wed, 15 Dec 2021 11:27:12 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8A259212BD;
 Wed, 15 Dec 2021 10:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1639564031; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uWir3Egtqz8dcAy6ZyiVvEp3MJMfb+NgQfiXhz0SqrQ=;
 b=yF6D/KJhNMnYLdJdDzzDEkhsvIdwMIcwXE4rYZlAjfl3pi0GwL0RFX/SNKfRc7uhb5WH8b
 z2512Spn5OmuOhF9cJKGclm8hhaeYxM40UmFxrLerRyCfdaNX/suuQEWL9uf44cnCymARK
 LfnFnKJqAWVSgkn0WcvMaGhWOoLGeVc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1639564031;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uWir3Egtqz8dcAy6ZyiVvEp3MJMfb+NgQfiXhz0SqrQ=;
 b=EdvpO9olITGQmC4HJYmzKelspYx8M2saDdg4RVkI0CBiEFs0Ww3Ck55ryUsEoVb2r74BN3
 BE96B7YHvTs3LJCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 743CB13B1C;
 Wed, 15 Dec 2021 10:27:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OyNBG//CuWHsbwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 15 Dec 2021 10:27:11 +0000
Date: Wed, 15 Dec 2021 11:28:36 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YbnDVLypfHi/8622@yuki>
References: <20211215101642.2464-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211215101642.2464-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] ci: Don't run wiki mirror on LTP forks
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
> Forks obviously don't have rights to push to official wiki:
> remote: Permission to linux-test-project/ltp.wiki.git denied to github-actions[bot].
> fatal: unable to access 'https://github.com/linux-test-project/ltp.wiki/':
> The requested URL returned error: 403
> 
> Although script could be easily modified to mirror fork's wiki, IMHO we
> don't want to have duplicate wiki content all over github (currently
> there are 811 LTP forks).
> 
> Fixes: 43316ef67a ("github: Add action to update wiki")
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>

Sounds like an obvious fix.

Acked-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
