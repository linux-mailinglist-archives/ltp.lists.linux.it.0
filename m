Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02999690ADA
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Feb 2023 14:49:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 824373CC0A7
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Feb 2023 14:49:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C2DC23C01AA
 for <ltp@lists.linux.it>; Thu,  9 Feb 2023 14:49:43 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BD2951400FB2
 for <ltp@lists.linux.it>; Thu,  9 Feb 2023 14:49:42 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E35B35CFF3;
 Thu,  9 Feb 2023 13:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1675950581;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z0heynYyEzJVsoMewS9AhwNJQec6A6v1D1Sm0V75hhU=;
 b=loWydvYxd+H5nc5WsstP1wGSebYUt4j3KgfQUtRX6DpqrpX6ghUWbqKmpk/9qQDAAQL797
 UeCtY3hzEy4R52jQgz2x1EenTR3/zrVsEpykDvCiCtUaqfSQFE7uJq7h3jEt352bdMreJ8
 SXoLZRL7aapXFaeUeGFFywMwqQs+V5s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1675950581;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z0heynYyEzJVsoMewS9AhwNJQec6A6v1D1Sm0V75hhU=;
 b=98c9hP+EsMUWEYmyialwbMFpJFwqWhs/xOj5ZATEqGgiYdyTCcnKfJl9fjXjssf6DonIrB
 E0gcOSCEEYT8r8Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BD8E9138E4;
 Thu,  9 Feb 2023 13:49:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wRCaLPX55GO6fAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 09 Feb 2023 13:49:41 +0000
Date: Thu, 9 Feb 2023 14:49:39 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Leo Liang <ycliang@andestech.com>
Message-ID: <Y+T58w801imaclXo@pevik>
References: <20230207124008.1788759-1-ycliang@andestech.com>
 <Y+JVPi5jo++joA/g@pevik> <Y+T2qzXrZcGK/EQt@ubuntu01>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+T2qzXrZcGK/EQt@ubuntu01>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] tst_pids.c: fix fork failure on small memory
 systems
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

Hi all,

Thanks Leo, I merged it with MIN(max_pids, max_threads), thanks Cyril for
catching it.

> > BTW IMHO it'd be better to rewrite
> > f = popen("ps -eT | wc -l", "r");
> > to list count of /proc/[0-9]*/ in plain C (TODO for us).


> Thanks for the review!
> I could send a v2 to add this as well.

Thank you, if you have time to send another patch to fix.

Kind regards,
Petr

> Best regards,
> Leo

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
