Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EEA3B6317
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 16:49:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 76DD43C6E40
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 16:49:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DE1393C03AB
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 16:49:22 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 51FD31A0064C
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 16:49:21 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A7AAE224AB;
 Mon, 28 Jun 2021 14:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624891761;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8HxzYXIoVFEJQ+RgfjqKBV2KtbP0f4MV+PRkEUOaE28=;
 b=ruKv09eouF1pmYQpZRSy4tAfBI7JA2jzgPy/mU4HLibeV9J1RxaI5ohbeQawpTsry8FygY
 P8gvNVC+IZiVg6kL0uXZJDzjoMhkDTjeKAaYVDQgv5Yx178vQGM5dg34v0Q7P1eEnG3tYQ
 5leUj/dYMi/Zyv+7FTk7wumyemiAPsg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624891761;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8HxzYXIoVFEJQ+RgfjqKBV2KtbP0f4MV+PRkEUOaE28=;
 b=6XSJGqERYmZxeF+Z6I4qTvYr3SdUsb9ySJpDagNg5rE+ZUJh1rju3HkFivJzhH4ykcbg7Y
 9j0rHdilZk5txBBw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 7F7F311906;
 Mon, 28 Jun 2021 14:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624891761;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8HxzYXIoVFEJQ+RgfjqKBV2KtbP0f4MV+PRkEUOaE28=;
 b=ruKv09eouF1pmYQpZRSy4tAfBI7JA2jzgPy/mU4HLibeV9J1RxaI5ohbeQawpTsry8FygY
 P8gvNVC+IZiVg6kL0uXZJDzjoMhkDTjeKAaYVDQgv5Yx178vQGM5dg34v0Q7P1eEnG3tYQ
 5leUj/dYMi/Zyv+7FTk7wumyemiAPsg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624891761;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8HxzYXIoVFEJQ+RgfjqKBV2KtbP0f4MV+PRkEUOaE28=;
 b=6XSJGqERYmZxeF+Z6I4qTvYr3SdUsb9ySJpDagNg5rE+ZUJh1rju3HkFivJzhH4ykcbg7Y
 9j0rHdilZk5txBBw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id bkLnHXHh2WAqGAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 28 Jun 2021 14:49:21 +0000
Date: Mon, 28 Jun 2021 16:49:15 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YNnhawovD2P/JBHu@pevik>
References: <20210623135912.81156-1-krzysztof.kozlowski@canonical.com>
 <20210623135912.81156-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210623135912.81156-2-krzysztof.kozlowski@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/4] include/tst_pid.h: fix language typo
 (subtraction)
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

Hi Krzysztof,

>  /*
> - * Returns number of free pids by substarction of the number of pids
> + * Returns number of free pids by subtraction of the number of pids
>   * currently used ('ps -eT') from max_pids
Because you change the description of this function in the next commit,
I'd just fix this simple typo in 2nd commit. But of course it's not wrong
(prevents keeping the fix even if we'd removed second commit).

Kind regards,
Petr
>   */
>  int tst_get_free_pids_(void (*cleanup_fn)(void));

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
