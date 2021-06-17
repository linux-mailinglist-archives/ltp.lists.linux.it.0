Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 921E83AB322
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 13:59:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A96F93C7883
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 13:59:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0524E3C30EA
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 13:59:42 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 85C131A00217
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 13:59:42 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DD80C1FDCE;
 Thu, 17 Jun 2021 11:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623931181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YzSPoUwG+1EMN3g/q/gjOisRiBLfGNXv6vH7SghX5rQ=;
 b=pWJpWD8Y7eFcTWDwzvjgVKnxWJzvGs7kQGaonbvUgxyNOUrf6VUjchwW0OOaGvCCWQTZCs
 1+jx6fbsh4ZUmggWlcTWiKdnFf+AZX4VecqwrBeGZXIIqRxhW3/O6O6eHNhJY+Dug1PYF6
 up6yF/e5pSch0J1edP7zCMyVkHhcgbM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623931181;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YzSPoUwG+1EMN3g/q/gjOisRiBLfGNXv6vH7SghX5rQ=;
 b=i7MdAgnKn4wshZwc2Y/7owzVG3GEd+eI/VVmQmEDFpYHp5lxztMWOGV8tGk7AtNUf+Ulif
 VsFrscGav0rQD+Bw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id C9567118DD;
 Thu, 17 Jun 2021 11:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623931181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YzSPoUwG+1EMN3g/q/gjOisRiBLfGNXv6vH7SghX5rQ=;
 b=pWJpWD8Y7eFcTWDwzvjgVKnxWJzvGs7kQGaonbvUgxyNOUrf6VUjchwW0OOaGvCCWQTZCs
 1+jx6fbsh4ZUmggWlcTWiKdnFf+AZX4VecqwrBeGZXIIqRxhW3/O6O6eHNhJY+Dug1PYF6
 up6yF/e5pSch0J1edP7zCMyVkHhcgbM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623931181;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YzSPoUwG+1EMN3g/q/gjOisRiBLfGNXv6vH7SghX5rQ=;
 b=i7MdAgnKn4wshZwc2Y/7owzVG3GEd+eI/VVmQmEDFpYHp5lxztMWOGV8tGk7AtNUf+Ulif
 VsFrscGav0rQD+Bw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id I3+RLy05y2CfFQAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Thu, 17 Jun 2021 11:59:41 +0000
Date: Thu, 17 Jun 2021 13:34:03 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Vinay Kumar <vinay.m.engg@gmail.com>
Message-ID: <YMszKzdwfi7PeAMs@yuki>
References: <YL/Wf51Y6V5lRnkM@pevik>
 <20210609173601.29352-1-vinay.m.engg@gmail.com>
 <20210609173601.29352-8-vinay.m.engg@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210609173601.29352-8-vinay.m.engg@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 08/10] semctl03 :Skipped EFAULT tests for libc
 variant.
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
> +	TST_EXP_FAIL(sys_semctl(*(tc->sem_id), 0, tc->ipc_cmd, *(tc->buf)),
                     ^
		     Fixed this to tv->semctl

And adjusted a few whitespaces and pushed, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
