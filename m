Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 00131397078
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:36:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C4A5E3C8A6D
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:36:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C09323C5592
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:36:07 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 42D84600BF6
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:36:06 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 808872191F;
 Tue,  1 Jun 2021 09:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622540166; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p51T1kwH+GeDD9SNr8ZUR1ak2JGiwF+AM+y82GXgOwI=;
 b=WmCcEyRIfwXUoOsCKKNTrBjKMZkxJULUJIhVBgaeHwXMh7pmYNCnxE1Gzw2+mlnNZ189FV
 vMbagK4yHklONahd5yhfxlBDf0KefQGiVFQxnVOn16Tn8Ulib9ZK6oRkvfWOJcY9KDQrq8
 W4waiawv+c62W4SgnXYKqLdDNlwswf4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622540166;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p51T1kwH+GeDD9SNr8ZUR1ak2JGiwF+AM+y82GXgOwI=;
 b=m3ZkWX4iSs0+HPP6q/CeN05+9EXHt4gOl8srj7ytreFLdK02jM0KCJBdmxyfrG48euvsNt
 4PlvGiAAxRs550DA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 58BF1118DD;
 Tue,  1 Jun 2021 09:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622540166; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p51T1kwH+GeDD9SNr8ZUR1ak2JGiwF+AM+y82GXgOwI=;
 b=WmCcEyRIfwXUoOsCKKNTrBjKMZkxJULUJIhVBgaeHwXMh7pmYNCnxE1Gzw2+mlnNZ189FV
 vMbagK4yHklONahd5yhfxlBDf0KefQGiVFQxnVOn16Tn8Ulib9ZK6oRkvfWOJcY9KDQrq8
 W4waiawv+c62W4SgnXYKqLdDNlwswf4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622540166;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p51T1kwH+GeDD9SNr8ZUR1ak2JGiwF+AM+y82GXgOwI=;
 b=m3ZkWX4iSs0+HPP6q/CeN05+9EXHt4gOl8srj7ytreFLdK02jM0KCJBdmxyfrG48euvsNt
 4PlvGiAAxRs550DA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id aMHqFIb/tWB9bgAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Tue, 01 Jun 2021 09:36:06 +0000
Date: Tue, 1 Jun 2021 11:10:13 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YLX5ddYuoA23tN6m@yuki>
References: <20210531165052.8731-1-pvorel@suse.cz>
 <20210531165052.8731-2-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210531165052.8731-2-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] build.sh: Rewrite to allow running certain
 step
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
Cc: ltp@lists.linux.it, Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Looks good acked.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
