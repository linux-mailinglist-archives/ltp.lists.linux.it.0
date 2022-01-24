Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA75497F93
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Jan 2022 13:31:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EE67E3C9097
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Jan 2022 13:31:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5EBD93C2AE3
 for <ltp@lists.linux.it>; Mon, 24 Jan 2022 13:30:57 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B7BDD600805
 for <ltp@lists.linux.it>; Mon, 24 Jan 2022 13:30:56 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 0D5251F38F;
 Mon, 24 Jan 2022 12:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643027456;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aFr4rCLemhB1QR/KUl18DaUp2m2HqvIwykBTGNU9qcw=;
 b=zz4Px0k2//DP5R7sfP6VXpic+mUCjp/bJC6/9B/hPYuH0UWB0+hkrNqRSsKYt0tmEYkIoI
 RMt2gfkY+kOSS+xqmoVf/CVm7KWDeY80rLtRxJK1kYdAa/B87b1pUP1kjn3vSke+R6qK9c
 Evxl2UlMTYvlGdN+Oc42aG+pzuheWWA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643027456;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aFr4rCLemhB1QR/KUl18DaUp2m2HqvIwykBTGNU9qcw=;
 b=Jl2MPsrYSHEfqZPm+1aPCMsgup6ha3yhh0gKYhBT5arosn9WxwO95zNkA2vLy1YJo4PNgy
 M3VXmSKYyUjf/sAQ==
Received: from g78 (unknown [10.163.24.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id C21F5A3B83;
 Mon, 24 Jan 2022 12:30:55 +0000 (UTC)
References: <cover.1642601554.git.luke.nowakowskikrijger@canonical.com>
 <10737fadf83b625be8843b06df53dbcb4bc30dfd.1642601554.git.luke.nowakowskikrijger@canonical.com>
User-agent: mu4e 1.6.10; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Luke Nowakowski-Krijger <luke.nowakowskikrijger@canonical.com>
Date: Mon, 24 Jan 2022 12:26:55 +0000
In-reply-to: <10737fadf83b625be8843b06df53dbcb4bc30dfd.1642601554.git.luke.nowakowskikrijger@canonical.com>
Message-ID: <8735ldz56p.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 14/16] controllers: Update pids.sh to use newer
 cgroup lib
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

Hello Luke,

Luke Nowakowski-Krijger <luke.nowakowskikrijger@canonical.com> writes:

> Updated to use the newer cgroup_lib to make mounting and cleanup
> nicer.
>
> Signed-off-by: Luke Nowakowski-Krijger <luke.nowakowskikrijger@canonical.com>
> ---
>  testcases/kernel/controllers/pids/pids.sh | 65 +++--------------------
>  1 file changed, 8 insertions(+), 57 deletions(-)

Very nice!

In general I think these conversions are a big improvement.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
