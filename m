Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D3348E6EE
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jan 2022 09:53:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 47F7A3C9539
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jan 2022 09:53:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 00D513C9525
 for <ltp@lists.linux.it>; Fri, 14 Jan 2022 09:53:12 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 047AB2009EB
 for <ltp@lists.linux.it>; Fri, 14 Jan 2022 09:53:11 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 15DD81F3BF;
 Fri, 14 Jan 2022 08:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1642150391;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8IHZ/Hky+no6jLGdjAJCDrjLZc5+zFZ1khnmnGZuMN8=;
 b=XWOMasDra8vtmEW5T/qHkXJFqZ/VKGeNDPA440PeSjOo7KvaPnV6D+0zBHWObdG3CuykYF
 84tr8GnebmZ8H9q7ggm5rBjWH7THpU+M66hwHXroFngoHIoA/hkySN5w710yaNDkeq10yu
 lToJ208E0sLloJ6bRkjxJngdDlksCOc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1642150391;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8IHZ/Hky+no6jLGdjAJCDrjLZc5+zFZ1khnmnGZuMN8=;
 b=oj0ABhrhHbhJTd8wH+BNz+ZRs0+Nm5Q+PQIq+R/tDE8KLc/BU9ScZYoKSwR07XzrjdQIoD
 oi0pFvjZ3qW2mwBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CBD1713C16;
 Fri, 14 Jan 2022 08:53:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IXe4LvY54WFWfQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 14 Jan 2022 08:53:10 +0000
Date: Fri, 14 Jan 2022 09:53:09 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Mimi Zohar <zohar@linux.ibm.com>
Message-ID: <YeE59WLtUBP04i/r@pevik>
References: <20220112150123.13768-1-pvorel@suse.cz>
 <8f0d69607590096c1be5d7c4c2a3ece316100ca0.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8f0d69607590096c1be5d7c4c2a3ece316100ca0.camel@linux.ibm.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] ima_measurements.sh: Use /proc/uptime instead
 of date
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
Cc: alexhenrie24@gmail.com, linux-integrity@vger.kernel.org,
 Alex Henrie <alexh@vpitech.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Mimi,

> On Wed, 2022-01-12 at 16:01 +0100, Petr Vorel wrote:
> > It fixes more iterations (e.g. -i2) which is more precise.
> > date +%s could be used, but it's better use procfs file instead
> > requiring binary.

> > Signed-off-by: Petr Vorel <pvorel@suse.cz>

> Thanks, Petr.

> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>

Thanks a lot for your review, merged.

Kind regards,
Petr


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
