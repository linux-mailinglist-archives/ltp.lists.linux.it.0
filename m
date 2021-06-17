Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B65E3AB33F
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 14:05:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E0DE03C71B8
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 14:05:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 126AE3C2DCB
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 14:05:51 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 978F01A0088D
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 14:05:51 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 02C7821B08;
 Thu, 17 Jun 2021 12:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623931551; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vuTer6G5eQKhQwYstR2ij54S+CYfAJyS5seBokSjqJM=;
 b=HMD698s++o8BldW8uiiYBa/0BRGPqB8YB21pd6yDWLo/M/OYhec5zncvpZqbHnKJeLjdYc
 yvJ6JKsqaNYkrgwdN74SzHMKrUtzPdyhWM6/qkB0gE5MERlqMcwtV/HPDy2GOtAt6GK9Hi
 esSIn5UBOF4lDewGL5UwDnh7l/4CaOY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623931551;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vuTer6G5eQKhQwYstR2ij54S+CYfAJyS5seBokSjqJM=;
 b=b9apSh95iGCqMNXabTlp0u/b9l0NILVhIJLTTk5ng1nfK28ir+JpqxYExn2OxuQMsb+BpN
 bzNsgoDuOYj+T8CA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id E2C14118DD;
 Thu, 17 Jun 2021 12:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623931550; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vuTer6G5eQKhQwYstR2ij54S+CYfAJyS5seBokSjqJM=;
 b=OkWVft12X09hNAHTRoLdLVVvzqZtBvz53MHsuoh0J50Z9RRaMU7ry1KmkTJrNlCJKnuL9A
 Z9e7/eZer1sS48PnpRUVV+oelBI4qkgSTKLCahxfLbFpyDLiAezDYA5YaXttpISdemSBKJ
 JIsddW5mWML7BygkAukCGtyHz641MBc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623931550;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vuTer6G5eQKhQwYstR2ij54S+CYfAJyS5seBokSjqJM=;
 b=3jfqSxIuHIuAGZoJ1Xg6xflNXiOAf8TLz3wbsFzBbGDVM1wRdKfdvbBvXJQc9fjdKjRqK8
 5vTrd0Z2qB4s/CCQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id I+7yNZ46y2A1GQAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Thu, 17 Jun 2021 12:05:50 +0000
Date: Thu, 17 Jun 2021 13:40:12 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Vinay Kumar <vinay.m.engg@gmail.com>
Message-ID: <YMs0nN2FfwvYn0oq@yuki>
References: <20210609173601.29352-10-vinay.m.engg@gmail.com>
 <20210613174946.9804-1-vinay.m.engg@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210613174946.9804-1-vinay.m.engg@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] ipc/shmctl02: Make use of TST_EXP_FAIL()
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
Cc: umesh.kalappa0@gmail.com, metan@ucw.cz, rwmacleod@gmail.com,
 vinay.kumar@blackfigtech.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Pushed, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
