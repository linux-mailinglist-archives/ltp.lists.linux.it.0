Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 009673A7DA7
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 13:53:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A52423C8962
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 13:53:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9618E3C2E0F
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 13:53:13 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 22FB1100037B
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 13:53:12 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 720461FD2A;
 Tue, 15 Jun 2021 11:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623757992;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dlg/IxokjnNlYkBcykaZcf8cbdJbqzPP9YjAgOrzy3w=;
 b=QmccwKSyD7vJQ8OxpT7JojBI/Ybc4D5owslme0mKyUyc7mnhQurl86BikT7E6xU2xx3Tjq
 OJGiRbZeW5qrAWSEhj/e14pwJt9c/IR8Fdk43mvc1mK5+IbYUuRr71m3AHJ+vnk2EPyXy0
 0JOxPX2NTOLji04j5KLsH0rxnw3ZQE8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623757992;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dlg/IxokjnNlYkBcykaZcf8cbdJbqzPP9YjAgOrzy3w=;
 b=Maat59/LWxZy+0UQmGsZaa7t/+29fgYEfC5rAd/Je5nIkxHjytgGrKamPwWpw8T4L3z6rG
 BFbcGEhhPmmdR+AQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 133D2118DD;
 Tue, 15 Jun 2021 11:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623757992;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dlg/IxokjnNlYkBcykaZcf8cbdJbqzPP9YjAgOrzy3w=;
 b=QmccwKSyD7vJQ8OxpT7JojBI/Ybc4D5owslme0mKyUyc7mnhQurl86BikT7E6xU2xx3Tjq
 OJGiRbZeW5qrAWSEhj/e14pwJt9c/IR8Fdk43mvc1mK5+IbYUuRr71m3AHJ+vnk2EPyXy0
 0JOxPX2NTOLji04j5KLsH0rxnw3ZQE8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623757992;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dlg/IxokjnNlYkBcykaZcf8cbdJbqzPP9YjAgOrzy3w=;
 b=Maat59/LWxZy+0UQmGsZaa7t/+29fgYEfC5rAd/Je5nIkxHjytgGrKamPwWpw8T4L3z6rG
 BFbcGEhhPmmdR+AQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id oI4vA6iUyGDBVAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 15 Jun 2021 11:53:12 +0000
Date: Tue, 15 Jun 2021 13:53:10 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>, Jan Stancek <jstancek@redhat.com>,
 ltp@lists.linux.it, Li Wang <liwang@redhat.com>,
 Xiao Yang <yangx.jy@cn.fujitsu.com>, Yang Xu <xuyang2018.jy@fujitsu.com>,
 automated-testing <automated-testing@yoctoproject.org>,
 Zeng Linggang <zenglg.jy@cn.fujitsu.com>,
 Yixin Zhang <yixin.zhang@intel.com>
Message-ID: <YMiUphhO3WeJtZSt@pevik>
References: <20210607111016.20630-1-pvorel@suse.cz>
 <CAASaF6x1+j+nF=-TpkfLwi9hYXWN5sDVff4oJAKX-eTyH11s8A@mail.gmail.com>
 <YL8nl3nFzTAy+aG0@yuki> <YL+C5hO3dANxCcVD@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YL+C5hO3dANxCcVD@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> > Hi!
> > Acked by me as well, but let's wait at least till the end of week until
> > we apply this.

> Sure, I can postpone the deletion till Monday. Thanks for your ack.

Merged. Thanks for your ack.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
