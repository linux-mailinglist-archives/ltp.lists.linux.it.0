Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 077836C50F9
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Mar 2023 17:42:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D05DC3CD2AD
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Mar 2023 17:42:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 27AB03C5624
 for <ltp@lists.linux.it>; Wed, 22 Mar 2023 17:42:30 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 725B71400982
 for <ltp@lists.linux.it>; Wed, 22 Mar 2023 17:42:29 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2FC6021003;
 Wed, 22 Mar 2023 16:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1679503348; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vnHmGltMrD8UJPdqBJ2w69/tvxqIcz7OH/u/DGlsQns=;
 b=YikZZAZQnZzFMe6GWiKEOi6LfLRt7c+Lvd51QTfe0kQBeqc0aDrFxJP/IGP/9FWarfCrfj
 TG1HV4EWJ//DFqa1PGMa4VQZgzayTN54fVONPLWAZqxIyTjssYEpRqZemdJ53Bf1h3WaQY
 8VSGUurQ36On8yn/V+wlAB88ZtNw4Jw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1679503348;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vnHmGltMrD8UJPdqBJ2w69/tvxqIcz7OH/u/DGlsQns=;
 b=ZUK2l9l23jbtYD8+rrRhFlRzCdZxOeA+Uz3f1Y9+asylfcOHIpwNT3dHO+ied9vTnbphy8
 Rq6PY/1kcUC82DCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1210313416;
 Wed, 22 Mar 2023 16:42:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lPUXBPQvG2TQdwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 22 Mar 2023 16:42:28 +0000
Date: Wed, 22 Mar 2023 17:43:39 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <ZBswO0LzyPJlvWI5@yuki>
References: <20230314114037.25581-1-rpalethorpe@suse.com>
 <20230314175438.GB79562@pevik> <20230320080415.GA179863@pevik>
 <20230320082336.GA182681@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230320082336.GA182681@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Add goals of patch review and tips
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > + also add Tested: link-to-github-actions-run below --- in patch would help
> > (it's than obvious that maintainer does not have to bother with doing it or
> > not hope that it fails on CentOS 7 old compiler or very new Fedora compiler).
> 
> > Maybe also encourage people to create account in the patchwork and maintain
> > status their patches would help (set "Superseded" if they sent new patch version,
> > other statuses like "Accepted" or "Changes requested" are also sometimes
> > forgotten by the maintainer who post comments or merge the patch).
> Example why helping to maintain the patches by submitter would help:
> mknod01: Rewrite the test using new LTP API [1] followed by [v2,1/1] mknod01:
> Rewrite the test using new LTP API [2].
> 
> Li reviewed v2, but later Cyril pushed v1 (manually updating patch) without
> update patchwork. (Li review was ignored, I tried to apply v2 to merge it
> because status was not updated.)

Sorry for that, that happened because v2 was marked as changes requsted
but v1 kept hanging in patchwork and I only realized that later...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
