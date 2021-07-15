Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3A53C9964
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 09:08:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 99BD33C73DA
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 09:08:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2B4BE3C2E33
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 09:08:18 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A2744601A3F
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 09:08:17 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DA2841FDE4;
 Thu, 15 Jul 2021 07:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626332896;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y37azxoSqyfcT6J0msfNo/UaNizAdtGPgE226FsuAz8=;
 b=uxFY7dNzxBW+S6SFUugCUm3QBR2KQjevXMjuAHVfLT/fVZS+SBhBxslXjyOA3V64hNj2FC
 Sf3HE/iLMHg5ECj8C/VF6TPdJ40nmoiIBpr8OO/2zvrdA2ATVgbx5jCf5I3Ix+4q8FH06y
 BhfIlTJFlHSBtkJl6AUttwli97Z5Teo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626332896;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y37azxoSqyfcT6J0msfNo/UaNizAdtGPgE226FsuAz8=;
 b=/EVerzCCs3ORdo8PnZeGhI4Igw3Iz5h/AIkGuvTlPa+5dDyHnosJwULipNSVzky6ezlIeu
 moZc73YiN7FZNtDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A53A513C27;
 Thu, 15 Jul 2021 07:08:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nw1dJuDe72CxXgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 15 Jul 2021 07:08:16 +0000
Date: Thu, 15 Jul 2021 09:08:15 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <YO/e3wcY8oXyFCO5@pevik>
References: <20210714180840.160798-1-amir73il@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210714180840.160798-1-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/fanotify: Fix running tests in a loop
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
Cc: Jan Kara <jack@suse.cz>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Amir,

> Both fanotify19 and fanotify18 leaked fds when run in a loop.
> fanotify19 was not checking child process exit status correctly
> which resulted in random failures.

Thanks for a quick fix!
Reviewed-by: Petr Vorel <pvorel@suse.cz>

FYI both fixes prolonged running for about 100% (comparing with runs on master
which don't fail). Of course, that's not a problem at all, it's just interesting
for me how simple closing of file descriptor can be expensive.

Kind regards,
Petr

# time ./fanotify19 -i40

Summary:
passed   360
failed   0
broken   0
skipped  0
warnings 0

real	0m0,871s
user	0m0,028s
sys	0m0,116s

vs.

Summary:
passed   360
failed   0
broken   0
skipped  0
warnings 0

real	0m0,387s
user	0m0,016s
sys	0m0,122s

# time ./fanotify19 -i10
Summary:
passed   160
failed   0
broken   0
skipped  0
warnings 0

real	0m0,436s
user	0m0,032s
sys	0m0,128s

vs.

Summary:
passed   160
failed   0
broken   0
skipped  0
warnings 0

real	0m0,876s
user	0m0,052s
sys	0m0,105s

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
