Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD504CB6D4
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Mar 2022 07:14:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4BC083CA312
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Mar 2022 07:14:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C6AD63C5924
 for <ltp@lists.linux.it>; Thu,  3 Mar 2022 07:14:40 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4A873601029
 for <ltp@lists.linux.it>; Thu,  3 Mar 2022 07:14:38 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 029611F383;
 Thu,  3 Mar 2022 06:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1646288078;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jfTudueYrA5s2/BQpYODQ25bKfR5/dSHKUc1lu/BkMc=;
 b=T+KvAvFBCYgdvadqAdulbLsRocNLD/rDBvdU/WRMfnqGBPAVUnMKNSZuQxKsZ7YafJOUtV
 MClrUJlX81jdi7gaus63BUWSnrFdIiI4mYUQ2ACM/IqTfklA7jDAALQxXDaSqCrvH0mRD5
 rdZ46J/18Xov4swkRevm5b0Aahl8rXs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1646288078;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jfTudueYrA5s2/BQpYODQ25bKfR5/dSHKUc1lu/BkMc=;
 b=xjVhRe4n0D7JtkpVlc4eVVgEJA4PpLkgqtL7izB1BgaFp7FB9ElRqDNxV9+/1amMqIU1bj
 2WCoMonZQM9MwnDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B5F65132C1;
 Thu,  3 Mar 2022 06:14:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QYAFKs1cIGKrIAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 03 Mar 2022 06:14:37 +0000
Date: Thu, 3 Mar 2022 07:14:34 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YiBcyvtqTX1CerM4@pevik>
References: <20220223200731.1859670-1-yaelt@google.com> <Yh+S7JD2q8oalRoM@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yh+S7JD2q8oalRoM@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] syscalls/keyctl09: test encrypted keys with
 provided decrypted data.
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
Cc: linux-integrity@vger.kernel.org, Yael Tzur <yaelt@google.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril, Yael,

> Hi!
> The test looks good to me now.

> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

> Looking at the kernel counterpart it is still in the next tree. We
> usually wait until the kernel functionality is part of a kernel release
> in order to make sure that there are no changes done to the
> kernel-userspace API.
Good (last time I checked it wasn't there).
For my record:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20220302&id=cd3bc044af483422cc81a93f23c78c20c978b17c

> I this case I guess that in this case the change is so minimal that we
> can add this test into LTP once it reaches Linus tree.
Cyril, maybe we could finally merge our policy (waiting ack for you):
https://patchwork.ozlabs.org/project/ltp/patch/20220203101803.10204-1-rpalethorpe@suse.com/
and put keyctl09 into runtest/staging now.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
