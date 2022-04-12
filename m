Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7534FD368
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Apr 2022 11:50:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CCCF73CA55B
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Apr 2022 11:50:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D907A3C1A1A
 for <ltp@lists.linux.it>; Tue, 12 Apr 2022 11:49:59 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3D88360063F
 for <ltp@lists.linux.it>; Tue, 12 Apr 2022 11:49:58 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 662D3210EB;
 Tue, 12 Apr 2022 09:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649756998;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pHSuwhk3GQe/vNcmnN1BoPe9HVWKmI7z++qxnUJmWGw=;
 b=p92Ne5mRC23s8xdk3Kf7YWImMcQb8P+lzOv72rUS49HPOUol5AH/gWXdtDdCugCKIFH/fN
 e71byz6bo3BbZeSsAVMuusJbKsutt6zXfwf01xQm+r5j3lpBS0vJSLUHbsLmGMOIK/GlbB
 cSU0U1ctuZJW91s6W61Sdfg8yynIUog=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649756998;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pHSuwhk3GQe/vNcmnN1BoPe9HVWKmI7z++qxnUJmWGw=;
 b=a8Nchfv6VY2ACmZ2y1WTcJ6fk73x3GKOj4hfwa9TyZsbn+iDg+T0RGB2gVZDU9dXjCgjjg
 vGSdx5c2SSYZcZAQ==
Received: from g78 (unknown [10.163.24.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id CF138A3B8A;
 Tue, 12 Apr 2022 09:49:57 +0000 (UTC)
References: <20220411151637.1739318-1-edliaw@google.com>
 <CAEemH2f+bDdbfLpK3Jtr_F4THvZHksmbYmV30o9zuz4nXH=xeA@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
Date: Tue, 12 Apr 2022 10:40:57 +0100
In-reply-to: <CAEemH2f+bDdbfLpK3Jtr_F4THvZHksmbYmV30o9zuz4nXH=xeA@mail.gmail.com>
Message-ID: <87pmlmzl4q.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] fzsync: break inf loop with flag vs
 pthread_cancel
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
Cc: kernel-team <kernel-team@android.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Edward and Li,

Li Wang <liwang@redhat.com> writes:

> On Mon, Apr 11, 2022 at 11:17 PM Edward Liaw via ltp <ltp@lists.linux.it> wrote:
>
>  Hi, I'm working to get fzsync working with the Android kernel, which
>  does not have pthread_cancel available.
>
>  In the absence of pthread_cancel, when thread A exits due to a break,
>  thread B will get stuck in an infinite loop while waiting for thread A
>  to progress.
>
>  Instead of cancelling thread B, we can use the exit flag to break out of
>  thread B's loop.  This should also remove the need for the wrapper
>  around the thread.
>
>  Signed-off-by: Edward Liaw <edliaw@google.com>
>
> Reviewed-by: Li Wang <liwang@redhat.com>

Awesome. Merged with some indentation fixes, it seems like you editor
used tab for the first indent then spaces thereafter.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
