Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA4A33759C
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Mar 2021 15:26:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A812D3C69C5
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Mar 2021 15:26:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 64EC03C3367
 for <ltp@lists.linux.it>; Thu, 11 Mar 2021 15:26:24 +0100 (CET)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D20D8601BE2
 for <ltp@lists.linux.it>; Thu, 11 Mar 2021 15:26:23 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id w11so2063995wrr.10
 for <ltp@lists.linux.it>; Thu, 11 Mar 2021 06:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=dnE1QtJVS3r8+3VAD2Hvp52zQvZog9A5Xl37St1vnbY=;
 b=RBt6U8K+RmEZzCp3Gq40LNvkg0+GYiz86zhF4aK07mxsmBd5aJnfM0Qg9ceS8mwqKn
 IYjK4n50tWFl9p6Zqxcy8sD4CgWUao0Dn8rT+U6gjvedIu1I2aIT2958Kyjgu/yBzlDr
 A2U/8NLRztMl42jPJ1N7eDc7SDaOPWBjqCX4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=dnE1QtJVS3r8+3VAD2Hvp52zQvZog9A5Xl37St1vnbY=;
 b=Z2KR0YXKA+AwQcsYElQI+eH8LO6NL58cGq0yrWu90RS2NGQi5BVmOeAW6Nz++4gSRb
 XUTAoCjiV1IboAXHpGn7ppa2iiM7eHQhSEUmGvViZSO8aOqioExA6TZ4mDY7XMNqN86V
 wpWmBUF4SP63lgwrsVthBIFOl3EAdZXkb2UWuYtUvvK3n7VaGoyayIzCH7nVKxeRzpC2
 4kh382YSHtGqlBx86vN1i4e2jW/6w2L698tMIdbopYd8+l/iY2BskAAjwbTuf/iXWpTS
 eY+05dvu+41lJImkqxC6vW8Ws2sKxHDD5e4/CnGL/K7I0cacfMI+hl6el8BweZx6fAwp
 Cbmw==
X-Gm-Message-State: AOAM5312s8kI3tAHFCDnYzXXMnHAFTkkAw3GVlsmiMa8hBVGqHmVPV2M
 oEikVNfoBle4dk5PkpjH/tihCPiRNPGyBQ==
X-Google-Smtp-Source: ABdhPJwwEg/iz6kfq0WdcAge8kjfkliDMUb1yaILFo/vAj6ORKVVvyjbcrdRiOPir+Y5K0Kr84okbA==
X-Received: by 2002:a5d:6b8a:: with SMTP id n10mr9123279wrx.150.1615472783372; 
 Thu, 11 Mar 2021 06:26:23 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:79d1:e29:deac:3ff5?
 ([2001:8b0:aba:5f3c:79d1:e29:deac:3ff5])
 by smtp.gmail.com with ESMTPSA id f16sm4150566wrt.21.2021.03.11.06.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:26:23 -0800 (PST)
Message-ID: <ff5b641d8673eda9308b4176f0e52c4b2935c7ab.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Thu, 11 Mar 2021 14:26:22 +0000
In-Reply-To: <YEjiYkuyGvs8QT8T@rei.lan>
References: <20210309155623.2457857-1-richard.purdie@linuxfoundation.org>
 <YEjiYkuyGvs8QT8T@rei.lan>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] open_posix_testsuite/generate-makefiles.sh:
 Avoid inconsistencies with make version
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, 2021-03-10 at 16:14 +0100, Cyril Hrubis wrote:
> Hi!
> Patchset pushed, thanks.
> 
> Also it looks like the wildcard used to be sorted but they removed that
> in a few make versions and nobody knows why:
> 
> https://stackoverflow.com/questions/40558385/gnu-make-wildcard-no-longer-gives-sorted-output-is-there-any-control-switch

Thanks. That decision in make was unfortunate and I think we'll be living 
with it for a while.

The good news is I think with these changes we have ltp behaving consistently
within Yocto Project :)

Cheers,

Richard


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
