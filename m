Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 762143B0799
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 16:39:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E95AA3C8E69
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 16:39:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5B6213C2244
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 16:39:48 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7A5F11401113
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 16:39:48 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DED112197A;
 Tue, 22 Jun 2021 14:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624372787; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vf7aYd/3ZpC/4481jjwscx7WQTzry95JBwrgIvY3Ra0=;
 b=ysd284NsWnED6mETxGqqGGoM7Mp3BFmr3WyqBvu9/M2JhxIrEvX9K7wIIAlNUO32YfSWBr
 EjOxkvHXWSE+KoTfN7EBCoskf2AYqnahrx87LPFieZoRWHzYYXiUJHArE8GKi2pGPUCSKg
 xlnFVRwtYtTaUJv/auWy1QGPEu62zPg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624372787;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vf7aYd/3ZpC/4481jjwscx7WQTzry95JBwrgIvY3Ra0=;
 b=mxCEyqiJrQ6HCUjcSz3Ou4i6tT62Ltf2HPHcFesBzUj6xLEdRD8MaB39BFVEyBj5KejUpU
 3szVkshJeAW75xAQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id C2A16118DD;
 Tue, 22 Jun 2021 14:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624372787; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vf7aYd/3ZpC/4481jjwscx7WQTzry95JBwrgIvY3Ra0=;
 b=ysd284NsWnED6mETxGqqGGoM7Mp3BFmr3WyqBvu9/M2JhxIrEvX9K7wIIAlNUO32YfSWBr
 EjOxkvHXWSE+KoTfN7EBCoskf2AYqnahrx87LPFieZoRWHzYYXiUJHArE8GKi2pGPUCSKg
 xlnFVRwtYtTaUJv/auWy1QGPEu62zPg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624372787;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vf7aYd/3ZpC/4481jjwscx7WQTzry95JBwrgIvY3Ra0=;
 b=mxCEyqiJrQ6HCUjcSz3Ou4i6tT62Ltf2HPHcFesBzUj6xLEdRD8MaB39BFVEyBj5KejUpU
 3szVkshJeAW75xAQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 5Q4TLjP20WDKYgAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Tue, 22 Jun 2021 14:39:47 +0000
Date: Tue, 22 Jun 2021 16:14:13 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YNHwNTJQ2zVu5rNJ@yuki>
References: <20210615074045.23974-1-rpalethorpe@suse.com>
 <20210615074045.23974-3-rpalethorpe@suse.com>
 <YMirQoiYRYsDP7Sb@yuki> <87czsk51fc.fsf@suse.de>
 <1e7ecce7-2e46-ea46-3c5b-357d53a238c3@suse.cz>
 <YNHoS1L+0toUtAWT@yuki>
 <3dfda1bd-3829-7188-6add-e1755e91df4f@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3dfda1bd-3829-7188-6add-e1755e91df4f@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 3/3] API: Remove TST_ERR usage from
 rtnetlink/netdevice
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
> >>> The test author is guaranteed that the library will not set TST_ERR
> >>> except via the TEST macro and similar.
> >>
> >> Hi, who decided to guarantee this and where is the guarantee documented?
> 
> Guaranteeing that TST_RET and TST_ERR will not be modified makes sense
> for SAFE_SYSCALL()s because they will be used extensively throughout
> test code. But the case is not so clear for primarily setup()/cleanup()
> functions like the af_alg, rtnetlink and netdevice libraries. And note
> that the rtnetlink library allows you to check ACKs manually without
> calling the two functions which will modify TST_ERR.
> 
> So again, where is the extent of this guarantee documented? I haven't
> found any mention of it in the doc/ dir and Richie didn't add any docs
> changes in his patchset either. Documenting this is necessary for both
> test writers and library maintainers.

I guess that it should be added to
doc/library-api-writing-guidelines.txt but that is orthogonal to the
attempt to fix the the library code itself.

> >> Changing the return value to always return errno will be a major PITA
> >> because 95% of error handling happens after some safe_syscall() which
> >> clobbers errno by calling tst_brk() after failure. And if you only want
> >> to return error codes from rtnetlink ACK messages, then there's the
> >> problem what to return when a safe_syscall() fails during cleanup().
> > 
> > For the current code it would be as easy as:
> 
> That code will only result in RTNL_SEND_VALIDATE() always returning 0
> regardless of success or failure, except when tst_brk() terminates the
> whole program.

Ah right, we have to return non-zero if the tst_rtnl_send() or
tst_rtnl_rect() failed. I would be nice to propagete the errno properly,
which we do not do at the moment, but that looks like a lot of effort so
we may as well hardcode something non-zero there as well.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
