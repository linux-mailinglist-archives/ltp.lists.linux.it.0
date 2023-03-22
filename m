Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA0A6C50DD
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Mar 2023 17:34:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8D4693CCBFB
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Mar 2023 17:34:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 03C913C5624
 for <ltp@lists.linux.it>; Wed, 22 Mar 2023 17:34:37 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4C1C41A00651
 for <ltp@lists.linux.it>; Wed, 22 Mar 2023 17:34:35 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 571A520FE6;
 Wed, 22 Mar 2023 16:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1679502875; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=abLU0OUS1R8qklp78Wgev8Z6EAhwwPRS721eXmgdr9I=;
 b=eJ/NpDQRkntH+eL2Faezuo/RxtSMJ47DtZDZZBKv5tHk6Qr13p8VOKaLHbjc8+Q8/sa0Iu
 Q0AMxVheZDUK0JJmvJP/b3vxyI4Q/9QFlct+y4CAnzGLzApeWLomYRVkSbszux6jGULAPf
 Rkd18kRTliefV6hkUbV/K5oFDe40Lo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1679502875;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=abLU0OUS1R8qklp78Wgev8Z6EAhwwPRS721eXmgdr9I=;
 b=JfG0SDzceNw2XOAfy2W/rn+12Tz3ouMQxdwPsgmeGixaw+LFFxCAWyg5CMcOLVeUbQAqWs
 PjzYM6uAkuHcErDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4353B13416;
 Wed, 22 Mar 2023 16:34:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vGraDhsuG2R9cwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 22 Mar 2023 16:34:35 +0000
Date: Wed, 22 Mar 2023 17:35:46 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <ZBsuYsWXtnmw83cV@yuki>
References: <20230217151036.10295-1-pvorel@suse.cz>
 <20230217151036.10295-2-pvorel@suse.cz> <ZBr9v2cz6/gmksAW@yuki>
 <20230322162046.GA369840@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230322162046.GA369840@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] tst_net.sh: Detect IPv6 disabled via sysct
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
> No, but we already use sysctl in tst_init_iface():
> sysctl -qw net.ipv6.conf.$iface.accept_dad=0 || return $?
> tst_rhost_run -c "sysctl -qw net.ipv6.conf.$iface.accept_dad=0" || return $?
>
> and we don't check for sysctl (expecting is everywhere). I'd also allow using
> sysctl (and then add a check via tst_require_cmds) or change also these with
> cat for reading and echo ... > for writing. WDYT?

I would say that sysctl is useful when you have a config file with a
bunch of values to be changed, but I would avoid using it in scripts,
because all it does in that cases to perepend the proc part of the path
and converts dots into slashes. And sometimes, when a path component
contains a dot, it fails to replace the right dots into slashes too:

http://lists.busybox.net/pipermail/busybox-cvs/2008-October/028382.html

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
