Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6DB3AEC20
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 17:15:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4C08A3C7050
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 17:15:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 201863C2318
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 17:15:39 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5776A1A009B4
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 17:15:38 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B21301FD45;
 Mon, 21 Jun 2021 15:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624288537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S3gXYsDODqauAS03kBikzZyxtthNfzN6k8gGKa0L0Bo=;
 b=t40F0pdHQNMLiQBQQYCg5o5mM54ymtpUY/hevibz9GaZaHGmkvB7LKFio0L8OxEePgpGDm
 OT/uJqZspkL09s/kZLw2pcCuF0HAiGMtLyRT1juTsnV46zUzx6cw59Uh1Ce3emdreij0Eo
 gIfyPFtJTJ1XJP/DrkmOGKRkqrPuw4Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624288537;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S3gXYsDODqauAS03kBikzZyxtthNfzN6k8gGKa0L0Bo=;
 b=dQr5OV8b9N/zpoOUxxSmipunJLkvZc/98USlommHetuJe/AcAsgYw3/0DRs/mbX81ir8xO
 Wsy6mgg0I+YL7xDQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 93F78118DD;
 Mon, 21 Jun 2021 15:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624288537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S3gXYsDODqauAS03kBikzZyxtthNfzN6k8gGKa0L0Bo=;
 b=t40F0pdHQNMLiQBQQYCg5o5mM54ymtpUY/hevibz9GaZaHGmkvB7LKFio0L8OxEePgpGDm
 OT/uJqZspkL09s/kZLw2pcCuF0HAiGMtLyRT1juTsnV46zUzx6cw59Uh1Ce3emdreij0Eo
 gIfyPFtJTJ1XJP/DrkmOGKRkqrPuw4Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624288537;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S3gXYsDODqauAS03kBikzZyxtthNfzN6k8gGKa0L0Bo=;
 b=dQr5OV8b9N/zpoOUxxSmipunJLkvZc/98USlommHetuJe/AcAsgYw3/0DRs/mbX81ir8xO
 Wsy6mgg0I+YL7xDQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id MGTkIhmt0GCOCgAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Mon, 21 Jun 2021 15:15:37 +0000
Date: Mon, 21 Jun 2021 16:50:02 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: liubo03 <liubo03@inspur.com>
Message-ID: <YNCnGpf8oQowhoMV@yuki>
References: <1622790418-36793-1-git-send-email-liubo03@inspur.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1622790418-36793-1-git-send-email-liubo03@inspur.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,PDS_TONAME_EQ_TOLOCAL_SHORT,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] io/ltp-aiodio: fix function return value
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
This makes it slightly better but still the most imporant part, the
check in the child process, is ignored.

Easiest fix would be rewriting the tests to the new test library so that
we could use tst_res(TFAIL, ...) in the child processess as well.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
