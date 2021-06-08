Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E688439F97F
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jun 2021 16:47:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 626283C7AF9
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jun 2021 16:47:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D8C993C1D75
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 16:47:05 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6D8661400E14
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 16:47:04 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7446C219AF;
 Tue,  8 Jun 2021 14:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623163624;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KDbQmQriRi3HqUpFnsINweEXfkIzyWnRzDfiVD2FdlE=;
 b=F+vnk0QPMFO1A0IlECYBD1pYf4Ppas+0ANFCkU7RUSNktodP5rg8o4VYXD2pmfZI8YoEAr
 HHWLBPWzkbYJV7skFH/AhwQsoe6Iz0j99wXlSemYWApGmCPYsVq+7vanJ4uQnR2l43p2Tr
 kFNu6dyXrCYEkYHGe0LLD/r2iejCfmg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623163624;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KDbQmQriRi3HqUpFnsINweEXfkIzyWnRzDfiVD2FdlE=;
 b=VVG3vSYJxLwb85qSkW1fJOzZCNISxDArEdbUrwVbS4X+ldH/3COz/bg4siarMP4LnbTaUn
 4fwJD9PgWK9MuyAg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 375E4118DD;
 Tue,  8 Jun 2021 14:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623163624;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KDbQmQriRi3HqUpFnsINweEXfkIzyWnRzDfiVD2FdlE=;
 b=F+vnk0QPMFO1A0IlECYBD1pYf4Ppas+0ANFCkU7RUSNktodP5rg8o4VYXD2pmfZI8YoEAr
 HHWLBPWzkbYJV7skFH/AhwQsoe6Iz0j99wXlSemYWApGmCPYsVq+7vanJ4uQnR2l43p2Tr
 kFNu6dyXrCYEkYHGe0LLD/r2iejCfmg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623163624;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KDbQmQriRi3HqUpFnsINweEXfkIzyWnRzDfiVD2FdlE=;
 b=VVG3vSYJxLwb85qSkW1fJOzZCNISxDArEdbUrwVbS4X+ldH/3COz/bg4siarMP4LnbTaUn
 4fwJD9PgWK9MuyAg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id YFJTDOiCv2C+GQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 08 Jun 2021 14:47:04 +0000
Date: Tue, 8 Jun 2021 16:47:02 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YL+C5hO3dANxCcVD@pevik>
References: <20210607111016.20630-1-pvorel@suse.cz>
 <CAASaF6x1+j+nF=-TpkfLwi9hYXWN5sDVff4oJAKX-eTyH11s8A@mail.gmail.com>
 <YL8nl3nFzTAy+aG0@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YL8nl3nFzTAy+aG0@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [Automated-testing] [RFC PATCH 0/2] Remove floppy and
 CDROM stress tests
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
Cc: Zeng Linggang <zenglg.jy@cn.fujitsu.com>,
 Xiao Yang <yangx.jy@cn.fujitsu.com>,
 automated-testing <automated-testing@yoctoproject.org>, ltp@lists.linux.it,
 Yixin Zhang <yixin.zhang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> Acked by me as well, but let's wait at least till the end of week until
> we apply this.

Sure, I can postpone the deletion till Monday. Thanks for your ack.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
