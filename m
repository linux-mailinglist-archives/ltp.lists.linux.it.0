Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 930C1A3324
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Aug 2019 10:54:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3085B3C2030
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Aug 2019 10:54:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 6E2173C1D01
 for <ltp@lists.linux.it>; Fri, 30 Aug 2019 10:54:05 +0200 (CEST)
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6716A600BDC
 for <ltp@lists.linux.it>; Fri, 30 Aug 2019 10:54:04 +0200 (CEST)
Received: by mail-ed1-x542.google.com with SMTP id l26so6547978edr.0
 for <ltp@lists.linux.it>; Fri, 30 Aug 2019 01:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=piZUXA+JB0l5bOfcnDLPz+IDCljKhZP+x85JaS3o4F8=;
 b=OK0JL0Ws6OK4qPphWxcL9VZRczRZy2PDblbtQ+qhqDOoX3JqGPzMxLkHpieYIbk2zr
 QhS60g3d6jWm6wYocTw0FRhf7AAY1rGZnG463jWwVUDrl9p9u/qwLOenAnqkh/ajx1M7
 g/0Hi4O6iWf5cfQDPFNpmbXJXkId0i+zBWKRsu/zHGfuzvJUqAftFrDASJ72QZFKeZAX
 ICvc10Ysvhz7eM9BYTAGwoKsH/1NmnWbu5965WihSmn8t+yKIKw0YQE6GbsyWtxKpYJU
 aKAsweUzLeAWRzarv6sWlu5Fbg9JOebNlIrRibFO0w2WOlIKehaJzxagH98By4VhPzpy
 7mCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=piZUXA+JB0l5bOfcnDLPz+IDCljKhZP+x85JaS3o4F8=;
 b=Y+Y+cww2e2XDitfF6BqaWJHL3/Sd2PlLqtqqCrmoeoiwzHx0cOb3HMZ+8qEnvIu0Bd
 oDnxHYgYMluGIjbG6tuFqz5nFfoDnWyBmR26lmtoerSCI1UOu0mTUBgl7dyTWwJWUCX1
 9CTPA1fd3oAVDSRnt8XES6cRPCurxjch3L1NZNuHf5cphlZeI/FTEU7UragCoAL4Rzhm
 HM211bM7f24qziXynTUcHZCr3WExq1nlvnmXU9SIuv9gH8g+88L5mVuRXdcX9bw3XSJH
 ghz9y/teN6AW9M3wCdyyNUm2wgSeaxf/dYaYhKbTxIsj9hNjUoqGFBL5Od6Bj2EM7zsg
 p4FQ==
X-Gm-Message-State: APjAAAWZCfsxhX4J/OxuFdSMV8sxGE9WxNicIqnXRW/+lYls7ky7e0YV
 XINq3clVqsdL5G2JRi5eV8I=
X-Google-Smtp-Source: APXvYqxbfuMKcYeLfZ0AAIZqPStLxNx+7JPaFpKCNqUZcBh8DDVAVLOOht/xlj9yMH81tFYjDAXrfg==
X-Received: by 2002:a17:906:698f:: with SMTP id
 i15mr11846185ejr.247.1567155244020; 
 Fri, 30 Aug 2019 01:54:04 -0700 (PDT)
Received: from dell5510 ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id o10sm712916ejn.73.2019.08.30.01.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2019 01:54:03 -0700 (PDT)
Date: Fri, 30 Aug 2019 10:54:01 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20190830085400.GA27375@dell5510>
References: <20190829183110.23231-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190829183110.23231-1-pvorel@suse.cz>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] net/if-mtu-change.sh: set longer timeout
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> Default CHANGE_INTERVAL 5s caused test to be killed after introducing
> LTP_TIMEOUT_MUL to shell API.

> TODO: set LTP_TIMEOUT_MUL based on CHANGE_INTERVAL.

> Fixes: fbea02ab5 ("lib/tst_test.sh: setup timeout per test run for the
> shell tests")

> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/network/stress/interface/if-mtu-change.sh | 2 ++
>  1 file changed, 2 insertions(+)

> diff --git a/testcases/network/stress/interface/if-mtu-change.sh b/testcases/network/stress/interface/if-mtu-change.sh
> index 30c013214..5a05e99c9 100755
> --- a/testcases/network/stress/interface/if-mtu-change.sh
> +++ b/testcases/network/stress/interface/if-mtu-change.sh
> @@ -5,6 +5,8 @@
>  # Copyright (c) International Business Machines  Corp., 2005
>  # Author: Mitsuru Chinen <mitch@jp.ibm.com>

> +LTP_TIMEOUT_MUL=${LTP_TIMEOUT_MUL:-2}
This should wait, till we find a solution for int vs. float for shell [1]
And check if user's value is not lower than minimal (2), as Li suggested in [1].

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/patch/1155460/#2250198


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
