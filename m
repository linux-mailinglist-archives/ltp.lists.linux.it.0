Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA5270F14F
	for <lists+linux-ltp@lfdr.de>; Wed, 24 May 2023 10:45:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 597A03CD29B
	for <lists+linux-ltp@lfdr.de>; Wed, 24 May 2023 10:45:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9BD263C9956
 for <ltp@lists.linux.it>; Wed, 24 May 2023 10:45:00 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id ADB6F200224
 for <ltp@lists.linux.it>; Wed, 24 May 2023 10:44:59 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CA6561FD6F;
 Wed, 24 May 2023 08:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1684917898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0UD6Y90E/kL0CEZ76rxV+TU72nTGTqLUHdXWaYwv1gY=;
 b=Xy2rWjm1CcAs7cf0zn5ezfXoWCunraTMN5dQZk+p330vxQCXIA1CUh1LUwH/jVkUpLRJy2
 T2FgHupMVj2bHwrMjFtyn0/+srbr+Mu88ALSZrggKtrHUZs/eVrGV4MjtVwWfJQwmhuiNQ
 760pw3uBzy2LgtFLd85pWv2dDcuAaig=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1684917898;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0UD6Y90E/kL0CEZ76rxV+TU72nTGTqLUHdXWaYwv1gY=;
 b=MMnNjVlMZFExhpmMNobR/sPCreAApbsQUvT2T4r4R2Swn4gdNA0CwtoQjwRd3TlnvYgKpx
 +H6gW+/nRBDe9pDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B60E6133E6;
 Wed, 24 May 2023 08:44:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4ugeLYrObWToZQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 24 May 2023 08:44:58 +0000
Date: Wed, 24 May 2023 10:46:08 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <ZG3O0Oe2zlezT0ew@yuki>
References: <20230518113216.126233-1-jlayton@kernel.org>
 <68340cb2-87e1-ff17-2db8-5610beba761b@fujitsu.com>
 <c6c0ae90df044b883ed65ba1896db8b51dfa70d4.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c6c0ae90df044b883ed65ba1896db8b51dfa70d4.camel@kernel.org>
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/statx06: use a fine-grained timestamp
 for the second time fetch
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
> > Now, it is not a right time to review this patch,  I prefer to review 
> > this when your kernel patchset is merged into linux master or 
> > linux-next. Then we can add a comment or a kernel commit id to explain 
> > this..
> > 
> > 
> 
> Fair enough. I don't think there is any issue with taking this patch in
> earlier however.
> 
> The problem with this test is that it makes the assumption that coarse-
> grained timestamps are sufficient to bracket a filesystem operation.
> While that has largely been true in the past, it's certainly not
> specified by any standard.

Do we have any API to ask the kernel what the granularity of filesystem
the timestamps is? Would that make sense to be added if it's not
present?

Apart from that I think that this patch is fine, since the
CLOCK_REALTIME value would be between CLOCK_REALTIME_COARSE and
CLOCK_REALTIME_COARSE + one tick. So the change is backward compatible
and we will not loose any precision in the assertions either.

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
