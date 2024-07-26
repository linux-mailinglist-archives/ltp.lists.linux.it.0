Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4704993D49A
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jul 2024 15:51:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 16FAE3D1C62
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jul 2024 15:51:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AB4443CF2B6
 for <ltp@lists.linux.it>; Fri, 26 Jul 2024 15:51:33 +0200 (CEST)
Authentication-Results: in-5.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=digikod.net (client-ip=84.16.66.172;
 helo=smtp-42ac.mail.infomaniak.ch; envelope-from=mic@digikod.net;
 receiver=lists.linux.it)
Received: from smtp-42ac.mail.infomaniak.ch (smtp-42ac.mail.infomaniak.ch
 [84.16.66.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 51F5A60563D
 for <ltp@lists.linux.it>; Fri, 26 Jul 2024 15:51:32 +0200 (CEST)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch
 [10.7.10.107])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4WVq104dKwzk5H;
 Fri, 26 Jul 2024 15:51:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
 s=20191114; t=1722001892;
 bh=KFbbw4xdpGnnzGNv+MpeS05EjuhAsjHohvW89oM7iiI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=z+EX2Pj/XV+g+qGIsVsyJz+82ALrA5mPk5XK4uzOJcU5vrrOUYQ6brlWupFsZUdJ4
 Le6vdP1isVEXNQS2ZRiU+Nkn9BSgp8eLFU6BCuAf6FkH+DTpOj7i49hr1igxozdXm0
 bTpQOe8/HRtJDkCh1i4/Wkkk0i7+7832g9FqWmQ8=
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4WVq101NrFztnT; Fri, 26 Jul 2024 15:51:32 +0200 (CEST)
Date: Fri, 26 Jul 2024 15:51:29 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20240726.Moowae0jipai@digikod.net>
References: <20240725-landlock-v4-0-66f5a1c0c693@suse.com>
 <20240725-landlock-v4-5-66f5a1c0c693@suse.com>
 <20240726132440.GC1066866@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240726132440.GC1066866@pevik>
X-Infomaniak-Routing: alpha
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v4 5/5] Add landlock06 test
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
Cc: gnoack@google.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Jul 26, 2024 at 03:24:40PM +0200, Petr Vorel wrote:
> Hi Andrea,
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
> Few notes below.
> 
> ...
> > +static struct tst_test test = {
> > +	.test_all = run,
> > +	.setup = setup,
> > +	.cleanup = cleanup,
> > +	.min_kver = "6.10",
> nit: would not be able to check the availablity via landlock ABI == 5?

Because Landlock is available since 5.13, I guess min_kver should be set
to the same version.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
