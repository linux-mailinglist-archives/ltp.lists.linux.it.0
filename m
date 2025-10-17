Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEE8BE651F
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Oct 2025 06:38:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1760675884; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=kpX/6/HrKvZjHwCEATA+RFAe4oZVUPkhlheNYjTiK5I=;
 b=CHxlzGe4nCswun+az2imt8C5wK/G0itcUoWCO4bvgsgvIQxGA1c432BTehdFyaQ/Z+wwO
 K6Yo99DtUx3r2zr8g/TVmy8KEvyrtrHzLsYg6cu6EVIJU8J7FnPsfsM1iv2aveBimxSVckb
 UcV7zBmeLGsTQWxzlnbP/uO1jDYo9v0=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7FE8D3CEE3B
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Oct 2025 06:38:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9C38F3CE8F7
 for <ltp@lists.linux.it>; Fri, 17 Oct 2025 06:37:52 +0200 (CEST)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 22FF61A0106D
 for <ltp@lists.linux.it>; Fri, 17 Oct 2025 06:37:51 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47103b6058fso10539895e9.1
 for <ltp@lists.linux.it>; Thu, 16 Oct 2025 21:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1760675870; x=1761280670; darn=lists.linux.it;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RUzHy7NfFCX6xk8Mg6P7v0o08q8ENdBahBEOhMUL5UE=;
 b=MWvKOaEFb3ccYOmhDH+uQlGoyitmLMgZFiPDWkCfIEe+HclDE1dJvckp86kQY3135R
 q8N5U05XuwXaOaNSxKLpRoX2lle0nCHtd/q6YgbzXN/aef9+fhYZWgWhF2tfQ8wf6MPd
 8jI2uQNeQv2dsb5mHMm0o2ZfkWwSYc67so2kzk714CNiTrvlYjROUhzpeDMnjWTL+ilv
 dMmYpFXbl+JWAH9pCXtUwE6+6Xpw1HTSZ801bdnY14AywOaXZn92mOu6Vm0EOdzRdpGO
 46n++Y/5Y4GKTixrkRzApfvYdn6p4LTA6sl8n0ZbOC3o+Vz+l5Tqa9Bj98ryQiVugu21
 /dEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760675870; x=1761280670;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RUzHy7NfFCX6xk8Mg6P7v0o08q8ENdBahBEOhMUL5UE=;
 b=F1e/YzsOT0UQZ7Mc4CcQOODDgVkiyDsvuf2wurJph5aVmEma2eZHmQz/ARcIgRKYTr
 fPcsncH+rx+W70cOXNKpKRT+wTyo/06ggzejukxlo0PY+eeejtsMDrgrOI/+Di9H7JQG
 xt7q0XjCY3uIVqmr/iUsROU4qknYSCI0oDd7b4oMpjF+CmkWA+4nzlqwcu3UQFezEqT6
 xCuS4rPu7e7GwpjVpJr3efBEfAV3x5IIoy4m0pCW9WB7oHwqBM7qd0gKblDqxWH0vdZ0
 e8zqm/LKjW6j5iZ7R2TuH54vlDy/7A8osGFSVhAuX521Bi6irdlJEjZJbulFHp4sAlWq
 bW5A==
X-Gm-Message-State: AOJu0YwSnAyIzwrngqHX8nweodIqU/fo0yHYoc5hatn6K1MRUhlBjgcr
 4MBOD5ym1UZBaueFBZeQy6DK9+dVqntKDMrM+cmYtXSeF0EmV7gOgBselaSd9xLuShQVxqlYZTv
 4WH0=
X-Gm-Gg: ASbGncvPIH5ErHJoo/wJTJtyfSdDgwY9WYxh8ME5dgSXGYa6PG8Ha55y5fvLMZK3sT/
 Yr40Z6+U3VXGIjor3nFgSgDPtGw6P5ZBs0+rwhWl4BWr8FrtjgrArdSPBjOlN0b/liIjJ/A8Sye
 7umprmjSO/kJ9vVBhgqH9O6vuNdcSApy2hteNNU4jdnOLTq1XpYasJygnxTKYtTrhzlI/7yCx5/
 Eit+lbnUDVUsLfLi3pyYzuUA84PvRruFoba0bjCLIplYnPw0NKy4SwZE3nJBF53vUM8l18jRvGR
 +Yj2HS1XszGVbCZKbtgolT0XC5JfWlnM1r3PxI9eJoyZOzuKBpCN2EfiOrOsNCRh8IbbEJIyV+I
 wEuk6wAzEEFUkLzcOlOJo7iH8Edk72EXSejL7+hBoMALpFHPSxsIFqTfauAAWwSikC+F//Bbwc2
 w=
X-Google-Smtp-Source: AGHT+IGjxd4s6hykUBBVnXL9LCpkSvJdF3n7tIbQpAt49cEeBk22/feO0W6KynBoBJetSO5Me/E6qQ==
X-Received: by 2002:a05:600c:3b23:b0:46d:1a9b:6d35 with SMTP id
 5b1f17b1804b1-47117300e79mr15862745e9.14.1760675870227; 
 Thu, 16 Oct 2025 21:37:50 -0700 (PDT)
Received: from localhost ([2a07:de40:b240:0:2ad6:ed42:2ad6:ed42])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4710ca243a3sm37091735e9.0.2025.10.16.21.37.49
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 21:37:49 -0700 (PDT)
Date: Fri, 17 Oct 2025 04:37:48 +0000
To: ltp@lists.linux.it
Message-ID: <aPHIHOlPZD3v3OLM@localhost>
References: <20250909084512.10962-1-wegao@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250909084512.10962-1-wegao@suse.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v1] connect01: Add positive check with different
 type of server
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Sep 09, 2025 at 08:44:17AM +0000, Wei Gao wrote:
> This patch refactors the existing test suite to use the new API. Previously,
> the tests only covered negative scenarios with invalid parameters. This update
> also introduces new positive tests to verify successful connections with
> various server types.
> 
> Fixes: #1167
> Signed-off-by: Wei Gao <wegao@suse.com>
> ---
>  testcases/kernel/syscalls/connect/connect01.c | 277 ++++++++----------
>  1 file changed, 118 insertions(+), 159 deletions(-)
> 

CI failure not related to patch, restart of failing job helped, see my
local CI pass result
https://github.com/coolgw/ltp/actions/runs/18487400975

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
