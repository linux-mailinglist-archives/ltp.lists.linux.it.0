Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC6E3FF06F
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 17:46:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3D9053C939D
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 17:46:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 664CA3C28F4
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 17:46:07 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2F4AB601140
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 17:46:05 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 50B331FDA4;
 Thu,  2 Sep 2021 15:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630597565;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PUD93pRTqQ01/LLQqfR7DIKhTojywFde3iZKxRA+1es=;
 b=1OrPqAawiriScIbrSUVU9WyBgdXAnst6b9yxKuxy7Dy2BLW+c/BqLGZ05PMx9eKgQ1nDtW
 T5SsPwpdyyN+nicS1SrUyji3IV9zw5fXi2QPVa7iqdUyZi2Hy4cTXWoSRXQIz+6tH5nsCz
 RAIdvbpO/cgFvQWtdocpDvyWQsz0g6s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630597565;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PUD93pRTqQ01/LLQqfR7DIKhTojywFde3iZKxRA+1es=;
 b=mQmMZKL4ufC6y3TXcFmhj2SZha/KXLKf1+MfOT24EEgLXevBVYEIMhdp3gURX/q/xaCxHc
 APcS+X423SczEPDA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 02D551372E;
 Thu,  2 Sep 2021 15:46:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id MtlAOrzxMGFVPQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Thu, 02 Sep 2021 15:46:04 +0000
Date: Thu, 2 Sep 2021 17:46:03 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YTDxu0w4mJGNCHTq@pevik>
References: <20210902103740.19446-1-pvorel@suse.cz>
 <20210902103740.19446-2-pvorel@suse.cz> <YTDO/mybX60s0agj@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YTDO/mybX60s0agj@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/4] doc: Mention make check
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Hi!
> >  --------------------------------------------------------------------------------
> >   statvfs01 statvfs01
> >   statvfs02 statvfs02
> > - 
> > +
> >  +statx01 statx01
> >  +
> >   stime01 stime01
> >   stime02 stime02
> > - 
> > +

> If we were pedantic this should probably be in a separate patch...
Yep. I removed this change (unintentional, my editor setup) and merged.
Thanks for review!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
