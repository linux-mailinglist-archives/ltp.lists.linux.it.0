Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 151A169A1BC
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Feb 2023 23:59:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 38B8F3CC129
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Feb 2023 23:59:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 893C33CB289
 for <ltp@lists.linux.it>; Thu, 16 Feb 2023 23:59:43 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E26A9140012C
 for <ltp@lists.linux.it>; Thu, 16 Feb 2023 23:59:41 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EDB3C20386;
 Thu, 16 Feb 2023 22:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1676588380;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uZhOSpL03fa/1iFLyUQih3wpDgoNw4WUVBFo48L5xLk=;
 b=SA7Roz8hUAzzCwele2xQmyLAW+rAq7f9pC3clTyn+86eCgmZlolaM/vQq3h7xYqox2iDWv
 xcnfsrzyYB3v7hLWT+9zMgvv2wMUM1DGsIDEJOBvM6iBpGifIV3ydWFvtlAbDUk3LXvM5K
 zSD00Spnm7Z88vT+L6A8xvJOUkOwTIE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1676588380;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uZhOSpL03fa/1iFLyUQih3wpDgoNw4WUVBFo48L5xLk=;
 b=qU+5Vvs6O4h4LR+79o6dBgHAbYfqqTqnqzljzwN3m3xqaa4CiWJSlHsLsMLnMkjB5Bxt3T
 M6D8IunJj0SRlaDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C8B48131FD;
 Thu, 16 Feb 2023 22:59:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lzCeL1y17mP8OAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 16 Feb 2023 22:59:40 +0000
Date: Thu, 16 Feb 2023 23:59:39 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Leo Liang <ycliang@andestech.com>
Message-ID: <Y+61W2hrAKPJOTAr@pevik>
References: <20230214122509.2957225-1-ycliang@andestech.com>
 <20230214122509.2957225-2-ycliang@andestech.com>
 <Y+uOimkvJ76Q8diX@pevik> <Y+uQB1iojD/0oQDY@yuki>
 <Y+uYAn0RyjKBTfj4@ubuntu01> <Y+uZ+ngyoz94gp9e@yuki>
 <Y+ukQAh4GMXh1TiK@yuki> <Y+3B1yAqIMrivj1O@ubuntu01>
 <Y+3tg68PkP7ce2eV@yuki> <Y+5DHpOxWi0iP8H0@ubuntu01>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y+5DHpOxWi0iP8H0@ubuntu01>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [v2 2/2] lib/tst_pid.c: Increase PIDS_RESERVED to avoid
 fork failure.
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

...
> Understood! Thank you for the detailed explanation!!
> Will send a v3 patch ASAP in accordance with your advice!

Leo, thanks a lot for investing your time in LTP cleanup!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
