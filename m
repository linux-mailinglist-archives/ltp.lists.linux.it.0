Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 236CA957C1
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 09:00:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 858D83C1D44
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 09:00:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 86B6B3C1CA0
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 09:00:01 +0200 (CEST)
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0E2D71000B5F
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 08:59:53 +0200 (CEST)
Received: by mail-lf1-x142.google.com with SMTP id v16so3255718lfg.11
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 00:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=afX65U9iSHVTOuRVa96SwdzvVkvnDrhIhmHas8vfAVQ=;
 b=uP+DgGBILFffVSKGZIE+J5nuBJQqhfsOcMImlw75bAoM8sUOnf5HAn97/89Q3XcyaJ
 /cmUnXZ8ULuMYp7obJRWsPp2HOPb+vx17QpUN3vUxvnzH9k8DOJPECZV3yNMkLSO+kKZ
 T3VGZYZB0uD+649o7MpJ2WcDZA3K/r3S+CeSCLIdGhBJBdrIdMyaesMBJ1MdHid1ksg9
 P0V2PSiry2jiVVRkUUdEy7PSr800uQi653+pK/weo/9R5ypwlRG2GM74cv0hR2klzvcL
 qFXnLQQn38t/OxAtxZJYEeC4nlpB2PpaekrDDzVShBZhajo+t0SOZy0EI1+Bs/Rt0ElK
 r2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=afX65U9iSHVTOuRVa96SwdzvVkvnDrhIhmHas8vfAVQ=;
 b=ISjMjClezFvy6pE/kVEh9saJAP6k/NjU5ObY6fDnJRAVht5I04GJm6JOCmGt9hlVQJ
 mU7rsoi4YoZ+4W0e8VWo02OWeEB2VfX2I3do3IZXFrmOF3f7B76qP2KpOkNSkrLkiGZ+
 cnIpx1LELuvEXV0AP5WQLIagagaa/aO4M1GbBTFCsEd65qyRb63jMQjAq64+SDrp/uKJ
 Q2mG0SV3HQndLoK/w5tLreGVz7qdWS/uoLdrkUteYr9Mg09IWRXVCBpqwyaGbHFYx+xs
 h1WGBsd395kzrNpMPJpX/mi18fj1uGYSZoHdoem5Oe4msE/RMtVVWbHySI3KK/cx0BeX
 HT3g==
X-Gm-Message-State: APjAAAUO8nDcW9VDaFxOX2jOmTqC2pMU3efWIrDvKzgAo/9e6UvG8Q3H
 7dyDRVaszqTdUPpQJSJw16YtP1Oqmil/nDCUjZoVGw==
X-Google-Smtp-Source: APXvYqyZxCQpxbtyELMPlRWx/rHg1djte5TBwZ4+VBoc5fWEtXBpl0kJPGbXwsHQYRc4e5HBEb52iSsRqEhzpxC2jm8=
X-Received: by 2002:ac2:5c42:: with SMTP id s2mr14900588lfp.61.1566284399694; 
 Mon, 19 Aug 2019 23:59:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190819074601.12094-1-linus.walleij@linaro.org>
 <20190819134904.GB11715@rei.lan>
In-Reply-To: <20190819134904.GB11715@rei.lan>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 Aug 2019 08:59:48 +0200
Message-ID: <CACRpkdbu5xesabEvMdSbj0AbirweM9EnSh=cOC3AKUKYzErqcg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5] syscalls/ioprio: Add test cases for I/O
 priority
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
Cc: Jens Axboe <axboe@kernel.dk>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Aug 19, 2019 at 3:49 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Pushed with a minor change, thanks.

Thanks a lot Cyril! :)

It's my first LTP test so I hope I get better at writing them over time.

Yours,
Linus Walleij

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
