Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AEF3B4316
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Jun 2021 14:22:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 891663C6EF4
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Jun 2021 14:22:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 97B463C207E
 for <ltp@lists.linux.it>; Fri, 25 Jun 2021 14:22:46 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 24EA9600A1C
 for <ltp@lists.linux.it>; Fri, 25 Jun 2021 14:22:45 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5872A1FE8C;
 Fri, 25 Jun 2021 12:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624623765; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q8uisbA338Zs3e2/K8Xnm23BTBJn3Ru0coYeTMGS7DA=;
 b=KUeP6PcK5ayuWkhZwZE+DqTzA/1tDBMxeXCkmIvOpwvlzm/elG3NrLVseHCwW1eJnDAS31
 T1T6M2SWmJnvx1BBPznf1pRJUyMcySrjm1HwAGAa5Y8KVMIz+v91Uh44ZjD8+qkVWhcipc
 gMbq5D82rEvlqcH5MyafOOZRtLhZQtU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624623765;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q8uisbA338Zs3e2/K8Xnm23BTBJn3Ru0coYeTMGS7DA=;
 b=DfZddKXbevTRo+EcdJWNnr7mmeSpWG6+Y/XbvCApB88cZjc8LNG1WBo9rAuKJMDvM+kURz
 wMGVAla0z3M9+5Cw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 3AEF111A97;
 Fri, 25 Jun 2021 12:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624623765; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q8uisbA338Zs3e2/K8Xnm23BTBJn3Ru0coYeTMGS7DA=;
 b=KUeP6PcK5ayuWkhZwZE+DqTzA/1tDBMxeXCkmIvOpwvlzm/elG3NrLVseHCwW1eJnDAS31
 T1T6M2SWmJnvx1BBPznf1pRJUyMcySrjm1HwAGAa5Y8KVMIz+v91Uh44ZjD8+qkVWhcipc
 gMbq5D82rEvlqcH5MyafOOZRtLhZQtU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624623765;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q8uisbA338Zs3e2/K8Xnm23BTBJn3Ru0coYeTMGS7DA=;
 b=DfZddKXbevTRo+EcdJWNnr7mmeSpWG6+Y/XbvCApB88cZjc8LNG1WBo9rAuKJMDvM+kURz
 wMGVAla0z3M9+5Cw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id RjjcDJXK1WC8RQAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Fri, 25 Jun 2021 12:22:45 +0000
Date: Fri, 25 Jun 2021 13:57:10 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Alessio Balsini <balsini@android.com>
Message-ID: <YNXEltZhCiuezIvP@yuki>
References: <20210623134041.366838-1-balsini@android.com>
 <YNM6QGFYt/bpaPDS@yuki> <YNR7L2ftbwx6IUls@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YNR7L2ftbwx6IUls@google.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] getrlimit/getrlimit03: fix unavailable
 __NR_getrlimit for arm
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
Cc: kernel-team@android.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Here below the new patch that should fixed the unused functions warnings, as
> well as the useless definition of rlimit_long if the signed version of
> __NR_getrlimit does not exist.

I've adjusted the patch a bit and pushed, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
