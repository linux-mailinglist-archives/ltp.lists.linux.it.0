Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4594447CDE0
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Dec 2021 09:14:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 28F833C9285
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Dec 2021 09:14:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9A7AC3C0B90
 for <ltp@lists.linux.it>; Wed, 22 Dec 2021 09:14:35 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id BA667601F19
 for <ltp@lists.linux.it>; Wed, 22 Dec 2021 09:14:34 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F22711F37E;
 Wed, 22 Dec 2021 08:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1640160874;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GThHWOdu7qoLAIc4HAwAwfMwwXUWXToaQMiaMQyP5hY=;
 b=2PvG13H6lKJNzaRLVw4OyxyIdBQpz6j6QZNKichIJEoS7CjdAuTWgyvTLjmTIghjvEDKRh
 8Q/CHhYmRPlWU9Q2V1QbsPN5MiJRrj/mnupRRPwFOiAP+nZIrv4x2WcrbLjEtEq9K7q9rm
 w37137aT3rlN4UAkInGX1udVxd5npYs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1640160874;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GThHWOdu7qoLAIc4HAwAwfMwwXUWXToaQMiaMQyP5hY=;
 b=Io7EaXKl3FKZuuvGzxwTIss2z4Tnp58hWQH1gRwFC0fMkbFxF0BsOMQdH0/BCGde8zZA3P
 ELC6kWI9ECV3vkCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AF64D13CDA;
 Wed, 22 Dec 2021 08:14:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dz/jKGnewmH2OgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 22 Dec 2021 08:14:33 +0000
Date: Wed, 22 Dec 2021 09:14:32 +0100
From: Petr Vorel <pvorel@suse.cz>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Message-ID: <YcLeaPJmSvmUJwJO@pevik>
References: <20211221193500.31950-1-pvorel@suse.cz>
 <61C28CB8.3050209@fujitsu.com>
 <CAEemH2cqTErtNZka8X3L3AgOhy-a2x8fqy1k-QKJWiXc7wA2fA@mail.gmail.com>
 <61C2C02A.90104@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61C2C02A.90104@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] lib: Skip tst_{disable,
 enable}_oom_protection() for non-root
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
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xu,

> > This is not working as expected in Github CI. I'm still looking at the
> > problem.
> > https://github.com/wangli5665/ltp/runs/4602025797?check_suite_focus=true
> I tested local but it works well. I guess ci fails because of linux user 
> namespace. Maybe we should require CAP_SYS_RESOURCE cap instead of using 
> geteuid.
Good catch, verifying.

Kind regards,
Petr

> Best Regards
> Yang Xu

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
