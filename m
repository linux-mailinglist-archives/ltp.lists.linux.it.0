Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B43204FB8C1
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Apr 2022 11:57:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 39AD03CA514
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Apr 2022 11:57:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9B5423C0653
 for <ltp@lists.linux.it>; Mon, 11 Apr 2022 11:57:45 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0FF6F1400539
 for <ltp@lists.linux.it>; Mon, 11 Apr 2022 11:57:44 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 604CA212C2
 for <ltp@lists.linux.it>; Mon, 11 Apr 2022 09:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649671064;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yGLTtBk39WsTUZIo1iy/C9ww8R0aCp+rZ4+HQ+MEOS0=;
 b=jwuCOoRBUI3QUAEsqChYJFp8bIsda3cfZBcdb5409KJGtOFQqoGibJXmJEJukgwZ3Q4h3q
 BjTvt3AXvus0ZQ5a4+yeAvE//pV11m/hGdMZXNfO410cszmtyhiMHIKa0xEGp5rCz3rrHU
 ZwQcoDLpmjbcnYiKcfywXAAuKfwFocA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649671064;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yGLTtBk39WsTUZIo1iy/C9ww8R0aCp+rZ4+HQ+MEOS0=;
 b=Ijl32EnFvmDY59Ukfe9ynzIGdWvr0RwlUupW24ZFEesJIxWZeepVqtwUgNDd9Njuy8IuRI
 neujMU6DQVdLFWBA==
Received: from g78 (rpalethorpe.udp.ovpn1.nue.suse.de [10.163.24.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 2CB3EA3B89;
 Mon, 11 Apr 2022 09:57:44 +0000 (UTC)
References: <20220331113324.14742-1-mdoucha@suse.cz>
 <20220331113324.14742-4-mdoucha@suse.cz>
User-agent: mu4e 1.6.10; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Martin Doucha <mdoucha@suse.cz>
Date: Mon, 11 Apr 2022 10:56:04 +0100
In-reply-to: <20220331113324.14742-4-mdoucha@suse.cz>
Message-ID: <87bkx8gcx6.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/3] Add test for CVE 2021-38198
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin,

Martin Doucha <mdoucha@suse.cz> writes:

> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
>
> Changes since v1:
> - Updated .save_restore metadata to the new structure
> - Use tst_parse_int() instead of sscanf()

Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
