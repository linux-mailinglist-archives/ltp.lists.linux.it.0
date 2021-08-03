Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E9B3DEBF0
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 13:35:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 143463C813C
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 13:35:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2F23B3C2AB9
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 13:35:19 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id AE9C21A00147
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 13:35:18 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 28B8421FEA;
 Tue,  3 Aug 2021 11:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627990518;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MaRJ5v6rvqFgrr+IA6xfd+NaFfI81M81DjmIv86gwMQ=;
 b=w/9bWLhOd/CccnIZ8dE/o9+nPxw1WNmleYtMILbSXzCUv6/VrWl3SR1EKDy3QlX3ubcp03
 avrEZrqbfDWaJ9+EbygHcVZgQ05SEuv1y0TdbNyfvyk4A3njIRG5h3dY6Gr7EKPJ1VzbE1
 +lS4tRFulF5j0s+1Q/b3+wbAWG/Edjo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627990518;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MaRJ5v6rvqFgrr+IA6xfd+NaFfI81M81DjmIv86gwMQ=;
 b=yV1FozfVk3OIXqDG7a/+AlyxL7OPGaCzgm6UvpRM/MJ2v/OdrKsydykm0UJBKQVXSKobKG
 Gh4EJ2FYr/D9VXDg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id EA81813B57;
 Tue,  3 Aug 2021 11:35:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id +qv6NvUpCWHNLQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Tue, 03 Aug 2021 11:35:17 +0000
Date: Tue, 3 Aug 2021 13:35:16 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YQkp9AP+fblqnXzI@pevik>
References: <20210802173536.19525-1-pvorel@suse.cz>
 <20210802173536.19525-2-pvorel@suse.cz> <YQkMuOHjZ4HHO+QQ@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YQkMuOHjZ4HHO+QQ@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v7 1/7] lib: Print Summary: into stderr
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

Hi Cyril,

> Hi!
> I wonder if this change can break anything but I guess that it's
> unlikely.

> Also while you are at it can you also fix tags? We do print help() to
> stderr but tags that follow go into stdout which is rather starnge.

> And the failure hints are written to stdout as well, which should be
> fixed as well.

Sure, I'll fix them all in v8.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
