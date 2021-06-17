Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EC53AADAD
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 09:33:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A27D53C7181
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 09:33:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 70C073C2E0B
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 09:33:02 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 665DE14011B9
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 09:33:01 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 9FC6E21AEF;
 Thu, 17 Jun 2021 07:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623915179;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=86NsWXV1rgcBwm/McyydXz4JWEPFP2nML2V+mvH3VhI=;
 b=ZCao4l6PjHAjGcHhtpBebJF2noc5TGUVYYKZDGM3KVe+Y4P7oLbY8I6tMzznr6DsmrVQum
 5K5BAdcGim9i/kQ2SMoK2++uCO7wLpWnx6GvVUalLP+JTy5GqdCT+AVW0bF0dOoMVHhcqH
 /Gsje/yogSBAxQQtXzIUARYS+CWnEE0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623915179;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=86NsWXV1rgcBwm/McyydXz4JWEPFP2nML2V+mvH3VhI=;
 b=lsHEIONLySa8eZq+QyxaHkOodLrIaVefJgYSwU+mYvjM/mKn96p8rED5qrmY4StXfi2wrS
 jZmEvWd3PF1WrdBQ==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id BD9E8A3BB8;
 Thu, 17 Jun 2021 07:32:57 +0000 (UTC)
References: <20210617070730.7699-1-krzysztof.kozlowski@canonical.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-reply-to: <20210617070730.7699-1-krzysztof.kozlowski@canonical.com>
Date: Thu, 17 Jun 2021 08:32:52 +0100
Message-ID: <87im2d3pzv.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 0/3] controllers/memcg: fixes for newer kernels
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

Hello,

Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> writes:

> Hi,
>
> This is a resend of previous Github pull:
> https://github.com/linux-test-project/ltp/pull/830

LGTM (Reviewed on Github).

I doubt tests that expect a precise allocation figure are valid.

>
> The patches fix several test failures we are hitting since months, see:
> https://bugs.launchpad.net/bugs/1829979
> https://bugs.launchpad.net/bugs/1829984
>
> Best regards,
> Krzysztof
>
>
> Krzysztof Kozlowski (3):
>   controllers/memcg: accept range of max_usage_in_bytes
>   controllers/memcg: accept range of usage_in_bytes
>   controllers/memcg: accept non-zero max_usage_in_bytes after reset
>
>  .../controllers/memcg/functional/memcg_lib.sh | 22 ++++++++++++++-----
>  .../memcg_max_usage_in_bytes_test.sh          | 12 ++++++++--
>  .../memcg/functional/memcg_stat_rss.sh        | 20 ++++++++---------
>  .../memcg/functional/memcg_stat_test.sh       |  8 +++----
>  .../functional/memcg_usage_in_bytes_test.sh   | 10 +++++++--
>  5 files changed, 49 insertions(+), 23 deletions(-)
>
> -- 
> 2.27.0


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
