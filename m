Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6CF4EA200
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Mar 2022 22:50:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B14883C9A74
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Mar 2022 22:50:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 078533C97CE
 for <ltp@lists.linux.it>; Mon, 28 Mar 2022 22:50:46 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7EEC81400DEF
 for <ltp@lists.linux.it>; Mon, 28 Mar 2022 22:50:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B53221F866;
 Mon, 28 Mar 2022 20:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1648500645;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B+ZDO4g3pZ6KtcgwThdINUjbl4MmTeByjdnVf9LlZoE=;
 b=aFriqUUbha+UytfzqvMKBP1uWL3VjIGAttPRh06ILtEY3l/ROZJFy4sGEqW04cyLUsHOM7
 w+pz7pk3tN/WA7b1h6Tp6OrX1xUN7XIpib5aH5L4RrMG4zGrKFVIYXXWzU2CXXjkJn9S2S
 Y82CCIDrislTX/nec/tjLwOuWkdKnls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1648500645;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B+ZDO4g3pZ6KtcgwThdINUjbl4MmTeByjdnVf9LlZoE=;
 b=8x2x1NBFMkHcUVZNlidYpjQYneL0MvVlzUgn2EqE/Ogd6gUF/oXA0CKUn2JR0K/m0eLafb
 fEZZkMXztGccWTAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 76D801332D;
 Mon, 28 Mar 2022 20:50:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UHbpGqUfQmLiVAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 28 Mar 2022 20:50:45 +0000
Date: Mon, 28 Mar 2022 22:50:44 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YkIfpAJNErCkSDEa@pevik>
References: <20220325093626.11114-1-andrea.cervesato@suse.de>
 <20220325093626.11114-3-andrea.cervesato@suse.de>
 <Yj3mvHaApe9vdQdg@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yj3mvHaApe9vdQdg@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/9] Rewrite userns02.c using new LTP API
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

Hi Cyril, Andrea,

> > +	sprintf(path, "/proc/%d/gid_map", childpid);
> > +	sprintf(content, "100 %d 1", parentgid);
> > +
> > +	fd = SAFE_OPEN(path, O_WRONLY, 0644);
> > +	SAFE_WRITE(1, fd, content, strlen(content));
> > +	SAFE_CLOSE(fd);

> I've shortened this part significantly with SAFE_FILE_PRINTF() and
> pushed, thanks.
Sorry for overlooking this one.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
