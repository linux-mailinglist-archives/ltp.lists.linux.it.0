Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 741A03B1633
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 10:48:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E72833C6FE8
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 10:48:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2F95F3C183E
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 10:48:36 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A5FCB200D41
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 10:48:35 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0EB5C1FD65;
 Wed, 23 Jun 2021 08:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624438115;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Omtu09MWbpGWgVefljpIuLPxSiEowiEQpAu3n9EROms=;
 b=rchGk2GCm/DhgurR1/bJuuFLVEE16ykLrEN3DaKsRG+IwOgME26PegIYqukaLzEesxD4nh
 ZPQ7Cqd/FDmbF6b41HnhYxiGg75JXEabi3avVmH23by1ySRmBcyxaFxXRM4+48BTAf+fxW
 KwLcAixNPmPJ+q8AVRgWP0eV0sQxk7o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624438115;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Omtu09MWbpGWgVefljpIuLPxSiEowiEQpAu3n9EROms=;
 b=7XyyAkbwAyg+PRZeYW5hTiVBr7CODLyx1b36UQcqZV+hu2FHbTO/aIY+wfSmAgjjY/RWMt
 qOGglDw/EOBomjCA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id DE0B711A97;
 Wed, 23 Jun 2021 08:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624438115;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Omtu09MWbpGWgVefljpIuLPxSiEowiEQpAu3n9EROms=;
 b=rchGk2GCm/DhgurR1/bJuuFLVEE16ykLrEN3DaKsRG+IwOgME26PegIYqukaLzEesxD4nh
 ZPQ7Cqd/FDmbF6b41HnhYxiGg75JXEabi3avVmH23by1ySRmBcyxaFxXRM4+48BTAf+fxW
 KwLcAixNPmPJ+q8AVRgWP0eV0sQxk7o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624438115;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Omtu09MWbpGWgVefljpIuLPxSiEowiEQpAu3n9EROms=;
 b=7XyyAkbwAyg+PRZeYW5hTiVBr7CODLyx1b36UQcqZV+hu2FHbTO/aIY+wfSmAgjjY/RWMt
 qOGglDw/EOBomjCA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id MrnWNGL10mBpKAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 23 Jun 2021 08:48:34 +0000
Date: Wed, 23 Jun 2021 10:48:33 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YNL1YatxX5D10w1o@pevik>
References: <20210622161753.32550-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210622161753.32550-1-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] tst_rtnetlink: pass error codes using
 rtnl_errno variable
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

Hi Martin,

LGTM.
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
