Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2F25955B7
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Aug 2022 10:58:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6EFB33C97EF
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Aug 2022 10:58:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4CCAB3C968B
 for <ltp@lists.linux.it>; Tue, 16 Aug 2022 10:58:17 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 829E11A00162
 for <ltp@lists.linux.it>; Tue, 16 Aug 2022 10:58:15 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 64739348F4;
 Tue, 16 Aug 2022 08:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1660640295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BVOve6yVWlZH+Vtui/CJhDgu3sPmmHvZ8/Hu2PN4G60=;
 b=Sy7h1uMVm2WhuxKdEsChJqInZEF4FggYWWHh0yG61IoAvu60fgxgvOM6lWSl5a1KRUBgNn
 F3CYGYZLxmOT+HjdSxTLp9ZsnYnGxmWAEKsZwSE9vFrWZvUR6AUgl37EAVTksBtUIJizVq
 keJlnEU8FBQjijAU64LY6zQbZI/Nv3I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1660640295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BVOve6yVWlZH+Vtui/CJhDgu3sPmmHvZ8/Hu2PN4G60=;
 b=IWgFGikICcV58QB6XtxhunINyL1ITtKIJN5La4X3D0o7CfZn84rLcA4hDAz6B+B3lYP4/2
 wvUHoWlk+zL3jSCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4E1ED139B7;
 Tue, 16 Aug 2022 08:58:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8i+9ECdc+2JmawAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 16 Aug 2022 08:58:15 +0000
Date: Tue, 16 Aug 2022 11:00:10 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Message-ID: <YvtcmjNXd1P18V1g@yuki>
References: <20220811135731.2228-1-pvorel@suse.cz>
 <765b4f35-2cd0-04e1-e405-04261b5ef645@fujitsu.com>
 <YvnqZfyByO42kAX9@pevik>
 <09a4ff13-eaf1-6a97-f868-893c56ac6b4c@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <09a4ff13-eaf1-6a97-f868-893c56ac6b4c@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 0/2] mount03: Convert to new API
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> So I think you should use  SAFE_SETREUID(nobody_uid, nobody_uid);
> and then use code as below:
> 
> 	if (WIFEXITED(status)) {
> 		switch (WEXITSTATUS(status)) {
> 		case EXIT_FAILURE:
> 			tst_res(TPASS, "%s passed", TESTBIN);
> 			return;
> 		case EXIT_SUCCESS:
> 			tst_res(TFAIL, "%s failed", TESTBIN);
> 			return;
> 		default:
> 		case TBROK:
> 			break;
> 		}
> 	}

Can we please stop propagating test success/failure via the exit value?

The problem have been solved years ago by the new test library, the
child just need to call tst_reinit() and tst_res() will work directly
from the child as well. See execlp01.c for example how that works.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
