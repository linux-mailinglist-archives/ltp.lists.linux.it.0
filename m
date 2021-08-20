Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB253F2C12
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 14:29:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2814E3C4F4F
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 14:29:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0F04F3C18F7
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 14:29:26 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 649906010EA
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 14:29:26 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8A04722138;
 Fri, 20 Aug 2021 12:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629462565;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OaX4iQ2cLU8ZHpI0pMGH+rbzmbWlHvCIp+8WWrrHTCE=;
 b=Hs4XCJhXQUvy2vAjw+4J0f8nvyGDfOx0kF2aVT/Fkh43AmNMZZb1CxiuYZT/3S1lD9kiAB
 p8b94IjgDc+y9j/a1/SqYB4l1Rhs3FiijXYwWpEfbFZAd630fMyCYZQ9pxAYqimrG2eU6T
 AYQhkrvPZOG1Qv3h1p4YBNVprD8fLg8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629462565;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OaX4iQ2cLU8ZHpI0pMGH+rbzmbWlHvCIp+8WWrrHTCE=;
 b=GoCAWk0Jwc2isS8h70L3xF14J2ckUozZHaxlb9hV5QfogJrZ4ZdBK6Qw3B49cwcFIjh8Ju
 hk2K7bSMGBgqamBw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 69B2C13AD1;
 Fri, 20 Aug 2021 12:29:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id HTDzFyWgH2EECAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Fri, 20 Aug 2021 12:29:25 +0000
Date: Fri, 20 Aug 2021 14:29:23 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YR+gIw3PNm7osPsJ@pevik>
References: <20210804120446.32835-1-aleksei.kodanev@bell-sw.com>
 <20210804120446.32835-3-aleksei.kodanev@bell-sw.com>
 <YR+H7ar8cYin8mHe@pevik>
 <682fbc24-5b58-aacf-a3cc-8648ea52be33@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <682fbc24-5b58-aacf-a3cc-8648ea52be33@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] network/tst_net.sh: extend the pattern in
 tst_ping_opt_unsupported()
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Alexey,

> Hi Petr,
> On 20.08.2021 13:46, Petr Vorel wrote:
> > Hi Alexey,

> >> -	ping $@ 2>&1 | grep -q "invalid option"
> >> +	ping $@ 2>&1 | grep -qE "(invalid|unrecognized) option"

> > Which implementation needs it? Both ping from iputils and busybox report
> > "invalid option".


> It's busybox/ping that is using musl libc getopt():
> misc/getopt.c:			__getopt_msg(argv[0], ": unrecognized option: ", optchar, k);

Ah, thx for info.
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
