Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 020774AD52B
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Feb 2022 10:47:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3771B3C9B53
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Feb 2022 10:47:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BE53E3C06B2
 for <ltp@lists.linux.it>; Tue,  8 Feb 2022 10:47:05 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D2F1C1400F2B
 for <ltp@lists.linux.it>; Tue,  8 Feb 2022 10:47:04 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 20975210FE;
 Tue,  8 Feb 2022 09:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644313624;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b4kHjJZq1yj/ox2++KtTsvHHtcavxrJtNeRwkp5RbHo=;
 b=kNiJuJBLJfYh/e/gxUphyr9ysALWPCxNbDSPrn1o/FFAGFVHIM6sRTcQmR+l/ZNHWgGR4O
 d1GKaxVAiX15GZjzWZCw4A1YZ1ShWPLh9oHMbcJd6kk29ZR0uYB/vKNBtY+mhB4k4sgEwz
 AWdIJkexdNhH5sOefsflfjsbfn9XndE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644313624;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b4kHjJZq1yj/ox2++KtTsvHHtcavxrJtNeRwkp5RbHo=;
 b=8aP15pWhJj3tQceYr89HedcVUfqrLL+FIXR/pkUJq1rnUNqUTRdwIWJST4JrZHf4hX0Be1
 g1ZqGVKXo3vZGxAg==
Received: from g78 (unknown [10.163.24.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id D8B34A3B83;
 Tue,  8 Feb 2022 09:47:03 +0000 (UTC)
References: <20220207141618.2844-1-rpalethorpe@suse.com>
 <20220207141618.2844-3-rpalethorpe@suse.com>
 <CAEemH2d-K=X0aodrLV=4AiVE-GWDkHv3+Rxf_NUq8btH=jF77A@mail.gmail.com>
 <87czjxwwgc.fsf@suse.de>
 <CAEemH2c0MTyitsSjbUqDsyW5rsOOAkXMJconVcBQRZLr0vK=4w@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
Date: Tue, 08 Feb 2022 09:46:47 +0000
In-reply-to: <CAEemH2c0MTyitsSjbUqDsyW5rsOOAkXMJconVcBQRZLr0vK=4w@mail.gmail.com>
Message-ID: <874k59wuzs.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/5] API/cgroup: Declare required controllers
 and version in test struct
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

Pushed!

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
