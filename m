Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5439BCAB9
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2024 11:44:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1730803458; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=qQR4UlcY8wsqYIkZAg8vkoiWOuUyAJ0IQLNhahjdYi8=;
 b=ghuLo8ZLXXvrsNCEdraQFTTd7X33AOOTuROS7u9wYPtHuV7haR10u9SB+cgG8e5HpDM4p
 6EsCkSX1AWEVBekLrossOZFC4xshlkoLp5/t7l+HnMYRF/D+ctQEjpLA/qPrZOqc+jcc8M9
 6Po9cQcVJ0dY3eb8cEU7Sraf2Ymwrak=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 52A3B3D1FEE
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2024 11:44:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6C9B83D1FD9
 for <ltp@lists.linux.it>; Tue,  5 Nov 2024 11:44:06 +0100 (CET)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2076F10119DE
 for <ltp@lists.linux.it>; Tue,  5 Nov 2024 11:44:05 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a99eb8b607aso694088266b.2
 for <ltp@lists.linux.it>; Tue, 05 Nov 2024 02:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1730803444; x=1731408244; darn=lists.linux.it;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PKBUIOl4ZPrO1nTTDZcFq1ODx1gnfJkbh0Q4Vkz2imk=;
 b=V5mBNRL8mS5ES98UvMjo8S75hG0mVWFasisCZpyxKA1rklZZKY3E5yRCFVaIOcpF30
 iZOlDSRVBqo6dT9hysKFGED7xcrEiAqezPX3KBHr5G2r3CX0cbLqxW8DOfBFHJjvU8ka
 rAqwXHL/CKW4I00wl43u73R+d2lEEalYIq8EXrnFZygex32yeTdKMotsl+1d38HD2hLC
 +3Bv2nmewnueb1nv0+wkA3L1Cc/vEZAbzRmNOkjvsoHK7QjJT6j0PHmzWeWEtLAGjvvu
 UjJLGYfZTgHi11jVHcvFcaT8xH9bQMlq/dAeMgFKr0iOKwRHdMTddPu/wQHA7lbF1I1d
 M6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730803444; x=1731408244;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PKBUIOl4ZPrO1nTTDZcFq1ODx1gnfJkbh0Q4Vkz2imk=;
 b=ewmzm95fj3MaahLHJemfkWxPwJtmCbEwK0r85VdoWQ4krOGsADjgJGvJogVkx40mkX
 WOwkLxqRd0KeMbaE96TbVtn7E47bE5LP9NMmW8CWigWgCriIT3pYNr+U+Xk3NsSgCvXH
 DWUI5amvvQUXGYmG4bR/1t1CVOlGbqWA5kX13Z2bmfuYLfwbkEEz8z5yilRS3B5upnZc
 g8BWr/8vv69x1+E2se2LHEu7SV18LLU81C2GMokJFzGpB+3ZEsttbMSUJWnu0I/sLF37
 qrHa+jARkcu4lWPvAASOc4vkU1rwxasSR0rRJyiCYJIWjNkF3W1jyTbX10P7mlqsjQXg
 vHsA==
X-Gm-Message-State: AOJu0YxwJDz0mfNLSeaoZ710pyGfXMixAvziQ7axO60lqNBPS9zcx+uf
 dnKxwdiswEZXv2E0cYO47uQD+/c+Cqxgd2PTj+UadNBIjV4eCOZGaB6SZFWBEa/I4i+FjbH+YPs
 =
X-Google-Smtp-Source: AGHT+IH+AS7Rop/ZRuszUZ/Ypk8vUy/NU1itWSeoT3Bx7NNBmN5YPv28liXXP2wx4x7PqiADk/OrAQ==
X-Received: by 2002:a17:907:7ba1:b0:a99:509b:f524 with SMTP id
 a640c23a62f3a-a9de6331190mr3157818266b.57.1730803444421; 
 Tue, 05 Nov 2024 02:44:04 -0800 (PST)
Received: from wegao ([202.127.77.110]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb16a2d8bsm117796766b.28.2024.11.05.02.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 02:44:04 -0800 (PST)
Date: Tue, 5 Nov 2024 05:43:58 -0500
To: Li Wang <liwang@redhat.com>
Message-ID: <Zyn27odLhAApGhdW@wegao>
References: <20241105041326.18531-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241105041326.18531-1-liwang@redhat.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/2] lapi: Add new field socket scoping to
 landlock_ruleset_attr
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Nov 05, 2024 at 12:13:24PM +0800, Li Wang wrote:
> Mainline kernel commit 21d52e295 ("landlock: Add abstract UNIX socket scoping")
> introduces a new "scoped" member to the struct landlock_ruleset_attr.
> 
> Signed-off-by: Li Wang <liwang@redhat.com>
> ---
>  include/lapi/landlock.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/lapi/landlock.h b/include/lapi/landlock.h
> index 211d171eb..5fb6d3755 100644
> --- a/include/lapi/landlock.h
> +++ b/include/lapi/landlock.h
> @@ -19,6 +19,7 @@ struct landlock_ruleset_attr
>  {
>  	uint64_t handled_access_fs;
>  	uint64_t handled_access_net;
> +	uint64_t scoped;
>  };
>  #endif
Reviewed-by: Wei Gao <wegao@suse.com>
>  
> -- 
> 2.47.0
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
