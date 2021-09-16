Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AE040DB8B
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Sep 2021 15:42:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AFF033C897F
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Sep 2021 15:42:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3D30C3C1D7D
 for <ltp@lists.linux.it>; Thu, 16 Sep 2021 15:42:29 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 288CA600055
 for <ltp@lists.linux.it>; Thu, 16 Sep 2021 15:42:28 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5DD9D20230;
 Thu, 16 Sep 2021 13:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631799748; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D6my520NpEaGdCZ5PMhwFr01ESWy1JGsaKCLXnj4xeI=;
 b=Dj402p1U6zJDZ3ZAiYw5r7k6aJyD36emB1l4xSUqw+GI5rtuxlDfYeSGShZZetTbZ+BTA8
 LE684rVkjNdugXQf7Fxo72cYHhhdnyRgUVsnldII9DIpGsDK77xhaInLTgYFAp2yVVFwdY
 3CuiNjwkOykZXk8bkFMNEXJwLfoqLvg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631799748;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D6my520NpEaGdCZ5PMhwFr01ESWy1JGsaKCLXnj4xeI=;
 b=D3576CDr5D0mYh11WG7QF791TDI1HUmMlf1JFMalSAvGlFyaTyWJna9+DVBoR1q+BkBUhb
 XTCcpzzFLy0Ur+BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4C30013480;
 Thu, 16 Sep 2021 13:42:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BszuEcRJQ2EHbQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 16 Sep 2021 13:42:28 +0000
Date: Thu, 16 Sep 2021 15:42:51 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YUNJ2yuO7UAylQNk@yuki>
References: <20210915134505.22771-1-mdoucha@suse.cz>
 <20210915134505.22771-4-mdoucha@suse.cz> <YUM+76XsQB57U3rE@yuki>
 <1973857f-53fd-6f16-1f7d-d65a371f9c60@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1973857f-53fd-6f16-1f7d-d65a371f9c60@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/4] syscalls/utime03: Convert to new API
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
> >> +	mintime = time(0);
> >> +	TST_EXP_PASS(utime(TEMP_FILE, NULL));
> >> +	maxtime = time(0);
> > 
> > I wonder if this suffers the problem as the ipc timestamps:
> > 
> > https://github.com/linux-test-project/ltp/commit/d37bde3defa12556ba7399f4131996f8e490490a
> 
> Possibly. Let's find out, we can always fix the test in the next release.

I guess that it would also depend on a underlying filesystem and how
timestamps are rounded in there, so I guess that we should turn on the
.all_filesystems flag for the test as well. What do you think?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
