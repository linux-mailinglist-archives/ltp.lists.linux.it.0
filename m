Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 466713A69D0
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 17:09:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E175F3C7222
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 17:09:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E13823C4D00
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 17:09:48 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7E5621000660
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 17:09:48 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D17F21FD46;
 Mon, 14 Jun 2021 15:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623683387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zf/K/RsEsZkPOa7hw0ikdUFWFhNpxb3tvdkF38NAjWk=;
 b=P75IwUYD4qkUkUW/JhIj98HWhE15Bx6G9Wy4u4CCi2mkdmROb5CFFnt2l8tGI/71hTGv5S
 kaKOQ8ldO251kwDEiv9JuCa89Os0j/WfSwGe6o9zh1HOUbbdUAjd5FkBlHPOlRIlXNQo+z
 +rymjjFNg2eLtC+otiYJncCmn8hnKtw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623683387;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zf/K/RsEsZkPOa7hw0ikdUFWFhNpxb3tvdkF38NAjWk=;
 b=LxzOibuw4HEim75VLdiV5DKSOU9yx9k6em8akPkmf2jR+EoBIYE8OLqsaZwdF7hsJoGyCG
 y0WlNQYakAaqirDA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id A9AD8118DD;
 Mon, 14 Jun 2021 15:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623683387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zf/K/RsEsZkPOa7hw0ikdUFWFhNpxb3tvdkF38NAjWk=;
 b=P75IwUYD4qkUkUW/JhIj98HWhE15Bx6G9Wy4u4CCi2mkdmROb5CFFnt2l8tGI/71hTGv5S
 kaKOQ8ldO251kwDEiv9JuCa89Os0j/WfSwGe6o9zh1HOUbbdUAjd5FkBlHPOlRIlXNQo+z
 +rymjjFNg2eLtC+otiYJncCmn8hnKtw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623683387;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zf/K/RsEsZkPOa7hw0ikdUFWFhNpxb3tvdkF38NAjWk=;
 b=LxzOibuw4HEim75VLdiV5DKSOU9yx9k6em8akPkmf2jR+EoBIYE8OLqsaZwdF7hsJoGyCG
 y0WlNQYakAaqirDA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id fNJ9Jjtxx2DNGwAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Mon, 14 Jun 2021 15:09:47 +0000
Date: Mon, 14 Jun 2021 16:44:04 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Vinay Kumar <vinay.m.engg@gmail.com>
Message-ID: <YMdrNLcYKCK7aK4d@yuki>
References: <YMNrt8TxrxhNjFPN@yuki>
 <20210613173043.8797-1-vinay.m.engg@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210613173043.8797-1-vinay.m.engg@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] setitimer02: Convert setitimer02 to new API
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
Pushed with small changes, thanks.

* Slightly adjusted the docparse comment

* Switched from malloc to .bufs static declaration in test structure

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
