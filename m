Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F84C3B9072
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 12:21:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 10BCC3CA407
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 12:21:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1702A3C5E5B
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 12:21:06 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6A050601156
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 12:21:06 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 7F5BB2284D
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 10:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625134865;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i6sN/qFRt/7nq4ZdLcCr61vrKGkR2LsJF52atlj6gM4=;
 b=jgD+gI37FuFLlo95EeHX0ElQx3bkWOUJ4V/Ut6qPoLmpI7abzKyRD2yOV2qc8dZoh15z5+
 pcJQceQoC16UU2/HMcGm86dnSaIDoVT5uijnHmeSaAHpcr7ESt+WBeBmvMyxlXspAtMEJP
 X9acWp4l2kpRV5f9pBdOGIiYAGK3d7U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625134865;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i6sN/qFRt/7nq4ZdLcCr61vrKGkR2LsJF52atlj6gM4=;
 b=g/ZO5bN3u1e1YXOa7lb45g3MdBxCWDUFyafV8TFk5BWCfz2fNRVqL6jrXtDnMpknbS2sda
 FmeBkq0Opig5HDBg==
Received: from g78 (unknown [10.163.17.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 2A107A3B91;
 Thu,  1 Jul 2021 10:21:05 +0000 (UTC)
References: <20210630154611.12019-1-mdoucha@suse.cz>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Martin Doucha <mdoucha@suse.cz>
In-reply-to: <20210630154611.12019-1-mdoucha@suse.cz>
Date: Thu, 01 Jul 2021 11:21:03 +0100
Message-ID: <87czs22v3k.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Add documentation for netdevice and rtnetlink
 libraries
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

Hello Martin,

Martin Doucha <mdoucha@suse.cz> writes:

> Signed-off-by: Martin Doucha <mdoucha@suse.cz>

Acked-by: Richard Palethorpe <rpalethorpe@suse.com>

> ---
>
> Changes since v1:
> - Refer to tst_brk() instead of explaining test termination on error
> - Use ndash where appropriate
> - Improved formatting of warnings
>
> We can't change struct tst_rtnl_attr_list.type to an enum. We don't have
> the complete list of its values and it has to match struct rtattr.rta_type,
> which is defined as unsigned short by the kernel.

+1

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
