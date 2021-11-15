Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 959B6450325
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Nov 2021 12:07:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 34B703C8159
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Nov 2021 12:07:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6AB4F3C8042
 for <ltp@lists.linux.it>; Mon, 15 Nov 2021 12:07:19 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BEB32200914
 for <ltp@lists.linux.it>; Mon, 15 Nov 2021 12:07:18 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 12C1921940;
 Mon, 15 Nov 2021 11:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636974438;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SaIKE3VY18BnJ314/TgZD6U0Yxjh13+o8xkS/CWlLZI=;
 b=TYjNpLPqXY7m+YtdHeIj9lDa8Q0opTPYSSpRr0PTi5QBtVTQu+UqJzthsDNzkRZBBSobH2
 epgXOFl7NLDJ7fJt7b9uF51ZIzDDxJUU/ioC/174PUMTtpN6oKEv+4fgrDXesfUC9UYXFG
 HsUnvxAGP1A7WAuq9xDD0efRvb+NEk0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636974438;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SaIKE3VY18BnJ314/TgZD6U0Yxjh13+o8xkS/CWlLZI=;
 b=IA9x6TuQG5EucIOyClY63PB32BvwlIGxojlQlrMF5D3Uf13MpNbR9Rrnhxm5VfhCKRYRBa
 1WqTgTlOYiDTdXAg==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id CB8EBA3B8E;
 Mon, 15 Nov 2021 11:07:17 +0000 (UTC)
References: <20211113041706.12893-1-msys.mizuma@gmail.com>
User-agent: mu4e 1.6.9; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Masayoshi Mizuma <msys.mizuma@gmail.com>
Date: Mon, 15 Nov 2021 10:58:27 +0000
In-reply-to: <20211113041706.12893-1-msys.mizuma@gmail.com>
Message-ID: <8735nxd6e2.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] controllers/pids.sh: get available for cgroup v2
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
Cc: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Masayoshi,

Masayoshi Mizuma <msys.mizuma@gmail.com> writes:

> From: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
>
> controllers/pids/pids.sh doesn't work in the cgroup v2 environment because
> some interfaces of cgroup v2 are different from cgroup v1.
>
> The test itself is useful for cgroup v2 as well, so let's get it
> available for cgroup v2.
>
> The test starts with cgroup v2 if it's mounted already. On some systems,
> like as Fedora 35 and CentOS Stream 9, systemd mounts cgroup v2 as the
> default while system booting.

FYI, we have a C API for CGroups which handles all of this. However this
patch looks good!

Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
