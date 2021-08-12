Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9EF3EA281
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Aug 2021 11:51:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 337BB3C6DD7
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Aug 2021 11:51:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 04F513C30C7
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 11:51:49 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 596C4200DB7
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 11:51:49 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id AA45B1FF2F;
 Thu, 12 Aug 2021 09:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628761908;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VXDrwxK7FI9LFnUQD2juE65PPDX7wW6zwLjyNPLLn9I=;
 b=rmJkST/Urlqs+YD+DXRZA4Nh21vhToXd+y3THxBRQJJIejbKspLKElB6tJByOtIfYykgcj
 dFd5cLimCMXb1P/xCLTCenwJW7z5UQ23Mv5NsOI54dywLo121MD5YQzIUwCZn/t5G7pxmg
 mCBrXDbB4i4aUV2Qh1Sc22JbSMxgZbk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628761908;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VXDrwxK7FI9LFnUQD2juE65PPDX7wW6zwLjyNPLLn9I=;
 b=RWvMYHis8WWlGOd1LUgRVDpCrxLUHmGSB/EouNVCn6Sh7sG6xS4o7RjYUz1dp+igT/rU7a
 FZkLSXbWBi3UIcBw==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 7996DA3EBD;
 Thu, 12 Aug 2021 09:51:48 +0000 (UTC)
References: <20210812080242.16972-1-krzysztof.kozlowski@canonical.com>
 <20210812080242.16972-5-krzysztof.kozlowski@canonical.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-reply-to: <20210812080242.16972-5-krzysztof.kozlowski@canonical.com>
Date: Thu, 12 Aug 2021 10:51:48 +0100
Message-ID: <871r6zm1mz.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 4/4] controllers/memcg: check status of
 commands using interface
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


Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
