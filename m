Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2493916DB
	for <lists+linux-ltp@lfdr.de>; Wed, 26 May 2021 14:00:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 181B13C992F
	for <lists+linux-ltp@lfdr.de>; Wed, 26 May 2021 14:00:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 02F703C29FA
 for <ltp@lists.linux.it>; Wed, 26 May 2021 14:00:04 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0535C6005EF
 for <ltp@lists.linux.it>; Wed, 26 May 2021 14:00:03 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by smtp-out2.suse.de (Postfix) with ESMTP id 508C41FD2A;
 Wed, 26 May 2021 12:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622030403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iHcA1kmx6DXoMyQxq4pc9DsCZPkc/oEEKI7fk9CuMAI=;
 b=nIKUo1LcYACx1dJw0QOL9TKkBErD6UwnTREHPKyptNBzlLdqOV658XEigNqcxuXp73hY/V
 LkjfQyyNqqgvgIzYWallXYii09ojN4DGHIBybz9ytmg2ik8OJzX4ru0J4I3eWRarHvRX00
 DqWjwqoTranzjShqqe1Hv1bXPq35Bw8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622030403;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iHcA1kmx6DXoMyQxq4pc9DsCZPkc/oEEKI7fk9CuMAI=;
 b=m/XaMTqiiCLisNqMwUIi0pBzkpMTR6L80Gz9LqdYb33k4A6+QUFtoODLxR7mS4ljJ/ylpB
 0U09qx67Hqe0hKCw==
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 320B311A98;
 Wed, 26 May 2021 12:00:03 +0000 (UTC)
Date: Wed, 26 May 2021 13:34:02 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <YK4yKsW9jPboFcZU@yuki>
References: <0dc10bb052f327dc4c76d01dc70930bebc6bf151.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0dc10bb052f327dc4c76d01dc70930bebc6bf151.camel@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] Recent Yocto Project LTP experiences (hangs)
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
Cc: ltp <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Just FYI, if you are running test in VMs you will be better with
runltp-ng that compared to ltp-pan is designed so that it drives qemu
and runs tests from the outside, which means that it can reboot the VM
automatically if testing gets stuck and continues with a next test. It
also logs kernel serial console so you get kernel traces in the result
file as well.

See: https://github.com/metan-ucw/runltp-ng

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
