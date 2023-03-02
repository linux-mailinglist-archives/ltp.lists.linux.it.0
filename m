Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 774846A8039
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Mar 2023 11:47:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F7633CB9FB
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Mar 2023 11:47:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F00463CB9CF
 for <ltp@lists.linux.it>; Thu,  2 Mar 2023 11:47:21 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 77BCE1A00CC9
 for <ltp@lists.linux.it>; Thu,  2 Mar 2023 11:47:21 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A4DD11FE65;
 Thu,  2 Mar 2023 10:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1677754040;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rDpkYi6l28OUZ543X0lsOi/fUjGlhsA2DPoTtul99xU=;
 b=NGKNmT5vl7RpNvPQDA5cznHeB0oRsjf5qTU256nBDN/lOrXiJu6QbtTms+mD89nqW8rvz3
 IARVb3TiqE3X1wuQLu3NZFQlKUegkWg674k03EQj0hCspNbiu9Rwn4C3tJZkL+lmBjhOSp
 KCFxcRGa3FX60v7OwrJ/jTWmRlqAqS0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1677754040;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rDpkYi6l28OUZ543X0lsOi/fUjGlhsA2DPoTtul99xU=;
 b=9UHOPZeoQ2+cMQKMdfGhfs7Mwdwoxo5fg/W+5JM5yo+xIs+Qt2pYxHJ/Omp9Ugz4b7EnqV
 CLLZplKQorP9SbDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 72D4313349;
 Thu,  2 Mar 2023 10:47:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7vJsGbh+AGQ9ZgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 02 Mar 2023 10:47:20 +0000
Date: Thu, 2 Mar 2023 11:47:18 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20230302104718.GA3854@pevik>
References: <20230302103552.10800-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230302103552.10800-1-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fsconfig03: Fix return value validation on older
 kernels
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

Hi Martin,

> On older kernels, Btrfs is not the only filesystem using the legacy
> fsconfig() handlers. Assume that fsconfig() is using legacy_parse_param()
> and allow it to return success regardless of filesystem up until the point
> where the legacy buffer would get full.

LGTM, thanks!

Reviewed-by: Petr Vorel <pvorel@suse.cz>

> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---

> Tested on kernel 5.3 both with and without the CVE fix.
Obviously still works on new kernel as well (tested on 6.1.x).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
