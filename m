Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 131F442EE3C
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Oct 2021 11:57:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CF5513C1778
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Oct 2021 11:57:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5A3D03C110D
 for <ltp@lists.linux.it>; Fri, 15 Oct 2021 11:57:44 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B023A1A01950
 for <ltp@lists.linux.it>; Fri, 15 Oct 2021 11:57:43 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EED6E21A61;
 Fri, 15 Oct 2021 09:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1634291862;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Npp59JNpJGXO0DbVUU9axYHcIFBIcm92F1IzwDjhBW4=;
 b=lexudAbWTpvy/fgCDh9xbXjc4qvNZFwtx/Ip3uwQzMJjqq8TTOfPNlC2gQwEo+ucdqltg8
 x8luG5ylWrtnDhPr7yjV3l2gIYH/PetREWWXkQFdRoY6Dmm2U9770Dmau/iGOy7Skqmr3H
 CqfOw7SICwuXVSfIosmA5OfSvP3SUyU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1634291862;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Npp59JNpJGXO0DbVUU9axYHcIFBIcm92F1IzwDjhBW4=;
 b=kdcwQr56VZNBHKJi0n2lNWFWBYKjTkzbkKvk5PbMA5CuCJePit1+I1rgRbpeEB4UWqLUpT
 edKAOP0/gc2ENhAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BFC6F13BEF;
 Fri, 15 Oct 2021 09:57:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id I3qaLJZQaWFOQgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 15 Oct 2021 09:57:42 +0000
Date: Fri, 15 Oct 2021 11:57:41 +0200
From: Petr Vorel <pvorel@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YWlQlXfHu6FXQAx/@pevik>
References: <20211014012533.18205-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211014012533.18205-1-zhanglianjie@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/5] syscalls/clone02: Convert to new API
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

Hi,

> +++ b/testcases/kernel/syscalls/clone/clone02.c
...
> +static char *res_name[] = {
> +	[1] = "CLONE_VM",
> +	[2] = "CLONE_FS",
> +	[4] = "CLONE_FILES",
> +	[8] = "CLONE_SIGHAND",
>  };

Not really that important, but you could
1) Instead of hardwired indexes use constants from <sched.h>.
2) To get their string values with macro stringification.

#define CLONE_DESC(x) [x] = #x

static char *res_name[] = {
	CLONE_DESC(CLONE_VM),
	CLONE_DESC(CLONE_FS),
	CLONE_DESC(CLONE_FILES),
	CLONE_DESC(CLONE_SIGHAND),
};

If this is the only change, it can be replaced during merge.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
