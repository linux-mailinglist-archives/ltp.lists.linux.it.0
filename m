Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E778948C6F5
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Jan 2022 16:18:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 42A143C9494
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Jan 2022 16:18:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AEC423C9468
 for <ltp@lists.linux.it>; Wed, 12 Jan 2022 16:18:55 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2F0A0600836
 for <ltp@lists.linux.it>; Wed, 12 Jan 2022 16:18:54 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 38D262171F;
 Wed, 12 Jan 2022 15:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1642000734;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UBYCDBK8D2MiTvv7DDnsZjDP3yELJIBGrLZVNr5RE/w=;
 b=t2S34adTr8p5mlVmDezRTKuycMhMHAirzKmRxdAzgwRuBUlo59WYJHYszsH9h57lekHzJQ
 DAa/Ll/wh1xUtTdbrSBCe0wdBw1ryOsP5YLu25MePrfPGBljFpQGLcv/64A8QPFW2BzoUL
 eUB0Q9MgUwPC85e8c6LCMRbT6ITigo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1642000734;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UBYCDBK8D2MiTvv7DDnsZjDP3yELJIBGrLZVNr5RE/w=;
 b=kSkKJxrR+Y77MZ0W2Pk+tosJb6J6riYuVrWY5Js2VSmjYdE8kR8v7uRr3joT362GUMdlUx
 DnmjbJaxGJiFaLBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 77DFB13B70;
 Wed, 12 Jan 2022 15:18:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rKxvGl3x3mFaHQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 12 Jan 2022 15:18:53 +0000
Date: Wed, 12 Jan 2022 16:18:50 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Kushal Chand <kushalchand@zilogic.com>
Message-ID: <Yd7xWuhoI+IBUi9l@pevik>
References: <20220111150028.92961-1-kushalchand@zilogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220111150028.92961-1-kushalchand@zilogic.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] tst_taint: Print readable error message
 instead of numerical code
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

Hi Kushal,

>  	if ((taint & taint_mask) != 0)
> -		tst_brk(TBROK, "Kernel is already tainted: %u", taint);
> +		tst_brk(TBROK, "Kernel is already tainted: TAINT_D (OOPS)");

Kernel can be tainted before testing with different flags than D.

If you don't like the number, how about create function to map taint flag to
char? i.e. similarly to tst_strerrno()?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
