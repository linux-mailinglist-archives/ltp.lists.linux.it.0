Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DAD3F00C2
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Aug 2021 11:41:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0AC323C55CE
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Aug 2021 11:41:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 21F0C3C1822
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 11:40:56 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2A7FE1A010FB
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 11:40:55 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7D72D22061;
 Wed, 18 Aug 2021 09:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629279655;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R2qZTDFj82/UeYyf5FBXn9+npXWqtRnHtY42CqOtg/Y=;
 b=syvLmVVYVRZMUcj+AkUypJnA4sA324NJp2iH7Wyb8VVkIpm7cDpsnyvPuFR0JTvH9tD00X
 LLKi0V2BlCh8VfGN1jZIOXgDnPAfhUW41RvHci9eAT+EDA5+AB+wn9bzku+uNlC83NvuG2
 gu0kVSYdhQ3iOI31LIE3CqVBHhRnjLc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629279655;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R2qZTDFj82/UeYyf5FBXn9+npXWqtRnHtY42CqOtg/Y=;
 b=WnLy5QweixbndgRWCr+vC6jMOsqqEIyv+1M5JNwZGqh2Xgup4FcCRo2VnDXf++eeUZbkwc
 85s0T134xrtswvAg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 36E61133D0;
 Wed, 18 Aug 2021 09:40:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id uNKZCqfVHGFFHgAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 18 Aug 2021 09:40:55 +0000
Date: Wed, 18 Aug 2021 11:40:53 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YRzVpQT1zYOvxlWe@pevik>
References: <20210818091224.27578-1-pvorel@suse.cz>
 <20210818091224.27578-2-pvorel@suse.cz>
 <7ac7a1d6-2d97-f8f5-8d60-040eb0753681@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7ac7a1d6-2d97-f8f5-8d60-040eb0753681@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] tst_test.sh: Simplify tst_cmd_available()
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
Cc: Elliott Hughes <enh@google.com>, Joerg Vehlow <joerg.vehlow@aox-tech.de>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

...
> > +	type $1 >/dev/null 2>&1
> I guess there was a reason, why command was used here in the first place.
> Iirc type is often a shell builtin, that can have different behavior, while
> command -v is posix and should be extremely portable.
> So maybe it is better to use "command -v" instead of type here. I hope most
> distributions have a command-command...
Well, I wrote that code, in dba1d50cb :). IMHO both are POSIX and both are shell
builtin.

I tested it on all implementations and the only difference is that both "type"
and "command -v" on dash and busybox sh returns 127 on missing command, the rest
return 1.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
