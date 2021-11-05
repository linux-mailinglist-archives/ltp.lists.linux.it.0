Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8788C446071
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Nov 2021 09:12:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 517A13C7350
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Nov 2021 09:12:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6303E3C69B7
 for <ltp@lists.linux.it>; Fri,  5 Nov 2021 09:12:36 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D85FF1400C4B
 for <ltp@lists.linux.it>; Fri,  5 Nov 2021 09:12:35 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 07F4A212BD;
 Fri,  5 Nov 2021 08:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1636099955;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yza8LMO/gd4yLc5PjnSujhT7PhGlY8E0N/ZSvI0LZ00=;
 b=tyXejRJt8j2e0bEhehOGu5+4hsqsXbORYO/e+9uN7KNejdWrr1BDw3IciXJBYy7P0H0yaG
 baWy9bJAfgOw/whR/ARu9veXEvefMSKq5qTDkz+I0yBHlgyQVW0Bwz5Gf4nxflMDs8pRf9
 rhS7U1fxlf4E6x581BCe9uT/UtAzPCU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1636099955;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yza8LMO/gd4yLc5PjnSujhT7PhGlY8E0N/ZSvI0LZ00=;
 b=UM7hnzLWUWmWQUUb33aK/9nW91F/AThT6oH3TjLIrS4vBBp+SocSzL8h6Thz6kT3Dz+BYo
 woVKzbDorIcXCqAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C53B913DFC;
 Fri,  5 Nov 2021 08:12:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id c96JLnLnhGEUQgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 05 Nov 2021 08:12:34 +0000
Date: Fri, 5 Nov 2021 09:12:33 +0100
From: Petr Vorel <pvorel@suse.cz>
To: zhaogongyi <zhaogongyi@huawei.com>
Message-ID: <YYTncV1JJVMuyseS@pevik>
References: <7c11918db7c34d3aa0af98cb42b7970e@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7c11918db7c34d3aa0af98cb42b7970e@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/fanotify: Kill the child process before
 exit
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
Cc: Matthew Bobrowski <repnop@google.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Zhao,

...
> > I don't feel like there's a need to introduce another helper here to
> > explicitly handle the cleanup case, but I could also be wrong.

> When we run the testcase simultaneously, and the ulimit of open files is small, the testcase will fail and remain
> many while(1) tasks in system, it makes the system very stuck.

This kind of info is worth of adding into git commit message.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
