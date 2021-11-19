Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF224570B4
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Nov 2021 15:33:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B58C53C8A8F
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Nov 2021 15:33:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7AE7D3C0681
 for <ltp@lists.linux.it>; Fri, 19 Nov 2021 15:33:24 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id F1F6114016FB
 for <ltp@lists.linux.it>; Fri, 19 Nov 2021 15:33:23 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EC2AA212CA;
 Fri, 19 Nov 2021 14:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1637332402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aqckAGf9mATZBnUBcHNVl/AQCcewNxTmGUFtZtPJB1M=;
 b=xlJBKZU/soolSK2TtnymFyed4fHaz4s1mTyWTQoI86u3Ady9GCS+ZScRc9XHM1VQOooxxR
 +L2w6PSt7P3Ri3AKAi3B+VXtik/YQftSDvmB1X7Av7dR4YF0GR9XguZhdGEJYT3H4ZPYfX
 oeeTQIDo8FF62jI+YMEzHhiFryl8kXE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1637332402;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aqckAGf9mATZBnUBcHNVl/AQCcewNxTmGUFtZtPJB1M=;
 b=Ly0aqW1ZAeE/wb/rrw+wXWzQ7uSbWvQNy9DJ4BXvLbDruRWY+b656YSI05FDtRdxZy79U9
 iAGOJA33HfIXPSDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D7CA313B32;
 Fri, 19 Nov 2021 14:33:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FwcgM7K1l2EaBQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 19 Nov 2021 14:33:22 +0000
Date: Fri, 19 Nov 2021 15:34:27 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YZe180T8PrMQ3sYu@yuki>
References: <20211119074602.857595-1-lkml@jv-coder.de>
 <20211119074602.857595-2-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211119074602.857595-2-lkml@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 01/12] posix/pthread_create/15-1: Supress warning
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> The script has a strange implementation, that just greps for "main" in the c file.
> Based on that it decides if the file should be a test or a run-test.
> Other tests in the suite including the main-function from testfrmw/threads_scenarii.c
> also use a comment, that supresses the message

I think that the testfrmw should be cleaned up and rewritten or even
better we should get rid of it completely in the long term...

Anyways applied, since this is simple enough.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
