Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 170975E5F1F
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Sep 2022 11:57:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C34643CAD52
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Sep 2022 11:57:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 876D63C9111
 for <ltp@lists.linux.it>; Thu, 22 Sep 2022 11:56:59 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A98F31A0148B
 for <ltp@lists.linux.it>; Thu, 22 Sep 2022 11:56:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D635B1F747;
 Thu, 22 Sep 2022 09:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1663840617;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7NFSG7T1LLGCbS7gRiF0WaLyTb1OLBg6rE49igDP7cw=;
 b=apeGYcHzbc4GbtxIjIjv5mHOgq1F3pjQYs98ZXVsdEQkYQcKIzQjDeoj1kBz831Oo73lLl
 eUukTSQWZ+R6MOZoT9pHtR3/mvIk+qXfHHqSYNDuNZUYDqLhdKl4DggmWMRFlrOozWzc/0
 1GnOvQFPu7+IaRWryVYooCmJvGeJOc8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1663840617;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7NFSG7T1LLGCbS7gRiF0WaLyTb1OLBg6rE49igDP7cw=;
 b=ioB7ei5+AZ45PvUt+/FGGQglgi8Hjr6jLEXagEktOOSPVwj8AsGsAgSzy/JVlXnNeLKgFH
 RCsODOKUtdP/RoCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC59B1346B;
 Thu, 22 Sep 2022 09:56:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Z/evI2kxLGNODwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 22 Sep 2022 09:56:57 +0000
Date: Thu, 22 Sep 2022 11:56:55 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YywxZ6sXB1ZaBxhD@pevik>
References: <20220921155006.13360-1-mdoucha@suse.cz>
 <CAEemH2eoxjDha9Ldu9shqO6MUUFfvT3dkFExAHGyH-38E5drVg@mail.gmail.com>
 <b1a19673-de0b-d6e0-0434-3eb457aaf69d@suse.cz>
 <YywgNSfv58iIvFbq@pevik>
 <CAEemH2dcmX4uPHWUABO-UfYXP9rbQ4FT+CQzKFksnn0xQZ71ow@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dcmX4uPHWUABO-UfYXP9rbQ4FT+CQzKFksnn0xQZ71ow@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_supported_fs: Implement checking paths
 against skiplist
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

...
> > Yes, that's not related. I changed it in eb47b4497 ("tst_supported_fs:
> > Support
> > skip list when query single fs") as with 32 one can detect it's TCONF.
> > As long as 0 is success, non-zero for failure.


> Looks like there is no difference to use whatever 32 or 1, as long as
> it's a non-zero, it will work well in the shell.

> Ok, I agree to update the doc (also usage() should be updated) later.
+1, I actually meant usage() in testcases/lib/tst_supported_fs.c.

Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
